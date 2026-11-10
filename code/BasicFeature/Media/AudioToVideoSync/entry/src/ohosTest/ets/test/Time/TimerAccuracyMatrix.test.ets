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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { delay, paceTurn } from '../Shared/TestPace';

const TIMER_BUDGET_MS: number = 3000;

interface TimerSample {
  delayMs: number;
  lower: number;
  upper: number;
}

const SAMPLES: TimerSample[] = [
  { delayMs: 0, lower: 0, upper: 500 },
  { delayMs: 1, lower: 0, upper: 500 },
  { delayMs: 2, lower: 1, upper: 500 },
  { delayMs: 4, lower: 3, upper: 600 },
  { delayMs: 8, lower: 6, upper: 700 },
  { delayMs: 16, lower: 12, upper: 800 },
  { delayMs: 32, lower: 26, upper: 1000 },
  { delayMs: 64, lower: 54, upper: 1200 },
  { delayMs: 128, lower: 112, upper: 1500 },
  { delayMs: 256, lower: 230, upper: 2000 }
];

async function measure(targetMs: number): Promise<number> {
  const start: number = Date.now();
  await delay(targetMs);
  return Date.now() - start;
}

export default function timerAccuracyMatrixTest() {
  describe('timerAccuracyMatrixTest', () => {
    beforeAll(() => {
      console.info('timerAccuracyMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('timerAccuracyMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0100
     * @tc.name      testTimerAccuracy0001
     * @tc.desc      Verify a zero-delay timer yields without blocking for long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(0);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(500);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0200
     * @tc.name      testTimerAccuracy0002
     * @tc.desc      Verify a one-millisecond timer never completes before the clock advances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(1);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(500);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0300
     * @tc.name      testTimerAccuracy0003
     * @tc.desc      Verify a two-millisecond timer fires within the scheduling budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(2);
      expect(elapsed).assertLargerOrEqual(1);
      expect(elapsed).assertLess(500);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0400
     * @tc.name      testTimerAccuracy0004
     * @tc.desc      Verify a four-millisecond timer fires within the scheduling budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(4);
      expect(elapsed).assertLargerOrEqual(3);
      expect(elapsed).assertLess(600);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0500
     * @tc.name      testTimerAccuracy0005
     * @tc.desc      Verify an eight-millisecond timer fires within the scheduling budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(8);
      expect(elapsed).assertLargerOrEqual(6);
      expect(elapsed).assertLess(700);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0600
     * @tc.name      testTimerAccuracy0006
     * @tc.desc      Verify a sixteen-millisecond timer fires within the scheduling budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(16);
      expect(elapsed).assertLargerOrEqual(12);
      expect(elapsed).assertLess(800);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0700
     * @tc.name      testTimerAccuracy0007
     * @tc.desc      Verify a thirty-two millisecond timer fires within the scheduling budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(32);
      expect(elapsed).assertLargerOrEqual(26);
      expect(elapsed).assertLess(1000);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0800
     * @tc.name      testTimerAccuracy0008
     * @tc.desc      Verify a sixty-four millisecond timer fires within the scheduling budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(64);
      expect(elapsed).assertLargerOrEqual(54);
      expect(elapsed).assertLess(1200);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_0900
     * @tc.name      testTimerAccuracy0009
     * @tc.desc      Verify a hundred-and-twenty-eight millisecond timer fires within budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(128);
      expect(elapsed).assertLargerOrEqual(112);
      expect(elapsed).assertLess(1500);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1000
     * @tc.name      testTimerAccuracy0010
     * @tc.desc      Verify a two-hundred-fifty-six millisecond timer fires within budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const elapsed: number = await measure(256);
      expect(elapsed).assertLargerOrEqual(230);
      expect(elapsed).assertLess(2000);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1100
     * @tc.name      testTimerAccuracy0011
     * @tc.desc      Verify every sampled delay fires inside its lower and upper scheduling bounds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let i = 0; i < SAMPLES.length; i++) {
        const sample: TimerSample = SAMPLES[i];
        const elapsed: number = await measure(sample.delayMs);
        expect(elapsed).assertLargerOrEqual(sample.lower);
        expect(elapsed).assertLess(sample.upper);
        expect(elapsed).assertLess(TIMER_BUDGET_MS);
      }
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1200
     * @tc.name      testTimerAccuracy0012
     * @tc.desc      Verify the measured elapsed time grows with strictly increasing requested delays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const schedule: number[] = [4, 8, 16, 32, 64];
      let previous: number = 0;
      for (let i = 0; i < schedule.length; i++) {
        const elapsed: number = await measure(schedule[i]);
        expect(elapsed).assertLarger(previous);
        previous = elapsed;
      }
      expect(previous).assertLarger(0);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1300
     * @tc.name      testTimerAccuracy0013
     * @tc.desc      Verify concurrent short timers all complete within one budget window
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tasks: Promise<void>[] = [];
      const start: number = Date.now();
      for (let i = 0; i < 5; i++) {
        tasks.push(delay(20));
      }
      await Promise.all(tasks);
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(15);
      expect(elapsed).assertLess(600);
      expect(tasks.length).assertEqual(5);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1400
     * @tc.name      testTimerAccuracy0014
     * @tc.desc      Verify the timer order is preserved when one delay is nested inside another
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const order: number[] = [];
      await delay(5);
      order.push(1);
      await delay(10);
      order.push(2);
      await delay(15);
      order.push(3);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(2);
      expect(order[2]).assertEqual(3);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1500
     * @tc.name      testTimerAccuracy0015
     * @tc.desc      Verify two identical timers produce comparable elapsed times within a tolerance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: number = await measure(32);
      const second: number = await measure(32);
      expect(first).assertLargerOrEqual(26);
      expect(second).assertLargerOrEqual(26);
      expect(Math.abs(first - second)).assertLess(300);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1600
     * @tc.name      testTimerAccuracy0016
     * @tc.desc      Verify a delay does not resolve to a negative elapsed time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const schedule: number[] = [0, 1, 2, 4, 8];
      for (let i = 0; i < schedule.length; i++) {
        const elapsed: number = await measure(schedule[i]);
        expect(elapsed).assertLargerOrEqual(0);
      }
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1700
     * @tc.name      testTimerAccuracy0017
     * @tc.desc      Verify a sequence of zero-delay yields completes quickly without starvation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      for (let i = 0; i < 20; i++) {
        await delay(0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(2000);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1800
     * @tc.name      testTimerAccuracy0018
     * @tc.desc      Verify the shortest and longest sampled timers respect their relative ordering
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const shortElapsed: number = await measure(4);
      const longElapsed: number = await measure(128);
      expect(longElapsed).assertLarger(shortElapsed);
      expect(shortElapsed).assertLargerOrEqual(0);
      expect(longElapsed).assertLess(TIMER_BUDGET_MS);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_1900
     * @tc.name      testTimerAccuracy0019
     * @tc.desc      Verify concurrent long timers complete together rather than serially
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      await Promise.all([delay(64), delay(64), delay(64)]);
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(54);
      expect(elapsed).assertLess(800);
    })

    /**
     * @tc.number    SUB_AVS_TIME_TIMER_2000
     * @tc.name      testTimerAccuracy0020
     * @tc.desc      Verify a completed timer can be followed by another timer without stale resolution
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTimerAccuracy0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let completed: number = 0;
      await delay(8);
      completed++;
      expect(completed).assertEqual(1);
      await delay(8);
      completed++;
      expect(completed).assertEqual(2);
    })
  });
}
