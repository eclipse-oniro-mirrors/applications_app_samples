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

// ===== error_handling_best_practice =====
// [Start error_handling_best_practice]
import http from '@ohos.net.http';

// 推荐：完整的错误处理
async function fetchDataWithErrorHandling(): Promise<void> {
  try {
    let response = await http.createHttp().request('/api/data');
    
    if (response.responseCode !== 200) {
      throw new Error(`HTTP ${response.responseCode}`);
    }
    
    let data = response.result;
    console.info(`Data: ${data}`);
  } catch (error) {
    console.error(`Fetch failed: ${(error as Error).message}`);
    // 错误恢复或上报
  }
}

// 反例：未捕获错误
async function fetchDataWithoutHandling(): Promise<void> {
  let response = await http.createHttp().request('/api/data');
  let data = response.result;
  console.info(`Data: ${data}`);
  // 可能导致未捕获的Promise拒绝
}
// [End error_handling_best_practice]
