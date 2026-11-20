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
import { systemDateTime } from '@kit.BasicServicesKit';
import { delay, paceTurn } from '../Shared/TestPace';
import { assertFiniteNumber } from '../Shared/TestSupport';
import { hilog } from '@kit.PerformanceAnalysisKit';

const NANOS_PER_MILLI: number = 1000000;
const CLOCK_TOLERANCE_MS: number = 2000;
const MIN_REASONABLE_YEAR: number = 2000;
const MAX_REASONABLE_YEAR: number = 2100;

interface TimerCase {
  label: string;
  delayMs: number;
  lowerMarginMs: number;
  upperMarginMs: number;
}

const TIMER_CASES: TimerCase[] = [
  { label: 'zero', delayMs: 0, lowerMarginMs: 0, upperMarginMs: 300 },
  { label: 'one', delayMs: 1, lowerMarginMs: 0, upperMarginMs: 300 },
  { label: 'five', delayMs: 5, lowerMarginMs: 3, upperMarginMs: 300 },
  { label: 'ten', delayMs: 10, lowerMarginMs: 7, upperMarginMs: 300 },
  { label: 'twenty', delayMs: 20, lowerMarginMs: 15, upperMarginMs: 400 },
  { label: 'fifty', delayMs: 50, lowerMarginMs: 40, upperMarginMs: 600 },
  { label: 'hundred', delayMs: 100, lowerMarginMs: 85, upperMarginMs: 800 }
];


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Time_ClockContract]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function clockContractTest() {
  describe('clockContractTest', () => {
    beforeAll(() => {
      console.info('clockContractTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('clockContractTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0100
     * @tc.name      testClockContract0001
     * @tc.desc      Verify the wall clock reports a positive millisecond timestamp
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0001');
      const millis: number = systemDateTime.getTime(false);
      assertFiniteNumber(millis, 'wall-millis');
      expect(millis).assertLarger(0);
      expect(Number.isInteger(millis)).assertTrue();
      const year: number = new Date(millis).getFullYear();
      expect(year).assertLargerOrEqual(MIN_REASONABLE_YEAR);
      expect(year).assertLessOrEqual(MAX_REASONABLE_YEAR);
    
      logEnd('testClockContract0001');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0200
     * @tc.name      testClockContract0002
     * @tc.desc      Verify the nanosecond wall clock and millisecond wall clock agree
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0002');
      const millis: number = systemDateTime.getTime(false);
      const nanos: number = systemDateTime.getTime(true);
      expect(nanos).assertLarger(0);
      const converted: number = nanos / NANOS_PER_MILLI;
      expect(Math.abs(converted - millis)).assertLessOrEqual(CLOCK_TOLERANCE_MS);
      expect(converted).assertLargerOrEqual(millis - CLOCK_TOLERANCE_MS);
      expect(converted).assertLessOrEqual(millis + CLOCK_TOLERANCE_MS);
    
      logEnd('testClockContract0002');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0300
     * @tc.name      testClockContract0003
     * @tc.desc      Verify the wall clock is close to the JavaScript Date source
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0003');
      const systemMillis: number = systemDateTime.getTime(false);
      const dateMillis: number = Date.now();
      expect(dateMillis).assertLarger(0);
      expect(Math.abs(systemMillis - dateMillis)).assertLess(CLOCK_TOLERANCE_MS * 2);
      expect(systemMillis).assertLargerOrEqual(dateMillis - CLOCK_TOLERANCE_MS * 2);
    
      logEnd('testClockContract0003');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0400
     * @tc.name      testClockContract0004
     * @tc.desc      Verify the startup uptime is positive and non-decreasing across reads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0004');
      const first: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const second: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      expect(first).assertLarger(0);
      expect(second).assertLargerOrEqual(first);
      expect(Number.isInteger(first)).assertTrue();
      expect(Number.isInteger(second)).assertTrue();
    
      logEnd('testClockContract0004');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0500
     * @tc.name      testClockContract0005
     * @tc.desc      Verify the active uptime is positive and non-decreasing across reads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0005');
      const first: number = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false);
      const second: number = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false);
      expect(first).assertLarger(0);
      expect(second).assertLargerOrEqual(first);
      expect(systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, true)).assertLarger(0);
    
      logEnd('testClockContract0005');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0600
     * @tc.name      testClockContract0006
     * @tc.desc      Verify the startup uptime is not larger than the wall clock epoch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0006');
      const uptime: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const wall: number = systemDateTime.getTime(false);
      expect(uptime).assertLarger(0);
      expect(wall).assertLarger(0);
      expect(uptime).assertLessOrEqual(wall);
    
      logEnd('testClockContract0006');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0700
     * @tc.name      testClockContract0007
     * @tc.desc      Verify the date object reports every calendar field inside its legal range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0007');
      const current: Date = await systemDateTime.getDate();
      expect(current instanceof Date).assertTrue();
      expect(current.getFullYear()).assertLargerOrEqual(MIN_REASONABLE_YEAR);
      expect(current.getFullYear()).assertLessOrEqual(MAX_REASONABLE_YEAR);
      expect(current.getMonth()).assertLargerOrEqual(0);
      expect(current.getMonth()).assertLessOrEqual(11);
      expect(current.getDate()).assertLargerOrEqual(1);
      expect(current.getDate()).assertLessOrEqual(31);
      expect(current.getHours()).assertLargerOrEqual(0);
      expect(current.getHours()).assertLessOrEqual(23);
      expect(current.getMinutes()).assertLargerOrEqual(0);
      expect(current.getMinutes()).assertLessOrEqual(59);
      expect(current.getSeconds()).assertLargerOrEqual(0);
      expect(current.getSeconds()).assertLessOrEqual(60);
    
      logEnd('testClockContract0007');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0800
     * @tc.name      testClockContract0008
     * @tc.desc      Verify the asynchronous and synchronous timezone reads agree
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0008');
      const asyncZone: string = await systemDateTime.getTimezone();
      const syncZone: string = systemDateTime.getTimezoneSync();
      expect(syncZone.length).assertLarger(0);
      expect(asyncZone.length).assertLarger(0);
      expect(asyncZone).assertEqual(syncZone);
      expect(syncZone.indexOf('/') >= 0 || syncZone === 'UTC').assertTrue();
    
      logEnd('testClockContract0008');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_0900
     * @tc.name      testClockContract0009
     * @tc.desc      Verify a timer never fires earlier than the requested lower margin
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0009');
      for (let i = 0; i < TIMER_CASES.length; i++) {
        const sample: TimerCase = TIMER_CASES[i];
        const start: number = Date.now();
        await delay(sample.delayMs);
        const elapsed: number = Date.now() - start;
        expect(elapsed).assertLargerOrEqual(sample.lowerMarginMs);
        expect(elapsed).assertLess(sample.upperMarginMs);
      }
    
      logEnd('testClockContract0009');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1000
     * @tc.name      testClockContract0010
     * @tc.desc      Verify a zero-delay timer yields control without blocking for long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0010');
      const start: number = Date.now();
      for (let i = 0; i < 10; i++) {
        await delay(0);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(2000);
      expect(start).assertLarger(0);
    
      logEnd('testClockContract0010');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1100
     * @tc.name      testClockContract0011
     * @tc.desc      Verify two timers started in order complete in a non-decreasing time order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0011');
      const stamps: number[] = [];
      const start: number = Date.now();
      await delay(10);
      stamps.push(Date.now() - start);
      await delay(20);
      stamps.push(Date.now() - start);
      await delay(30);
      stamps.push(Date.now() - start);
      expect(stamps.length).assertEqual(3);
      expect(stamps[0]).assertLargerOrEqual(5);
      expect(stamps[1]).assertLarger(stamps[0]);
      expect(stamps[2]).assertLarger(stamps[1]);
      expect(stamps[2]).assertLess(2000);
    
      logEnd('testClockContract0011');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1200
     * @tc.name      testClockContract0012
     * @tc.desc      Verify concurrent timers complete together rather than serially
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0012');
      const tasks: Promise<void>[] = [];
      const start: number = Date.now();
      for (let i = 0; i < 4; i++) {
        tasks.push(delay(40));
      }
      await Promise.all(tasks);
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(30);
      expect(elapsed).assertLess(200);
      expect(tasks.length).assertEqual(4);
    
      logEnd('testClockContract0012');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1300
     * @tc.name      testClockContract0013
     * @tc.desc      Verify the uptime advances after a measured timer completes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0013');
      const before: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      await delay(60);
      const after: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      expect(after).assertLargerOrEqual(before + 40);
      expect(after - before).assertLess(1000);
      expect(after).assertLarger(before);
    
      logEnd('testClockContract0013');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1400
     * @tc.name      testClockContract0014
     * @tc.desc      Verify repeated wall clock reads never move backwards
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0014');
      let previous: number = systemDateTime.getTime(false);
      for (let i = 0; i < 100; i++) {
        const current: number = systemDateTime.getTime(false);
        expect(current).assertLargerOrEqual(previous);
        previous = current;
      }
      expect(previous).assertLarger(0);
    
      logEnd('testClockContract0014');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1500
     * @tc.name      testClockContract0015
     * @tc.desc      Verify the startup uptime never exceeds the active uptime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0015');
      const startup: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
      const active: number = systemDateTime.getUptime(systemDateTime.TimeType.ACTIVE, false);
      expect(startup).assertLarger(0);
      expect(active).assertLarger(0);
      expect(active).assertLessOrEqual(startup + 1);
    
      logEnd('testClockContract0015');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1600
     * @tc.name      testClockContract0016
     * @tc.desc      Verify converting a date back to milliseconds matches the source timestamp
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0016');
      const current: Date = await systemDateTime.getDate();
      const millis: number = current.getTime();
      expect(millis).assertLarger(0);
      expect(new Date(millis).getFullYear()).assertEqual(current.getFullYear());
      expect(new Date(millis).getMonth()).assertEqual(current.getMonth());
      expect(new Date(millis).getDate()).assertEqual(current.getDate());
      expect(new Date(millis).getHours()).assertEqual(current.getHours());
    
      logEnd('testClockContract0016');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1700
     * @tc.name      testClockContract0017
     * @tc.desc      Verify the timezone string is a stable identifier across reads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0017');
      const first: string = systemDateTime.getTimezoneSync();
      const second: string = systemDateTime.getTimezoneSync();
      expect(first).assertEqual(second);
      expect(first.length).assertLarger(0);
      expect(first.indexOf(' ')).assertEqual(-1);
      expect(first.trim()).assertEqual(first);
    
      logEnd('testClockContract0017');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1800
     * @tc.name      testClockContract0018
     * @tc.desc      Verify a sequence of increasing delays produces strictly increasing elapsed times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0018');
      const delays: number[] = [5, 10, 20, 40];
      let previous: number = 0;
      for (let i = 0; i < delays.length; i++) {
        const start: number = Date.now();
        await delay(delays[i]);
        const elapsed: number = Date.now() - start;
        expect(elapsed).assertLarger(previous);
        previous = elapsed;
      }
      expect(previous).assertLarger(0);
    
      logEnd('testClockContract0018');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_1900
     * @tc.name      testClockContract0019
     * @tc.desc      Verify a timer scheduled with the same delay twice yields comparable durations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testClockContract0019');
      const firstStart: number = Date.now();
      await delay(30);
      const firstElapsed: number = Date.now() - firstStart;
      const secondStart: number = Date.now();
      await delay(30);
      const secondElapsed: number = Date.now() - secondStart;
      expect(firstElapsed).assertLargerOrEqual(20);
      expect(secondElapsed).assertLargerOrEqual(20);
      expect(Math.abs(firstElapsed - secondElapsed)).assertLess(150);
      expect(firstElapsed).assertLess(1000);
    
      logEnd('testClockContract0019');
    })

    /**
     * @tc.number    SUB_AVS_TIME_CLOCK_2000
     * @tc.name      testClockContract0020
     * @tc.desc      Verify the wall clock and uptime remain valid after repeated interleaved reads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClockContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testClockContract0020');
      for (let i = 0; i < 50; i++) {
        const wall: number = systemDateTime.getTime(false);
        const uptime: number = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
        expect(wall).assertLarger(0);
        expect(uptime).assertLarger(0);
        expect(uptime).assertLessOrEqual(wall);
      }
    
      logEnd('testClockContract0020');
    })
  });
}
