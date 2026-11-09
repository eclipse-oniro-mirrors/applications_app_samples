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

import { image } from '@kit.ImageKit';

/**
 * One installed application shown in the app list and the app detail pages.
 */
export class AppInfoItem {
  // Application UID assigned by the system.
  uid: number;
  // Bundle name of the application.
  bundleName: string;
  // Display label resolved from the application info, falls back to the bundle name.
  appName: string;
  // Icon pixels decoded from the application package, undefined when the resolution failed.
  icon: image.PixelMap | undefined;

  /**
   * Build one displayable application item.
   * @param uid application UID.
   * @param bundleName bundle name of the application.
   * @param appName display label, falling back to the bundle name when missing.
   * @param icon icon pixels decoded from the application package, undefined when unavailable.
   */
  constructor(uid: number, bundleName: string, appName: string, icon: image.PixelMap | undefined) {
    // Store the application UID.
    this.uid = uid;
    // Store the bundle name.
    this.bundleName = bundleName;
    // Store the display label.
    this.appName = appName;
    // Store the icon resource.
    this.icon = icon;
  }
}

/**
 * Result of an installed-application list query, including the safe degradation flag.
 */
export class AppListView {
  // Installed application items in system order.
  items: AppInfoItem[];
  // Whether the query succeeded; false means the list degrades to empty.
  loaded: boolean;
  // Plain failure detail for logs, empty on success.
  message: string;

  /**
   * Build one app list view.
   * @param items application items in system order.
   * @param loaded whether the query succeeded.
   * @param message failure detail for logs, empty on success.
   */
  constructor(items: AppInfoItem[], loaded: boolean, message: string) {
    // Store the items.
    this.items = items;
    // Store the load result flag.
    this.loaded = loaded;
    // Store the failure detail.
    this.message = message;
  }
}

/**
 * Route parameter of the application detail page, pushed by the app list rows and event rows.
 */
export interface AppDetailParam {
  // UID of the target application.
  uid: number;
  // Bundle name known by the caller, empty or undefined when unknown.
  bundleName?: string;
  // Display name known by the caller, empty or undefined when unknown.
  appName?: string;
}
