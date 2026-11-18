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

// ===== avoid_callback_hell =====
// [Start avoid_callback_hell]
import http from '@ohos.net.http';

interface EmptyResult {}

// 辅助函数：模拟数据处理和结果展示，实际项目中替换为业务逻辑
function processData(
  users: Object,
  products: Object,
  orders: Object,
  callback?: (result: Object) => void
): Promise<Object> {
  let emptyResult: EmptyResult = {};
  if (callback) { callback(emptyResult); }
  return Promise.resolve(emptyResult);
}
function displayResult(result: Object, callback?: () => void): Promise<void> {
  if (callback) { callback(); }
  return Promise.resolve();
}

// 反例：回调地狱
function fetchDataWithCallbacks(): void {
  http.createHttp().request('/api/users', (users) => {
    http.createHttp().request('/api/products', (products) => {
      http.createHttp().request('/api/orders', (orders) => {
        processData(users, products, orders, (result) => {
          displayResult(result, () => {
            console.info('Done');
          });
        });
      });
    });
  });
}

// 推荐：使用async/await
async function fetchDataWithAsyncAwait(): Promise<void> {
  let users = await http.createHttp().request('/api/users');
  let products = await http.createHttp().request('/api/products');
  let orders = await http.createHttp().request('/api/orders');
  
  let result = await processData(users, products, orders);
  await displayResult(result);
  
  console.info('Done');
}

// 推荐：使用Promise.all并发执行
async function fetchDataWithPromiseAll(): Promise<void> {
  let results = await Promise.all([
    http.createHttp().request('/api/users'),
    http.createHttp().request('/api/products'),
    http.createHttp().request('/api/orders')
  ]);
  let users = results[0];
  let products = results[1];
  let orders = results[2];
  
  let result = await processData(users, products, orders);
  await displayResult(result);
  
  console.info('Done');
}
// [End avoid_callback_hell]
