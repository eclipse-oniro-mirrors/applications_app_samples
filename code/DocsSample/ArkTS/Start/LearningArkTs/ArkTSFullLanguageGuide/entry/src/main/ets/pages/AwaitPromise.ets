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

// ===== await_promise =====
// [Start await_promise]
import http from '@ohos.net.http';

async function awaitPromise(): Promise<void> {
  // await等待Promise完成，获取resolve的值
  let promise1 = Promise.resolve(42);
  let value1 = await promise1;
  console.info(`Value 1: ${value1}`); // 42
  
  // await捕获Promise的错误
  let promise2 = Promise.reject(new Error('Failed'));
  try {
    let value2 = await promise2;
  } catch (error) {
    console.error(`Error 2: ${(error as Error).message}`); // Failed
  }
  
  // await等待fetch请求
  try {
    let response = await http.createHttp().request('/api/data');
    let data = response.result;
    console.info(`Data: ${data}`);
  } catch (error) {
    console.error(`Fetch failed: ${(error as Error).message}`);
  }
}

awaitPromise();
// [End await_promise]
