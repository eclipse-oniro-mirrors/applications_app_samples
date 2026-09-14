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

// ===== promise_allsettled_usage =====
// [Start promise_allsettled_usage]
import http from '@ohos.net.http';

interface FetchError {
  error: string;
}

// Promise.allSettled：获取所有Promise的结果
async function fetchMultipleUrls(urls: string[]): Promise<void> {
  let fetchPromises = urls.map(url => 
    http.createHttp().request(url)
      .then(res => res.result)
      .catch((error: Error): FetchError => ({ error: error.message }))
  );
  
  let results = await Promise.allSettled(fetchPromises);
  
  // 统计成功和失败数量
  let successCount = 0;
  let failureCount = 0;
  
  results.forEach((result, index) => {
    if (result.status === 'fulfilled') {
      successCount++;
      console.info(`URL ${index} success: ${result.value}`);
    } else {
      failureCount++;
      console.error(`URL ${index} failed: ${result.reason}`);
    }
  });
  
  console.info(`Summary: ${successCount} successes, ${failureCount} failures`);
}

// 使用示例
let urls = [
  '/api/users',
  '/api/products',
  '/api/orders',
  '/api/inventory'
];

fetchMultipleUrls(urls);
// [End promise_allsettled_usage]
