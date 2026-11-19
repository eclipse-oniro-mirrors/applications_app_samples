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

// Deterministic logic of pages/index.ets (aspect ratio selection) and MainAbility.ts (window size listener).

// Mirrors the ratio defaults of pages/index.ets.
export const RATIO_4_3: number = (4 / 3) * 1.0;
export const RATIO_1_1: number = 1.0;
export const RATIO_16_9: number = (16 / 9) * 1.0;
export const DEFAULT_RATIO_LABEL: string = '4:3';
// Mirrors the @StorageLink defaults before the first windowSizeChange event.
export const UNKNOWN_SIZE: string = 'unknown';
// Mirrors the page loaded by MainAbility.onWindowStageCreate().
export const MAIN_PAGE: string = 'pages/index';

// Mirrors the ratio radio handler: index 0 -> 4:3, index 1 -> 1:1, any other index -> 16:9.
export function ratioOfIndex(index: number): number {
  if (index === 0) {
    return RATIO_4_3;
  }
  if (index === 1) {
    return RATIO_1_1;
  }
  return RATIO_16_9;
}

// Mirrors showWindowRatio for the selected index.
export function ratioLabelOfIndex(index: number): string {
  if (index === 0) {
    return '4:3';
  }
  if (index === 1) {
    return '1:1';
  }
  return '16:9';
}

// Mirrors AppStorage.setOrCreate('windowWidth', JSON.stringify(width)).
export function sizeTextOf(value: number): string {
  return JSON.stringify(value);
}

// Mirrors setAspectRatio(ratio): the height kept for a given width (ratio = width / height).
export function heightForWidth(width: number, ratio: number): number {
  if (ratio <= 0) {
    return 0;
  }
  return width / ratio;
}

// Mirrors setAspectRatio(ratio): the width kept for a given height.
export function widthForHeight(height: number, ratio: number): number {
  return height * ratio;
}

// Mirrors the rounded px height the window manager lays out for the ratio.
export function roundedHeightForWidth(width: number, ratio: number): number {
  return Math.round(heightForWidth(width, ratio));
}

// Mirrors the label of a reported window size (width x height as shown by the two Text rows).
export function sizeSummaryOf(width: number, height: number): string {
  return `${sizeTextOf(width)} x ${sizeTextOf(height)}`;
}

// Mirrors a reported size matching the selected ratio (within one pixel of rounding).
export function matchesRatio(width: number, height: number, ratio: number): boolean {
  if (height <= 0 || ratio <= 0) {
    return false;
  }
  return Math.abs(width / ratio - height) <= 1;
}

// Mirrors the ratio radio index chosen for a label ('4:3' -> 0, '1:1' -> 1, '16:9' -> 2).
export function indexOfLabel(label: string): number {
  const labels: string[] = ['4:3', '1:1', '16:9'];
  return labels.indexOf(label);
}

// Mirrors the index page state: ratio radio, applied ratio and the size texts fed by MainAbility.
export class RatioPageState {
  numbers: number = 0;
  windowRatio: number = RATIO_4_3;
  showWindowRatio: string = DEFAULT_RATIO_LABEL;
  windowWidth: string = UNKNOWN_SIZE;
  windowHeight: string = UNKNOWN_SIZE;
  applied: number = 0;

  // Mirrors the radio onChange handler.
  select(index: number): string {
    this.numbers = index;
    this.windowRatio = ratioOfIndex(index);
    this.showWindowRatio = ratioLabelOfIndex(index);
    return this.showWindowRatio;
  }

  // Mirrors the windowSizeChange listener of MainAbility.getMainWindow().
  onSizeChange(width: number, height: number): string {
    this.windowWidth = sizeTextOf(width);
    this.windowHeight = sizeTextOf(height);
    return sizeSummaryOf(width, height);
  }

  // Mirrors the confirm button calling windows.setAspectRatio(this.windowRatio).
  apply(): number {
    this.applied++;
    return this.windowRatio;
  }
}
