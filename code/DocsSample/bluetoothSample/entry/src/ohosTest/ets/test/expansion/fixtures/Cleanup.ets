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
import { rethrowCaught } from './SdkInterop';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Cleanup must not replace a primary failure, including an original throw undefined. */
export function runCleanup(action: () => void, primaryFailed: boolean): void {
  try {
    action();
  } catch (cleanupError) {
    if (!primaryFailed) {
      rethrowCaught(cleanupError);
    }
    try {
      hilog.error(0xF811, '[Sample_bluetoothSample]', 'Secondary cleanup failed; original primary failure retained');
    } catch (_) {
      // Logger self-protection only; the caller still rethrows the original primary error.
    }
  }
}

/** Attempt every independent restoration while preserving the first thrown value. */
export function runCleanupSequence(actions: (() => void)[], index: number = 0): void {
  if (index >= actions.length) {
    return;
  }
  let primaryFailed: boolean = true;
  try {
    actions[index]();
    primaryFailed = false;
  } finally {
    runCleanup((): void => { runCleanupSequence(actions, index + 1); }, primaryFailed);
  }
}
