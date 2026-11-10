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

const PACE_DELAY_MS: number = 30;

// Hypium chains cases through resolved promises, so a suite can keep the JS thread busy in
// promise-job draining without ever returning to an idle event loop turn; the freeze detector
// then reports THREAD_BLOCK_6S and kills the test process. A zero-delay timer is fired from the
// same drain and does not create that idle gap, so the yield uses a real timer deadline instead.
export function paceTurn(): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve();
    }, PACE_DELAY_MS);
  });
}
