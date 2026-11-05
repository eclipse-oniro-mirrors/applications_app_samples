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

// ===== taskpool_basic_usage =====
// [Start taskpool_basic_usage]
import { taskpool } from '@kit.ArkTS';

// 任务函数需要使用@Concurrent装饰器标注
@Concurrent
function add(a: number, b: number): number {
  return a + b; // 在TaskPool后台线程中执行
}

async function useTaskPool(): Promise<void> {
  try {
    // 传入任务函数和参数，任务被调度到后台线程执行
    let result = await taskpool.execute(add, 2, 3);
    console.info(`计算结果: ${result}`); // 5
  } catch (error) {
    console.error(`任务执行失败: ${(error as Error).message}`);
  }
}

useTaskPool();
// [End taskpool_basic_usage]
