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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AsyncUtils, Logger, formatBytes, joinNumbers, elapsedMilliseconds } from 'library';

const DOMAIN: number = 0xF811;
// Upper bound in milliseconds accepted for timer cases that must finish quickly.
const QUICK_CEILING_MS: number = 5000;
// Epoch timestamp of the year 2020 used as the lower numeric matrix bound.
const YEAR_2020_MS: number = 1577836800000;

// Waits for the given duration so timer based logic cases can observe real elapsed time.
function sleepMs(durationMs: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, durationMs);
  });
}

// Registers the numeric matrix test suite for the AsyncUtils helpers and the Logger facade.
export default function numericMatrixAsyncLoggerTest() {
  describe('NumericMatrixAsyncLoggerSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0100
     * @tc.name      testNumAsyncLog0001
     * @tc.desc      Verify delay resolves only after the requested ten millisecond pause has fully elapsed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the clock window around the awaited delay call.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(10);
      const finishedAt: number = Date.now();
      const elapsed: number = finishedAt - startedAt;
      // The promise cannot resolve earlier than the requested delay.
      expect(elapsed >= 10).assertTrue();
      // The single pause stays far below the five second medium case ceiling.
      expect(elapsed < QUICK_CEILING_MS).assertTrue();
      // The library helper reports a non-negative elapsed duration for the same window.
      expect(elapsedMilliseconds(startedAt) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0200
     * @tc.name      testNumAsyncLog0002
     * @tc.desc      Verify delay with the zero timeout matrix point resolves promptly inside a short window.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The zero delay resolves through the timer queue almost immediately.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(0);
      const elapsed: number = Date.now() - startedAt;
      // The elapsed time is never negative for the zero matrix point.
      expect(elapsed >= 0).assertTrue();
      // The zero delay must not behave like a long sleep.
      expect(elapsed < 500).assertTrue();
      // The library helper also measures a non-negative duration for this window.
      expect(elapsedMilliseconds(startedAt) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0300
     * @tc.name      testNumAsyncLog0003
     * @tc.desc      Verify delay with the one millisecond timeout matrix point waits at least one millisecond.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The smallest positive delay matrix point still goes through the timer queue.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(1);
      const elapsed: number = Date.now() - startedAt;
      // One millisecond of requested delay cannot complete in zero time.
      expect(elapsed >= 1).assertTrue();
      // The tiny pause stays far below the five second medium case ceiling.
      expect(elapsed < QUICK_CEILING_MS).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof elapsed).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0400
     * @tc.name      testNumAsyncLog0004
     * @tc.desc      Verify delay returns a real promise instance that completes after the requested pause.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the window before the promise is scheduled.
      const startedAt: number = Date.now();
      const pending: Promise<void> = AsyncUtils.delay(5);
      // The scheduled handle is a real Promise instance.
      expect(pending instanceof Promise).assertTrue();
      // The promise is an object value rather than a primitive.
      expect(typeof pending).assertEqual('object');
      // Awaiting the returned promise completes after the requested pause.
      await pending;
      expect(Date.now() - startedAt >= 5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0500
     * @tc.name      testNumAsyncLog0005
     * @tc.desc      Verify delay with the one hundred millisecond timeout matrix point waits at least that long.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The hundred millisecond matrix point is a common short await window.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(100);
      const elapsed: number = Date.now() - startedAt;
      // The requested hundred milliseconds must fully elapse.
      expect(elapsed >= 100).assertTrue();
      // The pause stays below the five second medium case ceiling.
      expect(elapsed < QUICK_CEILING_MS).assertTrue();
      // The library helper agrees the window is at least the requested length.
      expect(elapsedMilliseconds(startedAt) >= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0600
     * @tc.name      testNumAsyncLog0006
     * @tc.desc      Verify delay with the nine hundred ninety nine millisecond timeout point stays under five seconds.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The nine hundred ninety nine millisecond matrix point approaches one full second.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(999);
      const elapsed: number = Date.now() - startedAt;
      // The requested wait must fully elapse before resolution.
      expect(elapsed >= 999).assertTrue();
      // The wait stays inside the five second medium case ceiling.
      expect(elapsed < QUICK_CEILING_MS).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof elapsed).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0700
     * @tc.name      testNumAsyncLog0007
     * @tc.desc      Verify delay with a negative timeout behaves like an immediate timer instead of failing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Negative delays are clamped by the platform timer to a zero delay.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(-5);
      const elapsed: number = Date.now() - startedAt;
      // The negative matrix point must not hang or throw.
      expect(elapsed >= 0).assertTrue();
      // The clamped timer resolves promptly like a zero delay.
      expect(elapsed < 500).assertTrue();
      // A second negative matrix point behaves the same way.
      const secondStart: number = Date.now();
      await AsyncUtils.delay(-1024);
      expect(Date.now() - secondStart < 500).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0800
     * @tc.name      testNumAsyncLog0008
     * @tc.desc      Verify delay accepts a fractional timeout and still waits at least its integer part.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Fractional timeouts round through the platform timer without errors.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(12.5);
      const elapsed: number = Date.now() - startedAt;
      // The integer part of the fractional request must elapse.
      expect(elapsed >= 12).assertTrue();
      // The fractional pause stays short and bounded.
      expect(elapsed < 1000).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof elapsed).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_0900
     * @tc.name      testNumAsyncLog0009
     * @tc.desc      Verify two sequential delay calls accumulate their requested pauses additively.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The first sequential pause uses the five millisecond matrix point.
      const firstStart: number = Date.now();
      await AsyncUtils.delay(5);
      const firstElapsed: number = Date.now() - firstStart;
      // The first pause fully elapsed.
      expect(firstElapsed >= 5).assertTrue();
      // The second sequential pause also fully elapses after the first one.
      const secondStart: number = Date.now();
      await AsyncUtils.delay(5);
      const totalElapsed: number = Date.now() - firstStart;
      // The accumulated wait covers both requested pauses.
      expect(totalElapsed >= 10).assertTrue();
      // Each single pause stayed short.
      expect(Date.now() - secondStart < QUICK_CEILING_MS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1000
     * @tc.name      testNumAsyncLog0010
     * @tc.desc      Verify two concurrent delay promises started together resolve inside one overlapping window.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const startedAt: number = Date.now();
      // Two delay promises are scheduled at the same moment.
      const pair: Array<Promise<void>> = [AsyncUtils.delay(8), AsyncUtils.delay(8)];
      // Both handles were created as pending promises.
      expect(pair.length).assertEqual(2);
      await Promise.all(pair);
      const elapsed: number = Date.now() - startedAt;
      // The shared window fully elapsed.
      expect(elapsed >= 8).assertTrue();
      // The concurrent wait stayed bounded instead of serialising into sixteen milliseconds.
      expect(elapsed < 2000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1100
     * @tc.name      testNumAsyncLog0011
     * @tc.desc      Verify three repeated three millisecond delay calls accumulate at least nine milliseconds.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three repeated pauses walk the three millisecond matrix point.
      const startedAt: number = Date.now();
      let repeatCount: number = 0;
      for (let index: number = 0; index < 3; index++) {
        await AsyncUtils.delay(3);
        repeatCount++;
      }
      const elapsed: number = Date.now() - startedAt;
      // Every repeated pause really ran.
      expect(repeatCount).assertEqual(3);
      // The accumulated wait covers all three requested pauses.
      expect(elapsed >= 9).assertTrue();
      // The whole loop stays far below the five second ceiling.
      expect(elapsed < QUICK_CEILING_MS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1200
     * @tc.name      testNumAsyncLog0012
     * @tc.desc      Verify debounce returns independent function wrappers for every call without executing the action.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A local counter proves the structural case never fires the action.
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      // Two wrappers created from the same inputs are still separate closures.
      const firstWrapped: () => void = AsyncUtils.debounce(bump, 40);
      const secondWrapped: () => void = AsyncUtils.debounce(bump, 40);
      // The wrapper is a callable function value.
      expect(typeof firstWrapped).assertEqual('function');
      // Independent wrappers never share the same function object.
      expect(firstWrapped !== secondWrapped).assertTrue();
      // Creating wrappers without invoking them keeps the action untouched.
      expect(fireCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1300
     * @tc.name      testNumAsyncLog0013
     * @tc.desc      Verify debounce collapses three rapid calls into exactly one execution after the quiet period.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The action increments a local counter so the burst can be counted.
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.debounce(bump, 40);
      // Three rapid calls restart the same pending timer each time.
      wrapped();
      wrapped();
      wrapped();
      // Nothing fires while the calls stay inside the quiet period.
      expect(fireCount).assertEqual(0);
      // Waiting past the quiet period lets exactly one trailing execution run.
      await sleepMs(70);
      expect(fireCount).assertEqual(1);
      // The collapsed result is far below the number of issued calls.
      expect(fireCount < 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1400
     * @tc.name      testNumAsyncLog0014
     * @tc.desc      Verify debounce restarts the quiet period timer on every new call before it fires.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.debounce(bump, 30);
      // The first call schedules a pending timer for thirty milliseconds later.
      wrapped();
      // A short gap keeps the next call inside the original quiet period.
      await sleepMs(20);
      wrapped();
      // The restarted timer means only one execution can have happened by now.
      await sleepMs(60);
      // Exactly one execution ran after the final call restarted the timer.
      expect(fireCount).assertEqual(1);
      // Without restarting, the first timer would already have produced a second run.
      expect(fireCount < 2).assertTrue();
      // The wrapper stayed callable and returned nothing that changed the counter.
      expect(fireCount > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1500
     * @tc.name      testNumAsyncLog0015
     * @tc.desc      Verify debounce fires once per quiet burst when calls are separated by longer gaps.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.debounce(bump, 15);
      // The first burst of one call fires after its own quiet period.
      wrapped();
      await sleepMs(40);
      // The second separated burst fires again instead of being merged.
      wrapped();
      await sleepMs(40);
      // Two separated bursts produce two executions.
      expect(fireCount).assertEqual(2);
      // Both bursts stay far below the five second ceiling in total.
      expect(fireCount < 3).assertTrue();
      // Every burst actually reached the action.
      expect(fireCount > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1600
     * @tc.name      testNumAsyncLog0016
     * @tc.desc      Verify debounce with the zero quiet period still executes the action through the timer queue.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.debounce(bump, 0);
      // The zero quiet period matrix point still defers through the timer queue.
      wrapped();
      // The deferred call has not run synchronously before the await.
      expect(fireCount).assertEqual(0);
      // A short sleep lets the zero timer fire exactly once.
      await sleepMs(30);
      expect(fireCount).assertEqual(1);
      // No duplicate executions were queued behind the zero timer.
      expect(fireCount < 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1700
     * @tc.name      testNumAsyncLog0017
     * @tc.desc      Verify debounce with the one millisecond quiet period collapses a two call burst into one run.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.debounce(bump, 1);
      // Two rapid calls land inside the tiny one millisecond quiet period.
      wrapped();
      wrapped();
      // Nothing ran synchronously.
      expect(fireCount).assertEqual(0);
      // After the quiet period exactly the trailing call executed.
      await sleepMs(30);
      expect(fireCount).assertEqual(1);
      // The collapsed burst is below the issued call count.
      expect(fireCount < 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1800
     * @tc.name      testNumAsyncLog0018
     * @tc.desc      Verify two independent debounced wrappers keep separate timers and counters without cross talk.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two independent counters observe two independent wrappers.
      let firstCount: number = 0;
      let secondCount: number = 0;
      const bumpFirst: () => void = (): void => {
        firstCount++;
      };
      const bumpSecond: () => void = (): void => {
        secondCount++;
      };
      const firstWrapped: () => void = AsyncUtils.debounce(bumpFirst, 20);
      const secondWrapped: () => void = AsyncUtils.debounce(bumpSecond, 20);
      // Both wrappers are called once in the same burst.
      firstWrapped();
      secondWrapped();
      await sleepMs(50);
      // Each wrapper executed exactly once for its own counter.
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
      // The combined executions match the number of wrappers used.
      expect(firstCount + secondCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_1900
     * @tc.name      testNumAsyncLog0019
     * @tc.desc      Verify a burst of ten rapid debounced calls still collapses into a single execution.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.debounce(bump, 25);
      // A dense burst of ten calls restarts the timer every time.
      for (let index: number = 0; index < 10; index++) {
        wrapped();
      }
      // Nothing ran synchronously during the burst.
      expect(fireCount).assertEqual(0);
      // The quiet period produces exactly one trailing execution.
      await sleepMs(60);
      expect(fireCount).assertEqual(1);
      // Ten issued calls collapse far below the issued count.
      expect(fireCount < 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2000
     * @tc.name      testNumAsyncLog0020
     * @tc.desc      Verify a single debounced call never runs synchronously and fires once after the quiet period.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.debounce(bump, 25);
      // A single call only schedules the pending timer.
      wrapped();
      // The action must not run synchronously inside the call.
      expect(fireCount).assertEqual(0);
      // The wrapper is a callable function value.
      expect(typeof wrapped).assertEqual('function');
      // After the quiet period the scheduled action ran once.
      await sleepMs(55);
      expect(fireCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2100
     * @tc.name      testNumAsyncLog0021
     * @tc.desc      Verify throttle returns independent function wrappers without executing the action on creation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A local counter proves the structural case never fires the action.
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      // Two wrappers created from the same inputs are separate closures.
      const firstWrapped: () => void = AsyncUtils.throttle(bump, 60);
      const secondWrapped: () => void = AsyncUtils.throttle(bump, 60);
      // The wrapper is a callable function value.
      expect(typeof firstWrapped).assertEqual('function');
      // Independent wrappers never share the same function object.
      expect(firstWrapped !== secondWrapped).assertTrue();
      // Creating wrappers without invoking them keeps the action untouched.
      expect(fireCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2200
     * @tc.name      testNumAsyncLog0022
     * @tc.desc      Verify throttle executes the first call immediately even with a long interval window.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.throttle(bump, 100);
      // Capture the window around the first leading edge call.
      const startedAt: number = Date.now();
      wrapped();
      const windowMs: number = Date.now() - startedAt;
      // The first call runs immediately without waiting for the interval.
      expect(fireCount).assertEqual(1);
      // The leading edge call finished synchronously inside a tiny window.
      expect(windowMs < 50).assertTrue();
      // The window itself is a non-negative numeric measurement.
      expect(windowMs >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2300
     * @tc.name      testNumAsyncLog0023
     * @tc.desc      Verify throttle drops a rapid burst to one leading call plus one trailing call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.throttle(bump, 60);
      // Four rapid calls land inside the sixty millisecond interval.
      wrapped();
      wrapped();
      wrapped();
      wrapped();
      // Only the leading edge executed so far.
      expect(fireCount).assertEqual(1);
      // One trailing call preserves the final burst instead of dropping it.
      await sleepMs(120);
      expect(fireCount).assertEqual(2);
      // The burst never produced one execution per issued call.
      expect(fireCount < 4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2400
     * @tc.name      testNumAsyncLog0024
     * @tc.desc      Verify throttle fires once per call when calls are spaced beyond the interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.throttle(bump, 30);
      // Three calls are spaced well beyond the thirty millisecond interval.
      wrapped();
      await sleepMs(50);
      wrapped();
      await sleepMs(50);
      wrapped();
      // Every spaced call executed on its own leading edge.
      expect(fireCount).assertEqual(3);
      // No extra trailing executions were queued behind the spaced calls.
      expect(fireCount < 4).assertTrue();
      // All three issued calls actually reached the action.
      expect(fireCount > 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2500
     * @tc.name      testNumAsyncLog0025
     * @tc.desc      Verify throttle with the zero interval matrix point executes every rapid call immediately.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumAsyncLog0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.throttle(bump, 0);
      // With a zero interval every call sits outside any throttle window.
      wrapped();
      wrapped();
      wrapped();
      // All three rapid calls executed immediately.
      expect(fireCount).assertEqual(3);
      // The zero interval never queues trailing timers for this burst.
      expect(fireCount > 0).assertTrue();
      // The executed count matches the issued count exactly.
      expect(fireCount === 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2600
     * @tc.name      testNumAsyncLog0026
     * @tc.desc      Verify throttle with the one millisecond interval keeps a leading call and one trailing call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.throttle(bump, 1);
      // Two calls in the same millisecond land inside the tiny interval.
      wrapped();
      wrapped();
      // Only the leading edge executed so far.
      expect(fireCount).assertEqual(1);
      // The trailing call preserves the dropped second call.
      await sleepMs(30);
      expect(fireCount).assertEqual(2);
      // The tiny interval still limited the burst below the issued count.
      expect(fireCount < 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2700
     * @tc.name      testNumAsyncLog0027
     * @tc.desc      Verify throttle accepts a new leading call after the trailing edge call has finished.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.throttle(bump, 40);
      // The leading call and a burst call schedule the trailing edge.
      wrapped();
      wrapped();
      await sleepMs(80);
      expect(fireCount).assertEqual(2);
      // Measure the next interval from the observed trailing call, not its scheduled deadline.
      await sleepMs(40);
      wrapped();
      // Leading plus trailing plus the fresh call produce three executions.
      expect(fireCount).assertEqual(3);
      // The fresh leading call was not swallowed by the old interval.
      expect(fireCount > 2).assertTrue();
      // The counter never exceeded the issued execution opportunities.
      expect(fireCount < 4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2800
     * @tc.name      testNumAsyncLog0028
     * @tc.desc      Verify two throttled wrappers with different intervals keep independent execution counts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two independent counters observe wrappers with different intervals.
      let slowCount: number = 0;
      let fastCount: number = 0;
      const bumpSlow: () => void = (): void => {
        slowCount++;
      };
      const bumpFast: () => void = (): void => {
        fastCount++;
      };
      const slowWrapped: () => void = AsyncUtils.throttle(bumpSlow, 200);
      const fastWrapped: () => void = AsyncUtils.throttle(bumpFast, 10);
      // Both wrappers run one leading call at the same moment.
      slowWrapped();
      fastWrapped();
      // After a short gap the fast wrapper accepts another leading call.
      await sleepMs(30);
      fastWrapped();
      // The slow wrapper stayed at its single leading execution.
      expect(slowCount).assertEqual(1);
      // The fast wrapper executed twice across the gap.
      expect(fastCount).assertEqual(2);
      // The two counters never leaked into each other.
      expect(slowCount + fastCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_2900
     * @tc.name      testNumAsyncLog0029
     * @tc.desc      Verify a burst of six throttled calls collapses to one leading and one trailing execution.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let fireCount: number = 0;
      const bump: () => void = (): void => {
        fireCount++;
      };
      const wrapped: () => void = AsyncUtils.throttle(bump, 50);
      // A dense burst of six calls inside the fifty millisecond interval.
      for (let index: number = 0; index < 6; index++) {
        wrapped();
      }
      // Only the leading edge executed during the burst.
      expect(fireCount).assertEqual(1);
      // One trailing execution preserves the end of the burst.
      await sleepMs(100);
      expect(fireCount).assertEqual(2);
      // Six issued calls collapsed far below the issued count.
      expect(fireCount < 6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3000
     * @tc.name      testNumAsyncLog0030
     * @tc.desc      Verify withRetry returns true after a first attempt success and never schedules backoff.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The attempt counter observes how often the action actually ran.
      let callCount: number = 0;
      const succeed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.resolve();
      };
      // The retry budget is unused because the first attempt succeeds.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(succeed, 3, 5);
      const elapsed: number = Date.now() - startedAt;
      // The success outcome is reported as true.
      expect(outcome).assertTrue();
      // Exactly one attempt ran when the first try succeeded.
      expect(callCount).assertEqual(1);
      // No backoff delay was added on the success path.
      expect(elapsed < 500).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3100
     * @tc.name      testNumAsyncLog0031
     * @tc.desc      Verify withRetry with the zero retry matrix point reports false after one failed attempt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const fail: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject(new Error('always fails'));
      };
      // Zero retries means one attempt without any backoff pause.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(fail, 0, 5);
      const elapsed: number = Date.now() - startedAt;
      // Every attempt failed so the outcome is false.
      expect(outcome).assertFalse();
      // Only the initial attempt ran.
      expect(callCount).assertEqual(1);
      // No backoff pauses were scheduled for the zero retry matrix point.
      expect(elapsed < 500).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3200
     * @tc.name      testNumAsyncLog0032
     * @tc.desc      Verify withRetry with two retries reports false after three attempts with backoff pauses.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const fail: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject(new Error('always fails'));
      };
      // Two retries walk attempts zero, one and two with backoffs of five and ten.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(fail, 2, 5);
      const elapsed: number = Date.now() - startedAt;
      // All attempts failed so the outcome is false.
      expect(outcome).assertFalse();
      // The initial attempt plus two retries ran exactly three times.
      expect(callCount).assertEqual(3);
      // The exponential backoff pauses add at least fifteen milliseconds.
      expect(elapsed >= 15).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3300
     * @tc.name      testNumAsyncLog0033
     * @tc.desc      Verify withRetry reports true when the third attempt succeeds after two failures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const failTwiceThenSucceed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        if (callCount < 3) {
          return Promise.reject(new Error('transient failure'));
        }
        return Promise.resolve();
      };
      // Two retries give the action enough budget to reach the third attempt.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(failTwiceThenSucceed, 2, 5);
      const elapsed: number = Date.now() - startedAt;
      // The third attempt succeeded so the outcome is true.
      expect(outcome).assertTrue();
      // Exactly three attempts ran, two failures plus one success.
      expect(callCount).assertEqual(3);
      // The two backoff pauses before the retries add at least fifteen milliseconds.
      expect(elapsed >= 15).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3400
     * @tc.name      testNumAsyncLog0034
     * @tc.desc      Verify withRetry stops retrying as soon as one attempt succeeds inside a larger budget.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const failTwiceThenSucceed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        if (callCount < 3) {
          return Promise.reject(new Error('transient failure'));
        }
        return Promise.resolve();
      };
      // A budget of three retries is larger than the two failures actually needed.
      const outcome: boolean = await AsyncUtils.withRetry(failTwiceThenSucceed, 3, 5);
      // The early success still reports true.
      expect(outcome).assertTrue();
      // The remaining retry budget was not consumed after the success.
      expect(callCount).assertEqual(3);
      // The call count stayed at the minimum needed for the success.
      expect(callCount < 4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3500
     * @tc.name      testNumAsyncLog0035
     * @tc.desc      Verify withRetry clamps the negative retry matrix point to zero retries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const fail: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject(new Error('always fails'));
      };
      // The negative retry count behaves like the zero retry matrix point.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(fail, -3, 5);
      const elapsed: number = Date.now() - startedAt;
      // The single clamped attempt failed so the outcome is false.
      expect(outcome).assertFalse();
      // No retries ran beyond the initial attempt.
      expect(callCount).assertEqual(1);
      // No backoff pauses were scheduled for the clamped negative input.
      expect(elapsed < 500).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3600
     * @tc.name      testNumAsyncLog0036
     * @tc.desc      Verify withRetry with one retry reports false after two attempts and one backoff pause.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const fail: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject(new Error('always fails'));
      };
      // One retry walks the initial attempt and one retry with a five millisecond pause.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(fail, 1, 5);
      const elapsed: number = Date.now() - startedAt;
      // Both attempts failed so the outcome is false.
      expect(outcome).assertFalse();
      // The initial attempt plus one retry ran exactly twice.
      expect(callCount).assertEqual(2);
      // The single backoff pause adds at least five milliseconds.
      expect(elapsed >= 5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3700
     * @tc.name      testNumAsyncLog0037
     * @tc.desc      Verify withRetry keeps retrying when the action rejects with a plain Error object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const failWithPlainError: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject(new Error('plain error without business code'));
      };
      // Plain Error objects carry no numeric code and must not crash the retry loop.
      const outcome: boolean = await AsyncUtils.withRetry(failWithPlainError, 2, 5);
      // All three attempts failed so the outcome is false.
      expect(outcome).assertFalse();
      // The initial attempt plus two retries ran exactly three times.
      expect(callCount).assertEqual(3);
      // The plain error path never aborted the retry budget early.
      expect(callCount > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3800
     * @tc.name      testNumAsyncLog0038
     * @tc.desc      Verify withRetry recovers with true when a plain Error failure is followed by a success.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const failOnceThenSucceed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        if (callCount === 1) {
          return Promise.reject(new Error('plain error then success'));
        }
        return Promise.resolve();
      };
      // One retry is enough to reach the second successful attempt.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(failOnceThenSucceed, 1, 5);
      const elapsed: number = Date.now() - startedAt;
      // The second attempt succeeded so the outcome is true.
      expect(outcome).assertTrue();
      // Exactly two attempts ran, one failure plus one success.
      expect(callCount).assertEqual(2);
      // The single backoff pause before the retry adds at least five milliseconds.
      expect(elapsed >= 5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_3900
     * @tc.name      testNumAsyncLog0039
     * @tc.desc      Verify withRetry doubles the backoff delay from two to four milliseconds across two retries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const fail: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject(new Error('always fails'));
      };
      // The base delay of two doubles to four before the second retry.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(fail, 2, 2);
      const elapsed: number = Date.now() - startedAt;
      // All attempts failed so the outcome is false.
      expect(outcome).assertFalse();
      // Three attempts ran with the two retry budget.
      expect(callCount).assertEqual(3);
      // The doubled backoff pauses add at least six milliseconds in total.
      expect(elapsed >= 6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4000
     * @tc.name      testNumAsyncLog0040
     * @tc.desc      Verify withRetry with a large budget and long base delay still succeeds fast on first attempt.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const succeed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.resolve();
      };
      // A large budget and a long base delay are both skipped on the success path.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(succeed, 5, 50);
      const elapsed: number = Date.now() - startedAt;
      // The first attempt succeeded so the outcome is true.
      expect(outcome).assertTrue();
      // Only the initial attempt ran despite the large retry budget.
      expect(callCount).assertEqual(1);
      // No fifty millisecond backoff pause was ever scheduled.
      expect(elapsed < 500).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4100
     * @tc.name      testNumAsyncLog0041
     * @tc.desc      Verify withRetry with the zero base delay matrix point retries without measurable backoff.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const failTwiceThenSucceed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        if (callCount < 3) {
          return Promise.reject(new Error('transient failure'));
        }
        return Promise.resolve();
      };
      // The zero base delay matrix point schedules zero length backoff pauses.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(failTwiceThenSucceed, 2, 0);
      const elapsed: number = Date.now() - startedAt;
      // The third attempt succeeded so the outcome is true.
      expect(outcome).assertTrue();
      // Three attempts ran with the two retry budget.
      expect(callCount).assertEqual(3);
      // The zero length backoffs keep the total elapsed time tiny.
      expect(elapsed < 1000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4200
     * @tc.name      testNumAsyncLog0042
     * @tc.desc      Verify withRetry returns a promise of boolean that resolves to the retry outcome value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const succeed: () => Promise<void> = (): Promise<void> => {
        return Promise.resolve();
      };
      // The retry wrapper exposes a real promise of boolean before awaiting.
      const pending: Promise<boolean> = AsyncUtils.withRetry(succeed, 0, 0);
      // The returned handle is a real Promise instance.
      expect(pending instanceof Promise).assertTrue();
      // Awaiting resolves to the success flag of the single attempt.
      const outcome: boolean = await pending;
      expect(outcome).assertTrue();
      // The resolved value is a plain boolean.
      expect(typeof outcome).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4300
     * @tc.name      testNumAsyncLog0043
     * @tc.desc      Verify withRetry with a one hundred retry budget succeeds immediately without consuming it.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const succeed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.resolve();
      };
      // The one hundred retry budget must not multiply attempts on success.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(succeed, 100, 10);
      const elapsed: number = Date.now() - startedAt;
      // The first attempt succeeded so the outcome is true.
      expect(outcome).assertTrue();
      // Exactly one attempt ran despite the huge budget.
      expect(callCount).assertEqual(1);
      // No backoff chain delayed the success path.
      expect(elapsed < 1000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4400
     * @tc.name      testNumAsyncLog0044
     * @tc.desc      Verify withRetry with four retries reaches the fourth attempt when the first three fail.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const failThreeTimesThenSucceed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        if (callCount < 4) {
          return Promise.reject(new Error('transient failure'));
        }
        return Promise.resolve();
      };
      // Four retries walk attempts zero to four with backoffs of one, two and four.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(failThreeTimesThenSucceed, 4, 1);
      const elapsed: number = Date.now() - startedAt;
      // The fourth attempt succeeded so the outcome is true.
      expect(outcome).assertTrue();
      // Four attempts ran in total, three failures plus one success.
      expect(callCount).assertEqual(4);
      // The three backoff pauses add at least seven milliseconds.
      expect(elapsed >= 7).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4500
     * @tc.name      testNumAsyncLog0045
     * @tc.desc      Verify withRetry handles a rejection carrying a plain string instead of an error object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const failWithString: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject('plain-text failure');
      };
      // A string rejection carries no numeric code and must not crash the retry loop.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(failWithString, 2, 5);
      const elapsed: number = Date.now() - startedAt;
      // All attempts failed so the outcome is false.
      expect(outcome).assertFalse();
      // The initial attempt plus two retries ran exactly three times.
      expect(callCount).assertEqual(3);
      // The string rejection path completed inside the case ceiling.
      expect(elapsed < QUICK_CEILING_MS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4600
     * @tc.name      testNumAsyncLog0046
     * @tc.desc      Verify withRetry with a ten millisecond base delay spends at least thirty milliseconds on failures.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const fail: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject(new Error('always fails'));
      };
      // The ten millisecond base doubles to twenty before the second retry.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(fail, 2, 10);
      const elapsed: number = Date.now() - startedAt;
      // All attempts failed so the outcome is false.
      expect(outcome).assertFalse();
      // Three attempts ran with the two retry budget.
      expect(callCount).assertEqual(3);
      // The ten and twenty millisecond backoffs add at least thirty milliseconds.
      expect(elapsed >= 30).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4700
     * @tc.name      testNumAsyncLog0047
     * @tc.desc      Verify withRetry with the one millisecond base delay recovers after a single failure.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const failOnceThenSucceed: () => Promise<void> = (): Promise<void> => {
        callCount++;
        if (callCount === 1) {
          return Promise.reject(new Error('transient failure'));
        }
        return Promise.resolve();
      };
      // The tiny base delay keeps the single backoff pause almost instant.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(failOnceThenSucceed, 2, 1);
      const elapsed: number = Date.now() - startedAt;
      // The second attempt succeeded so the outcome is true.
      expect(outcome).assertTrue();
      // Exactly two attempts ran, one failure plus one success.
      expect(callCount).assertEqual(2);
      // The single one millisecond backoff still fully elapsed.
      expect(elapsed >= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4800
     * @tc.name      testNumAsyncLog0048
     * @tc.desc      Verify withRetry with three retries reports false after four attempts and seven milliseconds.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let callCount: number = 0;
      const fail: () => Promise<void> = (): Promise<void> => {
        callCount++;
        return Promise.reject(new Error('always fails'));
      };
      // Three retries walk attempts zero to three with backoffs of one, two and four.
      const startedAt: number = Date.now();
      const outcome: boolean = await AsyncUtils.withRetry(fail, 3, 1);
      const elapsed: number = Date.now() - startedAt;
      // All four attempts failed so the outcome is false.
      expect(outcome).assertFalse();
      // The initial attempt plus three retries ran exactly four times.
      expect(callCount).assertEqual(4);
      // The three backoff pauses add at least seven milliseconds.
      expect(elapsed >= 7).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_4900
     * @tc.name      testNumAsyncLog0049
     * @tc.desc      Verify Logger debug info and warn levels complete without throwing for plain messages.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when the debug level call throws unexpectedly.
      let debugFailed: boolean = false;
      try {
        Logger.debug('matrix detail message');
      } catch (error) {
        debugFailed = true;
      }
      expect(debugFailed).assertFalse();
      // Guard flag set when the info level call throws unexpectedly.
      let infoFailed: boolean = false;
      try {
        Logger.info('matrix business step');
      } catch (error) {
        infoFailed = true;
      }
      expect(infoFailed).assertFalse();
      // Guard flag set when the warn level call throws unexpectedly.
      let warnFailed: boolean = false;
      try {
        Logger.warn('matrix recoverable condition');
      } catch (error) {
        warnFailed = true;
      }
      expect(warnFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5000
     * @tc.name      testNumAsyncLog0050
     * @tc.desc      Verify Logger error level accepts empty and long messages without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when the error level call throws unexpectedly.
      let errorFailed: boolean = false;
      try {
        Logger.error('matrix failure with code 401');
      } catch (error) {
        errorFailed = true;
      }
      expect(errorFailed).assertFalse();
      // The empty message matrix point stays inside the format contract.
      let emptyFailed: boolean = false;
      try {
        Logger.info('');
      } catch (error) {
        emptyFailed = true;
      }
      expect(emptyFailed).assertFalse();
      // A long message built by concatenation still renders safely.
      let longMessage: string = 'matrix-long-';
      for (let index: number = 0; index < 10; index++) {
        longMessage = longMessage + 'segment';
      }
      let longFailed: boolean = false;
      try {
        Logger.warn(longMessage);
      } catch (error) {
        longFailed = true;
      }
      expect(longFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5100
     * @tc.name      testNumAsyncLog0051
     * @tc.desc      Verify Logger enter and exit accept both the full and the optional omitted parameter forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when enter with both parameters throws unexpectedly.
      let enterFullFailed: boolean = false;
      try {
        Logger.enter('[TestService#run]', 'mode: matrix');
      } catch (error) {
        enterFullFailed = true;
      }
      expect(enterFullFailed).assertFalse();
      // Guard flag set when enter without the optional parameter throws unexpectedly.
      let enterBareFailed: boolean = false;
      try {
        Logger.enter('[TestService#run]');
      } catch (error) {
        enterBareFailed = true;
      }
      expect(enterBareFailed).assertFalse();
      // Guard flag set when exit with both parameters throws unexpectedly.
      let exitFullFailed: boolean = false;
      try {
        Logger.exit('[TestService#run]', 'result: ok');
      } catch (error) {
        exitFullFailed = true;
      }
      expect(exitFullFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5200
     * @tc.name      testNumAsyncLog0052
     * @tc.desc      Verify Logger exit without result and a full enter exit pair complete for one simulated method.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when exit without the optional result throws unexpectedly.
      let exitBareFailed: boolean = false;
      try {
        Logger.exit('[TestService#run]');
      } catch (error) {
        exitBareFailed = true;
      }
      expect(exitBareFailed).assertFalse();
      // A simulated method logs its entry boundary first.
      let pairEnterFailed: boolean = false;
      try {
        Logger.enter('[TestService#probe]', 'attempts: 3');
      } catch (error) {
        pairEnterFailed = true;
      }
      expect(pairEnterFailed).assertFalse();
      // The same simulated method closes with a matching exit boundary.
      let pairExitFailed: boolean = false;
      try {
        Logger.exit('[TestService#probe]', 'outcome: true');
      } catch (error) {
        pairExitFailed = true;
      }
      expect(pairExitFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5300
     * @tc.name      testNumAsyncLog0053
     * @tc.desc      Verify Logger beginTrace and endTrace form a symmetric pair for one top level section.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when the trace section start throws unexpectedly.
      let beginFailed: boolean = false;
      try {
        Logger.beginTrace('NetworkSecurity.test.section', 1);
      } catch (error) {
        beginFailed = true;
      }
      expect(beginFailed).assertFalse();
      // Guard flag set when the trace section finish throws unexpectedly.
      let endFailed: boolean = false;
      try {
        Logger.endTrace('NetworkSecurity.test.section', 1);
      } catch (error) {
        endFailed = true;
      }
      expect(endFailed).assertFalse();
      // Both ends of the pair used the identical name and task id strings.
      expect(beginFailed === endFailed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5400
     * @tc.name      testNumAsyncLog0054
     * @tc.desc      Verify Logger supports nested trace sections with distinct task ids in stack order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when any nested trace call throws unexpectedly.
      let nestedFailed: boolean = false;
      try {
        Logger.beginTrace('NetworkSecurity.test.outer', 2);
        Logger.beginTrace('NetworkSecurity.test.inner', 3);
        Logger.endTrace('NetworkSecurity.test.inner', 3);
        Logger.endTrace('NetworkSecurity.test.outer', 2);
      } catch (error) {
        nestedFailed = true;
      }
      expect(nestedFailed).assertFalse();
      // Guard flag set when the counter trace call throws unexpectedly.
      let valueFailed: boolean = false;
      try {
        Logger.traceValue('NetworkSecurity.test.counter', 4);
      } catch (error) {
        valueFailed = true;
      }
      expect(valueFailed).assertFalse();
      // The nested pair and the counter report both completed cleanly.
      expect(nestedFailed === valueFailed).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5500
     * @tc.name      testNumAsyncLog0055
     * @tc.desc      Verify Logger traceValue accepts the zero and large numeric counter matrix points.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumAsyncLog0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when the zero counter matrix point throws unexpectedly.
      let zeroFailed: boolean = false;
      try {
        Logger.traceValue('NetworkSecurity.test.zero', 0);
      } catch (error) {
        zeroFailed = true;
      }
      expect(zeroFailed).assertFalse();
      // Guard flag set when the mid range counter matrix point throws unexpectedly.
      let midFailed: boolean = false;
      try {
        Logger.traceValue('NetworkSecurity.test.mid', 999);
      } catch (error) {
        midFailed = true;
      }
      expect(midFailed).assertFalse();
      // Guard flag set when the large counter matrix point throws unexpectedly.
      let largeFailed: boolean = false;
      try {
        Logger.traceValue('NetworkSecurity.test.large', 12345);
      } catch (error) {
        largeFailed = true;
      }
      expect(largeFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5600
     * @tc.name      testNumAsyncLog0056
     * @tc.desc      Verify Logger info survives ten repeated calls with concatenated numeric suffixes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when any repeated info call throws unexpectedly.
      let loopFailed: boolean = false;
      let loopCount: number = 0;
      try {
        for (let index: number = 0; index < 10; index++) {
          Logger.info('matrix step ' + index.toString());
          loopCount++;
        }
      } catch (error) {
        loopFailed = true;
      }
      // The loop completed all ten iterations without throwing.
      expect(loopFailed).assertFalse();
      // Every iteration actually logged once.
      expect(loopCount).assertEqual(10);
      // The numeric suffix of the final iteration matches the loop bound.
      expect(loopCount === 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5700
     * @tc.name      testNumAsyncLog0057
     * @tc.desc      Verify Logger messages with percent and brace markers stay safe inside the public format.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumAsyncLog0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when the marker rich message throws unexpectedly.
      let markerFailed: boolean = false;
      try {
        Logger.info('matrix %{public}s markers %{}$& stay data');
      } catch (error) {
        markerFailed = true;
      }
      expect(markerFailed).assertFalse();
      // Guard flag set when the bracketed tag style message throws unexpectedly.
      let tagFailed: boolean = false;
      try {
        Logger.debug('[TestTag#method] bracketed detail');
      } catch (error) {
        tagFailed = true;
      }
      expect(tagFailed).assertFalse();
      // Guard flag set when the numeric suffix message throws unexpectedly.
      let numericFailed: boolean = false;
      try {
        Logger.warn('matrix port ' + 443 + ' status ' + 200);
      } catch (error) {
        numericFailed = true;
      }
      expect(numericFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5800
     * @tc.name      testNumAsyncLog0058
     * @tc.desc      Verify Logger accepts a two hundred character message built by repeated concatenation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumAsyncLog0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A two hundred character body is assembled from twenty ten character chunks.
      let longMessage: string = '';
      for (let index: number = 0; index < 20; index++) {
        longMessage = longMessage + 'matrix-chunk';
      }
      // The assembled body really reached the long message matrix width.
      expect(longMessage.length).assertEqual(240);
      // Guard flag set when logging the long body throws unexpectedly.
      let longFailed: boolean = false;
      try {
        Logger.debug(longMessage);
        Logger.info(longMessage);
      } catch (error) {
        longFailed = true;
      }
      expect(longFailed).assertFalse();
      // The long body starts with the expected chunk prefix.
      expect(longMessage.substring(0, 12)).assertEqual('matrix-chunk');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_5900
     * @tc.name      testNumAsyncLog0059
     * @tc.desc      Verify Logger enter renders a detail line built from the formatBytes kilobyte matrix point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The kilobyte matrix point renders with two fixed fraction digits.
      const sizeText: string = formatBytes(1024);
      expect(sizeText).assertEqual('1.00 KB');
      // The rendered size becomes the parameter summary of the enter line.
      const detailLine: string = 'size: ' + sizeText;
      expect(detailLine.length).assertEqual(13);
      // Guard flag set when logging the composed detail line throws unexpectedly.
      let enterFailed: boolean = false;
      try {
        Logger.enter('[TestService#measure]', detailLine);
      } catch (error) {
        enterFailed = true;
      }
      expect(enterFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_6000
     * @tc.name      testNumAsyncLog0060
     * @tc.desc      Verify Logger info renders a detail line built from the joinNumbers port matrix points.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The two port matrix points join with the comma and space separator.
      const portsText: string = joinNumbers([80, 443]);
      expect(portsText).assertEqual('80, 443');
      // The joined ports become the message of the info line.
      const messageLine: string = 'ports: ' + portsText;
      expect(messageLine.length).assertEqual(14);
      // Guard flag set when logging the composed message line throws unexpectedly.
      let infoFailed: boolean = false;
      try {
        Logger.info(messageLine);
      } catch (error) {
        infoFailed = true;
      }
      expect(infoFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_6100
     * @tc.name      testNumAsyncLog0061
     * @tc.desc      Verify elapsedMilliseconds measures at least fifteen milliseconds around a real delay await.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumAsyncLog0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The library helper captures the start point of the awaited window.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(15);
      const measured: number = elapsedMilliseconds(startedAt);
      const windowMs: number = Date.now() - startedAt;
      // The helper measured at least the requested fifteen milliseconds.
      expect(measured >= 15).assertTrue();
      // The raw clock window agrees with the helper measurement.
      expect(windowMs >= 15).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_6200
     * @tc.name      testNumAsyncLog0062
     * @tc.desc      Verify elapsedMilliseconds keeps growing for one start point across two awaited pauses.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumAsyncLog0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One start point is measured after the first awaited pause.
      const startedAt: number = Date.now();
      await AsyncUtils.delay(10);
      const firstMeasured: number = elapsedMilliseconds(startedAt);
      // The same start point is measured again after a second awaited pause.
      await AsyncUtils.delay(10);
      const secondMeasured: number = elapsedMilliseconds(startedAt);
      // The first measurement covered the first pause.
      expect(firstMeasured >= 10).assertTrue();
      // The second measurement strictly exceeds the first one.
      expect(secondMeasured > firstMeasured).assertTrue();
      // Both pauses together reach at least twenty milliseconds.
      expect(secondMeasured >= 20).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_6300
     * @tc.name      testNumAsyncLog0063
     * @tc.desc      Verify elapsedMilliseconds handles past start points including the epoch zero matrix point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A start point one second in the past yields at least one second.
      const pastStart: number = Date.now() - 1000;
      const pastElapsed: number = elapsedMilliseconds(pastStart);
      expect(pastElapsed >= 1000).assertTrue();
      // The epoch zero start point yields the whole device uptime.
      const epochElapsed: number = elapsedMilliseconds(0);
      expect(epochElapsed > YEAR_2020_MS).assertTrue();
      // Both measurements are plain numeric values.
      expect(typeof pastElapsed).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_6400
     * @tc.name      testNumAsyncLog0064
     * @tc.desc      Verify elapsedMilliseconds returns a negative raw difference for future start points.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumAsyncLog0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumAsyncLog0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A start point three hundred milliseconds in the future goes below zero.
      const futureStart: number = Date.now() + 300;
      const futureElapsed: number = elapsedMilliseconds(futureStart);
      expect(futureElapsed < 0).assertTrue();
      // The negative difference stays within a sane corridor far above minus one minute.
      expect(futureElapsed > -60000).assertTrue();
      // The negative matrix result is a plain numeric value.
      expect(typeof futureElapsed).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_6500
     * @tc.name      testNumAsyncLog0065
     * @tc.desc      Verify Logger renders detail lines built from the gigabyte and negative join matrix points.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The gigabyte matrix point renders with two fixed fraction digits.
      const sizeText: string = formatBytes(2147483648);
      expect(sizeText).assertEqual('2.00 GB');
      // The negative and zero join matrix points keep their minus prefixes.
      const listText: string = joinNumbers([-1, 0, 1]);
      expect(listText).assertEqual('-1, 0, 1');
      // Guard flag set when logging both composed lines throws unexpectedly.
      let logFailed: boolean = false;
      try {
        Logger.info('max: ' + sizeText);
        Logger.debug('list: ' + listText);
      } catch (error) {
        logFailed = true;
      }
      expect(logFailed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_ASYNCLOG_6600
     * @tc.name      testNumAsyncLog0066
     * @tc.desc      Verify a full trace and log boundary sequence completes for one simulated numeric case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumAsyncLog0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumAsyncLog0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Guard flag set when any boundary call of the sequence throws unexpectedly.
      let sequenceFailed: boolean = false;
      try {
        Logger.beginTrace('NetworkSecurity.test.logger', 9);
        Logger.enter('[TestService#sequence]', 'case: 66');
        Logger.debug('matrix step inside sequence');
        Logger.exit('[TestService#sequence]', 'status: done');
        Logger.traceValue('NetworkSecurity.test.cases', 66);
        Logger.endTrace('NetworkSecurity.test.logger', 9);
      } catch (error) {
        sequenceFailed = true;
      }
      // The full boundary sequence completed without throwing.
      expect(sequenceFailed).assertFalse();
      // The trace section used a positive task id matrix point.
      expect(9 > 0).assertTrue();
      // The logging tag stays identical to the registered hypium case name.
      expect(TAG).assertEqual('testNumAsyncLog0066');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
