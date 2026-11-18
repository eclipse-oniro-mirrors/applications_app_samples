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

export {}

// ===== error_handling_patterns =====
// [Start error_handling_patterns]
// 方案1: try-catch捕获异常
function tryCatchExample(): void {
  try {
    // 可能出错的代码
    let data: Object = JSON.parse('invalid json');
  } catch (error) {
    console.error(`解析失败: ${(error as Error).message}`);
  }
}

// 方案2: 返回错误信息（函数式风格）
function parseJSON(jsonStr: string): [Object | null, Error | null] {
  try {
    let data: Object = JSON.parse(jsonStr) as Object;
    return [data, null];
  } catch (error) {
    return [null, error as Error];
  }
}

// 方案3: 异步错误处理
async function asyncErrorHandling(): Promise<void> {
  try {
    let response = await http.createHttp().request('EXAMPLE_API_URL');
    let data = response.result;
  } catch (error) {
    console.error(`请求失败: ${(error as Error).message}`);
  }
}
// [End error_handling_patterns]
