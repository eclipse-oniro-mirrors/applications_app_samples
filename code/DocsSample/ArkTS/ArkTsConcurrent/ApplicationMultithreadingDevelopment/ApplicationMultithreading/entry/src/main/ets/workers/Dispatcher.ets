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

// [Start worker_dispatcher]
// workers/Dispatcher.ets
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

interface WorkerMessage {
  id: number;
  type: string;
  payload: string;
}

interface WorkerResult {
  id: number;
  result: string;
}

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e: MessageEvents) => {
  const data = e.data as WorkerMessage;
  let result: string = '';
  // 根据type字段将消息分发到对应的处理逻辑，多类任务串行复用同一个Worker
  if (data.type === 'logReport') {
    result = logReport(data.payload);
  } else if (data.type === 'filePreprocess') {
    result = filePreprocess(data.payload);
  }
  const message: WorkerResult = { id: data.id, result: result };
  workerPort.postMessage(message);
};

function logReport(payload: string): string {
  // 日志上报逻辑
  return 'logReport done';
}

function filePreprocess(payload: string): string {
  // 文件预处理逻辑
  return 'filePreprocess done';
}
// [End worker_dispatcher]