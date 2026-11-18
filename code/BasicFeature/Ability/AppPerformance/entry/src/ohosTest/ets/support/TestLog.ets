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
import { logInfo, logError } from '../../../main/ets/core/Logger';

export const BUNDLE: string = 'com.samples.appperformance';
export type TestBody = () => void | Promise<void>;

/** Keep @tc.number and legacy @tc.name in source; normalize only the registered name. */
export function testCaseName(legacyName: string): string {
  if (legacyName.startsWith(`${BUNDLE}_`)) { return legacyName; }
  const match = /^test([A-Za-z][A-Za-z0-9]*?)([0-9]{4})$/.exec(legacyName);
  return match === null ? `${BUNDLE}_${legacyName}_0001` : `${BUNDLE}_${match[1]}_${match[2]}`;
}

/** Map legacy leaf selectors while preserving suite names, separators and Hypium filters. */
export function testSelector(selector: string): string {
  return selector.split(',').map((item: string): string => item.split('#').map((part: string): string =>
    /^test[A-Za-z][A-Za-z0-9]*[0-9]{4}$/.test(part) ? testCaseName(part) : part).join('#')).join(',');
}

/** No object serialization, property traversal, string body, path or credential is logged. */
export function parameterSummary<T>(value: T): string {
  if (value === undefined) { return 'undefined'; }
  if (value === null) { return 'null'; }
  if (typeof value === 'string') { return `string(length=${(value as string).length}, redacted)`; }
  if (typeof value === 'boolean') { return `boolean(${value})`; }
  if (typeof value === 'number') {
    const numeric = value as number;
    return Number.isFinite(numeric) && Math.abs(numeric) <= 100000000 ?
      `number(${numeric})` : 'number(non-finite-or-large, redacted)';
  }
  return `${typeof value}(redacted)`;
}

/**
 * Evaluate each original assertion parameter exactly once, log its safe summary,
 * and return the unchanged value/reference to the ORIGINAL Hypium expect/matcher.
 * The static site identifies the assertion, not its business expression or payload.
 */
export function traceParameter<T>(site: string, value: T): T {
  // site contains its lexically bound case name; a late watchdog body cannot borrow the next case's name.
  try { logInfo(`assertion ${site}: ${parameterSummary(value)}`); } catch (_) {
    // Diagnostics must never replace a framework assertion or trigger a second evaluation.
  }
  return value;
}

/** Direct cases retain their original flags and framework timeout; this adds no local watchdog. */
export function loggedIt(legacyName: string, level: number, body: TestBody): void {
  const name = testCaseName(legacyName);
  it(name, level, (): void | Promise<void> => {
    logInfo(`${name} begin; legacy=${legacyName}`);
    try {
      const result: void | Promise<void> = body();
      if (result !== undefined) {
        return (result as Promise<void>).then((): void => {
          logInfo(`${name} end: body-returned; verdict=Hypium`);
        }, (error: Error): void => {
          logError(`${name} failure: ${parameterSummary(error)}`);
          logInfo(`${name} end: body-threw; verdict=Hypium`);
          throw error as Error;
        });
      }
      // A returned body is not necessarily a pass: Hypium may record a failed expectation without throwing.
      logInfo(`${name} end: body-returned; verdict=Hypium`);
    } catch (error) {
      logError(`${name} failure: ${parameterSummary(error)}`);
      logInfo(`${name} end: body-threw; verdict=Hypium`);
      throw error as Error;
    }
  });
}

/** Runner lifecycle describes dispatch only, never a full-suite or scientific verdict. */
export async function runRunner(name: string, body: () => Promise<void>): Promise<void> {
  logInfo(`${BUNDLE} ${name} begin`);
  try {
    await body();
  } catch (error) {
    logError(`${BUNDLE} ${name} failure: ${parameterSummary(error)}`);
    throw error as Error;
  } finally {
    logInfo(`${BUNDLE} ${name} end-dispatch; inspect framework/diagnostic report for results`);
  }
}
