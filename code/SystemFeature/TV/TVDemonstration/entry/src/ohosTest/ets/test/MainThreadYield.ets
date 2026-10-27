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
 * Main-thread pacing helper shared by the pure-logic ohosTest suites.
 */

const YIELD_INTERVAL_MS: number = 500;
// Must stay above zero: an already-expired timer is dispatched inside the same
// uv loop turn, so the runloop keeps executing the suite chain and the queued
// AppFreeze probe never gets a turn. A timer that is still pending makes the
// turn end, which lets the event queue drain before the chain resumes.
const YIELD_DELAY_MS: number = 10;
let lastYieldTime: number = 0;

/**
 * Returns control to the event loop once the running suite has kept the
 * ohosTest main thread busy for more than YIELD_INTERVAL_MS.
 *
 * The ohosTest entry point runs inside the application-under-test process, and
 * hypium executes specs as one chain of microtasks: only a spec that awaits a
 * native Promise hands the main thread back to the event loop. The pure-logic
 * matrix suites never await anything, so several hundred of their specs execute
 * inside a single JS job. On this TV image that job can keep the main thread
 * busy for more than 6 s, at which point the system AppFreeze watchdog reports
 * THREAD_BLOCK_6S for the foreground process, kills it, and `aa test` aborts
 * every remaining suite with "App died" (see the appfreeze logs under
 * /data/log/faultlog/faultlogger).
 *
 * Yielding once per spec - but only after a chain has already run for
 * YIELD_INTERVAL_MS - bounds every uninterrupted stretch of JS far below the
 * 3 s watchdog probe while adding at most one timer turn per half second.
 */
export async function keepMainThreadResponsive(): Promise<void> {
  const now: number = Date.now();
  if (now - lastYieldTime < YIELD_INTERVAL_MS) {
    return;
  }
  lastYieldTime = now;
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, YIELD_DELAY_MS);
  });
}
