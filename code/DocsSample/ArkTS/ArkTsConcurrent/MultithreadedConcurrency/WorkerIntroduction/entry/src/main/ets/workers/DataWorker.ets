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

// [Start data_worker]
// workers/DataWorker.ets
import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { DataProcessor, DataChart, DataTable } from './business';
// business这个HAR同时导出了DataChart、DataTable等UI组件，
// Worker线程启动时，这些UI模块及其依赖全部被初始化，占用内存且可能产生异常

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const result = new DataProcessor().process(e.data as string);
  workerPort.postMessage(result);
};
// [End data_worker]