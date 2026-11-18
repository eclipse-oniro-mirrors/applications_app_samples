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

// ===== promise_race_timeout =====
// [Start promise_race_timeout]
import http from '@ohos.net.http';

// Promise.race：竞赛模式，返回最先完成的Promise
async function fetchWithTimeout(url: string, timeoutMs: number): Promise<string> {
  // 创建超时Promise
  let timeoutPromise: Promise<string> = new Promise<string>((_resolve, reject) => {
    setTimeout(() => reject(new Error('Timeout')), timeoutMs);
  });

  // 创建请求Promise
  let fetchPromise: Promise<string> = http.createHttp().request(url)
    .then((res: http.HttpResponse) => res.result as string);

  // 竞赛：超时或请求完成
  try {
    let result: string = await Promise.race<string>([fetchPromise, timeoutPromise]);
    return result;
  } catch (error) {
    if ((error as Error).message === 'Timeout') {
      console.error('Request timed out');
    } else {
      console.error(`Request failed: ${(error as Error).message}`);
    }
    throw new Error((error as Error).message);
  }
}

// 使用示例
async function testRace(): Promise<void> {
  try {
    let data = await fetchWithTimeout('/api/data', 5000);
    console.info(`Data: ${data}`);
  } catch (error) {
    console.error('Failed to fetch data');
  }
}

testRace();
// [End promise_race_timeout]
