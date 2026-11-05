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

// ===== sendable_basic_usage =====
// [Start sendable_basic_usage]
import { taskpool } from '@kit.ArkTS';

// @Sendable装饰器标注的类可在线程间以引用方式共享
@Sendable
class SharedCounter {
  public count: number = 0;

  increase(): void {
    this.count++;
  }
}

// 任务函数使用@Concurrent装饰器标注，可接收Sendable对象参数
@Concurrent
function consumeSharedCounter(counter: SharedCounter): number {
  counter.increase();
  return counter.count;
}

async function useSendable(): Promise<void> {
  let counter = new SharedCounter();
  // Sendable对象引用传递，跨线程前后是同一个对象
  let result = await taskpool.execute(consumeSharedCounter, counter);
  console.info(`子线程返回的count: ${result}`); // 1
  console.info(`宿主线程读取的count: ${counter.count}`); // 1，与子线程共享同一对象
}

useSendable();
// [End sendable_basic_usage]
