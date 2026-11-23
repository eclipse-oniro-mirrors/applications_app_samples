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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { expect } from '@ohos/hypium';

export const LOG_DOMAIN: int = 0xF812;
export const LOG_TAG: string = '[CameraSampleTest]';

export function logSuite(name: string, state: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', name, state);
}

export function logCase(name: string, state: string): void {
  hilog.debug(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', name, state);
}

/** Single tick yield so the watchdog can observe long suites. */
export async function yieldTick(): Promise<void> {
  await new Promise<void>((resolve) => {
    setTimeout((): void => { resolve(undefined); }, 1);
  });
}

export function caughtMessage(action: () => void): string {
  try {
    action();
  } catch (error) {
    return (error as Error).message;
  }
  return '';
}

export function throwsError(action: () => void): boolean {
  try {
    action();
  } catch (error) {
    return true;
  }
  return false;
}

export function doesNotThrow(action: () => void): boolean {
  try {
    action();
  } catch (error) {
    return false;
  }
  return true;
}

export async function rejectionMessage(promise: Promise<void>): Promise<string> {
  try {
    await promise;
  } catch (error) {
    return (error as Error).message;
  }
  return '';
}

export class CallRecorder {
  calls: number = 0;
  labels: string[] = [];

  record(label: string): void {
    this.calls++;
    this.labels.push(label);
  }

  last(): string {
    if (this.labels.length === 0) {
      return '';
    }
    return this.labels[this.labels.length - 1];
  }

  joined(separator: string): string {
    return this.labels.join(separator);
  }

  reset(): void {
    this.calls = 0;
    this.labels = [];
  }
}

/** Deterministic pseudo random source used by workload suites. */
export class Lcg {
  private state: number = 1;
  private readonly modulus: number = 2147483647;
  private readonly multiplier: number = 48271;

  constructor(seed: number = 1) {
    this.state = seed <= 0 ? 1 : seed % this.modulus;
  }

  next(): number {
    this.state = this.state * this.multiplier % this.modulus;
    return this.state;
  }

  nextInt(bound: number): number {
    if (bound <= 1) {
      return 0;
    }
    return this.next() % bound;
  }

  nextBoolean(): boolean {
    return this.next() % 2 === 0;
  }
}

export class DeferredResult {
  promise: Promise<number> = Promise.resolve<number>(0);
  resolve: (value: number) => void = () => {
  };
  reject: (error: Error) => void = () => {
  };
  settled: boolean = false;

  constructor() {
    this.promise = new Promise<number>((resolve, reject) => {
      this.resolve = resolve;
      this.reject = reject;
    });
  }

  complete(value: number): void {
    this.settled = true;
    this.resolve(value);
  }

  fail(message: string): void {
    this.settled = true;
    this.reject(new Error(message));
  }
}

export function safeLength(value: string | undefined): number {
  return value === undefined ? -1 : value.length;
}

export function indexOfString(values: string[], target: string): number {
  for (let index = 0; index < values.length; index++) {
    if (values[index] === target) {
      return index;
    }
  }
  return -1;
}

export function uniqueStrings(values: string[]): string[] {
  const result: string[] = [];
  for (let index = 0; index < values.length; index++) {
    if (result.indexOf(values[index]) === -1) {
      result.push(values[index]);
    }
  }
  return result;
}

export function expectNoDuplicates(values: string[]): void {
  expect(uniqueStrings(values).length).assertEqual(values.length);
}
