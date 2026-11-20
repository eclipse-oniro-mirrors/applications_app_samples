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
import { caseEvent } from './TestLog';

export { BUNDLE, DOMAIN, TAG } from './TestLog';

export const CASE_TIMEOUT_MS: number = 10000;
export const RUNNER_TIMEOUT_MS: number = 12000;
export type ScenarioBody = () => void | Promise<void>;

/** Keep direct registrations' original filter and body, without adding a deadline. */
export function loggedCase(name: string, filter: number, body: ScenarioBody): void {
  it(name, filter, async (): Promise<void> => {
    caseEvent(name, 'begin');
    try {
      await body();
    } catch (error) {
      caseEvent(name, 'failure');
      throw error as Error;
    } finally {
      caseEvent(name, 'end');
    }
  });
}

/** Register one scenario with a real-time deadline and release its watchdog. */
export function scenario(name: string, body: ScenarioBody): void {
  it(name, 0, async (): Promise<void> => {
    caseEvent(name, 'begin');
    let watchdog: number = -1;
    const deadline = new Promise<void>((_resolve, reject): void => {
      watchdog = setTimeout((): void => {
        reject(new Error(`Scenario exceeded ${CASE_TIMEOUT_MS} ms: ${name}`));
      }, CASE_TIMEOUT_MS);
    });
    try {
      await Promise.race([Promise.resolve().then(body), deadline]);
    } catch (error) {
      // Do not log payloads or fixture content; Hypium retains the original failure.
      caseEvent(name, 'failure');
      throw error as Error;
    } finally {
      if (watchdog >= 0) {
        clearTimeout(watchdog);
      }
      caseEvent(name, 'end');
    }
  });
}
