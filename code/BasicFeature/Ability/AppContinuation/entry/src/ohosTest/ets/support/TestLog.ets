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

export const DOMAIN: number = 0xF811;
export const TAG: string = '[Sample_AppContinuation]';
export const BUNDLE: string = 'com.samples.appcontinuation';
export const SHARED_FIXTURE_CASE: string = BUNDLE + '_SharedFixture_0000';
export type SummaryValue = Object | undefined | null;
const MAX_PUBLIC_NUMBER: number = 65535;

/** Never inspect object properties, stringify objects, or reveal string contents. */
function safeSummary(value: SummaryValue): string {
  if (value === undefined) { return 'undefined'; }
  if (value === null) { return 'null'; }
  if (typeof value === 'string') { return `string(length=${(value as string).length})`; }
  if (typeof value === 'number') {
    const numberValue: number = value as number;
    return Number.isFinite(numberValue) && Math.abs(numberValue) <= MAX_PUBLIC_NUMBER ?
      `number(value=${numberValue})` : 'number(value=redacted)';
  }
  if (typeof value === 'boolean') { return `boolean(value=${value as boolean})`; }
  return `type=${typeof value}`;
}

/** Shared fixture observations never claim the currently running case as an owner. */
export function testInfo(message: string, owner: string = SHARED_FIXTURE_CASE): void {
  try {
    hilog.info(DOMAIN, TAG, '%{public}s %{public}s %{public}s', BUNDLE, owner, message);
  } catch (_error) {
    // Logging must not replace a test, asynchronous callback, or cleanup failure.
  }
}

export function testError(message: string, owner: string = SHARED_FIXTURE_CASE): void {
  try {
    hilog.error(DOMAIN, TAG, '%{public}s %{public}s %{public}s', BUNDLE, owner, message);
  } catch (_error) {
    // Keep the original error and its control flow; never log its body.
  }
}

export function caseEvent(name: string, phase: string): void {
  try {
    if (phase === 'failure') {
      hilog.error(DOMAIN, TAG, '%{public}s %{public}s %{public}s', BUNDLE, name, phase);
    } else {
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s %{public}s', BUNDLE, name, phase);
    }
  } catch (_error) {
    // The runner owns the original test result, independently of the log sink.
  }
}

/** Owner is a lexical case constant; late assertions cannot be relabelled as a later case. */
export function assertionSummary(site: string, actual: SummaryValue,
  matcher: string, expected: SummaryValue, owner: string): void {
  try {
    testInfo(`assert site=${site} matcher=${matcher} actual=${safeSummary(actual)} ` +
      `expected=${safeSummary(expected)}`, owner);
  } catch (_error) {
    // Summary formatting is best-effort; the original assertion still executes.
  }
}
