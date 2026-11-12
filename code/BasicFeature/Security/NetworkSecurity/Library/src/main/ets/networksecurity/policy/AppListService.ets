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

import { abilityAccessCtrl, application, bundleManager, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { PolicyErrorCodeMap } from './PolicyErrorCodeMap';
import { AppInfoItem, AppListView } from './AppTypes';

/**
 * Reads the installed application list through bundleManager. getAllBundleInfo is @systemapi and
 * needs ohos.permission.GET_INSTALLED_BUNDLE_LIST, a user_grant permission that must be requested
 * at runtime. A non-system-signed device fails with 201 / 202; loadAppList never throws and
 * returns a degraded view instead.
 */
export class AppListService {
  /**
   * Loads every installed application of the current user. When a context is bound, the runtime
   * permission dialog is shown once before the query. Never throws.
   * @param context host context used for the runtime permission request, optional.
   * @returns the app list view, degraded to loaded = false on error.
   */
  static async loadAppList(context?: common.Context): Promise<AppListView> {
    // Open the trace section for this system API.
    Logger.beginTrace('NetworkSecurity.policy.loadAppList', 1);
    Logger.enter('[AppListService#loadAppList]', 'context: ' + (context === undefined ? 'none' : 'bound'));
    try {
      // A user_grant permission must be granted at runtime before the query can succeed.
      const granted: boolean = await AppListService.ensurePermission(context);
      if (!granted) {
        Logger.warn('[AppList] GET_INSTALLED_BUNDLE_LIST not granted, degrade without querying');
        Logger.exit('[AppListService#loadAppList]', 'loaded: false');
        // Close the trace section on the degraded return path.
        Logger.endTrace('NetworkSecurity.policy.loadAppList', 1);
        return new AppListView([], false, 'permission not granted');
      }
      // WITH_APPLICATION fills appInfo, and WITH_HAP_MODULE fills hapModulesInfo, which carries
      // the entry module name needed for the cross-package context.
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE;
      // Query every installed bundle of the current user; errors propagate to the catch.
      const infos: bundleManager.BundleInfo[] = await bundleManager.getAllBundleInfo(flags);
      // Map every bundle info into the displayable item list with safe label fallbacks.
      const items: AppInfoItem[] = [];
      for (const info of infos) {
        items.push(AppListService.toItem(info));
      }
      // Cross-package labels and icons need a per-bundle context; skip when none is bound.
      if (context !== undefined) {
        // Resolve per bundle, chunk by chunk to keep the concurrent IPC load low.
        const contexts: Map<string, common.Context> = new Map();
        for (let start = 0; start < infos.length; start += AppListService.PARSE_CHUNK) {
          // The chunk end is clamped to the list length.
          const end: number = Math.min(start + AppListService.PARSE_CHUNK, infos.length);
          // Parse the chunk concurrently; each item degrades on its own on failure.
          const tasks: Promise<void>[] = [];
          for (let i = start; i < end; i++) {
            tasks.push(AppListService.parseOne(context, infos[i], items[i], contexts));
          }
          await Promise.all(tasks);
        }
      }
      // Cache the decoded items so other pages, for example the detail page, can reuse
      // the resolved names and icons without a second full system query.
      AppListService.latestItems = items;
      Logger.info('[AppList] loaded ' + items.length + ' installed applications');
      Logger.exit('[AppListService#loadAppList]', 'count: ' + items.length);
      // Close the trace section on the success return path.
      Logger.endTrace('NetworkSecurity.policy.loadAppList', 1);
      return new AppListView(items, true, '');
    } catch (error) {
      // Normalize the caught error so the code and message can be logged.
      const err: BusinessError = error as BusinessError;
      // 201 / 202 mean the device is not system-signed; the caller shows the degraded hint.
      const restricted: boolean = PolicyErrorCodeMap.isSystemRestricted(err.code);
      Logger.warn('[AppList] failed to load the app list, restricted ' + restricted + ', code ' + err.code + ': ' +
        err.message);
      Logger.exit('[AppListService#loadAppList]', 'loaded: false');
      // Close the trace section on the degraded return path.
      Logger.endTrace('NetworkSecurity.policy.loadAppList', 1);
      return new AppListView([], false, 'code ' + err.code + ': ' + err.message);
    }
  }

  /**
   * Requests GET_INSTALLED_BUNDLE_LIST through the runtime permission dialog. Without a bound
   * context the check is skipped and the query itself reports 201 when needed. A failed dialog
   * attempt never blocks the query, so a pre-granted install keeps working.
   * @param context host context used for the dialog, optional.
   * @returns true when the permission is granted or the check was skipped.
   */
  private static async ensurePermission(context?: common.Context): Promise<boolean> {
    // Skip the dialog when no context is bound.
    if (context === undefined) {
      return true;
    }
    try {
      // The standard stage-model path for runtime permission requests.
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      // The dialog is skipped automatically when the permission is already granted.
      const result = await atManager.requestPermissionsFromUser(context,
        ['ohos.permission.GET_INSTALLED_BUNDLE_LIST']);
      // Every requested permission must be granted, 0 means granted, -1 denied, 2 invalid.
      for (const code of result.authResults) {
        if (code !== 0) {
          Logger.warn('[AppList] permission request result code ' + code);
          return false;
        }
      }
      return true;
    } catch (error) {
      // Normalize the caught error and keep the query path alive.
      const err: BusinessError = error as BusinessError;
      Logger.warn('[AppList] permission request failed, code ' + err.code + ': ' + err.message);
      return true;
    }
  }

  // Cache of the latest successful app list; it keeps the decoded icons across pages.
  private static latestItems: AppInfoItem[] = [];

  /**
   * Finds one cached application by UID without re-querying the system.
   * @param uid UID to match.
   * @returns the cached item, or undefined when no list was loaded yet or the UID is absent.
   */
  static findAppByUid(uid: number): AppInfoItem | undefined {
    // Linear scan is enough for a demo-scale list.
    for (const item of AppListService.latestItems) {
      if (item.uid === uid) {
        return item;
      }
    }
    return undefined;
  }

  // Number of applications resolved concurrently per chunk.
  private static readonly PARSE_CHUNK: number = 8;

  /**
   * Resolves the display name and the icon of one application from its own package resources.
   * The raw label is a resource descriptor such as $string:app_name, and iconResource points
   * into another bundle, so both need a cross-package context. One failed resolution never
   * affects other items: the name falls back to the bundle name and the icon stays undefined.
   * @param hostContext host context used to create the cross-package module context.
   * @param info bundle info carrying appInfo, bundle name and module name.
   * @param item the display item to fill in place.
   * @param contexts cache of created module contexts keyed by bundle and module name.
   */
  private static async parseOne(hostContext: common.Context, info: bundleManager.BundleInfo,
    item: AppInfoItem, contexts: Map<string, common.Context>): Promise<void> {
    // The application info is always present under WITH_APPLICATION; guard anyway.
    const appInfo: bundleManager.ApplicationInfo | undefined = info.appInfo;
    if (appInfo === undefined) {
      return;
    }
    // Pick the entry module by type; HapModuleInfo carries the module name in the name field.
    let moduleName: string = '';
    const modules: bundleManager.HapModuleInfo[] = info.hapModulesInfo;
    for (const hap of modules) {
      if (hap.type === bundleManager.ModuleType.ENTRY) {
        moduleName = hap.name;
        break;
      }
    }
    // Fall back to the first HAP when no entry module is reported.
    if (moduleName.length === 0 && modules.length > 0) {
      moduleName = modules[0].name;
    }
    if (moduleName.length === 0) {
      return;
    }
    // Reuse the module context of the bundle entry module across calls.
    const key: string = info.name + '|' + moduleName;
    try {
      let moduleContext: common.Context | undefined = contexts.get(key);
      if (moduleContext === undefined) {
        // The three-parameter overload targets another bundle and needs GET_BUNDLE_INFO_PRIVILEGED.
        moduleContext = await application.createModuleContext(hostContext, info.name, moduleName);
        contexts.set(key, moduleContext);
      }
      // Resolve the localized label through the target package resources.
      item.appName = moduleContext.resourceManager.getStringSync(appInfo.labelId);
    } catch (error) {
      // Normalize the caught error and keep the bundle name fallback.
      const err: BusinessError = error as BusinessError;
      Logger.warn('[AppList] failed to resolve the label of ' + info.name + ', code ' + err.code);
    }
    try {
      // Reuse the cached module context built in the label step.
      const moduleContext: common.Context | undefined = contexts.get(key);
      if (moduleContext === undefined) {
        return;
      }
      // The system drawable pipeline returns ready-to-render pixels and also covers layered
      // icons, which plain media byte decoding cannot handle.
      item.icon = moduleContext.resourceManager.getDrawableDescriptor(appInfo.iconId).getPixelMap();
    } catch (error) {
      // Normalize the caught error and keep the icon placeholder path.
      const err: BusinessError = error as BusinessError;
      Logger.warn('[AppList] failed to resolve the icon of ' + info.name + ', code ' + err.code);
    }
  }

  /**
   * Maps one bundle info to the list item view, tolerating missing label or icon fields.
   * @param info bundle info returned by the system.
   * @returns the displayable application item.
   */
  private static toItem(info: bundleManager.BundleInfo): AppInfoItem {
    // The bundle name is always present and doubles as the name fallback.
    const bundleName: string = info.name;
    // The default bundle flag keeps appInfo undefined, so guard every field read.
    const appInfo: bundleManager.ApplicationInfo | undefined = info.appInfo;
    // Prefer a plain-text label; a resource descriptor such as $string:app_name is not a name.
    let appName: string = bundleName;
    if (appInfo !== undefined && appInfo.label !== undefined && appInfo.label.length > 0 &&
      !appInfo.label.startsWith('$')) {
      appName = appInfo.label;
    }
    // Keep the UID from the application info; 0 means the field was not populated.
    let uid: number = 0;
    if (appInfo !== undefined) {
      uid = appInfo.uid;
    }
    // The icon stays undefined here; parseOne decodes it from the target package later.
    return new AppInfoItem(uid, bundleName, appName, undefined);
  }
}
