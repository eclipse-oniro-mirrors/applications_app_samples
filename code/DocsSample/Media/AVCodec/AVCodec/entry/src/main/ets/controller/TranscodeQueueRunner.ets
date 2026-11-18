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

import { TranscodeQueueModel, TranscodeQueueItem } from '../model/TranscodeQueueModel';

export interface TranscodeQueueResult { state: number; progress: number; path: string; }
export interface TranscodeQueueHost {
  available: () => boolean;
  disposed: () => boolean;
  execute: (item: TranscodeQueueItem) => Promise<TranscodeQueueResult | undefined>;
  persist: () => Promise<boolean>;
}
export class TranscodeQueueRunner {
  async run(queue: TranscodeQueueModel, host: TranscodeQueueHost): Promise<void> {
    queue.paused = false;
    try {
      let item: TranscodeQueueItem | undefined = queue.next();
      while (item !== undefined && !host.disposed() && !queue.paused) {
        if (!host.available()) { queue.paused = true; break; }
        queue.activeId = item.id;
        queue.update(item.id, 'running', 0);
        const persisted: boolean = await host.persist();
        if (!persisted || host.disposed() || queue.paused) {
          queue.update(item.id, 'waiting', 0); queue.paused = true;
          if (persisted) { await host.persist(); }
          break;
        }
        const result: TranscodeQueueResult | undefined = await host.execute(item);
        if (result === undefined) {
          queue.update(item.id, 'waiting', 0); queue.paused = true;
        } else {
          queue.update(item.id, result.state === 2 ? 'completed' : result.state === 3 ? 'cancelled' : 'failed',
            result.progress, result.path);
          if (result.state === 3 || (result.state !== 2 && queue.stopOnFailure)) { queue.paused = true; }
        }
        queue.activeId = '';
        if (!await host.persist()) { queue.paused = true; }
        item = queue.next();
      }
    } finally { queue.activeId = ''; }
  }
}
