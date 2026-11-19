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

import { it } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

export const DOMAIN: number = 0xF811;
export const TAG: string = '[Sample_AppStartupAuto]';
export const BUNDLE: string = 'com.samples.appstartupauto';

/** Logging must never replace a test failure, prevent a body, or interrupt cleanup. */
export function testInfo(message: string): void {
  try {
    hilog.info(DOMAIN, TAG, '%{public}s', message);
  } catch (_) {
    // Diagnostic output is best effort; the test remains authoritative.
  }
}

export function testFailure(message: string): void {
  try {
    hilog.error(DOMAIN, TAG, '%{public}s', message);
  } catch (_) {
    // Do not obscure the original failure with a logger failure.
  }
}

/** Old @tc.name values remain stable aliases; Hypium receives only the new runtime name. */
export function runtimeCaseName(legacyName: string): string {
  const parts: RegExpMatchArray | null = legacyName.match(/^test([A-Za-z][A-Za-z0-9_]*?)([0-9]{4})$/);
  return parts === null ? legacyName : `${BUNDLE}_${parts[1]}_${parts[2]}`;
}

/** Map only case components, not suite names, flags, timeout, runner or other parameters. */
export function remapLegacyCaseFilters(parameters: Record<string, string>): void {
  const keys: string[] = ['class', 'notClass', 'itName', 'runSkipped',
    '-s class', '-s notClass', '-s itName', '-s runSkipped'];
  keys.forEach((key: string): void => {
    const value: string | undefined = parameters[key];
    if (value === undefined) { return; }
    parameters[key] = value.split(',').map((entry: string): string => {
      const separator: number = entry.lastIndexOf('#');
      if (separator >= 0) {
        return entry.substring(0, separator + 1) + runtimeCaseName(entry.substring(separator + 1));
      }
      return key === 'itName' || key === '-s itName' ? runtimeCaseName(entry) : entry;
    }).join(',');
  });
}

/** Strings and objects remain opaque; only finite small integers may be printed. */
function parameterSummary<T>(value: T): string {
  if (value === null) { return 'null'; }
  if (value === undefined) { return 'undefined'; }
  if (typeof value === 'string') { return `string(length=${(value as string).length},redacted)`; }
  if (typeof value === 'boolean') { return value ? 'boolean(true)' : 'boolean(false)'; }
  if (typeof value === 'number') {
    const numberValue = value as number;
    return Number.isFinite(numberValue) && Number.isInteger(numberValue) && Math.abs(numberValue) <= 100 ?
      `number(smallInteger=${numberValue})` : 'number(redacted)';
  }
  return `${typeof value}(redacted)`;
}

/**
 * Each caller supplies an immutable lexical case/site (or an honest shared site).
 * The unchanged value/reference goes to the ORIGINAL Hypium expect/matcher.
 * No runtime-current-case lookup can relabel a late callback as a following case.
 */
export function traceParameter<T>(site: string, value: T): T {
  try {
    testInfo(`assertion ${site}: ${parameterSummary(value)}`);
  } catch (_) {
    // Diagnostics cannot replace an assertion or evaluate a business expression twice.
  }
  return value;
}

/** Retain existing case IDs, flags, runner hooks, watchdogs and fixture cleanup. */
export function loggedIt(legacyName: string, flag: number, body: () => void | Promise<void>): void {
  const name: string = runtimeCaseName(legacyName);
  it(name, flag, async (): Promise<void> => {
    testInfo(`${name} begin`);
    try {
      await body();
    } catch (error) {
      testFailure(`${name} failure(error=redacted)`);
      throw error as Error;
    } finally {
      testInfo(`${name} end`);
    }
  });
}
