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

/**
 * SDK 26.0.0 does not export @ohos.arkui.placeholderRegister.
 * This registry implements the same placeholder bookkeeping used by the sample:
 * mark rows as loaded, count loaded rows, and resolve whether a row is a placeholder.
 */
/** Provides Placeholder Registry helpers for the sample. */
export class PlaceholderRegistry {
  private flags: boolean[] = [];
  private maxCount: number;

  constructor(total: number) {
    this.maxCount = total;
    for (let i = 0; i < total; i++) {
      this.flags.push(false);
    }
  }

  register(index: number): void {
    if (index >= 0 && index < this.flags.length) {
      this.flags[index] = true;
    }
  }

  registerRange(start: number, end: number): void {
    for (let i = start; i < end && i < this.flags.length; i++) {
      this.flags[i] = true;
    }
  }

  isLoaded(index: number): boolean {
    return index >= 0 && index < this.flags.length ? this.flags[index] : false;
  }

  loadedCount(): number {
    let count = 0;
    for (let i = 0; i < this.flags.length; i++) {
      if (this.flags[i]) {
        count++;
      }
    }
    return count;
  }

  total(): number {
    return this.maxCount;
  }

  reset(): void {
    for (let i = 0; i < this.flags.length; i++) {
      this.flags[i] = false;
    }
  }
}
