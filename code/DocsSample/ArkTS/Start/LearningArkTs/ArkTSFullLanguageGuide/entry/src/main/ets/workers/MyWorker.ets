/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// ===== worker_thread_impl =====
// [Start worker_thread_impl]
// entry/src/main/ets/workers/MyWorker.ets
import { worker, MessageEvents, ErrorEvent, ThreadWorkerGlobalScope } from '@kit.ArkTS';

// Worker线程与宿主线程通信的端口
const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

// 接收宿主线程通过postMessage发送的消息
workerPort.onmessage = (e: MessageEvents): void => {
  // 收到消息后在此执行耗时任务（如图片解码、数据压缩），示例省略具体任务实现；注意不能直接操作UI
  if (e.data === 'hello world') {
    // 处理结果通过postMessage发回宿主线程，由宿主线程处理并更新UI
    workerPort.postMessage('success');
  }
}

// Worker线程发生错误时的回调
workerPort.onerror = (err: ErrorEvent): void => {
  console.error(`MyWorker error: ${err.message}`);
}
// [End worker_thread_impl]
