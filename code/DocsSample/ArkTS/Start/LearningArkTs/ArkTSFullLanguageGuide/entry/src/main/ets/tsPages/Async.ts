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

export {};

// [Start ts_await_usage]
async function example(): Promise<void> {
  // await只能在async函数内使用
  let result = await Promise.resolve('Hello');
  console.info(`${result}`);
}

// 错误示例：在普通函数中使用await
function normalFunction() {
    let result = await Promise.resolve('Hello'); // 编译错误
}

// await可以用于任何Promise
async function awaitExample(): Promise<void> {
  // 等待Promise.resolve()
  let result1 = await Promise.resolve('Immediate');
  console.info(`${result1}`);

  // 等待Promise.reject()（需要错误处理）
  try {
    let result2 = await Promise.reject('Error');
  } catch (error) {
    console.error('Caught:', error);
  }

  // 等待setTimeout创建的Promise
  let result3 = await new Promise<string>((resolve) => {
    setTimeout(() => resolve('Delayed'), 1000);
  });
  console.info(`${result3}`);
}

awaitExample();
// [End ts_await_usage]

// [Start ts_generator_note]
// TypeScript对照写法，ArkTS不支持：
function* numberGenerator() {
    yield 1;
    yield 2;
    yield 3;
}
// [End ts_generator_note]
