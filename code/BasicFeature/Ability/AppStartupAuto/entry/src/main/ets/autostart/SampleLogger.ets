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
export const TAG: string = '[Sample_AppStartupAuto]';

/** Fixed English diagnostics only: do not log private records or native error payloads. */
export function reportFailure(operation: string): void {
  try {
    hilog.warn(DOMAIN, TAG, '%{public}s failed', operation);
  } catch (_) {
    // A collector failure must not replace the original business outcome.
    console.error(`${TAG} Diagnostic logging unavailable: ${operation}`);
  }
}
