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

import { bundleManager, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { policy } from '@kit.NetworkKit';
import { AccessPolicyService, AccessPolicyView, BackgroundPolicyService, BackgroundView, LogEntry, Logger,
  PolicyErrorCodeMap, PolicyEventItem, PolicyEventService, QuotaPolicyService, QuotaSummary, TrustlistService,
  TrustlistView, appendLog, backgroundPolicyText, nowTimeText } from 'library';

// Maximum number of log entries kept in the log panel.
const LOG_LIMIT: number = 50;
// Maximum number of policy events kept in the event list.
const EVENT_LIMIT: number = 30;
// Emitter event id notifying the resident policy page that the trust lists changed on the detail page.
export const NS_TRUSTLIST_DIRTY_EVENT: number = 1001;
// Sentinel for an invalid or unparsable UID.
const INVALID_UID: number = -1;
// Radix used to parse the UID input.
const DECIMAL_RADIX: number = 10;

/**
 * Policy mode applied to a UID by the per-UID demo buttons.
 */
export enum UidPolicyMode {
  // Clear the per-UID policy.
  NONE = 0,
  // Allow metered background traffic for the UID.
  ALLOW = 1,
  // Reject metered background traffic for the UID.
  REJECT = 2
}

/**
 * State holder of the network policy page.
 * Every policy call except getNetAccessPolicy() and showAppNetPolicySettings() is @systemapi and fails with
 * 202 / 201 on a non-system-signed device; run() turns that into a log entry and a degraded state, never a crash.
 */
@ObservedV2
export class PolicyViewModel {
  // Latest network access policy view.
  @Trace public access: AccessPolicyView = new AccessPolicyView(false, false, false, '');
  // Latest background policy view.
  @Trace public background: BackgroundView =
    new BackgroundView(false, policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_NONE, 0, false);
  // UID text of the trust list card, filled by the picker or typed manually.
  @Trace public trustlistUid: string = '';
  // Latest quota policy summary.
  @Trace public quota: QuotaSummary = new QuotaSummary([], false, '');
  // Latest trust list view.
  @Trace public trustlist: TrustlistView = new TrustlistView([], [], false);
  // Policy events captured by the listeners, newest first.
  @Trace public events: PolicyEventItem[] = [];
  // Log entries shown in the shared log panel.
  @Trace public logs: LogEntry[] = [];
  // Whether a policy action is running.
  @Trace public busy: boolean = false;
  // Whether the last call proved the system APIs are available.
  @Trace public systemAvailable: boolean = false;
  // UID of this application.
  @Trace public selfUid: number = 0;
  // Whether the policy event listeners are attached.
  @Trace public eventListening: boolean = false;

  // Ability context bound by the page, null before bind().
  private context: common.UIAbilityContext | null = null;
  // Monotonic sequence for log entry ids.
  private logSeq: number = 0;
  // Monotonic sequence for event ids.
  private eventSeq: number = 0;

  /**
   * Bind the ability context, resolve the self UID and start the initial load.
   * @param context ability context used to open the system settings page.
   */
  bind(context: common.Context): void {
    Logger.enter('[PolicyViewModel#bind]');
    Logger.beginTrace('NetworkSecurity.entry.bind', 1);
    // getHostContext() of a page returns the UIAbilityContext; showAppNetPolicySettings needs it.
    this.context = context as common.UIAbilityContext;
    // Resolve the UID of this application and prefill the trust list input.
    this.selfUid = PolicyViewModel.resolveSelfUid();
    this.trustlistUid = this.selfUid.toString();
    this.log('info', 'Policy', 'Policy page bound, self uid ' + this.selfUid);
    // Run the first full query sweep without blocking the UI.
    this.refreshAll();
    Logger.endTrace('NetworkSecurity.entry.bind', 1);
    Logger.exit('[PolicyViewModel#bind]');
  }

  /**
   * Run every policy query once, in a fixed order.
   */
  async refreshAll(): Promise<void> {
    Logger.enter('[PolicyViewModel#refreshAll]');
    Logger.beginTrace('NetworkSecurity.entry.refreshAll', 1);
    // Read each policy domain sequentially to keep logs ordered.
    await this.refreshAccess();
    await this.queryBackground();
    await this.readQuota();
    await this.readTrustlist();
    Logger.endTrace('NetworkSecurity.entry.refreshAll', 1);
    Logger.exit('[PolicyViewModel#refreshAll]');
  }

  /**
   * Re-read the public network access policy.
   */
  async refreshAccess(): Promise<void> {
    Logger.enter('[PolicyViewModel#refreshAccess]');
    Logger.beginTrace('NetworkSecurity.entry.refreshAccess', 1);
    // Read the access policy and report failures through run().
    await this.run('AccessPolicy', async () => {
      // Fetch the view from the access policy service.
      const view: AccessPolicyView = await AccessPolicyService.read();
      this.access = view;
      // Log the states when the policy is readable on this device.
      if (view.loaded) {
        this.log('info', 'AccessPolicy', 'allowWiFi ' + view.allowWiFi + ', allowCellular ' + view.allowCellular);
        return;
      }
      this.log('warn', 'AccessPolicy', 'Public access policy is not available');
    });
    Logger.endTrace('NetworkSecurity.entry.refreshAccess', 1);
    Logger.exit('[PolicyViewModel#refreshAccess]');
  }

  /**
   * Enable or disable the system background network policy, then re-query it.
   * @param value switch value, true to allow background networking.
   */
  async toggleBackground(value: boolean): Promise<void> {
    Logger.enter('[PolicyViewModel#toggleBackground]', 'value: ' + value.toString());
    Logger.beginTrace('NetworkSecurity.entry.toggleBackground', 1);
    // Apply the new background policy and report failures through run().
    await this.run('Background', async () => {
      // Set the system background policy to the switch value.
      await BackgroundPolicyService.setAllowed(value);
      this.systemAvailable = true;
      this.log('info', 'Background', 'setBackgroundAllowed(' + value + ') succeeded');
    });
    // Refresh the background view with the applied state.
    await this.queryBackground();
    Logger.endTrace('NetworkSecurity.entry.toggleBackground', 1);
    Logger.exit('[PolicyViewModel#toggleBackground]');
  }

  /**
   * Query the background policy state and the policy of the self UID.
   */
  async queryBackground(): Promise<void> {
    Logger.enter('[PolicyViewModel#queryBackground]');
    Logger.beginTrace('NetworkSecurity.entry.queryBackground', 1);
    // Read the global state and the per-UID policy.
    await this.run('Background', async () => {
      // Ask for the global allowance and the self UID policy kind.
      const allowed: boolean = await BackgroundPolicyService.isAllowed();
      const kind: policy.NetBackgroundPolicy = await BackgroundPolicyService.policyByUid(this.selfUid);
      // Publish the query result to the page.
      this.background = new BackgroundView(allowed, kind, this.selfUid, true);
      this.systemAvailable = true;
      this.log('info', 'Background', 'allowed ' + allowed + ', uid ' + this.selfUid + ' policy ' +
        backgroundPolicyText(kind));
    });
    Logger.endTrace('NetworkSecurity.entry.queryBackground', 1);
    Logger.exit('[PolicyViewModel#queryBackground]');
  }

  /**
   * Re-read the quota policies of the default SIM.
   */
  async readQuota(): Promise<void> {
    Logger.enter('[PolicyViewModel#readQuota]');
    Logger.beginTrace('NetworkSecurity.entry.readQuota', 1);
    // Read the quota summary and report failures through run().
    await this.run('Quota', async () => {
      // Fetch the summary from the quota policy service.
      const summary: QuotaSummary = await QuotaPolicyService.read();
      this.quota = summary;
      // Warn when the device does not expose the quota APIs.
      if (!summary.loaded) {
        this.log('warn', 'Quota', 'Quota policy is not available on this device');
        return;
      }
      this.systemAvailable = true;
      this.log('info', 'Quota', 'Quota policy count ' + summary.items.length);
    });
    Logger.endTrace('NetworkSecurity.entry.readQuota', 1);
    Logger.exit('[PolicyViewModel#readQuota]');
  }

  /**
   * Apply the demo quota policy and the reminder limit, then refresh the list.
   */
  async applyQuota(): Promise<void> {
    Logger.enter('[PolicyViewModel#applyQuota]');
    Logger.beginTrace('NetworkSecurity.entry.applyQuota', 1);
    // Write the demo quota and reminder thresholds.
    await this.run('Quota', async () => {
      // Apply the demo warning and limit values.
      await QuotaPolicyService.applyDemoQuota();
      await QuotaPolicyService.remind();
      this.systemAvailable = true;
      this.log('info', 'Quota', 'Demo quota applied: 100 MB warning, 200 MB limit, alert only');
    });
    // Refresh the quota list with the applied values.
    await this.readQuota();
    Logger.endTrace('NetworkSecurity.entry.applyQuota', 1);
    Logger.exit('[PolicyViewModel#applyQuota]');
  }

  /**
   * Reset all quota policies of the default SIM, then refresh the list.
   */
  async resetQuota(): Promise<void> {
    Logger.enter('[PolicyViewModel#resetQuota]');
    Logger.beginTrace('NetworkSecurity.entry.resetQuota', 1);
    // Remove every quota policy of the default SIM.
    await this.run('Quota', async () => {
      // Reset all quota policies at once.
      await QuotaPolicyService.reset();
      this.systemAvailable = true;
      this.log('info', 'Quota', 'resetPolicies done for the default SIM');
    });
    // Refresh the quota list after the reset.
    await this.readQuota();
    Logger.endTrace('NetworkSecurity.entry.resetQuota', 1);
    Logger.exit('[PolicyViewModel#resetQuota]');
  }

  /**
   * Restore the quota policies removed by the reset action, then refresh the list.
   */
  async restoreQuota(): Promise<void> {
    Logger.enter('[PolicyViewModel#restoreQuota]');
    Logger.beginTrace('NetworkSecurity.entry.restoreQuota', 1);
    // Re-apply the demo quota policies.
    await this.run('Quota', async () => {
      // Restore the quota values removed by the reset action.
      await QuotaPolicyService.restoreAll();
      this.systemAvailable = true;
      this.log('info', 'Quota', 'restoreAllPolicies done for the default SIM');
    });
    // Refresh the quota list after the restore.
    await this.readQuota();
    Logger.endTrace('NetworkSecurity.entry.restoreQuota', 1);
    Logger.exit('[PolicyViewModel#restoreQuota]');
  }

  /**
   * Add the entered UID to both system trust lists, then refresh the view.
   */
  async applyTrustlist(): Promise<void> {
    Logger.enter('[PolicyViewModel#applyTrustlist]');
    Logger.beginTrace('NetworkSecurity.entry.applyTrustlist', 1);
    // Parse the input and skip the apply when it is invalid.
    const uid: number = this.parseUid();
    if (uid === INVALID_UID) {
      Logger.endTrace('NetworkSecurity.entry.applyTrustlist', 1);
      Logger.exit('[PolicyViewModel#applyTrustlist]', 'skipped: invalid uid');
      return;
    }
    // Build the single-element UID list for the apply.
    const uids: number[] = [uid];
    await this.run('Trustlist', async () => {
      // Add the UID to both device idle and power save lists.
      await TrustlistService.setTrustlist(uids, true);
      this.systemAvailable = true;
      this.log('info', 'Trustlist', 'uid ' + uid + ' added to the device idle and power save trust lists');
    });
    // Refresh the trust list view with the applied state.
    await this.readTrustlist();
    Logger.endTrace('NetworkSecurity.entry.applyTrustlist', 1);
    Logger.exit('[PolicyViewModel#applyTrustlist]', 'uid: ' + uid.toString());
  }

  /**
   * Re-read the device idle and power save trust lists.
   */
  async readTrustlist(): Promise<void> {
    Logger.enter('[PolicyViewModel#readTrustlist]');
    Logger.beginTrace('NetworkSecurity.entry.readTrustlist', 1);
    // Read both trust lists and report failures through run().
    await this.run('Trustlist', async () => {
      // Fetch the trust list view from the service.
      const view: TrustlistView = await TrustlistService.read();
      this.trustlist = view;
      // Warn when the device does not expose the trust list APIs.
      if (!view.loaded) {
        this.log('warn', 'Trustlist', 'Trust list is not available on this device');
        return;
      }
      this.systemAvailable = true;
      this.log('info', 'Trustlist', 'device idle ' + view.deviceIdle.length + ', power save ' + view.powerSave.length);
    });
    Logger.endTrace('NetworkSecurity.entry.readTrustlist', 1);
    Logger.exit('[PolicyViewModel#readTrustlist]');
  }

  /**
   * Start or stop the five policy event listeners of the system.
   */
  toggleEvents(): void {
    Logger.enter('[PolicyViewModel#toggleEvents]');
    Logger.beginTrace('NetworkSecurity.entry.toggleEvents', 1);
    // Stop the listeners when they are already running.
    if (this.eventListening) {
      PolicyEventService.stop();
      this.eventListening = false;
      this.log('info', 'Event', 'Policy event listeners stopped');
      Logger.endTrace('NetworkSecurity.entry.toggleEvents', 1);
      Logger.exit('[PolicyViewModel#toggleEvents]', 'listeners stopped');
      return;
    }
    try {
      // Subscribe with a callback that appends each event to the list.
      PolicyEventService.start((tag: string, text: string, uid: number) => {
        this.appendEvent(tag, text, uid);
      });
      this.eventListening = true;
      this.systemAvailable = true;
      this.log('info', 'Event', 'Policy event listeners started');
    } catch (error) {
      // Convert the caught value to BusinessError for the code field.
      const err: BusinessError = error as BusinessError;
      this.eventListening = false;
      this.handleError('Event', err);
    }
    Logger.endTrace('NetworkSecurity.entry.toggleEvents', 1);
    Logger.exit('[PolicyViewModel#toggleEvents]');
  }

  /**
   * Called from aboutToDisappear so the five listeners never leak with the page.
   */
  stopEvents(): void {
    Logger.enter('[PolicyViewModel#stopEvents]');
    Logger.beginTrace('NetworkSecurity.entry.stopEvents', 1);
    // Nothing to detach when the listeners never started.
    if (!this.eventListening) {
      Logger.endTrace('NetworkSecurity.entry.stopEvents', 1);
      Logger.exit('[PolicyViewModel#stopEvents]', 'skipped: not listening');
      return;
    }
    PolicyEventService.stop();
    this.eventListening = false;
    Logger.info('[Event] Policy event listeners removed on page disappear');
    Logger.endTrace('NetworkSecurity.entry.stopEvents', 1);
    Logger.exit('[PolicyViewModel#stopEvents]');
  }

  /**
   * Open the system network access settings page for the access policy card.
   */
  async openSettings(): Promise<void> {
    Logger.enter('[PolicyViewModel#openSettings]');
    Logger.beginTrace('NetworkSecurity.entry.openSettings', 1);
    // The settings page needs the bound UIAbility context.
    const context: common.UIAbilityContext | null = this.context;
    if (context === null) {
      this.log('warn', 'Settings', 'Ability context is not bound yet');
      Logger.endTrace('NetworkSecurity.entry.openSettings', 1);
      Logger.exit('[PolicyViewModel#openSettings]', 'skipped: context not bound');
      return;
    }
    // Jump to the system settings and report failures through run().
    await this.run('Settings', async () => {
      // Open the system network access settings page.
      await AccessPolicyService.openSettings(context);
      this.log('info', 'Settings', 'System network access settings page opened');
    });
    Logger.endTrace('NetworkSecurity.entry.openSettings', 1);
    Logger.exit('[PolicyViewModel#openSettings]');
  }

  /**
   * Clear all log entries shown in the log panel.
   */
  clearLogs(): void {
    Logger.enter('[PolicyViewModel#clearLogs]');
    Logger.beginTrace('NetworkSecurity.entry.clearLogs', 1);
    // Reset the log list to empty.
    this.logs = [];
    Logger.endTrace('NetworkSecurity.entry.clearLogs', 1);
    Logger.exit('[PolicyViewModel#clearLogs]');
  }

  /**
   * Run one policy action under the busy guard and translate errors.
   * @param tag demo tag used in the log panel.
   * @param action async action to execute.
   */
  private async run(tag: string, action: () => Promise<void>): Promise<void> {
    // Skip while another policy action is running.
    if (this.busy) {
      return;
    }
    this.busy = true;
    try {
      // Execute the wrapped action.
      await action();
    } catch (error) {
      // Convert the caught value to BusinessError for the code field.
      const err: BusinessError = error as BusinessError;
      this.handleError(tag, err);
    } finally {
      // Release the busy flag on every path.
      this.busy = false;
    }
  }

  /**
   * Parse the trust list UID text into a non-negative number.
   * @returns the parsed UID, or INVALID_UID when the input is invalid.
   */
  private parseUid(): number {
    // Trim the raw input before parsing.
    const text: string = this.trustlistUid.trim();
    if (text.length === 0) {
      this.log('warn', 'Trustlist', 'UID input is empty');
      return INVALID_UID;
    }
    // Parse as a decimal number and reject invalid or negative values.
    const parsed: number = Number.parseInt(text, DECIMAL_RADIX);
    if (Number.isNaN(parsed) || parsed < 0) {
      this.log('warn', 'Trustlist', 'Invalid UID input ' + text);
      return INVALID_UID;
    }
    return parsed;
  }

  /**
   * Translate one BusinessError into a warning or an error log entry.
   * @param tag demo tag used in the log panel.
   * @param err error thrown by the system call.
   */
  private handleError(tag: string, err: BusinessError): void {
    // A restricted system API keeps the demo usable, so warn instead of failing.
    if (PolicyErrorCodeMap.isSystemRestricted(err.code)) {
      this.systemAvailable = false;
      this.log('warn', tag, 'System API restricted, code ' + err.code + ': ' + err.message);
      return;
    }
    this.log('error', tag, 'Call failed, code ' + err.code + ': ' + err.message);
  }

  /**
   * Append one policy event to the list, keeping the newest first with a limit.
   * @param tag source tag of the event.
   * @param text event detail text.
   * @param uid payload UID of the event, or a negative value when it carries no UID.
   */
  private appendEvent(tag: string, text: string, uid: number): void {
    // Advance the sequence and build the event item.
    this.eventSeq += 1;
    const item: PolicyEventItem = new PolicyEventItem(this.eventSeq, tag, text, nowTimeText());
    // Keep the payload UID only when the event carries one.
    if (uid >= 0) {
      item.uid = uid;
    }
    // Build the next list with the new item at the head.
    const next: PolicyEventItem[] = [item];
    const keep: number = this.events.length < EVENT_LIMIT ? this.events.length : EVENT_LIMIT - 1;
    for (let index = 0; index < keep; index++) {
      next.push(this.events[index]);
    }
    // Publish the trimmed event list.
    this.events = next;
  }

  /**
   * Append one entry to the log panel and mirror it to hilog by level.
   * @param level log level, one of info, warn or error.
   * @param tag demo tag used in the log panel.
   * @param text human-readable detail text.
   */
  private log(level: string, tag: string, text: string): void {
    // Advance the sequence and build the entry.
    this.logSeq += 1;
    const entry: LogEntry = new LogEntry(this.logSeq, nowTimeText(), tag, text, level);
    // Append with the limit so the oldest entries are dropped.
    this.logs = appendLog(this.logs, entry, LOG_LIMIT);
    // Mirror the entry to hilog with the demo tag.
    const message: string = '[' + tag + '] ' + text;
    if (level === 'error') {
      Logger.error(message);
      return;
    }
    if (level === 'warn') {
      Logger.warn(message);
      return;
    }
    Logger.info(message);
  }

  /**
   * getUidForSelf() does not exist in this SDK, so the UID comes from the bundle info of the application.
   */
  /**
   * Resolve the UID of this application synchronously.
   * @returns the application UID, or 0 when the lookup fails.
   */
  private static resolveSelfUid(): number {
    try {
      // Read the own bundle info synchronously. GET_BUNDLE_INFO_WITH_APPLICATION is required,
      // because the default flag leaves appInfo (and therefore appInfo.uid) unfilled.
      const info: bundleManager.BundleInfo =
        bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      const uid: number = info.appInfo.uid;
      if (uid === 0) {
        Logger.error('[Policy] resolved self uid is 0, the appInfo.uid field was not populated');
      }
      return uid;
    } catch (error) {
      // Convert the caught value to BusinessError for the code field.
      const err: BusinessError = error as BusinessError;
      Logger.error('[Policy] failed to resolve the self uid, code ' + err.code + ': ' + err.message);
      return 0;
    }
  }
}
