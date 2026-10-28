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

// [Start worker_manager]
import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';

// 宿主线程发给Worker的消息，通过type字段区分任务类型
interface WorkerMessage {
  id: number;
  type: string;
  payload: string;
}

// Worker返回给宿主线程的处理结果
interface WorkerResult {
  id: number;
  success: boolean;
  result?: string;
  error?: string;
}

class WorkerManager {
  private workerInstance: worker.ThreadWorker | null = null;
  private taskCounter: number = 0;
  private pending: Map<number, (result: string) => void> = new Map();
  private rejectFuncs: Map<number, (reason: string) => void> = new Map();

  constructor() {
    this.workerInstance = new worker.ThreadWorker('entry/ets/workers/Dispatcher.ets');
    this.workerInstance.onmessage = (e: MessageEvents) => {
      const data = e.data as WorkerResult;
      if (data.success) {
        const resolver = this.pending.get(data.id);
        if (resolver) {
          resolver(data.result ?? '');
          this.pending.delete(data.id);
          this.rejectFuncs.delete(data.id);
        }
      } else {
        const reject = this.rejectFuncs.get(data.id);
        if (reject) {
          reject(data.error ?? '');
          this.pending.delete(data.id);
          this.rejectFuncs.delete(data.id);
        }
      }
    };

    this.workerInstance.onexit = (code) => {
      this.pending.clear();
      this.rejectFuncs.forEach(reject => reject('Worker exited'));
      this.rejectFuncs.clear();
    };
  }

  // 不同类型的任务复用同一个Worker，通过type分发
  execute(type: string, payload: string): Promise<string> {
    const id = ++this.taskCounter;
    return new Promise<string>((resolve, reject) => {
      if (this.workerInstance) {
        this.pending.set(id, resolve);
        this.rejectFuncs.set(id, reject);
        const message: WorkerMessage = { id, type, payload };
        this.workerInstance.postMessage(message);
      } else {
        reject('Worker is null');
      }
    });
  }

  destroy(): void {
    if (this.workerInstance) {
      this.workerInstance.terminate();
      this.workerInstance = null;
    }
  }
}

// 全局单例，通过该管理类复用单个Worker处理可串行的多类任务(需独立并行的任务应由单独的Worker处理)
const dispatcher: WorkerManager = new WorkerManager();
// [End worker_manager]
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(async () => {
            let result = await dispatcher.execute('logReport', 'payload');
            this.message = 'success';
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}