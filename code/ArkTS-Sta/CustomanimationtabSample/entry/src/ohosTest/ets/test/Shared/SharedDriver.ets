'use static';
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

/**
 * Pure logical model of the custom animation tab page. No UI framework is
 * imported here. The model mirrors the transitions that Index.ets performs in
 * its tab click handler, in its Swiper.onChange callback and in its horizontal
 * Scroll.onDidScroll callback. Expectations in the suites come from the
 * independent oracle functions in this file, never from the model itself.
 */

export const TABS: string[] = [
  '\u5168\u90e8', 'UI\u5e03\u5c40', '\u52a8\u6548', '\u4e09\u65b9\u5e93', '\u5176\u4ed6'
];
export const TAB_KEYS: string[] = ['all', 'layout', 'motion', 'thirdParty', 'other'];
export const DATA_ROWS: string[] = ['0', '1', '2', '3', '4', '5', '6', '7'];

export const TAB_COUNT: number = 5;
export const DATA_ROW_COUNT: number = 8;
export const TAB_WIDTH: number = 95;
export const BAR_WIDTH: number = 90;
export const BAR_HEIGHT: number = 60;
export const BAR_RADIUS: number = 20;
export const BAR_TOP_MARGIN: number = 10;
export const PAGE_HEIGHT_PERCENT: number = 85;
export const BUTTON_HEIGHT_PERCENT: number = 15;

export const DEFAULT_COLOR: string = '#C0C0C0';
export const TOGGLE_COLOR: string = 'yellow';
export const SCROLL_LEFT: number = 90;
export const SCROLL_RIGHT: number = -90;
export const SELECT_FONT_SIZE: number = 18;
export const UNSELECT_FONT_SIZE: number = 17;

export const CARD_HEIGHT: number = 102;
export const CARD_RADIUS: number = 8;
export const IMAGE_WIDTH: number = 128;
export const IMAGE_HEIGHT: number = 80;
export const IMAGE_RADIUS: number = 8;
export const TOPIC_WIDTH: number = 58;
export const TOPIC_HEIGHT: number = 16;
export const TOPIC_RADIUS: number = 4;
export const ACTION_WIDTH: number = 58;
export const ACTION_HEIGHT: number = 20;
export const PADDING: number = 12;
export const ROW_HEIGHT: number = 40;
export const TITLE_HEIGHT: number = 20;
export const TEXT_HEIGHT: number = 20;
export const TEXT_GAP_HEIGHT: number = 4;

export class FloatEntry {
  name: string;
  value: number;
  unit: string;

  constructor(name: string, value: number, unit: string) {
    this.name = name;
    this.value = value;
    this.unit = unit;
  }
}

export class IntEntry {
  name: string;
  value: number;

  constructor(name: string, value: number) {
    this.name = name;
    this.value = value;
  }
}

export class ColorEntry {
  name: string;
  hex: string;

  constructor(name: string, hex: string) {
    this.name = name;
    this.hex = hex;
  }
}

export const FLOAT_ENTRIES: FloatEntry[] = [
  new FloatEntry('custom_animation_tab_list_select_font_size', 18, 'fp'),
  new FloatEntry('custom_animation_tab_list_unselect_font_size', 17, 'fp'),
  new FloatEntry('custom_animation_tab_ske_large_border_radius', 8, 'vp'),
  new FloatEntry('custom_animation_tab_ske_small_border_radius', 8, 'vp'),
  new FloatEntry('custom_animation_tab_ske_xs_border_radius', 4, 'vp'),
  new FloatEntry('custom_animation_tab_ske_lg_topic_width', 58, 'vp'),
  new FloatEntry('custom_animation_tab_ske_topic_height', 16, 'vp'),
  new FloatEntry('custom_animation_tab_ske_action_area_height', 20, 'vp'),
  new FloatEntry('custom_animation_tab_ske_card_height', 102, 'vp'),
  new FloatEntry('custom_animation_tab_ske_card_title_height', 20, 'vp'),
  new FloatEntry('custom_animation_tab_ske_card_text_height', 20, 'vp'),
  new FloatEntry('custom_animation_tab_ske_image_height', 80, 'vp'),
  new FloatEntry('custom_animation_tab_ske_md_padding_margin', 12, 'vp'),
  new FloatEntry('custom_animation_tab_ske_row_height', 40, 'vp')
];

export const COLOR_ENTRIES: ColorEntry[] = [
  new ColorEntry('start_window_background', '#FFFFFF'),
  new ColorEntry('custom_animation_tab_skeleton_color_medium', '#FFF2F3F4'),
  new ColorEntry('custom_animation_tab_skeleton_color_light', '#FFECECEC')
];

export const INT_ENTRIES: IntEntry[] = [
  new IntEntry('multiple_files_download_image_size_fifty', 50),
  new IntEntry('multiple_files_download_image_size_twenty_five', 25),
  new IntEntry('multiple_files_download_text_font_size_fourteen', 14),
  new IntEntry('multiple_files_download_text_font_size_twelve', 12),
  new IntEntry('multiple_files_download_text_font_size_twenty_five', 25),
  new IntEntry('multiple_files_download_text_font_size_twenty', 20),
  new IntEntry('multiple_files_download_padding_twenty', 20),
  new IntEntry('multiple_files_download_padding_fifteen', 15),
  new IntEntry('multiple_files_download_margin_bottom_eighteen', 18),
  new IntEntry('multiple_files_download_margin_bottom_twelve', 12),
  new IntEntry('multiple_files_download_margin_top_twenty', 20),
  new IntEntry('multiple_files_download_margin_top_seven', 7),
  new IntEntry('multiple_files_download_margin_top_five', 5),
  new IntEntry('multiple_files_download_progress_height', 5),
  new IntEntry('multiple_files_download_border_width', 5),
  new IntEntry('multiple_files_download_border_radius', 10),
  new IntEntry('multiple_files_download_margin_top_thirty', 30),
  new IntEntry('multiple_files_download_margin_left_four', 4),
  new IntEntry('multiple_files_download_padding_zero', 0),
  new IntEntry('multiple_files_download_padding_five', 5),
  new IntEntry('multiple_files_download_height_twenty_six', 26),
  new IntEntry('multiple_files_download_borderRadius_eight', 8),
  new IntEntry('multiple_files_download_borderRadius_twelve', 12),
  new IntEntry('multiple_files_download_history_percentage_fifty', 50),
  new IntEntry('multiple_files_download_margin_left_sixty', 60)
];

export function floatOf(name: string): number {
  for (let i = 0; i < FLOAT_ENTRIES.length; i++) {
    if (FLOAT_ENTRIES[i].name === name) {
      return FLOAT_ENTRIES[i].value;
    }
  }
  return -1;
}

export function integerOf(name: string): number {
  for (let i = 0; i < INT_ENTRIES.length; i++) {
    if (INT_ENTRIES[i].name === name) {
      return INT_ENTRIES[i].value;
    }
  }
  return -1;
}

export function colorOf(name: string): string {
  for (let i = 0; i < COLOR_ENTRIES.length; i++) {
    if (COLOR_ENTRIES[i].name === name) {
      return COLOR_ENTRIES[i].hex;
    }
  }
  return '';
}

export function clampIndex(value: number): number {
  if (value < 0) {
    return 0;
  }
  if (value > TAB_COUNT - 1) {
    return TAB_COUNT - 1;
  }
  return value;
}

/** Independent oracle: fold (next - current) * 95 over a click path. */
export function oracleDisplacement(path: number[]): number {
  let current: number = 0;
  let total: number = 0;
  for (let i = 0; i < path.length; i++) {
    total += (path[i] - current) * TAB_WIDTH;
    current = path[i];
  }
  return total;
}

/** Independent oracle: final scrollX after the documented scroll-focus rule. */
export function oracleScrollFinal(path: number[]): number {
  let scroll: number = 0;
  for (let i = 0; i < path.length; i++) {
    if (path[i] === 3) {
      scroll = SCROLL_LEFT;
    } else if (path[i] === 1) {
      scroll = SCROLL_RIGHT;
    }
  }
  return scroll;
}

/** Independent oracle: full scrollX trail, one entry per click. */
export function oracleScrollTrail(path: number[]): number[] {
  let scroll: number = 0;
  let trail: number[] = [];
  for (let i = 0; i < path.length; i++) {
    if (path[i] === 3) {
      scroll = SCROLL_LEFT;
    } else if (path[i] === 1) {
      scroll = SCROLL_RIGHT;
    }
    trail.push(scroll);
  }
  return trail;
}

/** Independent oracle: displacement is always index * 95 after a path from 0. */
export function oracleLinear(path: number[]): number {
  if (path.length === 0) {
    return 0;
  }
  return path[path.length - 1] * TAB_WIDTH;
}

export function dragTotal(deltas: number[]): number {
  let total: number = 0;
  for (let i = 0; i < deltas.length; i++) {
    total -= deltas[i];
  }
  return total;
}

export function settleTargetIndex(start: number, delta: number): number {
  const half: number = TAB_WIDTH / 2;
  let steps: number = 0;
  let rest: number = delta;
  while (rest >= half) {
    steps++;
    rest -= TAB_WIDTH;
  }
  while (rest <= -half) {
    steps--;
    rest += TAB_WIDTH;
  }
  return clampIndex(start + steps);
}

export function settleRebounds(start: number, delta: number): boolean {
  return settleTargetIndex(start, delta) === start;
}

export function colorAfterToggles(toggles: number): string {
  return toggles % 2 === 0 ? DEFAULT_COLOR : TOGGLE_COLOR;
}

export function uniqueCount(items: string[]): number {
  let seen: string[] = [];
  for (let i = 0; i < items.length; i++) {
    if (seen.indexOf(items[i]) < 0) {
      seen.push(items[i]);
    }
  }
  return seen.length;
}

export function totalCells(pages: number, rows: number): number {
  return pages * rows;
}

export function sequenceTotal(values: number[]): number {
  let total: number = 0;
  for (let i = 0; i < values.length; i++) {
    total += values[i];
  }
  return total;
}

export function rgbOf(hex: string): number[] {
  let raw: string = hex;
  if (raw.length === 9) {
    raw = raw.substring(3);
  } else if (raw.length === 7) {
    raw = raw.substring(1);
  }
  const r: number = parseInt(raw.substring(0, 2), 16);
  const g: number = parseInt(raw.substring(2, 4), 16);
  const b: number = parseInt(raw.substring(4, 6), 16);
  return [r, g, b];
}

export function luminanceOf(hex: string): number {
  const parts: number[] = rgbOf(hex);
  const r: number = parts[0] / 255;
  const g: number = parts[1] / 255;
  const b: number = parts[2] / 255;
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

export function contrastOf(first: string, second: string): number {
  const a: number = luminanceOf(first) + 0.05;
  const b: number = luminanceOf(second) + 0.05;
  return a > b ? a / b : b / a;
}

export class TabState {
  index: number = 0;
  displacement: number = 0;
  color: string = DEFAULT_COLOR;
  scrollX: number = 0;
  selects: number = 0;
  drags: number = 0;
  toggles: number = 0;
  changes: number = 0;
  path: number[] = [];
  dragPath: number[] = [];
  history: string[] = [];

  select(next: number): void {
    const bounded: number = clampIndex(next);
    this.displacement += (bounded - this.index) * TAB_WIDTH;
    this.index = bounded;
    this.selects++;
    this.path.push(bounded);
    this.history.push('select:' + String(bounded));
    if (this.index === 3) {
      this.scrollX = SCROLL_LEFT;
    } else if (this.index === 1) {
      this.scrollX = SCROLL_RIGHT;
    }
  }

  onChange(next: number): void {
    const bounded: number = clampIndex(next);
    this.displacement += (bounded - this.index) * TAB_WIDTH;
    this.index = bounded;
    this.changes++;
    this.path.push(bounded);
    this.history.push('change:' + String(bounded));
    if (this.index === 3) {
      this.scrollX = SCROLL_LEFT;
    } else if (this.index === 1) {
      this.scrollX = SCROLL_RIGHT;
    }
  }

  drag(xOffset: number): void {
    this.displacement -= xOffset;
    this.drags++;
    this.dragPath.push(xOffset);
    this.history.push('drag:' + String(xOffset));
  }

  toggleColor(): void {
    this.color = this.color === DEFAULT_COLOR ? TOGGLE_COLOR : DEFAULT_COLOR;
    this.toggles++;
  }

  reset(): void {
    this.index = 0;
    this.displacement = 0;
    this.color = DEFAULT_COLOR;
    this.scrollX = 0;
    this.selects = 0;
    this.drags = 0;
    this.toggles = 0;
    this.changes = 0;
    this.path = [];
    this.dragPath = [];
    this.history = [];
  }

  clone(): TabState {
    const copy: TabState = new TabState();
    copy.index = this.index;
    copy.displacement = this.displacement;
    copy.color = this.color;
    copy.scrollX = this.scrollX;
    copy.selects = this.selects;
    copy.drags = this.drags;
    copy.toggles = this.toggles;
    copy.changes = this.changes;
    copy.path = this.path.slice();
    copy.dragPath = this.dragPath.slice();
    copy.history = this.history.slice();
    return copy;
  }
}

export class SkeletonCard {
  isMine: boolean = false;

  constructor(isMine: boolean) {
    this.isMine = isMine;
  }

  textBlocks(): number {
    return 2;
  }

  imageBlocks(): number {
    return 1;
  }

  actionBlocks(): number {
    return this.isMine ? 0 : 3;
  }

  tagBlocks(): number {
    return this.isMine ? 2 : 0;
  }

  totalBlocks(): number {
    return this.textBlocks() + this.imageBlocks() + this.actionBlocks() + this.tagBlocks();
  }

  contentHeight(): number {
    return TITLE_HEIGHT + TEXT_GAP_HEIGHT + TEXT_HEIGHT;
  }

  footerHeight(): number {
    return ROW_HEIGHT;
  }

  innerWidth(): number {
    return IMAGE_WIDTH + PADDING;
  }

  cardWidthWithMargins(outerWidth: number): number {
    return outerWidth - PADDING * 2;
  }

  tagWidthAt(index: number): number {
    return index === 0 ? TOPIC_WIDTH : TOPIC_WIDTH;
  }
}

export class PageModel {
  labels: string[] = TABS;
  rows: string[] = DATA_ROWS;

  cellCount(): number {
    return totalCells(this.labels.length, this.rows.length);
  }

  labelAt(index: number): string {
    return this.labels[clampIndex(index).toInt()];
  }

  rowAt(index: number): string {
    if (index < 0 || index >= this.rows.length) {
      return '';
    }
    return this.rows[index.toInt()];
  }
}

export class ActionLog {
  entries: string[] = [];

  record(event: string): void {
    this.entries.push(event);
  }

  size(): number {
    return this.entries.length;
  }

  countOf(prefix: string): number {
    let total: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].indexOf(prefix) === 0) {
        total++;
      }
    }
    return total;
  }

  last(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  snapshot(): string {
    return this.entries.join('|');
  }
}

export function sanitizeLabel(raw: string): string {
  return raw.trim();
}

export function isBlank(raw: string): boolean {
  return raw.trim().length === 0;
}

export function tabToPageKey(index: number): string {
  if (index < 0 || index >= TAB_KEYS.length) {
    return '';
  }
  return TAB_KEYS[index.toInt()];
}

export function pageKeyToIndex(key: string): number {
  for (let i = 0; i < TAB_KEYS.length; i++) {
    if (TAB_KEYS[i] === key) {
      return i;
    }
  }
  return -1;
}

/** FNV-1a style accumulator used to fingerprint an event log independently. */
export function logFingerprint(events: string[]): number {
  let hash: number = 2166136261;
  for (let i = 0; i < events.length; i++) {
    const text: string = events[i];
    for (let j = 0; j < text.length; j++) {
      hash = hash ^ text.charCodeAt(j);
      hash = hash * 16777619;
      hash = hash >>> 0;
    }
  }
  return hash >>> 0;
}

export function expectedSelectedFont(current: number, target: number): number {
  return current === target ? SELECT_FONT_SIZE : UNSELECT_FONT_SIZE;
}

export function selectedCountAt(index: number): number {
  return index >= 0 && index < TAB_COUNT ? 1 : 0;
}

export function barOffsetAt(index: number): number {
  return index * TAB_WIDTH;
}

export function isVisibleBar(index: number, viewport: number): boolean {
  const left: number = index * TAB_WIDTH;
  return left + BAR_WIDTH > 0 && left < viewport;
}

export function wrapDisabled(index: number, delta: number): number {
  const candidate: number = index + delta;
  if (candidate < 0) {
    return 0;
  }
  if (candidate > TAB_COUNT - 1) {
    return TAB_COUNT - 1;
  }
  return candidate;
}

export function percentage(part: number, whole: number): number {
  if (whole === 0) {
    return 0;
  }
  return part / whole * 100;
}

export function average(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  return sequenceTotal(values) / values.length;
}

export function maxOf(values: number[]): number {
  let best: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] > best) {
      best = values[i];
    }
  }
  return best;
}

export function minOf(values: number[]): number {
  let best: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] < best) {
      best = values[i];
    }
  }
  return best;
}

export function ascending(values: number[]): boolean {
  for (let i = 1; i < values.length; i++) {
    if (values[i] < values[i - 1]) {
      return false;
    }
  }
  return true;
}

export function displacementInvariant(state: TabState): boolean {
  return state.displacement === state.index * TAB_WIDTH;
}

export function scrollInvariant(state: TabState): boolean {
  if (state.index === 3) {
    return state.scrollX === SCROLL_LEFT;
  }
  if (state.index === 1) {
    return state.scrollX === SCROLL_RIGHT;
  }
  return true;
}
