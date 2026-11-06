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
 
export class DemoItem {
  public key: string;
  public title: string;
  public subtitle: string;
  public category: string;

  constructor(key: string, title: string, subtitle: string, category: string) {
    this.key = key;
    this.title = title;
    this.subtitle = subtitle;
    this.category = category;
  }
}

export const DEMO_ITEMS: DemoItem[] = [
  new DemoItem('navigation', 'AtomicServiceNavigation',
    'Page root container: title bar, content area, NavDestination routes', 'Container'),
  new DemoItem('search', 'AtomicServiceSearch', 'Search area + selection area + two function areas', 'Interaction'),
  new DemoItem('tabs', 'AtomicServiceTabs', 'Simplified Tabs with up to 5 tabs', 'Interaction'),
  new DemoItem('web', 'AtomicServiceWeb', 'Local H5 page + controller + message channel', 'Capability'),
  new DemoItem('download', 'DownloadFileButton', 'Unified download button + document saving', 'Capability'),
  new DemoItem('halfScreen', 'HalfScreenLaunchComponent',
    'Half-screen embedded atomic service (placeholder appId stub)', 'Capability'),
  new DemoItem('jump', 'Cross-app jump',
    'startAbility launches system settings; demonstrates success, rejection, timeout and error codes', 'Capability'),
  new DemoItem('sheet', 'Half-modal sheet',
    'bindSheet half-modal sheet: height presets, style switch and close callback', 'Interaction'),
  new DemoItem('prefs', 'Preferences storage',
    'preferences read/write: write, read, delete and restore after restart', 'Capability')
];

export const CATEGORIES: string[] = ['All', 'Container', 'Interaction', 'Capability'];

/** 目录标题资源；页面展示统一走 $r，避免硬编码文案 */
export function demoTitleRes(key: string): Resource {
  switch (key) {
    case 'navigation':
      return $r('app.string.demo_navigation_title');
    case 'search':
      return $r('app.string.demo_search_title');
    case 'tabs':
      return $r('app.string.demo_tabs_title');
    case 'web':
      return $r('app.string.demo_web_title');
    case 'download':
      return $r('app.string.demo_download_title');
    case 'halfScreen':
      return $r('app.string.demo_halfscreen_title');
    case 'jump':
      return $r('app.string.demo_jump_title');
    case 'sheet':
      return $r('app.string.demo_sheet_title');
    default:
      return $r('app.string.demo_prefs_title');
  }
}

/** 目录副标题资源 */
export function demoSubtitleRes(key: string): Resource {
  switch (key) {
    case 'navigation':
      return $r('app.string.demo_navigation_subtitle');
    case 'search':
      return $r('app.string.demo_search_subtitle');
    case 'tabs':
      return $r('app.string.demo_tabs_subtitle');
    case 'web':
      return $r('app.string.demo_web_subtitle');
    case 'download':
      return $r('app.string.demo_download_subtitle');
    case 'halfScreen':
      return $r('app.string.demo_halfscreen_subtitle');
    case 'jump':
      return $r('app.string.demo_jump_subtitle');
    case 'sheet':
      return $r('app.string.demo_sheet_subtitle');
    default:
      return $r('app.string.demo_prefs_subtitle');
  }
}

/** 目录分类资源 */
export function demoCategoryRes(key: string): Resource {
  switch (key) {
    case 'navigation':
      return $r('app.string.demo_category_container');
    case 'search':
    case 'tabs':
    case 'sheet':
      return $r('app.string.demo_category_interaction');
    default:
      return $r('app.string.demo_category_capability');
  }
}

export function filterDemos(items: DemoItem[], keyword: string, category: string): DemoItem[] {
  const normalized = keyword.trim().toLowerCase();
  return items.filter((item: DemoItem) => {
    const categoryMatched = category === '' || category === 'All' || item.category === category;
    const keywordMatched = normalized === '' ||
      item.title.toLowerCase().includes(normalized) ||
      item.subtitle.toLowerCase().includes(normalized) ||
      item.category.toLowerCase().includes(normalized);
    return categoryMatched && keywordMatched;
  });
}

export function canSwitchTab(currentIndex: number, comingIndex: number, locked: boolean, tabCount: number): boolean {
  if (tabCount <= 0 || comingIndex < 0 || comingIndex >= tabCount) {
    return false;
  }
  return !locked || currentIndex === comingIndex;
}

export function canPopNavStack(size: number): boolean {
  return size > 0;
}
