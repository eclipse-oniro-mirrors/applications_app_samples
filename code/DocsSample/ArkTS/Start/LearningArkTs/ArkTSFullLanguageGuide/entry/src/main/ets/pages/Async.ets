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

export {}

// ===== sync_vs_async =====
// [Start sync_vs_async]
// 同步执行：阻塞等待
function syncOperation(): void {
  console.info('开始操作');
  // 模拟耗时操作
  let start = Date.now();
  while (Date.now() - start < 1000) {
    // 阻塞1秒
  }
  console.info('操作完成');
}

syncOperation();
console.info('继续执行其他任务');
// 输出顺序：开始操作 -> 操作完成 -> 继续执行其他任务

// 异步执行：不阻塞
function asyncOperation(): Promise<void> {
  console.info('开始异步操作');
  return new Promise((resolve) => {
    setTimeout(() => {
      console.info('异步操作完成');
      resolve();
    }, 1000);
  });
}

asyncOperation();
console.info('立即继续执行其他任务');
// 输出顺序：开始异步操作 -> 立即继续执行其他任务 -> 异步操作完成（1秒后）
// [End sync_vs_async]

// ===== event_loop_mechanism =====
// [Start event_loop_mechanism]
// 事件循环机制
console.info('1. 开始');

// 宏任务（Macro Task）：setTimeout、setInterval、I/O等
setTimeout(() => {
  console.info('2. setTimeout（宏任务）');
}, 0);

// 微任务（Micro Task）：Promise、queueMicrotask等
Promise.resolve().then(() => {
  console.info('3. Promise（微任务）');
});

console.info('4. 同步代码结束');

// 输出顺序：
// 1. 开始
// 4. 同步代码结束
// 3. Promise（微任务）
// 2. setTimeout（宏任务）
// [End event_loop_mechanism]

// ===== async_function_declaration =====
// [Start async_function_declaration]
// 基本异步函数声明
async function fetchData(): Promise<string> {
  return 'Data loaded';
}

// 箭头函数形式的异步函数
const fetchUserData = async (): Promise<User> => {
  return { id: 1, name: 'Alice' };
};

// 类方法形式的异步函数
class DataService {
  async getData(): Promise<string> {
    return 'Data from service';
  }
}

interface User {
  id: number;
  name: string;
}

// 使用异步函数
async function main(): Promise<void> {
  let data = await fetchData();
  console.info(`${data}`);
  
  let user = await fetchUserData();
  console.info(`${user.name}`);
  
  let service = new DataService();
  let serviceData = await service.getData();
  console.info(`${serviceData}`);
}

main();
// [End async_function_declaration]

// ===== async_function_return_value =====
// [Start async_function_return_value]
// 异步函数自动将返回值包装为Promise
async function returnString(): Promise<string> {
  return 'Hello'; // 自动包装为Promise.resolve('Hello')
}

async function returnNumber(): Promise<number> {
  return 42; // 自动包装为Promise.resolve(42)
}

interface ReturnObjectResult {
  id: number;
}

async function returnObject(): Promise<ReturnObjectResult> {
  return { id: 1 }; // 自动包装为Promise.resolve({ id: 1 })
}

// 使用返回值
returnString().then((data: string) => console.info(data)); // Hello
returnNumber().then((num: number) => console.info(`${num}`));   // 42
returnObject().then((obj: ReturnObjectResult) => console.info(`${obj.id}`)); // 1

// 异步函数返回Promise
async function returnPromise(): Promise<string> {
  return Promise.resolve('Already a Promise');
}

returnPromise().then((data: string) => console.info(data)); // Already a Promise
// [End async_function_return_value]

// ===== sync_vs_async_function =====
// [Start sync_vs_async_function]
// 普通函数：同步执行
function normalFunction(): string {
  console.info('Normal function executing');
  return 'Result';
}

let result1 = normalFunction();
console.info(`After normal function: ${result1}`);
// 输出顺序：
// Normal function executing
// After normal function: Result

// 异步函数：异步执行
async function asyncFunction(): Promise<string> {
  console.info('Async function executing');
  return 'AsyncResult';
}

let result2 = asyncFunction();
console.info(`After async function: ${result2}`);
// 输出顺序：
// Async function executing
// After async function: Promise { 'AsyncResult' }

// 异步函数需要await或 .then() 获取结果
asyncFunction().then(result => console.info('Async result:', result));
// 输出：Async result: AsyncResult
// [End sync_vs_async_function]

// ===== await_serial_execution =====
// [Start await_serial_execution]
async function serialExecution(): Promise<void> {
  console.info('Start');
  
  // 串行执行：一个接一个
  let result1 = await new Promise<string>((resolve) => {
    setTimeout(() => {
      console.info('Task 1 completed');
      resolve('Result 1');
    }, 1000);
  });
  
  let result2 = await new Promise<string>((resolve) => {
    setTimeout(() => {
      console.info('Task 2 completed');
      resolve('Result 2');
    }, 1000);
  });
  
  let result3 = await new Promise<string>((resolve) => {
    setTimeout(() => {
      console.info('Task 3 completed');
      resolve('Result 3');
    }, 1000);
  });
  
  console.info(`All tasks completed: ${result1}, ${result2}, ${result3}`);
}

serialExecution();
// 输出顺序：
// Start
// Task 1 completed（1秒后）
// Task 2 completed（2秒后）
// Task 3 completed（3秒后）
// All tasks completed: Result 1 Result 2 Result 3
// [End await_serial_execution]

// ===== await_non_blocking =====
// [Start await_non_blocking]
async function nonBlockingExample(): Promise<void> {
  console.info('1. Async function start');
  
  // await等待Promise，但不阻塞外部代码
  await new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      console.info('2. Promise resolved');
      resolve();
    }, 1000);
  });
  
  console.info('3. Async function end');
}

nonBlockingExample();
console.info('4. External code continues');

// 输出顺序：
// 1. Async function start
// 4. External code continues（不等待）
// 2. Promise resolved（1秒后）
// 3. Async function end
// [End await_non_blocking]

// ===== promise_states =====
// [Start promise_states]
// Pending状态
let pendingPromise: Promise<void> = new Promise<void>((resolve: () => void, reject: (reason: Error) => void) => {
  // 未调用resolve或reject，保持Pending状态
});

console.info('Promise 处于 Pending 状态'); // Promise { <pending> }

// Fulfilled状态（成功）
let fulfilledPromise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
  resolve('Success');
});

fulfilledPromise.then((value: string) => console.info(value)); // Success

// Rejected状态（失败）
let rejectedPromise: Promise<string> = new Promise<string>(
  (resolve: (value: string) => void, reject: (reason: Error) => void) => {
    reject(new Error('Failure'));
  }
);

rejectedPromise.catch((error: Error) => console.error(error.message)); // Failure

// 状态转换：只能从Pending -> Fulfilled或Pending -> Rejected
let irreversiblePromise: Promise<string> = new Promise<string>(
  (resolve: (value: string) => void, reject: (reason: Error) => void) => {
    resolve('First resolve');
    reject(new Error('Second reject')); // 无效，Promise状态已确定
  }
);

irreversiblePromise.then((value: string) => console.info(value)); // First resolve
// [End promise_states]

// ===== promise_creation =====
// [Start promise_creation]
// 方式1：使用Promise构造函数
let promise1 = new Promise<string>((resolve, reject) => {
  // 异步操作
  setTimeout(() => {
    let success = true;
    if (success) {
      resolve('Operation succeeded');
    } else {
      reject(new Error('Operation failed'));
    }
  }, 1000);
});

// 方式2：使用Promise.resolve()
let promise2 = Promise.resolve('Immediately resolved');

// 方式3：使用Promise.reject()
let promise3 = Promise.reject(new Error('Immediately rejected'));

// 方式4：封装异步操作为Promise
function delay(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

async function useDelay(): Promise<void> {
  console.info('Waiting...');
  await delay(1000);
  console.info('Done waiting');
}

useDelay();
// [End promise_creation]

// ===== promise_chaining =====
// [Start promise_chaining]
// Promise链式调用
Promise.resolve(1)
  .then((value: number): number => {
    console.info(`Step 1: ${value}`);
    return value + 1;
  })
  .then((value: number): number => {
    console.info(`Step 2: ${value}`);
    return value * 2;
  })
  .then((value: number): string => {
    console.info(`Step 3: ${value}`);
    return `Final: ${value}`;
  })
  .then((result: string): void => {
    console.info(`Final result: ${result}`);
  });

// 输出：
// Step 1: 1
// Step 2: 2
// Step 3: 4
// Final result: Final: 4

// 错误处理链
Promise.resolve(1)
  .then((value: number): number => {
    if (value < 10) {
      throw new Error('Value too small');
    }
    return value;
  })
  .catch((error: Error): number => {
    console.error(`Error caught: ${error.message}`);
    return 10; // 恢复链式调用
  })
  .then((value: number): number => {
    console.info(`Recovered value: ${value}`);
    return value * 2;
  })
  .then((finalValue: number): void => {
    console.info(`Final value: ${finalValue}`);
  });

// 输出：
// Error caught: Value too small
// Recovered value: 10
// Final value: 20
// [End promise_chaining]

// ===== promise_static_methods =====
// [Start promise_static_methods]
// Promise.resolve() 和Promise.reject()
let resolvedPromise: Promise<string> = Promise.resolve('Resolved value');
let staticRejectedPromise: Promise<string> = Promise.reject(new Error('Rejected error'));

resolvedPromise.then((value: string): void => console.info(value)); // Resolved value
staticRejectedPromise.catch((error: Error): void => console.error(error.message)); // Rejected error

// Promise.all()：等待所有Promise完成
let staticPromise1: Promise<number> = Promise.resolve(1);
let staticPromise2: Promise<number> = Promise.resolve(2);
let staticPromise3: Promise<number> = Promise.resolve(3);

Promise.all([staticPromise1, staticPromise2, staticPromise3])
  .then((values: number[]): void => console.info(`All values: ${values.join(', ')}`)); // 1, 2, 3

// Promise.all() 失败示例
let failedPromise: Promise<number> = Promise.reject(new Error('Failed'));

Promise.all([staticPromise1, failedPromise, staticPromise3])
  .catch((error: Error): void => console.error(`One promise failed: ${error.message}`));

// Promise.race()：返回最先完成的Promise
let fastPromise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
  setTimeout(() => resolve('Fast'), 100);
});

let slowPromise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
  setTimeout(() => resolve('Slow'), 200);
});

Promise.race([fastPromise, slowPromise])
  .then((value: string): void => console.info(`Race winner: ${value}`)); // Fast

// Promise.allSettled()：返回所有Promise的结果（无论成功或失败）
let successPromise: Promise<string> = Promise.resolve('Success');
let failurePromise: Promise<string> = Promise.reject(new Error('Failure'));

Promise.allSettled([successPromise, failurePromise])
  .then((results): void => {
    results.forEach((result): void => {
      if (result.status === 'fulfilled') {
        console.info(`Fulfilled: ${result.value}`);
      } else {
        console.info(`Rejected: ${result.reason}`);
      }
    });
  });

// Promise.any()：返回第一个成功的Promise（ES2021）
let promiseA: Promise<string> = Promise.reject(new Error('A failed'));
let promiseB: Promise<string> = Promise.resolve('B succeeded');
let promiseC: Promise<string> = Promise.resolve('C succeeded');

Promise.any([promiseA, promiseB, promiseC])
  .then((value: string): void => console.info(`First success: ${value}`)) // B succeeded
  .catch((_error: Error): void => console.error('All promises rejected'));
// [End promise_static_methods]

// ===== create_range =====
// [Start create_range]
function createRange(start: number, end: number): number[] {
  let result: number[] = [];
  for (let i: number = start; i <= end; i++) {
    result.push(i);
  }
  return result;
}

let rangeValues: number[] = createRange(1, 5);
for (let value of rangeValues) {
  console.info(`${value}`);
}
// [End create_range]

// ===== async_data_sources =====
// [Start async_data_sources]
async function fetchDataSource1(): Promise<string> {
  return 'Data 1';
}

async function fetchDataSource2(): Promise<string> {
  return 'Data 2';
}

async function fetchDataSource3(): Promise<string> {
  return 'Data 3';
}

async function processAsyncSources(): Promise<void> {
  let sources: Promise<string>[] = [
    fetchDataSource1(),
    fetchDataSource2(),
    fetchDataSource3()
  ];

  for (let source of sources) {
    try {
      let data: string = await source;
      console.info(`Processed: ${data}`);
    } catch (error) {
      console.error(`Source failed: ${(error as Error).message}`);
    }
  }
}
// [End async_data_sources]

// ===== concurrency_limiter =====
// [Start concurrency_limiter]
// 并发限制器
class RequestConcurrencyLimiter {
  private maxConcurrency: number;
  private currentConcurrency: number = 0;
  private queue: (() => Promise<void>)[] = [];
  
  constructor(maxConcurrency: number) {
    this.maxConcurrency = maxConcurrency;
  }
  
  async run<T>(task: () => Promise<T>): Promise<T> {
    // 如果当前并发数已达上限，加入队列等待
    if (this.currentConcurrency >= this.maxConcurrency) {
      return new Promise<T>((resolve: (value: T) => void, reject: (reason: Error) => void) => {
        this.queue.push(async (): Promise<void> => {
          try {
            let result: T = await this.executeTask<T>(task);
            resolve(result);
          } catch (error) {
            reject(error as Error);
          }
        });
      });
    }
    
    return this.executeTask<T>(task);
  }
  
  private async executeTask<T>(task: () => Promise<T>): Promise<T> {
    this.currentConcurrency++;
    
    try {
      let result: T = await task();
      return result;
    } finally {
      this.currentConcurrency--;
      
      // 执行队列中的下一个任务
      if (this.queue.length > 0) {
        let nextTask: (() => Promise<void>) | undefined = this.queue.shift();
        if (nextTask) {
          nextTask();
        }
      }
    }
  }
}

function fetchWithLimitRequest(url: string): Promise<string> {
  return Promise.resolve(`response from ${url}`);
}

// 使用示例
async function fetchWithLimit(limiterUrls: string[], maxConcurrency: number): Promise<void> {
  let limiter: RequestConcurrencyLimiter = new RequestConcurrencyLimiter(maxConcurrency);
  
  let tasks: Promise<string>[] = limiterUrls.map((url: string): Promise<string> => 
    limiter.run<string>((): Promise<string> => fetchWithLimitRequest(url))
  );
  
  let results: string[] = await Promise.all(tasks);
  console.info(`All requests completed: ${results.length}`);
}

let limiterUrls: string[] = [];
for (let i: number = 0; i < 20; i++) {
  limiterUrls.push(`/api/data/${i}`);
}
fetchWithLimit(limiterUrls, 5); // 限制最多5个并发请求
// [End concurrency_limiter]

// ===== task_queue =====
// [Start task_queue]
// 任务队列
class TaskQueue {
  private tasks: (() => Promise<void>)[] = [];
  private processing: boolean = false;
  
  addTask(task: () => Promise<void>): void {
    this.tasks.push(task);
    this.processQueue();
  }
  
  private async processQueue(): Promise<void> {
    if (this.processing || this.tasks.length === 0) {
      return;
    }
    
    this.processing = true;
    
    while (this.tasks.length > 0) {
      let task: (() => Promise<void>) | undefined = this.tasks.shift();
      if (task === undefined) {
        continue;
      }
      try {
        await task();
      } catch (error) {
        console.error(`Task failed: ${(error as Error).message}`);
      }
    }
    
    this.processing = false;
  }
}

// 使用示例
let taskQueue = new TaskQueue();

taskQueue.addTask(async () => {
  console.info('Task 1 started');
  await new Promise<void>((resolve: () => void) => setTimeout(resolve, 1000));
  console.info('Task 1 completed');
});

taskQueue.addTask(async () => {
  console.info('Task 2 started');
  await new Promise<void>((resolve: () => void) => setTimeout(resolve, 500));
  console.info('Task 2 completed');
});

taskQueue.addTask(async () => {
  console.info('Task 3 started');
  await new Promise<void>((resolve: () => void) => setTimeout(resolve, 800));
  console.info('Task 3 completed');
});

// 输出（串行执行）：
// Task 1 started
// Task 1 completed（1秒后）
// Task 2 started
// Task 2 completed（1.5秒后）
// Task 3 started
// Task 3 completed（2.3秒后）
// [End task_queue]

// ===== semaphore =====
// [Start semaphore]
// 信号量（Semaphore）
class Semaphore {
  private permits: number;
  private waitQueue: ((permit: number) => void)[] = [];
  
  constructor(permits: number) {
    this.permits = permits;
  }
  
  async acquire(): Promise<number> {
    if (this.permits > 0) {
      this.permits--;
      return this.permits;
    }
    
    // 等待许可
    return new Promise<number>((resolve) => {
      this.waitQueue.push(resolve);
    });
  }
  
  release(): void {
    this.permits++;
    
    // 通知等待队列中的第一个任务
    if (this.waitQueue.length > 0) {
      let nextWaiter: ((permit: number) => void) | undefined = this.waitQueue.shift();
      if (nextWaiter !== undefined) {
        this.permits--;
        nextWaiter(this.permits);
      }
    }
  }
}

// 使用示例
async function limitedResourceAccess(semaphore: Semaphore): Promise<void> {
  let permit = await semaphore.acquire();
  
  console.info('Accessing resource...');
  await new Promise<void>((resolve: () => void) => setTimeout(resolve, 1000));
  console.info('Resource access completed');
  
  semaphore.release();
}

let semaphore = new Semaphore(3); // 最多3个并发访问

// 启动多个并发任务
for (let i: number = 0; i < 10; i++) {
  limitedResourceAccess(semaphore);
}

// 输出：最多同时3个任务访问资源
// [End semaphore]

// ===== race_condition_mutex =====
// [Start race_condition_mutex]
interface SharedCounter {
  value: number;
}

// 竞态条件示例
let sharedData: SharedCounter = { value: 0 };

async function incrementWithoutLock(): Promise<void> {
  let current: number = sharedData.value;
  await new Promise<void>((resolve: () => void) => setTimeout(resolve, 10)); // 模拟延迟
  sharedData.value = current + 1;
}

// 不加锁：可能导致竞态条件
async function raceConditionExample(): Promise<void> {
  sharedData.value = 0;
  
  await Promise.all([
    incrementWithoutLock(),
    incrementWithoutLock(),
    incrementWithoutLock()
  ]);
  
  console.info(`Final value (race condition): ${sharedData.value}`); // 可能小于3
}

raceConditionExample();

// 使用互斥锁（Mutex）避免竞态条件
class Mutex {
  private locked: boolean = false;
  private queue: (() => void)[] = [];
  
  async lock(): Promise<void> {
    if (!this.locked) {
      this.locked = true;
      return;
    }
    
    return new Promise<void>((resolve: () => void) => {
      this.queue.push(resolve);
    });
  }
  
  unlock(): void {
    if (this.queue.length > 0) {
      let nextWaiter: (() => void) | undefined = this.queue.shift();
      if (nextWaiter) {
        nextWaiter();
      }
    } else {
      this.locked = false;
    }
  }
}

async function incrementWithLock(mutex: Mutex): Promise<void> {
  await mutex.lock();
  
  try {
    let current: number = sharedData.value;
    await new Promise<void>((resolve: () => void) => setTimeout(resolve, 10));
    sharedData.value = current + 1;
  } finally {
    mutex.unlock();
  }
}

async function safeIncrementExample(): Promise<void> {
  sharedData.value = 0;
  let mutex: Mutex = new Mutex();
  
  await Promise.all([
    incrementWithLock(mutex),
    incrementWithLock(mutex),
    incrementWithLock(mutex)
  ]);
  
  console.info(`Final value (with lock): ${sharedData.value}`); // 3
}

safeIncrementExample();
// [End race_condition_mutex]

// ===== concurrency_limit_best_practice =====
// [Start concurrency_limit_best_practice]
class ItemConcurrencyLimiter {
  private runningCount: number = 0;
  private readonly maxConcurrency: number;
  private waitQueue: (() => void)[] = [];

  constructor(maxConcurrency: number) {
    this.maxConcurrency = maxConcurrency;
  }

  async run<T>(task: () => Promise<T>): Promise<T> {
    if (this.runningCount >= this.maxConcurrency) {
      await new Promise<void>((resolve: () => void) => {
        this.waitQueue.push(resolve);
      });
    }

    this.runningCount++;
    try {
      return await task();
    } finally {
      this.runningCount--;
      let nextTask: (() => void) | undefined = this.waitQueue.shift();
      if (nextTask) {
        nextTask();
      }
    }
  }
}

// 推荐：限制并发数量，控制资源占用
async function processItemsWithLimit(items: string[], maxConcurrency: number): Promise<void> {
  let limiter: ItemConcurrencyLimiter = new ItemConcurrencyLimiter(maxConcurrency);
  
  let tasks: Promise<void>[] = items.map((item: string): Promise<void> => 
    limiter.run<void>((): Promise<void> => processItem(item))
  );
  
  await Promise.all(tasks);
}

// 反例：无限制并发，可能导致资源耗尽
async function processItemsWithoutLimit(items: string[]): Promise<void> {
  let tasks: Promise<void>[] = items.map((item: string): Promise<void> => processItem(item));
  await Promise.all(tasks);
}

async function processItem(item: string): Promise<void> {
  // 处理单个项目
  await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
  console.info(`Item processed: ${item}`);
}
// [End concurrency_limit_best_practice]

// ===== for_await_of =====
// [Start for_await_of]
async function processAsyncItems(): Promise<void> {
  let asyncItems: Promise<string>[] = [
    Promise.resolve('item1'),
    Promise.resolve('item2'),
    Promise.resolve('item3')
  ];

  for await (const item of asyncItems) {
    console.info(`${item}`); // item1, item2, item3
  }
}

processAsyncItems();
// [End for_await_of]

// ===== for_of_await =====
// [Start for_of_await]
async function processAsyncItemsManually(): Promise<void> {
  let asyncItems: Promise<string>[] = [
    Promise.resolve('item1'),
    Promise.resolve('item2'),
    Promise.resolve('item3')
  ];

  for (let itemPromise of asyncItems) {
    let item: string = await itemPromise;
    console.info(`${item}`); // item1, item2, item3
  }
}

processAsyncItemsManually();
// [End for_of_await]

