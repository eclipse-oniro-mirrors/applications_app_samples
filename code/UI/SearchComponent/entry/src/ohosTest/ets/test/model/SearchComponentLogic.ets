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

// Search, category and history logic of searchcomponent mainpage/SearchComponent.ets evaluated on the real
// waterFlowData; history entries are represented by scene names.

import { SceneModuleInfo, waterFlowData } from '../../../../main/ets/bridge/SearchComponentBridge';

// Mirrors searchClassifyData of SearchComponent.ets.
export const CLASSIFY_DATA: string[] = ['UI\u5e03\u5c40', '\u52a8\u6548', '\u4e09\u65b9\u5e93', 'Native',
  '\u6027\u80fd\u793a\u4f8b', '\u5176\u4ed6'];
// Mirrors setSearchInputWidth(): px2vp(width) - 32 - 24 - 8.
export const INPUT_WIDTH_RESERVED: number = 32 + 24 + 8;

// Mirrors isCategoryItem of searchFunc(): no category means every item qualifies.
export function inCategory(item: SceneModuleInfo, category: string): boolean {
  return category.length === 0 ? true : item.category.toString() === category;
}

// Mirrors searchFunc(value, category): case-insensitive name match or exact serial number match.
export function searchScenes(value: string, category: string): SceneModuleInfo[] {
  const result: SceneModuleInfo[] = [];
  for (let i: number = 0; i < waterFlowData.length; i++) {
    const item: SceneModuleInfo = waterFlowData[i];
    const isCategoryItem: boolean = inCategory(item, category);
    if (item.name.toLowerCase().includes(value.toLowerCase()) && isCategoryItem) {
      result.push(item);
    } else if (item.serialNumber.toString() === value && isCategoryItem) {
      result.push(item);
    }
  }
  return value.length !== 0 ? result : [];
}

// Mirrors the names shown in the search result list.
export function searchNames(value: string, category: string): string[] {
  return searchScenes(value, category).map((item: SceneModuleInfo): string => item.name);
}

// Mirrors the toast of searchFunc(): a non-empty search without results.
export function showsNoResultToast(value: string, category: string): boolean {
  return value !== '' && searchScenes(value, category).length === 0;
}

// Mirrors the classify button: tapping the selected category clears it (-1).
export function nextClassifyIndex(current: number, index: number): number {
  return current === index ? -1 : index;
}

// Mirrors categoryName = classifyIndex === index ? item : ''.
export function categoryAfterTap(current: number, index: number): string {
  const next: number = nextClassifyIndex(current, index);
  if (next === index && index >= 0 && index < CLASSIFY_DATA.length) {
    return CLASSIFY_DATA[index];
  }
  return '';
}

// Mirrors the history update when a result is opened: new names are prepended, known names move to the front.
export function addToHistory(history: string[], name: string): string[] {
  const result: string[] = history.slice();
  const index: number = result.indexOf(name);
  if (index < 0) {
    result.unshift(name);
  } else {
    result.unshift(result.splice(index, 1)[0]);
  }
  return result;
}

// Mirrors a history chip tap: the chip moves to the front of searchHistoryData.
export function moveHistoryToFront(history: string[], index: number): string[] {
  const result: string[] = history.slice();
  if (!Number.isInteger(index) || index < 0 || index >= result.length) {
    return result;
  }
  result.unshift(result.splice(index, 1)[0]);
  return result;
}

// Mirrors the history block visibility: hidden without history or while text is entered.
export function historyVisible(historyLength: number, searchContext: string): boolean {
  return !(historyLength === 0 || searchContext.length !== 0);
}

// Mirrors setSearchInputWidth() for a window width in px and a density.
export function searchInputWidthOf(windowWidthPx: number, density: number): number {
  if (density <= 0) {
    return 0;
  }
  return windowWidthPx / density - INPUT_WIDTH_RESERVED;
}

// Mirrors the route of a scene (appUri) found by name.
export function appUriOf(name: string): string {
  for (const item of waterFlowData) {
    if (item.name === name) {
      return item.appUri;
    }
  }
  return '';
}

// Mirrors the number of scenes per category.
export function categoryCountOf(category: string): number {
  return waterFlowData.filter((item: SceneModuleInfo): boolean => item.category === category).length;
}

// Mirrors the search page state of SearchComponent.
export class SearchPageState {
  searchInput: string = '';
  classifyIndex: number = -1;
  categoryName: string = '';
  results: string[] = [];
  history: string[] = [];
  isSearchPageShow: boolean = false;
  toasts: number = 0;

  // Mirrors onSearchClicked().
  open(): boolean {
    this.isSearchPageShow = true;
    return this.isSearchPageShow;
  }

  // Mirrors the Search onChange() handler.
  input(value: string): number {
    this.searchInput = value;
    this.results = searchNames(value, this.categoryName);
    if (showsNoResultToast(value, this.categoryName)) {
      this.toasts++;
    }
    return this.results.length;
  }

  // Mirrors the classify button onClick().
  tapCategory(index: number): string {
    this.categoryName = categoryAfterTap(this.classifyIndex, index);
    this.classifyIndex = nextClassifyIndex(this.classifyIndex, index);
    this.results = searchNames(this.searchInput, this.categoryName);
    return this.categoryName;
  }

  // Mirrors a result item click: history update and leaving the search page.
  pick(index: number): string {
    if (!Number.isInteger(index) || index < 0 || index >= this.results.length) {
      return '';
    }
    const name: string = this.results[index];
    this.history = addToHistory(this.history, name);
    this.results = [];
    this.isSearchPageShow = false;
    return appUriOf(name);
  }

  // Mirrors onArrowClicked(): everything is reset.
  back(): void {
    this.results = [];
    this.isSearchPageShow = false;
    this.classifyIndex = -1;
    this.searchInput = '';
    this.categoryName = '';
  }
}
