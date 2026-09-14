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

// ===== async_vs_promise_chain =====
// [Start async_vs_promise_chain]
import http from '@ohos.net.http';

interface User {
  id: number;
  name: string;
}

// 推荐：异步函数清晰易读
async function chainFetchUserData(userId: number): Promise<User> {
  let response = await http.createHttp().request(`/api/users/${userId}`);
  let user = response.result as User;
  return user;
}

// 反例：Promise链式调用复杂
function fetchUserDataPromise(userId: number): Promise<User> {
  return http.createHttp().request(`/api/users/${userId}`)
    .then((response): User => response.result as User)
    .then((user: User): User => user);
}
// [End async_vs_promise_chain]
