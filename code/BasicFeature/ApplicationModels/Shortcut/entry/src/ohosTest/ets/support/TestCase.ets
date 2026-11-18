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

import { expect as hypiumExpect, it as hypiumIt } from '@ohos/hypium';
import { logInfo } from '../../../main/ets/services/Logger';
import { BUNDLE } from './CaseScope';
import { AsyncCleanup, runWithCleanup } from './CaseLifecycle';

export function caseName(feature: string, sequence: string): string {
  return `${BUNDLE}_${feature}_${sequence}`;
}

/** Keep runner flags and old @tc.number mapping; only the runtime registration name is standardized. */
export function it(name: string, flags: number, body: AsyncCleanup,
  cleanup: AsyncCleanup | undefined = undefined): void {
  hypiumIt(name, flags, async (): Promise<void> => {
    await runWithCleanup(name, body, cleanup === undefined ? [] : [cleanup]);
  });
}

/** Do not stringify payloads, titles, Wants, identifiers or storage documents into public logs. */
export function assertionSummary(value: Object | undefined | null): string {
  if (value === undefined) { return 'undefined'; }
  if (value === null) { return 'null'; }
  if (typeof value === 'string') { return `string(length=${value.length})`; }
  if (typeof value === 'boolean') { return `boolean=${value}`; }
  if (typeof value === 'number') {
    return Number.isFinite(value) && Number.isInteger(value) && Math.abs(value) <= 100 ?
      `number(smallInteger=${value})` : 'number(redacted)';
  }
  if (Array.isArray(value)) { return `array(length=${value.length})`; }
  return `type=${typeof value}`;
}

/** Log both evaluated parameters immediately before the real Hypium assertion; never catch its failure. */
export class LoggedExpectation {
  private actual: Object | undefined | null;
  private readonly owner: string;
  private readonly site: string;
  constructor(actual: Object | undefined | null, owner: string, site: string = 'unbound') {
    this.actual = actual;
    this.owner = owner;
    this.site = site;
  }

  private log(method: string, expected: Object | undefined | null): void {
    logInfo(`${this.owner} site=${this.site} assertion=${method} actual=${assertionSummary(this.actual)} ` +
      `expected=${assertionSummary(expected)}`);
  }

  assertEqual(expected: Object | undefined | null): void {
    this.log('assertEqual', expected);
    hypiumExpect(this.actual).assertEqual(expected);
  }

  assertTrue(): void {
    this.log('assertTrue', true);
    hypiumExpect(this.actual).assertTrue();
  }

  assertFalse(): void {
    this.log('assertFalse', false);
    hypiumExpect(this.actual).assertFalse();
  }

  assertUndefined(): void {
    this.log('assertUndefined', undefined);
    hypiumExpect(this.actual).assertUndefined();
  }

  assertContain(expected: string): void {
    this.log('assertContain', expected);
    hypiumExpect(this.actual).assertContain(expected);
  }
}

export function expect(actual: Object | undefined | null, owner: string, site: string = 'unbound'): LoggedExpectation {
  return new LoggedExpectation(actual, owner, site);
}
