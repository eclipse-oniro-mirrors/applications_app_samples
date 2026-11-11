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
export const TAG: string = '[Sample_AppPerformance]';

/**
 * Diagnostics are best-effort. A logging failure (for example inside a release
 * path) must never replace the original business result or stop the caller from
 * releasing its remaining resources.
 */
export function logInfo(message: string): void {
  try {
    hilog.info(DOMAIN, TAG, '%{public}s', message);
  } catch (_) {
    return; // Never log from this catch: a failing logger would recurse.
  }
}

/** Best-effort warning; see logInfo for the failure policy. */
export function logWarn(message: string): void {
  try {
    hilog.warn(DOMAIN, TAG, '%{public}s', message);
  } catch (_) {
    return;
  }
}

/** Best-effort error; see logInfo for the failure policy. */
export function logError(message: string): void {
  try {
    hilog.error(DOMAIN, TAG, '%{public}s', message);
  } catch (_) {
    return;
  }
}
