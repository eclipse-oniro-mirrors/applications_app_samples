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

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AppInfoItem, AppListService, AppListView, Logger } from 'library';

/**
 * State holder of the installed application list page. The load result and the search
 * keyword are published as V2 traces so the page re-renders without manual refresh.
 */
@ObservedV2
export class AppListViewModel {
  // Loaded application items shown by the list.
  @Trace items: AppInfoItem[] = [];
  // Search keyword typed by the user; empty means no filtering.
  @Trace keyword: string = '';
  // Whether a load action is running.
  @Trace busy: boolean = false;
  // Whether the last load succeeded; false shows the degraded hint.
  @Trace loaded: boolean = false;
  // Localized degradation message shown by the page, empty on success.
  @Trace message: ResourceStr = '';

  /**
   * Filtered items recomputed from the loaded list and the keyword.
   */
  @Computed
  get filtered(): AppInfoItem[] {
    // An empty keyword keeps the full list.
    const text: string = this.keyword.trim().toLowerCase();
    if (text.length === 0) {
      return this.items;
    }
    // Match either the display name or the bundle name.
    const result: AppInfoItem[] = [];
    for (const item of this.items) {
      if (item.appName.toLowerCase().includes(text) || item.bundleName.toLowerCase().includes(text)) {
        result.push(item);
      }
    }
    return result;
  }

  /**
   * Load the installed application list once and publish the view state.
   * @param context host context used for the runtime permission request, optional.
   */
  async load(context?: common.Context): Promise<void> {
    // Skip while a load is already running.
    if (this.busy) {
      return;
    }
    this.busy = true;
    try {
      // AppListService never throws and returns a degraded view on failure.
      const view: AppListView = await AppListService.loadAppList(context);
      this.items = view.items;
      this.loaded = view.loaded;
      // Show the unified restriction hint when the device is not system-signed.
      this.message = view.loaded ? '' : $r('app.string.ns_pol_restricted');
    } catch (error) {
      // Safety net: the service already swallows its own errors.
      const err: BusinessError = error as BusinessError;
      this.items = [];
      this.loaded = false;
      this.message = $r('app.string.ns_pol_restricted');
      Logger.error('[AppList] unexpected load failure, code ' + err.code + ': ' + err.message);
    } finally {
      // Release the busy flag on every path.
      this.busy = false;
    }
  }

  /**
   * Update the search keyword used by the filtered getter.
   * @param keyword keyword typed into the search input.
   */
  filter(keyword: string): void {
    // Publish the keyword so the computed filter re-evaluates.
    this.keyword = keyword;
  }
}
