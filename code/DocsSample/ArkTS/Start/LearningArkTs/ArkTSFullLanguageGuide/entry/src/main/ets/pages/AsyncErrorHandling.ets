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

// ===== async_function_error_handling =====
// [Start async_function_error_handling]
import http from '@ohos.net.http';

// 异步函数中的错误处理
async function fetchDataWithError(): Promise<string> {
  try {
    // 模拟可能失败的异步操作
    let response = await http.createHttp().request('/api/data');
    
    if (response.responseCode !== 200) {
      throw new Error(`HTTP ${response.responseCode}`);
    }
    
    let data = response.result;
    return JSON.stringify(data);
  } catch (error) {
    console.error('Fetch error:', (error as Error).message);
    throw new Error((error as Error).message); // 重新抛出错误
  }
}

// 使用try-catch处理异步函数的错误
async function handleFetch(): Promise<void> {
  try {
    let data = await fetchDataWithError();
    console.info(`Data: ${data}`);
  } catch (error) {
    console.error('Handler error:', (error as Error).message);
  }
}

// 使用Promise.catch() 处理错误
fetchDataWithError()
  .then(data => console.info(`Success: ${data}`))
  .catch((error: Error) => console.error(`Catch: ${error.message}`));
// [End async_function_error_handling]
