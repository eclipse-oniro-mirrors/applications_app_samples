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
import Logger from '../../../../main/ets/util/Logger';

// Synchronous bookkeeping: never adds an await or changes deferred/drain order.
export class ContinuousCleanup {
  private failed: boolean = false;
  private firstError: Error | undefined = undefined;
  private primaryFailed: boolean;

  constructor(primaryFailed: boolean) {
    this.primaryFailed = primaryFailed;
  }

  capture(error: Error | undefined): void {
    if (this.primaryFailed || this.failed) {
      try {
        // Fixed diagnostic only: never inspect or stringify an arbitrary error.
        Logger.error('fixture cleanup', 'Secondary fixture cleanup failed; original failure retained');
      } catch (_) {
        // Logging itself is best effort and must not replace the original failure.
      }
    }
    if (!this.failed) {
      this.failed = true;
      this.firstError = error;
    }
  }

  run(action: () => void): void {
    try {
      action();
    } catch (error) {
      // Type-only cast retains the exact thrown value, including undefined.
      this.capture(error as Error);
    }
  }

  finish(): void {
    if (!this.primaryFailed && this.failed) {
      throw this.firstError as Error;
    }
  }
}
