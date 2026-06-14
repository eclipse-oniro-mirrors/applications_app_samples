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

// ===== promise_any_usage =====
// [Start promise_any_usage]
import http from '@ohos.net.http';

// Promise.any：返回第一个成功的Promise
async function fetchFromMultipleSources(): Promise<Object> {
  let sources = [
    'EXAMPLE_API_URL_1',
    'EXAMPLE_API_URL_2',
    'EXAMPLE_API_URL_3'
  ];
  
  let fetchPromises = sources.map((source: string): Promise<Object> => 
    http.createHttp().request(source)
      .then((res): Object => {
        if (res.responseCode !== 200) {
          throw new Error(`HTTP ${res.responseCode}`);
        }
        return res.result as Object;
      })
  );
  
  try {
    // 使用第一个成功的响应
    let data = await Promise.any(fetchPromises);
    console.info(`Data from first successful source: ${data}`);
    return data;
  } catch (error) {
    console.error(`All sources failed: ${(error as Error).message}`);
    throw new Error((error as Error).message);
  }
}

fetchFromMultipleSources();
// [End promise_any_usage]
