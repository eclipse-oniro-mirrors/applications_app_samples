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

import { expect } from '@ohos/hypium';
import { assertionSummary, SHARED_FIXTURE_CASE, SummaryValue } from './TestLog';

/** A single evaluation of each original actual/expected value; no assertion is caught. */
export class LoggedExpectation {
  private actual: SummaryValue;
  private site: string;
  private owner: string;

  constructor(actual: SummaryValue, site: string, owner: string) {
    this.actual = actual;
    this.site = site;
    this.owner = owner;
  }

  public assertEqual(expected: SummaryValue): void {
    assertionSummary(this.site, this.actual, 'assertEqual', expected, this.owner);
    expect(this.actual).assertEqual(expected);
  }

  public assertTrue(): void {
    assertionSummary(this.site, this.actual, 'assertTrue', true, this.owner);
    expect(this.actual).assertTrue();
  }

  public assertFalse(): void {
    assertionSummary(this.site, this.actual, 'assertFalse', false, this.owner);
    expect(this.actual).assertFalse();
  }

  public assertUndefined(): void {
    assertionSummary(this.site, this.actual, 'assertUndefined', undefined, this.owner);
    expect(this.actual).assertUndefined();
  }
}

export function loggedExpect(actual: SummaryValue, site: string,
  owner: string = SHARED_FIXTURE_CASE): LoggedExpectation {
  return new LoggedExpectation(actual, site, owner);
}
