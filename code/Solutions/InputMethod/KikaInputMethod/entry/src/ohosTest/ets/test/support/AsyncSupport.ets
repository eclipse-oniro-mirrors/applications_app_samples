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
 * Yields to the event loop with a real native IPC round-trip.
 *
 * A bundle query ends the current uvLoopTask, so the OpenHarmony 6-second
 * application freeze watchdog is reset between long-running test cases.
 * A zero-delay timer does not end uvLoopTask and therefore does not work here.
 */
export async function yieldToEventLoop(): Promise<void> {
  await bundleManager.getBundleInfoForSelf(0);
}

/**
 * Cooperative delay for tests that must wait for an ability or UI transition.
 *
 * This is a normal timer and is not a substitute for {@link yieldToEventLoop}.
 *
 * @param ms delay in milliseconds
 */
export function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}
