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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x55EE;
const TAG: string = 'Screenshot-TestKit';

/**
 * AppStorage keys written by the capture feature. Keeping the list in one place makes
 * the reset helpers safe: a suite can only clear state that the feature actually owns.
 */
export const CAPTURE_KEYS: string[] = ['captureImage', 'imageFilename', 'imageUri', 'saveTipStr'];

/**
 * Stage model of the capture pipeline. The real service walks through these stages in
 * order, so the harness below can reproduce the transitions without touching the system
 * screenshot interface.
 */
export enum CaptureStage {
  IDLE = 'idle',
  CAPTURED = 'captured',
  PREVIEWED = 'previewed',
  SAVED = 'saved',
  DISMISSED = 'dismissed',
  TERMINATED = 'terminated'
}

/**
 * Allowed transitions of the capture pipeline. The table is deliberately strict: every
 * regression that reorders capture, preview and save shows up as a rejected transition.
 */
const TRANSITIONS: string[] = [
  'idle>captured',
  'captured>previewed',
  'previewed>saved',
  'previewed>dismissed',
  'saved>dismissed',
  'dismissed>terminated',
  'captured>dismissed',
  'idle>dismissed'
];

/**
 * Reset every storage key that belongs to one capture session.
 */
export function resetCaptureSessionStorage(): void {
  for (let index: number = 0; index < CAPTURE_KEYS.length; index++) {
    AppStorage.setOrCreate<string>(CAPTURE_KEYS[index], '');
  }
  AppStorage.setOrCreate<string>('saveTipStr', '');
  hilog.info(DOMAIN, TAG, '%{public}s', 'capture session storage reset');
}

/**
 * Reset the state used by the view model suites.
 */
export function resetViewModelState(): void {
  AppStorage.setOrCreate<string>('saveTipStr', '');
  AppStorage.setOrCreate<string>('context', '');
  hilog.info(DOMAIN, TAG, '%{public}s', 'view model state reset');
}

/**
 * Reset the state used by the extension lifecycle suites.
 */
export function resetExtensionState(): void {
  AppStorage.setOrCreate<string>('context', '');
  AppStorage.setOrCreate<string>('saveTipStr', '');
  AppStorage.setOrCreate<string>('requestId', '0');
  hilog.info(DOMAIN, TAG, '%{public}s', 'extension state reset');
}

/**
 * Typed read helper: AppStorage.get returns T | undefined, tests compare against strings.
 */
export function readString(key: string): string {
  const value: string | undefined = AppStorage.get<string>(key);
  return value === undefined ? '' : value;
}

/**
 * Typed write helper used by suites that only need a string channel.
 */
export function writeString(key: string, value: string): void {
  AppStorage.setOrCreate<string>(key, value);
}

/**
 * Build the file name the way the model does: prefix, millisecond stamp and suffix.
 */
export function captureFileName(stamp: number, suffix: string = '.jpg'): string {
  return 'Screenshot' + '_' + stamp + suffix;
}

/**
 * Validate a generated capture file name against the documented contract.
 */
export function isValidCaptureName(name: string): boolean {
  if (!name.startsWith('Screenshot_')) {
    return false;
  }
  if (!name.endsWith('.jpg') && !name.endsWith('.jpeg')) {
    return false;
  }
  const stamp: string = name.substring('Screenshot_'.length, name.length - '.jpg'.length);
  if (stamp.length === 0) {
    return false;
  }
  const parsed: number = Number(stamp);
  return !Number.isNaN(parsed) && parsed > 0;
}

/**
 * Pure re-implementation of the view model geometry: every design value is scaled from
 * the 1920 pixel reference width used by the TV sample.
 */
export function previewRect(designWidth: number, width: number): number[] {
  const ratio: number = width / 1920;
  const rect: number[] = [96 * ratio, 570 * ratio, 750 * ratio, 421 * ratio];
  if (designWidth <= 0) {
    return rect;
  }
  return rect;
}

/**
 * State machine that mirrors the capture pipeline without system side effects.
 */
export class CaptureHarness {
  private stage: CaptureStage = CaptureStage.IDLE;
  private history: CaptureStage[] = [];
  private tip: string = '';
  private rejections: number = 0;

  /**
   * Current stage of the pipeline.
   */
  current(): CaptureStage {
    return this.stage;
  }

  /**
   * Stage history, oldest first.
   */
  stages(): CaptureStage[] {
    const copy: CaptureStage[] = [];
    for (let index: number = 0; index < this.history.length; index++) {
      copy.push(this.history[index]);
    }
    return copy;
  }

  /**
   * Number of transitions that were rejected by the table above.
   */
  rejected(): number {
    return this.rejections;
  }

  /**
   * Latest tip string rendered by the preview or the tip window.
   */
  lastTip(): string {
    return this.tip;
  }

  /**
   * Advance the pipeline. Returns false when the transition is not allowed, which lets
   * the caller assert both the negative path and the resulting stage.
   */
  advance(next: CaptureStage): boolean {
    const key: string = this.stage + '>' + next;
    if (!TRANSITIONS.includes(key)) {
      this.rejections++;
      hilog.error(DOMAIN, TAG, '%{public}s', 'rejected transition ' + key);
      return false;
    }
    this.stage = next;
    this.history.push(next);
    return true;
  }

  /**
   * Force a stage without the transition table, used by recovery suites.
   */
  force(next: CaptureStage): void {
    this.stage = next;
    this.history.push(next);
  }

  /**
   * Publish a tip string, empty values are rejected to protect the focusless window.
   */
  publishTip(tip: string): boolean {
    if (tip.length === 0) {
      this.rejections++;
      return false;
    }
    this.tip = tip;
    return true;
  }

  /**
   * Reset the harness so a suite can be executed in any order.
   */
  reset(): void {
    this.stage = CaptureStage.IDLE;
    this.history = [];
    this.tip = '';
    this.rejections = 0;
  }
}

/**
 * Minimal metric collector shared by the performance suites.
 */
export class Metrics {
  private names: string[] = [];
  private samples: number[] = [];

  record(name: string, milliseconds: number): void {
    this.names.push(name);
    this.samples.push(milliseconds);
  }

  count(): number {
    return this.samples.length;
  }

  total(): number {
    let sum: number = 0;
    for (let index: number = 0; index < this.samples.length; index++) {
      sum += this.samples[index];
    }
    return sum;
  }

  average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.total() / this.samples.length;
  }

  max(): number {
    let value: number = 0;
    for (let index: number = 0; index < this.samples.length; index++) {
      if (this.samples[index] > value) {
        value = this.samples[index];
      }
    }
    return value;
  }

  min(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let value: number = this.samples[0];
    for (let index: number = 0; index < this.samples.length; index++) {
      if (this.samples[index] < value) {
        value = this.samples[index];
      }
    }
    return value;
  }

  percentile(ratio: number): number {
    if (this.samples.length === 0) {
      return 0;
    }
    const sorted: number[] = this.samples.slice().sort((left: number, right: number) => left - right);
    const position: number = Math.floor((sorted.length - 1) * ratio);
    return sorted[position];
  }

  summary(): string {
    return 'count=' + this.count() + ',avg=' + this.average().toFixed(2) + ',max=' + this.max();
  }

  reset(): void {
    this.names = [];
    this.samples = [];
  }
}

/**
 * Await a fixed delay without blocking the UI thread.
 */
export async function delayMs(milliseconds: number): Promise<void> {
  await new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, milliseconds);
  });
}

/**
 * Run a callback repeatedly and return the elapsed time in milliseconds.
 */
export async function measure(rounds: number, action: () => void): Promise<number> {
  const start: number = Date.now();
  for (let index: number = 0; index < rounds; index++) {
    action();
  }
  return Date.now() - start;
}

/**
 * Guard that fails fast when an asynchronous action leaks a rejection.
 */
export async function expectNoThrow(action: () => Promise<void>, label: string): Promise<boolean> {
  try {
    await action();
    return true;
  } catch (error) {
    hilog.error(DOMAIN, TAG, '%{public}s', label + ' threw');
    return false;
  }
}
