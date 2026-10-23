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

// [Start data_worker_next]
// 将business拆分为两个HAR：
// - business-ui：DataChart、DataTable等UI组件
// - business-worker：DataProcessor等纯业务逻辑

// workers/DataWorker2.ets
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { DataProcessor } from './business-worker';
// 只加载纯逻辑模块，不包含任何UI依赖

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const result = new DataProcessor().process(e.data);
  workerPort.postMessage(result);
};
// [End data_worker_next]