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
 
export class StorageKeys {
  public static readonly NAV_TITLE: string = 'navTitle';
  public static readonly NAV_GRADIENT: string = 'navGradient';
  public static readonly NAV_HIDE_TITLE: string = 'navHideTitle';
  public static readonly NAV_SPLIT: string = 'navSplit';
  public static readonly APP_LOGS: string = 'appLogs';
  public static readonly LAYOUT_PROFILE: string = 'layoutProfile';
}

export enum RouteKey {
  NAVIGATION = 'navigation',
  SEARCH = 'search',
  TABS = 'tabs',
  WEB = 'web',
  DOWNLOAD = 'download',
  HALF_SCREEN = 'halfScreen',
  JUMP = 'jump',
  SHEET = 'sheet',
  PREFS = 'prefs'
}

export function isRouteKey(value: string): boolean {
  return value === RouteKey.NAVIGATION || value === RouteKey.SEARCH || value === RouteKey.TABS ||
    value === RouteKey.WEB || value === RouteKey.DOWNLOAD || value === RouteKey.HALF_SCREEN ||
    value === RouteKey.JUMP || value === RouteKey.SHEET || value === RouteKey.PREFS;
}

export const DEFAULT_NAV_TITLE: string = 'nav_title_default';
export const NAV_TITLE_PRESETS: string[] = ['nav_title_default', 'nav_title_alt'];

export const TAB_COUNT: number = 3;
export const PICKER_TIMEOUT_MS: number = 3000;
export const JUMP_TIMEOUT_MS: number = 3000;

export const LOG_STORE_CAPACITY: number = 200;
export const PAGE_LOG_LIMIT: number = 20;
export const HOME_LOG_LIMIT: number = 30;

export const HILOG_DOMAIN: number = 0xF811;
export const HILOG_TAG: string = '[Sample_AtomicServiceComponents]';

export const HALF_SCREEN_APP_ID: string = '576000000000000000';
