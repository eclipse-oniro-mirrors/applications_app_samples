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

import { logInfo, logWarning } from '../../../main/ets/services/Logger';

export type AsyncCleanup = () => void | Promise<void>;

/** Every cleanup runs. A secondary failure must never replace the original failed assertion. */
export async function runWithCleanup(caseName: string, body: AsyncCleanup,
  cleanups: AsyncCleanup[] = []): Promise<void> {
  let bodyFailed: boolean = false;
  let bodyError: Error | undefined = undefined;
  let cleanupFailed: boolean = false;
  let cleanupError: Error | undefined = undefined;
  logInfo(`${caseName} begin`);
  try {
    await body();
  } catch (error) {
    bodyFailed = true;
    bodyError = error as Error;
    logWarning(`${caseName} failure stage=body`);
  } finally {
    for (const cleanup of cleanups) {
      try {
        await cleanup();
      } catch (error) {
        if (!cleanupFailed) {
          cleanupFailed = true;
          cleanupError = error as Error;
        }
        logWarning(`${caseName} failure stage=cleanup`);
      }
    }
    logInfo(`${caseName} end`);
  }
  if (bodyFailed) { throw bodyError as Error; }
  if (cleanupFailed) { throw cleanupError as Error; }
}
