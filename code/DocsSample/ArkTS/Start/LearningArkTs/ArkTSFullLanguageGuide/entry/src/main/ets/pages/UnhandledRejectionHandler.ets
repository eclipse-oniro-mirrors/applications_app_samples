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

// ===== unhandled_rejection_handler =====
// [Start unhandled_rejection_handler]
import errorManager from '@ohos.app.ability.errorManager';

// 监听未处理的Promise拒绝
errorManager.on('unhandledRejection', (reason: Error, promise: Promise<Object>) => {
  console.error(`未处理的 Promise 拒绝: ${reason.message}`);
});

// 示例：触发全局错误处理
async function triggerUnhandledRejection(): Promise<void> {
  // 这个错误没有try-catch或.catch() 处理
  await Promise.reject(new Error('未捕获的 Promise 错误'));
}

triggerUnhandledRejection(); // 运行时报错，将触发全局错误监听器
// [End unhandled_rejection_handler]
