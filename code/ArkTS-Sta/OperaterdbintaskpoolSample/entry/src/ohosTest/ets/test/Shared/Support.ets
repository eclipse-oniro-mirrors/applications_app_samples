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

import hilog from '@ohos.hilog';

const DOMAIN: int = 0x0000;
const TAG: string = 'ContactSampleTest';

/**
 * Writes one structured line to the device log.
 * Every suite calls this in beforeAll / afterAll, so console output is never required.
 */
export function logSuite(name: string, state: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s %{public}s', name, state);
}

/**
 * Writes a free-form note that belongs to a suite step.
 */
export function logStep(name: string, detail: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s :: %{public}s', name, detail);
}

/**
 * Writes a warning line, used by negative-path suites.
 */
export function logWarn(name: string, detail: string): void {
  hilog.warn(DOMAIN, TAG, '%{public}s :: %{public}s', name, detail);
}

/**
 * Writes an error line, used when a recovery path is exercised.
 */
export function logError(name: string, detail: string): void {
  hilog.error(DOMAIN, TAG, '%{public}s :: %{public}s', name, detail);
}

/**
 * Yields once so the device watchdog keeps the test thread responsive.
 * Hypium supports async beforeEach / it bodies.
 */
export function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => { resolve(undefined); }, 1);
  });
}
