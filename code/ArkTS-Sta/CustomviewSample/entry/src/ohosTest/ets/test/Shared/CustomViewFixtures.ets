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

/** Fixtures and pure helpers shared by the CustomviewSample UI test suites. */

export interface TabFixture {
  index: number;
  label: string;
  contentId: string;
  sampleCount: number;
}

export interface AnimationFixture {
  index: number;
  durationMs: number;
  repeatable: boolean;
}

/** Tab labels rendered by the sample page, in display order. */
export const TAB_LABELS: string[] = ['候补预测', '在线换座', '余票挖掘', '个人中心'];

/** Page content component ids, one per tab. */
export const CONTENT_IDS: string[] = ['custom_view_content_0', 'custom_view_content_1',
  'custom_view_content_2', 'custom_view_content_3'];

export const TAB_FIXTURES: TabFixture[] = [
  { index: 0, label: '候补预测', contentId: 'custom_view_content_0', sampleCount: 8 },
  { index: 1, label: '在线换座', contentId: 'custom_view_content_1', sampleCount: 7 },
  { index: 2, label: '余票挖掘', contentId: 'custom_view_content_2', sampleCount: 6 },
  { index: 3, label: '个人中心', contentId: 'custom_view_content_3', sampleCount: 5 }
];

export const ANIMATION_FIXTURES: AnimationFixture[] = [
  { index: 0, durationMs: 0, repeatable: false },
  { index: 1, durationMs: 200, repeatable: true },
  { index: 2, durationMs: 400, repeatable: true },
  { index: 3, durationMs: 600, repeatable: true }
];

export function sumTabSamples(): number {
  let total: number = 0;
  for (let i: number = 0; i < TAB_FIXTURES.length; i++) {
    total += TAB_FIXTURES[i].sampleCount;
  }
  return total;
}

export function countPages(): number {
  return TAB_LABELS.length;
}

export function resolveTabIndexByLabel(label: string): number {
  for (let i: number = 0; i < TAB_LABELS.length; i++) {
    if (TAB_LABELS[i] === label) {
      return i;
    }
  }
  return -1;
}

export function clampValue(value: number, min: number, max: number): number {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

export function isSortedAscending(values: number[]): boolean {
  for (let i: number = 1; i < values.length; i++) {
    if (values[i - 1] > values[i]) {
      return false;
    }
  }
  return true;
}

export function uniqueValues(values: string[]): string[] {
  const result: string[] = [];
  for (let i: number = 0; i < values.length; i++) {
    if (result.indexOf(values[i]) < 0) {
      result.push(values[i]);
    }
  }
  return result;
}

export function buildTabKey(index: number, suffix: string): string {
  return 'tab-' + String(index) + '-' + suffix;
}

export function parseTabKey(key: string): string[] {
  return key.split('-');
}

export function calculateGridRows(count: number, perRow: number): number {
  if (count <= 0 || perRow <= 0) {
    return 0;
  }
  return Math.floor((count + perRow - 1) / perRow);
}

export function calculateProgressPercent(done: number, total: number): number {
  if (total <= 0) {
    return 0;
  }
  return Math.floor(done * 100 / total);
}

export function computeLayoutWeight(total: number, fixed: number): number {
  return total - fixed;
}

export function sumAnimationSamples(): number {
  let total: number = 0;
  for (let i: number = 0; i < ANIMATION_FIXTURES.length; i++) {
    total += ANIMATION_FIXTURES[i].durationMs;
  }
  return total;
}

/** Simple tab selection model mirroring the sample page behaviour. */
export class TabModel {
  private current: number = 0;
  private readonly labels: string[] = TAB_LABELS;

  public count(): number {
    return this.labels.length;
  }

  public currentIndex(): number {
    return this.current;
  }

  public currentLabel(): string {
    return this.labels[this.current];
  }

  public select(index: number): boolean {
    if (index < 0 || index >= this.labels.length) {
      return false;
    }
    this.current = index;
    return true;
  }

  public moveNext(): boolean {
    if (this.current >= this.labels.length - 1) {
      return false;
    }
    this.current++;
    return true;
  }

  public movePrev(): boolean {
    if (this.current <= 0) {
      return false;
    }
    this.current--;
    return true;
  }

  public reset(): void {
    this.current = 0;
  }
}

/** Animation timeline model used by the motion related suites. */
export class AnimationModel {
  private frame: number = 0;
  private playing: boolean = false;
  private readonly duration: number;

  constructor(duration: number) {
    this.duration = duration;
  }

  public play(): boolean {
    if (this.playing) {
      return false;
    }
    this.playing = true;
    return true;
  }

  public pause(): boolean {
    if (!this.playing) {
      return false;
    }
    this.playing = false;
    return true;
  }

  public stop(): void {
    this.playing = false;
    this.frame = 0;
  }

  public advance(step: number): number {
    if (this.playing && step > 0) {
      this.frame += step;
      if (this.frame > this.duration) {
        this.frame = this.duration;
      }
    }
    return this.frame;
  }

  public getFrame(): number {
    return this.frame;
  }
}

/** Key/value store used to validate state persistence behaviour. */
export class StateStoreModel {
  private keys: string[] = [];
  private values: number[] = [];
  private history: number = 0;

  public set(key: string, value: number): void {
    const index: number = this.keys.indexOf(key);
    if (index >= 0) {
      this.values[index] = value;
    } else {
      this.keys.push(key);
      this.values.push(value);
    }
    this.history++;
  }

  public get(key: string): number {
    const index: number = this.keys.indexOf(key);
    return index >= 0 ? this.values[index] : -1;
  }

  public remove(key: string): boolean {
    const index: number = this.keys.indexOf(key);
    if (index < 0) {
      return false;
    }
    this.keys.splice(index, 1);
    this.values.splice(index, 1);
    return true;
  }

  public size(): number {
    return this.keys.length;
  }

  public historySize(): number {
    return this.history;
  }
}

/** Rolling sampler used by performance oriented test cases. */
export class PerformanceSampler {
  private samples: number[] = [];

  public record(value: number): void {
    this.samples.push(value);
  }

  public count(): number {
    return this.samples.length;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      total += this.samples[i];
    }
    return Math.floor(total / this.samples.length);
  }

  public peak(): number {
    let result: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      if (this.samples[i] > result) {
        result = this.samples[i];
      }
    }
    return result;
  }

  public isStable(limit: number): boolean {
    return this.peak() <= limit;
  }

  public reset(): void {
    this.samples = [];
  }
}

/** Validation helpers reused by validation oriented suites. */
export class ValidationModel {
  public static isValidName(value: string): boolean {
    return value.length > 0;
  }

  public static isValidIndex(index: number, count: number): boolean {
    return index >= 0 && index < count;
  }

  public static isValidRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  public static isPositive(value: number): boolean {
    return value > 0;
  }
}
