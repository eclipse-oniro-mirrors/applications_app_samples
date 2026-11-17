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
// ===== worker_basic_usage =====
// [Start worker_basic_usage]
// WorkerUsage.ets
import { worker, MessageEvents } from '@kit.ArkTS';

// 使用Worker在后台线程执行耗时任务
function useWorker(): void {
  // 创建Worker线程实例（Worker线程文件需位于模块的ets目录下）
  const wk: worker.ThreadWorker = new worker.ThreadWorker('entry/ets/workers/MyWorker.ets');

  // 接收Worker线程返回的消息
  wk.onmessage = (e: MessageEvents): void => {
    console.info(`收到Worker消息: ${e.data}`);
    // 任务完成后销毁Worker线程，避免资源泄漏
    wk.terminate();
  };

  // 向Worker线程发送消息，触发后台任务
  wk.postMessage('hello world');
}

// useWorker(); // 一般在按钮单击等UI事件回调中调用
// [End worker_basic_usage]
