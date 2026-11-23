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

// Deterministic logic of pages/Index.ets (Index + FileItemComponent). Date and random inputs of the page are
// passed in explicitly so that the formatting can be verified.

// Mirrors documentSelectOptions.maxSelectNumber = 3 in selectDlp().
export const MAX_SELECT_NUMBER: number = 3;
// Mirrors the Want action used by viewDlp().
export const VIEW_ACTION: string = 'ohos.want.action.viewData';
// Mirrors const FONT_WEIGHT = 400.
export const FONT_WEIGHT: number = 400;
// Mirrors the 'MB' suffix of FileItemComponent.getSize().
export const SIZE_UNIT: string = 'MB';

// Mirrors the Want built by viewDlp(dlpUri).
export interface ViewWant {
  action: string;
  uri: string;
}

// Mirrors viewDlp(): { 'action': 'ohos.want.action.viewData', 'uri': dlpUri }.
export function viewWantOf(uri: string): ViewWant {
  const want: ViewWant = { action: VIEW_ACTION, uri: uri };
  return want;
}

// Mirrors JSON.stringify of the Want logged when startAbility() fails.
export function viewWantJsonOf(uri: string): string {
  return JSON.stringify(viewWantOf(uri));
}

// Mirrors the DocumentViewPicker limit: at most maxSelectNumber documents are returned per selection.
export function acceptedCountOf(selectedCount: number): number {
  if (selectedCount <= 0) {
    return 0;
  }
  return selectedCount > MAX_SELECT_NUMBER ? MAX_SELECT_NUMBER : Math.floor(selectedCount);
}

// Mirrors the push loop of selectDlp(): selected uris are appended after the existing ones.
export function appendSelection(current: string[], selected: string[]): string[] {
  const result: string[] = current.slice();
  for (let index: number = 0; index < selected.length; index++) {
    result.push(selected[index]);
  }
  return result;
}

// Mirrors the list length after a selection.
export function countAfterSelection(currentCount: number, selectedCount: number): number {
  return currentCount + acceptedCountOf(selectedCount);
}

// Mirrors Text(`Text${this.index + 1}`) of FileItemComponent.
export function itemTitleOf(index: number): string {
  return `Text${index + 1}`;
}

// Mirrors the padStart(2, '0') used by getTime().
export function twoDigits(value: number): string {
  return value.toString().padStart(2, '0');
}

// Mirrors getTime(): `${year}-${month}-${day}` with zero padded month and day (month already 1-based).
export function formatDate(year: number, month: number, day: number): string {
  return `${year}-${twoDigits(month)}-${twoDigits(day)}`;
}

// Mirrors getTime(): month = now.getMonth() + 1 for a zero-based month index.
export function formatDateFromMonthIndex(year: number, monthIndex: number, day: number): string {
  return formatDate(year, monthIndex + 1, day);
}

// Mirrors getSize(): (random * 10).toFixed(1) + 'MB' for a random fraction in [0, 1).
export function formatSize(fraction: number): string {
  return `${(fraction * 10).toFixed(1)}${SIZE_UNIT}`;
}

// Mirrors the numeric part shown by getSize().
export function sizeValueOf(fraction: number): number {
  return Number.parseFloat((fraction * 10).toFixed(1));
}

// Mirrors the logger.error() messages of selectDlp() / viewDlp().
export function errorMessageOf(operation: string, errorJson: string): string {
  return `${operation} DLP failed ${errorJson}`;
}

// Mirrors the ForEach key generation over fileArray (index based item identity).
export function itemKeyOf(uri: string, index: number): string {
  return `${index}__${uri}`;
}

// Mirrors the Index page state: selection appends uris, a list item click opens the matching uri.
export class DlpListState {
  fileArray: string[] = [];
  lastViewed: string = '';
  viewCount: number = 0;
  toastCount: number = 0;

  // Mirrors the documentPicker.select() callback.
  select(uris: string[]): number {
    const accepted: number = acceptedCountOf(uris.length);
    for (let index: number = 0; index < accepted; index++) {
      this.fileArray.push(uris[index]);
    }
    return this.fileArray.length;
  }

  // Mirrors FileItemComponent.onClick() -> viewDlp(files); returns '' for an index outside the list.
  view(index: number): string {
    if (index < 0 || index >= this.fileArray.length || !Number.isInteger(index)) {
      return '';
    }
    this.lastViewed = this.fileArray[index];
    this.viewCount++;
    return viewWantJsonOf(this.lastViewed);
  }

  // Mirrors the sift Image.onClick(): only a toast is shown.
  sift(): number {
    this.toastCount++;
    return this.toastCount;
  }

  // Mirrors the title rendered for an item.
  titleAt(index: number): string {
    return itemTitleOf(index);
  }
}
