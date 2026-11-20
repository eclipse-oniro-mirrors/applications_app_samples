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

// Never inspect/stringify an arbitrary failure while preserving a primary error.
function reportSecondaryCleanupFailure(): void {
  try {
    hilog.error(0xF811, '[Sample_ImageEffect]', 'Secondary cleanup failed; primary failure retained');
  } catch (loggingError) {
    // Best-effort logger self-protection must not replace the original failure.
  }
}

// One guard per try/finally. The catch at the callsite rethrows the EXACT primary value.
export class CleanupGuard {
  public primaryFailed: boolean = false;
  public cleanupFailed: boolean = false;

  runSync(cleanup: () => void): void {
    try {
      cleanup();
    } catch (error) {
      this.cleanupFailed = true;
      if (!this.primaryFailed) {
        throw error as Error;
      }
      reportSecondaryCleanupFailure();
    }
  }

  async run(cleanup: () => Promise<void>): Promise<void> {
    try {
      await cleanup();
    } catch (error) {
      this.cleanupFailed = true;
      if (!this.primaryFailed) {
        throw error as Error;
      }
      reportSecondaryCleanupFailure();
    }
  }
}

// Capture the first failure in a closure, including throw undefined, without coercion.
// All original owned cleanup attempts still run in their original order.
export class CleanupFailures {
  private failed: boolean = false;
  private rethrow: () => void = (): void => {};

  attemptSync(cleanup: () => void): void {
    try {
      cleanup();
    } catch (error) {
      if (!this.failed) {
        this.failed = true;
        this.rethrow = (): void => { throw error as Error; };
      } else {
        reportSecondaryCleanupFailure();
      }
    }
  }

  async attempt(cleanup: () => Promise<void>): Promise<void> {
    try {
      await cleanup();
    } catch (error) {
      if (!this.failed) {
        this.failed = true;
        this.rethrow = (): void => { throw error as Error; };
      } else {
        reportSecondaryCleanupFailure();
      }
    }
  }

  finish(): void {
    if (this.failed) {
      this.rethrow();
    }
  }
}
