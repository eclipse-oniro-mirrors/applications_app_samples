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

/** Provides List Data Utils helpers for the sample. */
export class ListDataUtils {
  static itemTitle(index: number): string {
    return `Item ${index + 1}`;
  }

  static itemSubtitle(index: number): string {
    return `Row ${index + 1} of long list`;
  }

  static nextBatch(loaded: number, total: number, batch: number): number {
    if (loaded < 0) {
      return 0;
    }
    const next = loaded + batch;
    return next > total ? total : next;
  }

  static formatPlaceholder(loaded: number, total: number): string {
    return `loaded=${loaded}/${total}`;
  }

  static formatPrefetch(prefetched: number, loaded: number, total: number): string {
    return `prefetched=${prefetched}, loaded=${loaded}/${total}`;
  }
}
