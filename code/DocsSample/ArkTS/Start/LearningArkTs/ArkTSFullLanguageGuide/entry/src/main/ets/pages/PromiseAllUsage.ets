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

// ===== promise_all_usage =====
// [Start promise_all_usage]
import http from '@ohos.net.http';

// Promise.all：并行执行多个异步任务
async function fetchAllData(): Promise<void> {
  console.info('Fetching all data...');
  
  let startTime = Date.now();
  
  // 并行发起三个请求
  let results = await Promise.all([
    http.createHttp().request('/api/users').then(res => res.result),
    http.createHttp().request('/api/products').then(res => res.result),
    http.createHttp().request('/api/orders').then(res => res.result)
  ]);
  let users = results[0];
  let products = results[1];
  let orders = results[2];
  
  let endTime = Date.now();
  console.info(`All requests completed in ${endTime - startTime}ms`);
  
  console.info(`Users: ${users}`);
  console.info(`Products: ${products}`);
  console.info(`Orders: ${orders}`);
}

fetchAllData();

// Promise.all失败处理
async function fetchAllWithErrorHandling(): Promise<void> {
  try {
    let results = await Promise.all([
      http.createHttp().request('/api/data1').then(res => res.result),
      http.createHttp().request('/api/data2').then(res => res.result),
      http.createHttp().request('/api/data3').then(res => res.result)
    ]);
    let data1 = results[0];
    let data2 = results[1];
    let data3 = results[2];
    
    console.info(`All data fetched successfully: ${data1}, ${data2}, ${data3}`);
  } catch (error) {
    console.error(`At least one request failed: ${(error as Error).message}`);
  }
}
// [End promise_all_usage]
