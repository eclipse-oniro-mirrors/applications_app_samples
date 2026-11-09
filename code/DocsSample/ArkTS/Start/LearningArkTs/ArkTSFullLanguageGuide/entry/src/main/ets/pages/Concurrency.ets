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

// ===== async_await_basic =====
// [Start async_await_basic]
// async函数：返回值自动包装为Promise
async function fetchMessage(): Promise<string> {
  return 'Hello ArkTS';
}

// await只能在async函数中使用，等待Promise完成并获取结果
async function loadMessage(): Promise<void> {
  try {
    let message = await fetchMessage();
    console.info(`${message}`); // 'Hello ArkTS'
  } catch (error) {
    // await将被拒绝的Promise转为异常，可用try-catch捕获
    console.error(`加载失败: ${(error as Error).message}`);
  }
}

loadMessage();  // 顶层不能使用await，直接调用返回Promise，不等待完成
// [End async_await_basic]

// ===== promise_basic_usage =====
// [Start promise_basic_usage]
// 通过构造函数创建Promise
let basicPromise = new Promise<string>((resolve, reject) => {
  let success = true;
  if (success) {
    resolve('操作成功');
  } else {
    reject(new Error('操作失败'));
  }
});

// then注册成功回调，catch注册失败回调，支持链式调用
basicPromise
  .then((value: string): string => `${value}，继续处理`)
  .then((value: string): void => console.info(`${value}`))
  .catch((error: Error): void => console.error(`${error.message}`));
// [End promise_basic_usage]

// ===== promise_combinators =====
// [Start promise_combinators]
// Promise.all()：等待全部完成，任一失败则整体失败
let allPromise = Promise.all([Promise.resolve(1), Promise.resolve(2)]);
allPromise.then((values: number[]): void => console.info(`${values.join(', ')}`)); // 1, 2

// Promise.race()：采用最先完成的Promise结果
let fastPromise = new Promise<string>((resolve: (value: string) => void) => {
  setTimeout(() => resolve('fast'), 100);
});
let slowPromise = new Promise<string>((resolve: (value: string) => void) => {
  setTimeout(() => resolve('slow'), 200);
});
Promise.race([fastPromise, slowPromise])
  .then((value: string): void => console.info(`${value}`)); // 'fast'

// Promise.allSettled()：等待全部完成，无论成败都收集结果
Promise.allSettled([Promise.resolve('ok'), Promise.reject(new Error('bad'))])
  .then((results): void => {
    results.forEach((result): void => {
      console.info(`${result.status}`);
    });
  });
// 输出两行日志：
// 'fulfilled'
// 'rejected'

// Promise.any()：采用第一个成功的结果
Promise.any([Promise.reject(new Error('A失败')), Promise.resolve('B成功')])
  .then((value: string): void => console.info(`${value}`)); // 'B成功'
// [End promise_combinators]
