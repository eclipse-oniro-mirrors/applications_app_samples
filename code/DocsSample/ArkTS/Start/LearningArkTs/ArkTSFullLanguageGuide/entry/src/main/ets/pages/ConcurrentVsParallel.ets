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

// ===== concurrent_vs_parallel =====
// [Start concurrent_vs_parallel]
import http from '@ohos.net.http';
import { worker } from '@kit.ArkTS';

// 并发示例：异步I/O操作
async function concurrentExample(): Promise<void> {
  console.info('开始并发任务');
  
  // 启动多个异步任务（不等待）
  let task1 = http.createHttp().request('/api/users');
  let task2 = http.createHttp().request('/api/products');
  let task3 = http.createHttp().request('/api/orders');
  
  // 并发执行，等待所有任务完成
  let responses = await Promise.all([task1, task2, task3]);
  let users = responses[0];
  let products = responses[1];
  let orders = responses[2];
  
  console.info('所有并发任务完成');
}

// 并行示例：多线程计算
function parallelExample(): void {
  console.info('开始并行任务');
  
  // 创建Worker线程进行并行计算
  let worker1 = new worker.ThreadWorker('entry/ets/workers/ComputeWorker.ets');
  let worker2 = new worker.ThreadWorker('entry/ets/workers/ComputeWorker.ets');
  
  worker1.postMessage({ task: 'calculate1' });
  worker2.postMessage({ task: 'calculate2' });
  
  worker1.onmessage = (e) => console.info(`Worker 1 完成: ${e.data}`);
  worker2.onmessage = (e) => console.info(`Worker 2 完成: ${e.data}`);
}
// [End concurrent_vs_parallel]
