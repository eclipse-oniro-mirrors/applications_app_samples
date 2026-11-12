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

// Default interval used when a caller passes a non positive interval.
const FALLBACK_INTERVAL: number = 500;
// Default delay used when a caller passes a non positive delay.
const FALLBACK_DELAY: number = 300;

/**
 * Keyed rate limiter and debouncer built on Date.now and setTimeout.
 * Every logical action gets its own key so independent buttons never block each other.
 * Timestamps and pending timer ids are stored in maps so the state stays inspectable.
 */
export class ThrottleUtils {
  // Last accepted run time per key, expressed in milliseconds since the epoch.
  private static readonly lastRunMap: Map<string, number> = new Map<string, number>();
  // Pending debounce timer id per key, used to cancel the previous call.
  private static readonly debounceTimerMap: Map<string, number> = new Map<string, number>();
  // Timer id per key for the throttle trailing call so it can be cleared as well.
  private static readonly throttleTimerMap: Map<string, number> = new Map<string, number>();

  /**
   * Checks whether an action with this key may run now and records the run time.
   * @param key Logical action key.
   * @param intervalMs Minimum interval in milliseconds between two runs.
   * @returns True when the caller may run the action now.
   */
  static shouldRun(key: string, intervalMs: number): boolean {
    // A non positive interval would block nothing, so a sane default is used instead.
    const interval: number = intervalMs > 0 ? intervalMs : FALLBACK_INTERVAL;
    // Read the current time once so all arithmetic uses the same reference.
    const now: number = Date.now();
    // Look up the previous run time of this key.
    const last: number | undefined = ThrottleUtils.lastRunMap.get(key);
    // The first call of a key is always allowed.
    if (last === undefined) {
      // Record this moment as the new reference time.
      ThrottleUtils.lastRunMap.set(key, now);
      // Report that the caller may proceed.
      return true;
    }
    // Compare the elapsed time against the configured interval.
    if (now - last >= interval) {
      // Record this moment as the new reference time.
      ThrottleUtils.lastRunMap.set(key, now);
      // Report that the caller may proceed.
      return true;
    }
    // The interval has not elapsed yet, so the call is dropped.
    return false;
  }

  /**
   * Schedules an action so that only the last call inside the delay window runs.
   * @param key Logical action key.
   * @param delayMs Quiet window in milliseconds.
   * @param action Action executed once the window expired.
   */
  static debounce(key: string, delayMs: number, action: () => void): void {
    // A non positive delay would run instantly, so a sane default is used instead.
    const delay: number = delayMs > 0 ? delayMs : FALLBACK_DELAY;
    // Read the pending timer of this key, if any.
    const pending: number | undefined = ThrottleUtils.debounceTimerMap.get(key);
    // Cancel the previous timer so only the newest call survives.
    if (pending !== undefined) {
      // Drop the scheduled callback from the event loop.
      clearTimeout(pending);
    }
    // Schedule the action after the quiet window.
    const timerId: number = setTimeout(() => {
      // Forget the timer id because it is firing right now.
      ThrottleUtils.debounceTimerMap.delete(key);
      // Run the caller action.
      action();
    }, delay);
    // Remember the new timer id for a later cancellation.
    ThrottleUtils.debounceTimerMap.set(key, timerId);
  }

  /**
   * Runs the action immediately when the interval elapsed, otherwise drops the call.
   * @param key Logical action key.
   * @param intervalMs Minimum interval in milliseconds between two runs.
   * @param action Action executed when the interval elapsed.
   */
  static throttle(key: string, intervalMs: number, action: () => void): void {
    // Ask the shared limiter whether this call may run.
    const allowed: boolean = ThrottleUtils.shouldRun(key, intervalMs);
    // Drop the call when the interval has not elapsed.
    if (!allowed) {
      // Nothing else has to be done for a dropped call.
      return;
    }
    // Run the action synchronously to keep the caller flow predictable.
    action();
  }

  /**
   * Clears all state of a single key.
   * @param key Logical action key.
   */
  static reset(key: string): void {
    // Read the pending debounce timer of this key.
    const debounceTimer: number | undefined = ThrottleUtils.debounceTimerMap.get(key);
    // Cancel the pending debounce callback when there is one.
    if (debounceTimer !== undefined) {
      // Drop the scheduled callback from the event loop.
      clearTimeout(debounceTimer);
    }
    // Read the pending throttle timer of this key.
    const throttleTimer: number | undefined = ThrottleUtils.throttleTimerMap.get(key);
    // Cancel the pending throttle callback when there is one.
    if (throttleTimer !== undefined) {
      // Drop the scheduled callback from the event loop.
      clearTimeout(throttleTimer);
    }
    // Forget the timer ids of this key.
    ThrottleUtils.debounceTimerMap.delete(key);
    // Forget the trailing throttle timer id of this key.
    ThrottleUtils.throttleTimerMap.delete(key);
    // Forget the last run time so the next call is allowed again.
    ThrottleUtils.lastRunMap.delete(key);
  }

  /**
   * Clears the state of every key, useful when a page disappears.
   */
  static clearAll(): void {
    // Cancel every pending debounce callback.
    ThrottleUtils.debounceTimerMap.forEach((timerId: number) => {
      // Drop the scheduled callback from the event loop.
      clearTimeout(timerId);
    });
    // Cancel every pending throttle callback.
    ThrottleUtils.throttleTimerMap.forEach((timerId: number) => {
      // Drop the scheduled callback from the event loop.
      clearTimeout(timerId);
    });
    // Drop all remembered timer ids at once.
    ThrottleUtils.debounceTimerMap.clear();
    // Drop all trailing throttle timer ids at once.
    ThrottleUtils.throttleTimerMap.clear();
    // Drop every remembered run time so all keys are allowed again.
    ThrottleUtils.lastRunMap.clear();
  }
}
