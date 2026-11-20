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
import { errorManager } from '@kit.AbilityKit';

// 将监听回调保存为observer，便于后续精确注销
let observer: errorManager.UnhandledRejectionObserver = (reason: Error, promise: Promise<void>) => {
  console.error(`未处理的 Promise 拒绝: ${reason.message}`);
};

// 注册监听（只能在主线程注册）
errorManager.on('unhandledRejection', observer);

// 示例：触发未处理的Promise rejection
async function triggerUnhandledRejection(): Promise<void> {
  // 这个错误没有try-catch或.catch() 处理
  await Promise.reject(new Error('未捕获的 Promise 错误'));
}

triggerUnhandledRejection(); // 该rejection未被处理，将触发上方注册的监听器

// 在合适的时机（如页面销毁时）注销监听：
errorManager.off('unhandledRejection', observer);
// [End unhandled_rejection_handler]
