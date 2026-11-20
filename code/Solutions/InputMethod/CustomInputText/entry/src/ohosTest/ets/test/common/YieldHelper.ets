/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundleManager from '@ohos.bundle.bundleManager';

/**
 * Ends the current main-thread loop task between test cases.
 *
 * hypium runs cases back to back inside one uv loop task. A setTimeout(0) based
 * yield does not end that task: the timer is already due when the loop checks
 * it, so the whole batch stays inside one task and hiview's watchdog kills it
 * with THREAD_BLOCK_6S. Awaiting a real async native call (the bundle manager
 * round trip below) hands the loop back, because the reply arrives later as a
 * new event. A short non-zero timer is kept as a fallback for the case where
 * the bundle service rejects the call.
 */
export async function yieldToEventLoop(): Promise<void> {
  try {
    await bundleManager.getBundleInfoForSelf(0);
    return;
  } catch (error) {
    // Fall through to the timer based yield when the bundle service fails.
  }
  await new Promise<void>((resolve: Function) => {
    setTimeout(() => {
      resolve();
    }, 5);
  });
}
