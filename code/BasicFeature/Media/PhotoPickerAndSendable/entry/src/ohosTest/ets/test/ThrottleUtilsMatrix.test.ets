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
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Throttle window in milliseconds used by the matrix cases. */
const WINDOW_MS: number = 100;
/** Quiet debounce window in milliseconds used by the matrix cases. */
const QUIET_MS: number = 80;
/** Wait that stays safely inside the one hundred millisecond window. */
const PENDING_WAIT_MS: number = 30;
/** Wait that clears every sixty to one hundred millisecond timer. */
const FIRE_WAIT_MS: number = 220;
/** Wait that stays inside the three hundred millisecond fallback delay. */
const FALLBACK_WAIT_MS: number = 160;
/** Wait that clears the three hundred millisecond fallback delay. */
const FALLBACK_FIRE_WAIT_MS: number = 400;

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
 * Registers the keyed throttle and debounce matrix cases of the shared
 * library. Every case uses dedicated keys so the suite state stays isolated.
 */
export default function throttleUtilsMatrixTest() {
  describe('ThrottleUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0100
     * @tc.name      testThrMatrix0001
     * @tc.desc      Verify shouldRun suppresses four immediate follow up
     *               calls inside one hundred millisecond window of one key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testThrMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key so the case state stays isolated.
      const key: string = 'throttle-matrix-sync-chain';
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // The first call of the fresh key is allowed.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      // Every immediate follow up call inside the window is dropped.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // Clean the key state so later cases stay unaffected.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0200
     * @tc.name      testThrMatrix0002
     * @tc.desc      Verify five different keys each allow their first call
     *               and suppress only their own immediate follow ups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testThrMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Collect five dedicated keys in one list.
      const keys: string[] = ['throttle-matrix-multi-a', 'throttle-matrix-multi-b',
        'throttle-matrix-multi-c', 'throttle-matrix-multi-d', 'throttle-matrix-multi-e'];
      // Start every key from a clean state.
      for (let index: number = 0; index < keys.length; index++) {
        ThrottleUtils.reset(keys[index]);
      }
      // Every key allows its own first call.
      for (let index: number = 0; index < keys.length; index++) {
        expect(ThrottleUtils.shouldRun(keys[index], WINDOW_MS)).assertTrue();
      }
      // Every key suppresses its own immediate second call.
      for (let index: number = 0; index < keys.length; index++) {
        expect(ThrottleUtils.shouldRun(keys[index], WINDOW_MS)).assertFalse();
      }
      // Clean every key state at the end.
      for (let index: number = 0; index < keys.length; index++) {
        ThrottleUtils.reset(keys[index]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0300
     * @tc.name      testThrMatrix0003
     * @tc.desc      Verify a key consumed with a two hundred millisecond
     *               interval also suppresses checks with smaller intervals
     *               inside the same window.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThrMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the mixed interval check.
      const key: string = 'throttle-matrix-mixed-interval';
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Consume the window with the longest interval.
      expect(ThrottleUtils.shouldRun(key, 200)).assertTrue();
      // Smaller intervals still see the consumed window.
      expect(ThrottleUtils.shouldRun(key, 50)).assertFalse();
      expect(ThrottleUtils.shouldRun(key, 100)).assertFalse();
      expect(ThrottleUtils.shouldRun(key, 200)).assertFalse();
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0400
     * @tc.name      testThrMatrix0004
     * @tc.desc      Verify keys built from Chinese text, emoji and a long
     *               buffer keep their throttle state independent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThrMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build one key per unusual text form.
      const chineseKey: string = '\u6309\u952E-\u8282\u6D41';
      const emojiKey: string = '\uD83D\uDE00-\uD83C\uDF89';
      let longKey: string = 'throttle-matrix-';
      for (let index: number = 0; index < 50; index++) {
        longKey = longKey + 'k';
      }
      // Start every key from a clean state.
      ThrottleUtils.reset(chineseKey);
      ThrottleUtils.reset(emojiKey);
      ThrottleUtils.reset(longKey);
      // Every unusual key allows its first call.
      expect(ThrottleUtils.shouldRun(chineseKey, WINDOW_MS)).assertTrue();
      expect(ThrottleUtils.shouldRun(emojiKey, WINDOW_MS)).assertTrue();
      expect(ThrottleUtils.shouldRun(longKey, WINDOW_MS)).assertTrue();
      // Every unusual key suppresses its own second call.
      expect(ThrottleUtils.shouldRun(chineseKey, WINDOW_MS)).assertFalse();
      expect(ThrottleUtils.shouldRun(emojiKey, WINDOW_MS)).assertFalse();
      expect(ThrottleUtils.shouldRun(longKey, WINDOW_MS)).assertFalse();
      // Clean every key state at the end.
      ThrottleUtils.reset(chineseKey);
      ThrottleUtils.reset(emojiKey);
      ThrottleUtils.reset(longKey);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0500
     * @tc.name      testThrMatrix0005
     * @tc.desc      Verify zero and negative intervals fall back to the
     *               default window and suppress the immediate follow ups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThrMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testThrMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key per invalid interval form.
      const zeroKey: string = 'throttle-matrix-interval-zero';
      const negativeKey: string = 'throttle-matrix-interval-negative';
      const largeNegativeKey: string = 'throttle-matrix-interval-large-negative';
      // Start every key from a clean state.
      ThrottleUtils.reset(zeroKey);
      ThrottleUtils.reset(negativeKey);
      ThrottleUtils.reset(largeNegativeKey);
      // A zero interval activates the fallback window.
      expect(ThrottleUtils.shouldRun(zeroKey, 0)).assertTrue();
      expect(ThrottleUtils.shouldRun(zeroKey, 0)).assertFalse();
      // A small negative interval activates the fallback window too.
      expect(ThrottleUtils.shouldRun(negativeKey, -1)).assertTrue();
      expect(ThrottleUtils.shouldRun(negativeKey, -1)).assertFalse();
      // A large negative interval behaves the same way.
      expect(ThrottleUtils.shouldRun(largeNegativeKey, -1000)).assertTrue();
      expect(ThrottleUtils.shouldRun(largeNegativeKey, -1000)).assertFalse();
      // Clean every key state at the end.
      ThrottleUtils.reset(zeroKey);
      ThrottleUtils.reset(negativeKey);
      ThrottleUtils.reset(largeNegativeKey);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0600
     * @tc.name      testThrMatrix0006
     * @tc.desc      Verify a maximal integer interval accepts the first call
     *               and suppresses the immediate second call deterministically.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThrMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testThrMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the huge interval check.
      const key: string = 'throttle-matrix-huge-interval';
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // The huge interval accepts the first call.
      expect(ThrottleUtils.shouldRun(key, 2147483647)).assertTrue();
      // No real elapsed time reaches the huge interval, so it drops.
      expect(ThrottleUtils.shouldRun(key, 2147483647)).assertFalse();
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0700
     * @tc.name      testThrMatrix0007
     * @tc.desc      Verify repeated reset calls reopen the window every time
     *               so a consumed key can run again without any wait.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThrMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the reset cycle check.
      const key: string = 'throttle-matrix-reset-cycle';
      // The first cycle consumes and reopens the window.
      ThrottleUtils.reset(key);
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      ThrottleUtils.reset(key);
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      // The second cycle repeats the same behaviour.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      ThrottleUtils.reset(key);
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertTrue();
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // The third reset leaves the key ready for later cases.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0800
     * @tc.name      testThrMatrix0008
     * @tc.desc      Verify throttle executes the first call synchronously,
     *               drops the immediate repeats and reopens after reset.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testThrMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the sync execution check.
      const key: string = 'throttle-matrix-throttle-sync';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // The first call runs synchronously.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(1);
      // The immediate repeats are dropped without touching the counter.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(1);
      // The reset reopens the window and the action runs again.
      ThrottleUtils.reset(key);
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(2);
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_0900
     * @tc.name      testThrMatrix0009
     * @tc.desc      Verify four immediate throttle calls execute exactly one
     *               action while the window stays consumed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testThrMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the counter hold check.
      const key: string = 'throttle-matrix-counter-hold';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Four immediate calls execute exactly one action.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(1);
      // The key stays consumed after the burst.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1000
     * @tc.name      testThrMatrix0010
     * @tc.desc      Verify three keys keep their throttle counters fully
     *               independent while the same action body is reused.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testThrMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use three dedicated keys for the counter isolation check.
      const keyA: string = 'throttle-matrix-counter-a';
      const keyB: string = 'throttle-matrix-counter-b';
      const keyC: string = 'throttle-matrix-counter-c';
      // Count the executed actions of each key.
      let countA: number = 0;
      let countB: number = 0;
      let countC: number = 0;
      // Actions that record one run of their own key.
      const runA: () => void = (): void => {
        countA = countA + 1;
      };
      const runB: () => void = (): void => {
        countB = countB + 1;
      };
      const runC: () => void = (): void => {
        countC = countC + 1;
      };
      // Start every key from a clean state.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
      ThrottleUtils.reset(keyC);
      // Every key runs its action once.
      ThrottleUtils.throttle(keyA, WINDOW_MS, runA);
      ThrottleUtils.throttle(keyB, WINDOW_MS, runB);
      ThrottleUtils.throttle(keyC, WINDOW_MS, runC);
      expect(countA).assertEqual(1);
      expect(countB).assertEqual(1);
      expect(countC).assertEqual(1);
      // The immediate repeats stay dropped on every key.
      ThrottleUtils.throttle(keyA, WINDOW_MS, runA);
      ThrottleUtils.throttle(keyB, WINDOW_MS, runB);
      ThrottleUtils.throttle(keyC, WINDOW_MS, runC);
      expect(countA).assertEqual(1);
      expect(countB).assertEqual(1);
      expect(countC).assertEqual(1);
      // Clean every key state at the end.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
      ThrottleUtils.reset(keyC);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1100
     * @tc.name      testThrMatrix0011
     * @tc.desc      Verify throttle consumes the shared window so a direct
     *               shouldRun check right after it reports the blocked state.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThrMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the linkage check.
      const key: string = 'throttle-matrix-linkage';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // The throttle call consumes the window and runs once.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(1);
      // The direct shouldRun check sees the consumed window.
      expect(ThrottleUtils.shouldRun(key, WINDOW_MS)).assertFalse();
      // A further throttle call is dropped as well.
      ThrottleUtils.throttle(key, WINDOW_MS, runAction);
      expect(counter).assertEqual(1);
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1200
     * @tc.name      testThrMatrix0012
     * @tc.desc      Verify three immediate debounce registrations leave the
     *               counters untouched because the quiet window is pending.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testThrMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the pending check.
      const key: string = 'throttle-matrix-debounce-pending';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Register three actions inside the same quiet window.
      ThrottleUtils.debounce(key, QUIET_MS, runAction);
      ThrottleUtils.debounce(key, QUIET_MS, runAction);
      ThrottleUtils.debounce(key, QUIET_MS, runAction);
      // Nothing has fired while the window is still pending.
      expect(counter).assertEqual(0);
      // Reset cancels the pending timer for later cases.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1300
     * @tc.name      testThrMatrix0013
     * @tc.desc      Verify five immediate debounce registrations execute only
     *               the fifth action once the quiet window expired.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testThrMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the burst check.
      const key: string = 'throttle-matrix-debounce-burst';
      // Count the executed actions.
      let counter: number = 0;
      // Remember the payload of the executed action.
      let payload: string = '';
      // Five actions that register their own payload.
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
      const fourthAction: () => void = (): void => {
        counter = counter + 1;
        payload = 'fourth';
      };
      const fifthAction: () => void = (): void => {
        counter = counter + 1;
        payload = 'fifth';
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Register five actions in a row inside one quiet window.
      ThrottleUtils.debounce(key, QUIET_MS, firstAction);
      ThrottleUtils.debounce(key, QUIET_MS, secondAction);
      ThrottleUtils.debounce(key, QUIET_MS, thirdAction);
      ThrottleUtils.debounce(key, QUIET_MS, fourthAction);
      ThrottleUtils.debounce(key, QUIET_MS, fifthAction);
      // Wait until the quiet window expired.
      await waitForMillis(FIRE_WAIT_MS);
      // Exactly one action ran and it is the last registered one.
      expect(counter).assertEqual(1);
      expect(payload).assertEqual('fifth');
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1400
     * @tc.name      testThrMatrix0014
     * @tc.desc      Verify a single debounce action stays pending inside the
     *               quiet window and fires exactly once afterwards.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testThrMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the fire check.
      const key: string = 'throttle-matrix-debounce-fire';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Register the action with a quiet window of eighty milliseconds.
      ThrottleUtils.debounce(key, QUIET_MS, runAction);
      // A short wait inside the window shows the action still pending.
      await waitForMillis(PENDING_WAIT_MS);
      expect(counter).assertEqual(0);
      // A wait past the window shows the action fired exactly once.
      await waitForMillis(FIRE_WAIT_MS);
      expect(counter).assertEqual(1);
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1500
     * @tc.name      testThrMatrix0015
     * @tc.desc      Verify two keys with pending debounce actions both fire
     *               exactly once because their timers never interfere.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testThrMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use two dedicated keys for the independence check.
      const keyA: string = 'throttle-matrix-debounce-a';
      const keyB: string = 'throttle-matrix-debounce-b';
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
      // Register one pending action on each key.
      ThrottleUtils.debounce(keyA, QUIET_MS, runA);
      ThrottleUtils.debounce(keyB, QUIET_MS, runB);
      // Wait until both quiet windows expired.
      await waitForMillis(FIRE_WAIT_MS);
      // Both actions fired exactly once.
      expect(countA).assertEqual(1);
      expect(countB).assertEqual(1);
      // Clean both key states at the end.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1600
     * @tc.name      testThrMatrix0016
     * @tc.desc      Verify a zero debounce delay falls back to the default
     *               window: the action stays pending midway and fires once
     *               the fallback window expired.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThrMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testThrMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the zero delay check.
      const key: string = 'throttle-matrix-delay-zero';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Register the action with a zero delay that maps to the fallback.
      ThrottleUtils.debounce(key, 0, runAction);
      // A wait inside the fallback window keeps the action pending.
      await waitForMillis(FALLBACK_WAIT_MS);
      expect(counter).assertEqual(0);
      // A wait past the fallback window lets the action fire once.
      await waitForMillis(FALLBACK_FIRE_WAIT_MS);
      expect(counter).assertEqual(1);
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1700
     * @tc.name      testThrMatrix0017
     * @tc.desc      Verify a negative debounce delay falls back to the same
     *               default window and fires the action exactly once.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThrMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testThrMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the negative delay check.
      const key: string = 'throttle-matrix-delay-negative';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state.
      ThrottleUtils.reset(key);
      // Register the action with a negative delay that maps to the fallback.
      ThrottleUtils.debounce(key, -50, runAction);
      // Wait past the fallback window.
      await waitForMillis(FALLBACK_FIRE_WAIT_MS);
      // The action fired exactly once.
      expect(counter).assertEqual(1);
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1800
     * @tc.name      testThrMatrix0018
     * @tc.desc      Verify reset cancels a pending debounce action so it
     *               never fires even after its window has elapsed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testThrMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the cancel check.
      const key: string = 'throttle-matrix-debounce-cancel';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Start from a clean state and register the pending action.
      ThrottleUtils.reset(key);
      ThrottleUtils.debounce(key, QUIET_MS, runAction);
      // Reset cancels the pending timer immediately.
      ThrottleUtils.reset(key);
      // Wait well past the quiet window.
      await waitForMillis(FIRE_WAIT_MS);
      // The cancelled action never fired.
      expect(counter).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_1900
     * @tc.name      testThrMatrix0019
     * @tc.desc      Verify clearAll cancels the pending debounce actions of
     *               two keys at once so neither action ever fires.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testThrMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use two dedicated keys for the global cancel check.
      const keyA: string = 'throttle-matrix-clear-a';
      const keyB: string = 'throttle-matrix-clear-b';
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
      // Register one pending action on each key.
      ThrottleUtils.debounce(keyA, QUIET_MS, runA);
      ThrottleUtils.debounce(keyB, QUIET_MS, runB);
      // Clear the state of every key at once.
      ThrottleUtils.clearAll();
      // Wait well past both quiet windows.
      await waitForMillis(FIRE_WAIT_MS);
      // Neither pending action fired.
      expect(countA).assertEqual(0);
      expect(countB).assertEqual(0);
      // Clean both key states at the end.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_2000
     * @tc.name      testThrMatrix0020
     * @tc.desc      Verify clearAll drops every remembered run time so two
     *               consumed keys accept their next call immediately.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThrMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThrMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use two dedicated keys for the restore check.
      const keyA: string = 'throttle-matrix-restore-a';
      const keyB: string = 'throttle-matrix-restore-b';
      // Start both keys from a clean state.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
      // Consume both windows.
      expect(ThrottleUtils.shouldRun(keyA, WINDOW_MS)).assertTrue();
      expect(ThrottleUtils.shouldRun(keyB, WINDOW_MS)).assertTrue();
      // Both keys are blocked right after their consumption.
      expect(ThrottleUtils.shouldRun(keyA, WINDOW_MS)).assertFalse();
      expect(ThrottleUtils.shouldRun(keyB, WINDOW_MS)).assertFalse();
      // Clear the state of every key at once.
      ThrottleUtils.clearAll();
      // Both keys accept their next call immediately.
      expect(ThrottleUtils.shouldRun(keyA, WINDOW_MS)).assertTrue();
      expect(ThrottleUtils.shouldRun(keyB, WINDOW_MS)).assertTrue();
      // Clean both key states at the end.
      ThrottleUtils.reset(keyA);
      ThrottleUtils.reset(keyB);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_2100
     * @tc.name      testThrMatrix0021
     * @tc.desc      Verify shouldRun recovers after a sixty millisecond
     *               window elapsed and refreshes the window on recovery.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testThrMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testThrMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the recovery check.
      const key: string = 'throttle-matrix-recovery';
      // Start from a clean state and consume the small window.
      ThrottleUtils.reset(key);
      expect(ThrottleUtils.shouldRun(key, 60)).assertTrue();
      expect(ThrottleUtils.shouldRun(key, 60)).assertFalse();
      // Wait past the small window.
      await waitForMillis(FIRE_WAIT_MS);
      // The window elapsed so the key is allowed again.
      expect(ThrottleUtils.shouldRun(key, 60)).assertTrue();
      // The recovered call refreshed the window reference.
      expect(ThrottleUtils.shouldRun(key, 60)).assertFalse();
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_THRMAT_2200
     * @tc.name      testThrMatrix0022
     * @tc.desc      Verify a debounce action registered after clearAll fires
     *               normally once its own quiet window expired.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testThrMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testThrMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Use a dedicated key for the reregister check.
      const key: string = 'throttle-matrix-reregister';
      // Count the executed actions.
      let counter: number = 0;
      // Action that records one run.
      const runAction: () => void = (): void => {
        counter = counter + 1;
      };
      // Clear the global state first.
      ThrottleUtils.clearAll();
      // Register a fresh action after the global clear.
      ThrottleUtils.debounce(key, QUIET_MS, runAction);
      // Wait until the quiet window expired.
      await waitForMillis(FIRE_WAIT_MS);
      // The fresh action fired exactly once.
      expect(counter).assertEqual(1);
      // Clean the key state at the end.
      ThrottleUtils.reset(key);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
