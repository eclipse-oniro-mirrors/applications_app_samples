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
import { BusinessError, emitter } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { policy } from '@kit.NetworkKit';
import { AccessPolicyService, AppInfoItem, AppListService, AppListView, appendLog, BackgroundPolicyService, LogEntry,
  Logger, PolicyErrorCodeMap, TrustlistService, TrustlistView, UidPolicyService, backgroundPolicyText, nowTimeText,
  uidPolicyText } from 'library';
import { NS_TRUSTLIST_DIRTY_EVENT, UidPolicyMode } from './PolicyViewModel';

// Maximum number of log entries kept by the detail page.
const LOG_LIMIT: number = 50;
// Interface name used for the per-interface access check, aligned with PolicyPage.
const DEFAULT_IFACE: string = 'wlan0';

/**
 * State holder of the application detail page. It aggregates the per-UID access policy,
 * UID policy, background policy and trust lists through the shared Library services, resolves the
 * application name through three levels and degrades every restricted call into a log entry.
 */
@ObservedV2
export class AppDetailViewModel {
  // UID of the target application.
  @Trace public uid: number = 0;
  // Display name resolved from the caller, the bundle manager or the app list.
  @Trace public appName: string = '';
  // Application icon decoded from the app list, undefined while loading or when unavailable.
  @Trace public appIcon: image.PixelMap | undefined = undefined;
  // Bundle name resolved the same way; empty means unknown.
  @Trace public bundleName: string = '';
  // Whether the per-UID access policy query succeeded.
  @Trace public accessLoaded: boolean = false;
  // Whether the UID may use Wi-Fi networks.
  @Trace public allowWiFi: boolean = false;
  // Whether the UID may use cellular networks.
  @Trace public allowCellular: boolean = false;
  // Whether the UID policy query succeeded.
  @Trace public uidLoaded: boolean = false;
  // UID policy kind reported by the system.
  @Trace public uidPolicy: policy.NetUidPolicy = policy.NetUidPolicy.NET_POLICY_NONE;
  // Whether the UID may use metered networks.
  @Trace public meteredAllowed: boolean = false;
  // Whether the UID may use the default interface.
  @Trace public ifaceAllowed: boolean = false;
  // Whether the background policy query succeeded.
  @Trace public bgLoaded: boolean = false;
  // Background policy kind reported by the system.
  @Trace public bgPolicy: policy.NetBackgroundPolicy = policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_NONE;
  // Whether the trust list query succeeded.
  @Trace public trustlistLoaded: boolean = false;
  // Whether the UID is in the device idle trust list.
  @Trace public inIdleTrustlist: boolean = false;
  // Whether the UID is in the power save trust list.
  @Trace public inPowerTrustlist: boolean = false;
  // Whether a query or apply action is running.
  @Trace public busy: boolean = false;
  // Whether the last call proved the system APIs are available.
  @Trace public systemAvailable: boolean = false;
  // Log entries shown in the shared log panel.
  @Trace public logs: LogEntry[] = [];

  // Monotonic sequence for log entry ids.
  private logSeq: number = 0;

  // Host context bound by the page; the cross-package icon resolution needs it.
  private hostContext: common.Context | undefined = undefined;

  /**
   * Load the aggregated policy view of one UID and resolve its display names.
   * @param uid UID of the target application.
   * @param bundleName bundle name known by the caller, empty when unknown.
   * @param appName display name known by the caller, empty when unknown.
   * @param context host context enabling the cross-package icon resolution, optional.
   */
  async loadDetail(uid: number, bundleName: string, appName: string, context?: common.Context): Promise<void> {
    // Publish the identity first so the page can render the header immediately.
    this.uid = uid;
    this.bundleName = bundleName;
    this.appName = appName;
    // Keep the context for the detached icon resolution below.
    this.hostContext = context;
    // Resolve the missing names through the bundle manager and the app list.
    await this.resolveNames(uid);
    // Reuse the cached icon first; the list-to-detail path hits it immediately.
    const cached: AppInfoItem | undefined = AppListService.findAppByUid(uid);
    if (cached !== undefined && cached.icon !== undefined) {
      // Publish the cached icon synchronously, no second system query is needed.
      this.appIcon = cached.icon;
    }
    // Resolve the icon in the background for the deep-link path without a cached list.
    this.resolveIcon(uid);
    // Query the four policy domains sequentially to keep the logs ordered.
    await this.queryAccess();
    await this.queryUidPolicy();
    await this.queryBackground();
    await this.queryTrustlist();
  }

  /**
   * Resolve the display names of the UID through three levels: the pushed parameters,
   * getBundleNameByUidSync, then the loaded app list; the bare UID is the last fallback.
   * @param uid UID of the target application.
   */
  private async resolveNames(uid: number): Promise<void> {
    // Keep the caller-provided bundle name when it is already known.
    if (this.bundleName.length === 0) {
      this.bundleName = await AppDetailViewModel.resolveBundleName(uid);
    }
    // Fall back to the bundle name when the display name is unknown.
    if (this.appName.length === 0) {
      this.appName = this.bundleName;
    }
    // Show the bare UID when no readable name exists, for example a system UID.
    if (this.appName.length === 0) {
      this.appName = 'uid ' + uid.toString();
    }
  }

  /**
   * Resolve the bundle name of one UID through getBundleNameByUidSync and the app list.
   * @param uid UID to resolve.
   * @returns the bundle name, or an empty string when every lookup fails.
   */
  private static async resolveBundleName(uid: number): Promise<string> {
    // The synchronous bundle manager lookup is the cheapest direct mapping.
    try {
      // getBundleNameByUidSync needs GET_BUNDLE_INFO and throws 201 or 17700021 when restricted.
      return bundleManager.getBundleNameByUidSync(uid);
    } catch (error) {
      // Normalize the caught error so the code can be logged.
      const err: BusinessError = error as BusinessError;
      Logger.warn('[AppDetail] getBundleNameByUidSync failed, code ' + err.code);
    }
    // The loaded app list is the second source; it stays empty on restricted devices.
    try {
      // Load the list once and match the UID directly.
      const view: AppListView = await AppListService.loadAppList();
      for (const item of view.items) {
        if (item.uid === uid) {
          return item.bundleName;
        }
      }
    } catch (error) {
      // Normalize the caught error so the code can be logged.
      const err: BusinessError = error as BusinessError;
      Logger.warn('[AppDetail] app list name match failed, code ' + err.code);
    }
    // No readable name; the caller falls back to the bare UID text.
    return '';
  }

  /**
   * Resolve the application icon from the app list, which carries decoded icon pixels.
   * The list is already authorized after a visit to the app list page; a restricted deep
   * link keeps the initial block instead. Runs detached, so it never blocks the policy
   * queries and publishes through @Trace when the pixels arrive.
   * @param uid UID of the target application.
   */
  private async resolveIcon(uid: number): Promise<void> {
    try {
      // Load the list once and match the UID directly; the bound context enables the
      // cross-package icon decoding, which is skipped when the context is missing.
      const view: AppListView = await AppListService.loadAppList(this.hostContext);
      for (const item of view.items) {
        if (item.uid === uid) {
          // Publish the icon; the page switches from the initial block to the pixels.
          this.appIcon = item.icon;
          return;
        }
      }
    } catch (error) {
      // Normalize the caught error; the initial block stays as the fallback.
      const err: BusinessError = error as BusinessError;
      Logger.warn('[AppDetail] icon match failed, code ' + err.code);
    }
  }

  /**
   * Apply one per-UID policy mode, then re-query the UID state and keep the action logged.
   * @param mode policy mode to apply.
   */
  async applyUidPolicy(mode: UidPolicyMode): Promise<void> {
    // Skip while another action is running.
    if (this.busy) {
      return;
    }
    this.busy = true;
    try {
      // Map the demo mode to the matching system policy value, aligned with PolicyPage.
      let target: policy.NetUidPolicy = policy.NetUidPolicy.NET_POLICY_NONE;
      if (mode === UidPolicyMode.ALLOW) {
        target = policy.NetUidPolicy.NET_POLICY_ALLOW_METERED_BACKGROUND;
      } else if (mode === UidPolicyMode.REJECT) {
        target = policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND;
      }
      // Set the system per-UID policy; errors propagate to the catch.
      await UidPolicyService.setPolicy(this.uid, target);
      this.systemAvailable = true;
      this.log('info', 'UidPolicy', 'uid ' + this.uid + ' policy set to ' + uidPolicyText(target));
    } catch (error) {
      // Normalize the caught error and degrade restricted calls into log entries.
      const err: BusinessError = error as BusinessError;
      this.handleRestricted('UidPolicy', err);
    }
    // Refresh the UID view with the applied state on every path.
    await this.queryUidPolicy();
    // Release the busy flag after the refresh completes.
    this.busy = false;
  }

  /**
   * Add the target UID to or remove it from both trust lists, then re-query the state.
   * @param allowed true to add the UID to both lists, false to remove it.
   */
  async applyTrustlist(allowed: boolean): Promise<void> {
    // Skip while another action is running.
    if (this.busy) {
      return;
    }
    this.busy = true;
    try {
      // Write both trust lists; errors propagate to the catch.
      await TrustlistService.setTrustlist([this.uid], allowed);
      this.systemAvailable = true;
      this.log('info', 'Trustlist', 'uid ' + this.uid + (allowed ? ' added to' : ' removed from') +
        ' the device idle and power save trust lists');
      // Notify the resident policy page tab that the trust lists changed.
      emitter.emit({ eventId: NS_TRUSTLIST_DIRTY_EVENT });
    } catch (error) {
      // Normalize the caught error and degrade restricted calls into log entries.
      const err: BusinessError = error as BusinessError;
      this.handleRestricted('Trustlist', err);
    }
    // Refresh the trust list view with the applied state on every path.
    await this.queryTrustlist();
    // Release the busy flag after the refresh completes.
    this.busy = false;
  }

  /**
   * Clear all log entries shown in the log panel.
   */
  clearLogs(): void {
    // Reset the log list to empty.
    this.logs = [];
  }

  /**
   * Read the per-UID Wi-Fi and cellular access policy of the target UID.
   */
  private async queryAccess(): Promise<void> {
    try {
      // getNetworkAccessPolicy is @systemapi; errors propagate from the service.
      const access: policy.NetworkAccessPolicy = await AccessPolicyService.readUidAccess(this.uid);
      // Normalize the flags to strict booleans for rendering.
      this.allowWiFi = access.allowWiFi === true;
      this.allowCellular = access.allowCellular === true;
      this.accessLoaded = true;
      this.systemAvailable = true;
      this.log('info', 'UidAccess', 'uid ' + this.uid + ' allowWiFi ' + this.allowWiFi + ', allowCellular ' +
        this.allowCellular);
    } catch (error) {
      // Normalize the caught error and degrade restricted calls into log entries.
      const err: BusinessError = error as BusinessError;
      this.accessLoaded = false;
      this.handleRestricted('UidAccess', err);
    }
  }

  /**
   * Read the UID policy kind and the two allow states of the target UID.
   */
  private async queryUidPolicy(): Promise<void> {
    try {
      // Fetch the policy kind and the metered and interface allow states.
      const kind: policy.NetUidPolicy = await UidPolicyService.getPolicy(this.uid);
      const meteredAllowed: boolean = await UidPolicyService.isMeteredAllowed(this.uid);
      const ifaceAllowed: boolean = await UidPolicyService.isIfaceAllowed(this.uid, DEFAULT_IFACE);
      // Publish the query result to the page.
      this.uidPolicy = kind;
      this.meteredAllowed = meteredAllowed;
      this.ifaceAllowed = ifaceAllowed;
      this.uidLoaded = true;
      this.systemAvailable = true;
      this.log('info', 'UidPolicy', 'uid ' + this.uid + ' policy ' + uidPolicyText(kind) + ', metered ' +
        meteredAllowed + ', ' + DEFAULT_IFACE + ' ' + ifaceAllowed);
    } catch (error) {
      // Normalize the caught error and degrade restricted calls into log entries.
      const err: BusinessError = error as BusinessError;
      this.uidLoaded = false;
      this.handleRestricted('UidPolicy', err);
    }
  }

  /**
   * Read the background policy kind configured for the target UID.
   */
  private async queryBackground(): Promise<void> {
    try {
      // getBackgroundPolicyByUid is @systemapi; errors propagate from the service.
      const kind: policy.NetBackgroundPolicy = await BackgroundPolicyService.policyByUid(this.uid);
      // Publish the query result to the page.
      this.bgPolicy = kind;
      this.bgLoaded = true;
      this.systemAvailable = true;
      this.log('info', 'Background', 'uid ' + this.uid + ' background policy ' + backgroundPolicyText(kind));
    } catch (error) {
      // Normalize the caught error and degrade restricted calls into log entries.
      const err: BusinessError = error as BusinessError;
      this.bgLoaded = false;
      this.handleRestricted('Background', err);
    }
  }

  /**
   * Read the device idle and power save trust lists and mark whether the target UID is included.
   */
  private async queryTrustlist(): Promise<void> {
    // read() never throws; it degrades to loaded = false when the APIs are restricted.
    const view: TrustlistView = await TrustlistService.read();
    // Publish the membership flags of the target UID for the two InfoRows.
    this.inIdleTrustlist = view.deviceIdle.includes(this.uid);
    this.inPowerTrustlist = view.powerSave.includes(this.uid);
    this.trustlistLoaded = view.loaded;
    // Warn when the device does not expose the trust list APIs.
    if (!view.loaded) {
      this.log('warn', 'Trustlist', 'Trust list is not available on this device');
      return;
    }
    this.systemAvailable = true;
    this.log('info', 'Trustlist', 'uid ' + this.uid + ' in idle list ' + this.inIdleTrustlist + ', in power list ' +
      this.inPowerTrustlist);
  }

  /**
   * Translate one BusinessError into a degradation log entry.
   * @param tag demo tag used in the log panel.
   * @param err error thrown by the system call.
   */
  private handleRestricted(tag: string, err: BusinessError): void {
    // A restricted system API keeps the page usable, so warn instead of failing.
    if (PolicyErrorCodeMap.isSystemRestricted(err.code)) {
      this.systemAvailable = false;
      this.log('warn', tag, 'System API restricted, code ' + err.code + ': ' + err.message);
      return;
    }
    this.log('error', tag, 'Call failed, code ' + err.code + ': ' + err.message);
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
}
