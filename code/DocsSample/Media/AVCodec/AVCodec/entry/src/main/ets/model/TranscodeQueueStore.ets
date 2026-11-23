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

import { common } from '@kit.AbilityKit';
import { MediaStateFiles } from './MediaStateFiles';
import { TranscodeQueueModel, TranscodeQueueItem } from './TranscodeQueueModel';

export interface TranscodeQueueSnapshot {
  version: number;
  items: TranscodeQueueItem[];
  stopOnFailure: boolean;
}

const QUEUE_VERSION: number = 1;
const QUEUE_FILE: string = 'transcode_queue.json';
const LEGACY_POLICY_FILE: string = 'transcode_queue_policy.json';

// 队列和策略在调用时序列化为同一快照，写入由状态文件模块串行提交。
export class TranscodeQueueStore {
  static save(context: common.Context, queue: TranscodeQueueModel): Promise<void> {
    const snapshot: TranscodeQueueSnapshot = {
      version: QUEUE_VERSION,
      items: queue.items,
      stopOnFailure: queue.stopOnFailure
    };
    return MediaStateFiles.write(context, QUEUE_FILE, JSON.stringify(snapshot));
  }

  static async restore(context: common.Context): Promise<TranscodeQueueSnapshot> {
    const text: string = await MediaStateFiles.read(context, QUEUE_FILE, '[]');
    const snapshot: TranscodeQueueSnapshot | TranscodeQueueItem[] =
      JSON.parse(text) as TranscodeQueueSnapshot | TranscodeQueueItem[];
    if (Array.isArray(snapshot)) {
      const items: TranscodeQueueItem[] = TranscodeQueueModel.validated(snapshot);
      const policy: string = await MediaStateFiles.read(context, LEGACY_POLICY_FILE, 'false');
      if (policy !== 'true' && policy !== 'false') { throw new Error('Invalid legacy queue policy'); }
      return { version: QUEUE_VERSION, items: items, stopOnFailure: policy === 'true' };
    }
    if (snapshot === null || typeof snapshot !== 'object' || snapshot.version !== QUEUE_VERSION ||
      typeof snapshot.stopOnFailure !== 'boolean') { throw new Error('Invalid transcode queue snapshot'); }
    return {
      version: QUEUE_VERSION,
      items: TranscodeQueueModel.validated(snapshot.items),
      stopOnFailure: snapshot.stopOnFailure
    };
  }
}
