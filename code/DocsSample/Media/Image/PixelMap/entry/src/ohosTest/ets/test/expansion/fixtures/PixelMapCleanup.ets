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

import Logger from '../../../../../main/ets/common/Logger';

// A failed flag preserves even throw undefined; diagnostics never inspect the thrown value.
export class CleanupGuard {
  private failed: boolean = false;
  markFailed(): void {
    this.failed = true;
  }
  finishSync(action: () => void, cleanup: () => void): void {
    let completed = false;
    try {
      action();
      completed = true;
    } finally {
      if (!completed) {
        this.markFailed();
      }
      this.runSync(cleanup);
    }
  }
  async finishAsync(action: () => Promise<void>, cleanup: () => Promise<void>): Promise<void> {
    let completed = false;
    try {
      await action();
      completed = true;
    } finally {
      if (!completed) {
        this.markFailed();
      }
      await this.runAsync(cleanup);
    }
  }
  runSync(action: () => void): void {
    if (!this.failed) {
      // Mark before calling: any thrown value propagates naturally, retaining its identity.
      this.failed = true;
      action();
      this.failed = false;
    } else {
      try {
        action();
      } catch (error) {
        secondaryCleanupFailure();
      }
    }
  }
  async runAsync(action: () => Promise<void>): Promise<void> {
    if (!this.failed) {
      this.failed = true;
      await action();
      this.failed = false;
    } else {
      try {
        await action();
      } catch (error) {
        secondaryCleanupFailure();
      }
    }
  }
}
function secondaryCleanupFailure(): void {
  try {
    Logger.error('EXP cleanup failed after an earlier failure; original failure retained');
  } catch (error) {
    // Logger self-protection: never replace the original failure with a logging failure.
  }
}
let nativeQuarantined: boolean = false;
const retainedOwners: Object[] = [];
export function isEncoderQuarantined(): boolean {
  return nativeQuarantined;
}
export function quarantineEncoder(owner: Object): void {
  nativeQuarantined = true;
  retainedOwners.push(owner);
  try {
    Logger.error('EXP encoder owner quarantined without release/unlink; restart isolated test process');
  } catch (error) {
    // Keep quarantine and the primary error even when the logger fails.
  }
}
