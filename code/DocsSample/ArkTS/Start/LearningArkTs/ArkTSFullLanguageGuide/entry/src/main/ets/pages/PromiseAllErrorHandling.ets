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

// ===== promise_all_error_handling =====
// [Start promise_all_error_handling]
import http from '@ohos.net.http';

async function parallelErrorHandling(): Promise<void> {
  try {
    // 并行执行多个异步操作
    let results = await Promise.all([
      http.createHttp().request('EXAMPLE_API_URL/users'),
      http.createHttp().request('EXAMPLE_API_URL/posts'),
      http.createHttp().request('EXAMPLE_API_URL/comments')
    ]);
    
    let usersRes = results[0];
    let postsRes = results[1];
    let commentsRes = results[2];
    console.info(`所有请求成功: ${usersRes.responseCode}, ${postsRes.responseCode}, ${commentsRes.responseCode}`);
  } catch (error) {
    console.error(`至少一个请求失败: ${(error as Error).message}`);
  }
}

// 使用Promise.allSettled获取所有结果（无论成功或失败）
async function allSettledExample(): Promise<void> {
  let results = await Promise.allSettled([
    Promise.resolve('成功1'),
    Promise.reject(new Error('失败1')),
    Promise.resolve('成功2')
  ]);
  
  results.forEach((result, index) => {
    if (result.status === 'fulfilled') {
      console.info(`第${index + 1}个成功: ${result.value}`);
    } else {
      console.error(`第${index + 1}个失败:`, result.reason);
    }
  });
}

allSettledExample();
// 输出:
// 第1个成功: 成功1
// 第2个失败: 失败1
// 第3个成功: 成功2
// [End promise_all_error_handling]
