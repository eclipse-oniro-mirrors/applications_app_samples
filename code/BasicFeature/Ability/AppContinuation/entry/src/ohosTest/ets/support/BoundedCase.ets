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
export const TAG: string = '[Sample_AppContinuation]';
export const BUNDLE: string = 'com.example.appcontinuation';

export const CASE_TIMEOUT_MS: number = 10000;
export const RUNNER_TIMEOUT_MS: number = 12000;
export type ScenarioBody = () => void | Promise<void>;

/** Register one scenario with a real-time deadline and release its watchdog. */
export function scenario(name: string, body: ScenarioBody): void {
  it(name, 0, async (): Promise<void> => {
    hilog.info(DOMAIN, TAG, '%{public}s %{public}s begin', BUNDLE, name);
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
      hilog.error(DOMAIN, TAG, '%{public}s %{public}s failure', BUNDLE, name);
      throw error;
    } finally {
      if (watchdog >= 0) {
        clearTimeout(watchdog);
      }
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s end', BUNDLE, name);
    }
  });
}
