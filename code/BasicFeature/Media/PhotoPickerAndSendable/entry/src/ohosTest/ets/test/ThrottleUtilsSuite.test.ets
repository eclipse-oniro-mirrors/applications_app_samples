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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ThrottleUtils } from 'photopickersendable';

/** Interval window in milliseconds used by the throttle and shouldRun cases. */
const WINDOW_MS: number = 50;
/** Quiet window in milliseconds used by the debounce cases. */
const QUIET_MS: number = 50;
/** Wait that clears a fifty millisecond window with a safe margin. */
const SETTLE_MS: number = 80;
/** Wait that stays inside the quiet window when a rearm is expected. */
const SHORT_WAIT_MS: number = 20;
/** Wait long enough for a fifty millisecond timer to fire. */
const TIMER_WAIT_MS: number = 100;
/** Half of the quiet window, used to land inside the debounce span. */
const MID_WAIT_MS: number = 30;
/** Wait that clears the three hundred millisecond delay fallback. */
const FALLBACK_WAIT_MS: number = 350;

/**
 * Waits for the given duration before the next assertion runs.
 * @param delayMs Duration to wait in milliseconds.
 * @returns Promise resolved once the wait elapsed.
 */
function waitForMillis(delayMs: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout((): void => {
      resolve();
    }, delayMs);
  });
}

/**
 * Registers the timing cases of ThrottleUtils.
 */
export default function throttleUtilsSuiteTest() {
  describe('ThrottleUtilsSuiteTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0100
     * @tc.name      testThrottleUtil0001
     * @tc.desc      Verify shouldRun allows the first call of a fresh key and
     *               suppresses the immediate follow up calls inside the window.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrottleUtil0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // Use a dedicated key so the case state stays isolated.
      const key: string = 'throttle-suite-should-run-window';
      // Drop any state left by a previous run of this key.
      ThrottleUtils.reset(key);
      // The first call of a fresh key is allowed.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      // The immediate second call inside the window is suppressed.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // The third immediate call is suppressed as well.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // Clean the key state so later cases stay unaffected.
      ThrottleUtils.reset(key);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0200
     * @tc.name      testThrottleUtil0002
     * @tc.desc      Verify shouldRun restores the permission after the interval
     *               window elapsed and suppresses the call that follows the
     *               restored one immediately.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrottleUtil0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Use a dedicated key for this timing case.
      const key: string = 'throttle-suite-should-run-recovery';
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // The first call is allowed.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      // The immediate second call is suppressed.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // Wait past the fifty millisecond window.
      await waitForMillis(SETTLE_MS);
      // The window has elapsed so the call is allowed again.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      // The restored call refreshed the window, so the next one is suppressed.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0300
     * @tc.name      testThrottleUtil0003
     * @tc.desc      Verify throttle runs the action synchronously on the first
     *               call, drops the calls inside the window and runs the action
     *               again once the window elapsed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrottleUtil0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Use a dedicated key for this timing case.
      const key: string = 'throttle-suite-throttle-sync';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // The first call executes the action synchronously.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(1);
      // The second call inside the window is dropped.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(1);
      // The third immediate call is dropped as well.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(1);
      // Wait past the window.
      await waitForMillis(SETTLE_MS);
      // The action runs again after the interval elapsed.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(2);
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0400
     * @tc.name      testThrottleUtil0004
     * @tc.desc      Verify debounce holds the action back inside the quiet window
     *               and executes only the last registered action once the window
     *               expired.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrottleUtil0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Use a dedicated key for this timing case.
      const key: string = 'throttle-suite-debounce-last';
      // Count the executed actions.
      let counter: number = 0;
      // Remember the payload of the executed action.
      let payload: string = '';
      // Actions that register their payload for one run.
      const firstAction: () => void = (): void => {
        counter = counter + 1;
        payload = 'first';
      };
      const secondAction: () => void = (): void => {
        counter = counter + 1;
        payload = 'second';
      };
      const thirdAction: () => void = (): void => {
        counter = counter + 1;
        payload = 'third';
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Register three actions in a row inside the same quiet window.
      ThrottleUtils.debounce(key, QUIET_MS, firstAction);
      ThrottleUtils.debounce(key, QUIET_MS, secondAction);
      ThrottleUtils.debounce(key, QUIET_MS, thirdAction);
      // A short wait inside the window shows that nothing ran yet.
      await waitForMillis(SHORT_WAIT_MS);
      expect(counter).assertEqual(0);
      // Wait until the quiet window expired.
      await waitForMillis(TIMER_WAIT_MS);
      // Exactly the last action ran once.
      expect(counter).assertEqual(1);
      // The executed action is the last registered one.
      expect(payload).assertEqual('third');
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0500
     * @tc.name      testThrottleUtil0005
     * @tc.desc      Verify debounce restarts its quiet window when a later call
     *               arrives inside the span, so the early action never runs and
     *               only the rearmed action executes once.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrottleUtil0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Use a dedicated key for this timing case.
      const key: string = 'throttle-suite-debounce-rearm';
      // Count the executed actions.
      let counter: number = 0;
      // Remember the payload of the executed action.
      let payload: string = '';
      // Action of the first call.
      const earlyAction: () => void = (): void => {
        counter = counter + 1;
        payload = 'early';
      };
      // Action of the rearmed call.
      const lateAction: () => void = (): void => {
        counter = counter + 1;
        payload = 'late';
      };
      // Action of the second rearmed cycle.
      const secondLateAction: () => void = (): void => {
        counter = counter + 1;
        payload = 'late2';
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Register the early action.
      ThrottleUtils.debounce(key, QUIET_MS, earlyAction);
      // Stay inside the quiet window before the rearmed call.
      await waitForMillis(MID_WAIT_MS);
      // Rearm the window with the late action.
      ThrottleUtils.debounce(key, QUIET_MS, lateAction);
      // Wait until the restarted window expired.
      await waitForMillis(TIMER_WAIT_MS);
      // Only one action ran in total.
      expect(counter).assertEqual(1);
      // The early action was dropped and the late one ran.
      expect(payload).assertEqual('late');
      // Rearm a second cycle with a fresh late action.
      ThrottleUtils.debounce(key, QUIET_MS, secondLateAction);
      // A short wait inside the restarted window shows the new action is pending.
      await waitForMillis(SHORT_WAIT_MS);
      expect(counter).assertEqual(1);
      // Wait until the restarted window expired.
      await waitForMillis(TIMER_WAIT_MS);
      // The second rearmed action ran exactly once.
      expect(counter).assertEqual(2);
      expect(payload).assertEqual('late2');
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0600
     * @tc.name      testThrottleUtil0006
     * @tc.desc      Verify two different keys keep independent windows: consuming
     *               one key never blocks the other key and both keys recover at
     *               the same time after the interval elapsed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrottleUtil0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Use two dedicated keys for the isolation check.
      const keyA: string = 'throttle-suite-isolate-a';
      const keyB: string = 'throttle-suite-isolate-b';
      // Count the executed actions of each key.
      let countA: number = 0;
      let countB: number = 0;
      // Actions that record one run of their own key.
      const runA: () => void = (): void => {
        countA = countA + 1;
      };
      const runB: () => void = (): void => {
        countB = countB + 1;
      };
      // Start both keys from a clean state.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
      // The first call of key A is allowed.
      expect(ThrottleUtils.shouldRun(keyA, WINDOW_MS)).assertTrue();
      // Consuming key A does not block the first call of key B.
      expect(ThrottleUtils.shouldRun(keyB, WINDOW_MS)).assertTrue();
      // Key A is suppressed by its own window.
      expect(ThrottleUtils.shouldRun(keyA, WINDOW_MS)).assertFalse();
      // Key B is suppressed by its own window too.
      expect(ThrottleUtils.shouldRun(keyB, WINDOW_MS)).assertFalse();
      // Wait past the window so both keys recover before the throttle counts run.
      await waitForMillis(SETTLE_MS);
      // Each key runs its action once through the throttle helper.
      ThrottleUtils.throttle(keyA, WINDOW_MS, runA);
      ThrottleUtils.throttle(keyB, WINDOW_MS, runB);
      expect(countA).assertEqual(1);
      expect(countB).assertEqual(1);
      // The immediate repeats stay suppressed on both keys.
      ThrottleUtils.throttle(keyA, WINDOW_MS, runA);
      ThrottleUtils.throttle(keyB, WINDOW_MS, runB);
      expect(countA).assertEqual(1);
      expect(countB).assertEqual(1);
      // Wait past the window.
      await waitForMillis(SETTLE_MS);
      // Both keys recover independently.
      ThrottleUtils.throttle(keyA, WINDOW_MS, runA);
      ThrottleUtils.throttle(keyB, WINDOW_MS, runB);
      expect(countA).assertEqual(2);
      expect(countB).assertEqual(2);
      // Clean both key states at the end.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0700
     * @tc.name      testThrottleUtil0007
     * @tc.desc      Verify reset reopens the window of a consumed key and cancels
     *               a pending debounce action so it never fires afterwards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrottleUtil0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Use a dedicated key for the reset case.
      const key: string = 'throttle-suite-reset-key';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state and consume the window.
      ThrottleUtils.reset(key);
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // Reset the key and confirm the window reopens.
      ThrottleUtils.reset(key);
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      // Schedule a pending debounce action.
      ThrottleUtils.debounce(key, QUIET_MS, runAction);
      // Reset cancels the pending timer.
      ThrottleUtils.reset(key);
      // Wait well past the quiet window.
      await waitForMillis(TIMER_WAIT_MS);
      // The cancelled action never fired.
      expect(counter).assertEqual(0);
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0800
     * @tc.name      testThrottleUtil0008
     * @tc.desc      Verify a non positive interval falls back to the default
     *               window: the first call passes and the immediate follow ups
     *               with zero and negative intervals stay suppressed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThrottleUtil0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // Use a dedicated key for the fallback case.
      const key: string = 'throttle-suite-fallback-interval';
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // The first call with a zero interval is allowed.
      expect(ThrottleUtils.shouldRun(key, 0)).assertTrue();
      // The fallback window suppresses the immediate second call.
      expect(ThrottleUtils.shouldRun(key, 0)).assertFalse();
      // A negative interval activates the same fallback suppression.
      expect(ThrottleUtils.shouldRun(key, -5)).assertFalse();
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_0900
     * @tc.name      testThrottleUtil0009
     * @tc.desc      Verify clearAll cancels the pending debounce actions of every
     *               key and clears the remembered run times so both keys are
     *               allowed again afterwards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrottleUtil0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Use two dedicated keys for the global clear case.
      const keyA: string = 'throttle-suite-clear-a';
      const keyB: string = 'throttle-suite-clear-b';
      // Count the executed actions of each key.
      let countA: number = 0;
      let countB: number = 0;
      // Actions that record one run of their own key.
      const runA: () => void = (): void => {
        countA = countA + 1;
      };
      const runB: () => void = (): void => {
        countB = countB + 1;
      };
      // Start both keys from a clean state.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
      // Schedule a pending debounce action on each key.
      ThrottleUtils.debounce(keyA, QUIET_MS, runA);
      ThrottleUtils.debounce(keyB, QUIET_MS, runB);
      // Consume the window of key A so a run time is remembered.
      expect(ThrottleUtils.shouldRun(keyA, WINDOW_MS)).assertTrue();
      // Clear the state of every key.
      ThrottleUtils.clearAll();
      // Wait well past the quiet window.
      await waitForMillis(TIMER_WAIT_MS);
      // Neither pending action fired.
      expect(countA).assertEqual(0);
      expect(countB).assertEqual(0);
      // Both keys are allowed again because the run times were dropped.
      expect(ThrottleUtils.shouldRun(keyA, WINDOW_MS)).assertTrue();
      expect(ThrottleUtils.shouldRun(keyB, WINDOW_MS)).assertTrue();
      // Clean both key states at the end.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THROTTLE_1000
     * @tc.name      testThrottleUtil0010
     * @tc.desc      Verify a non positive debounce delay falls back to the longer
     *               default window: the action stays pending after the settle
     *               wait and runs only once the fallback window expired.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThrottleUtil0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Use a dedicated key for the delay fallback case.
      const key: string = 'throttle-suite-fallback-delay';
      // Count the executed actions.
      let counter: number = 0;
      // Remember the moment the action fired.
      let firedAtMs: number = 0;
      // Action that records one run and its fire time.
      const runAction: () => void = (): void => {
        counter = counter + 1;
        firedAtMs = Date.now();
      };
      // Mark the moment the fallback window starts.
      const startMs: number = Date.now();
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Schedule the action with a zero delay.
      ThrottleUtils.debounce(key, 0, runAction);
      // Wait a short span that stays inside the fallback window.
      await waitForMillis(SETTLE_MS);
      // The action is still pending because the fallback delay is longer.
      expect(counter).assertEqual(0);
      // Wait past the three hundred millisecond fallback window.
      await waitForMillis(FALLBACK_WAIT_MS);
      // The action ran exactly once.
      expect(counter).assertEqual(1);
      // The fallback window held the action back for its full span, so it
      // cannot have fired anywhere near the short settle wait.
      expect(firedAtMs - startMs >= 290).assertTrue();
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
    });
  });
}
