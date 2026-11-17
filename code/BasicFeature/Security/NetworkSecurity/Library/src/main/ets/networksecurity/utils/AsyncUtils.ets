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

import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';

// Sentinel timer id used before the first timer is scheduled.
const NO_TIMER: number = -1;
// Multiplier applied to the base delay for every retry attempt.
const BACKOFF_BASE: number = 2;
// Sentinel code logged when a thrown value carries no numeric business code.
const UNKNOWN_CODE: number = -1;

/**
 * Asynchronous helpers: delayed promises, debounced and throttled callbacks
 * and a retry wrapper with exponential backoff. Debounce and throttle use
 * plain closures with arrow functions, which is the ArkTS-friendly form.
 */
export class AsyncUtils {
  /**
   * Wait for the given number of milliseconds.
   * @param ms delay duration in milliseconds.
   * @returns a promise that resolves once the delay has elapsed.
   */
  static delay(ms: number): Promise<void> {
    const tag: string = '[AsyncUtils#delay]';
    Logger.enter(tag, 'ms: ' + ms.toString());
    Logger.beginTrace('NetworkSecurity.utils.delay', 1);
    // Resolve through setTimeout so the caller can await the pause.
    const promise: Promise<void> = new Promise<void>((resolve: () => void) => {
      setTimeout((): void => {
        // The timer fires only after the requested delay.
        resolve();
      }, ms);
    });
    Logger.exit(tag, 'scheduled');
    Logger.endTrace('NetworkSecurity.utils.delay', 1);
    return promise;
  }

  /**
   * Wrap a callback so it runs only after a quiet period of waitMs. Each
   * new invocation restarts the timer and cancels the pending one.
   * @param action callback to debounce; it receives no arguments.
   * @param waitMs quiet period in milliseconds before the callback runs.
   * @returns a wrapped callback with debounce behaviour.
   */
  static debounce(action: () => void, waitMs: number): () => void {
    const tag: string = '[AsyncUtils#debounce]';
    Logger.enter(tag, 'waitMs: ' + waitMs.toString());
    Logger.beginTrace('NetworkSecurity.utils.debounce', 1);
    // Timer id lives in the closure so every wrapper is independent.
    let timerId: number = NO_TIMER;
    // The returned arrow function keeps the closure alive between calls.
    const wrapped: () => void = (): void => {
      // Cancel the still pending invocation of the previous call.
      if (timerId !== NO_TIMER) {
        clearTimeout(timerId);
      }
      // Schedule the real callback after the quiet period.
      timerId = setTimeout((): void => {
        timerId = NO_TIMER;
        action();
      }, waitMs);
    };
    Logger.exit(tag, 'wrapped');
    Logger.endTrace('NetworkSecurity.utils.debounce', 1);
    return wrapped;
  }

  /**
   * Wrap a callback so it runs at most once per interval. Extra calls
   * inside the interval are dropped, not queued.
   * @param action callback to throttle; it receives no arguments.
   * @param intervalMs minimum spacing between two executions in milliseconds.
   * @returns a wrapped callback with throttle behaviour.
   */
  static throttle(action: () => void, intervalMs: number): () => void {
    const tag: string = '[AsyncUtils#throttle]';
    Logger.enter(tag, 'intervalMs: ' + intervalMs.toString());
    Logger.beginTrace('NetworkSecurity.utils.throttle', 1);
    // Both flags live in the closure so every wrapper is independent.
    let lastRunAt: number = 0;
    let timerId: number = NO_TIMER;
    // The returned arrow function applies the trailing-edge logic.
    const wrapped: () => void = (): void => {
      const now: number = Date.now();
      // Run immediately when the interval has fully elapsed.
      if (now - lastRunAt >= intervalMs) {
        lastRunAt = now;
        action();
      } else if (timerId === NO_TIMER) {
        // Schedule one trailing call so the final burst is not lost.
        const wait: number = intervalMs - (now - lastRunAt);
        timerId = setTimeout((): void => {
          timerId = NO_TIMER;
          lastRunAt = Date.now();
          action();
        }, wait);
      }
    };
    Logger.exit(tag, 'wrapped');
    Logger.endTrace('NetworkSecurity.utils.throttle', 1);
    return wrapped;
  }

  /**
   * Run an async action and retry it with exponential backoff after
   * failures. The action is attempted up to retryCount plus one times.
   * @param action async callback to execute.
   * @param retryCount number of retries after the first attempt.
   * @param baseDelayMs delay before the first retry in milliseconds.
   * @returns true when one attempt succeeded, false when all failed.
   */
  static async withRetry(action: () => Promise<void>, retryCount: number, baseDelayMs: number): Promise<boolean> {
    const tag: string = '[AsyncUtils#withRetry]';
    Logger.enter(tag, 'retryCount: ' + retryCount.toString() + ', baseDelayMs: ' + baseDelayMs.toString());
    Logger.beginTrace('NetworkSecurity.utils.withRetry', 1);
    // Clamp the retry count so negative inputs behave like zero retries.
    const safeRetryCount: number = retryCount < 0 ? 0 : retryCount;
    // Walk through every attempt until one succeeds.
    let result: boolean = false;
    for (let attempt = 0; attempt <= safeRetryCount; attempt++) {
      try {
        // Each attempt gets a fresh run of the async action.
        await action();
        result = true;
        break;
      } catch (error) {
        // The action may throw a plain Error without a business code, so guard the read
        // before rendering it; an unguarded read would turn a retryable failure into a crash.
        const err: BusinessError = error as BusinessError;
        const code: number = typeof err.code === 'number' ? err.code : UNKNOWN_CODE;
        Logger.warn('[AsyncUtils#withRetry] attempt ' + attempt.toString() + ' failed, code ' + code.toString());
        if (attempt < safeRetryCount) {
          // Exponential backoff doubles the base delay per attempt.
          const backoff: number = baseDelayMs * Math.pow(BACKOFF_BASE, attempt);
          await AsyncUtils.delay(backoff);
        }
      }
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.withRetry', 1);
    return result;
  }
}
