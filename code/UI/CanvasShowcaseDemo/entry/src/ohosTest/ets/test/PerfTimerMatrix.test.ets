import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { PerfTimer } from '../../../main/ets/model/utils/PerfTimer';

/**
 * PerfTimer 性能计时工具类矩阵套件
 * 在 PerfTimer.test 基础上补齐返回值类型矩阵与统计不变式：
 * boolean/null/数组透传、fn 恰好调用一次、异常传播、耗时非负、计数累加、
 * min≤avg≤max 不变式、avg 两位小数、reset 后重启/清空统计、空报告精确格式、
 * 多实例隔离、report 不清样本、start 重置起点。
 */
export default function perfTimerMatrixTest() {
  describe('perfTimerMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0100
     * @tc.name timeReturnsBoolean0100
     * @tc.desc Verify time passes through a boolean result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('time_returnsBoolean', 0, () => {
      const r: boolean = PerfTimer.time('Matrix', '布尔', (): boolean => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0200
     * @tc.name timeReturnsNull0200
     * @tc.desc Verify time passes through a null result of a nullable type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('time_returnsNull', 0, () => {
      const r: string | null = PerfTimer.time('Matrix', '空值', (): string | null => null);
      expect(r === null).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0300
     * @tc.name timeReturnsArray0300
     * @tc.desc Verify time passes through an array result unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('time_returnsArray', 0, () => {
      const r: string[] = PerfTimer.time('Matrix', '数组', (): string[] => ['a', 'b']);
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0400
     * @tc.name timeInvokesFnOnce0400
     * @tc.desc Verify time invokes the wrapped function exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('time_invokesFnOnce', 0, () => {
      let calls = 0;
      const r: number = PerfTimer.time('Matrix', '一次', (): number => {
        calls += 1;
        return calls;
      });
      expect(r).assertEqual(1);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0500
     * @tc.name timePropagatesException0500
     * @tc.desc Verify an exception from the wrapped function propagates to the caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('time_propagatesException', 0, () => {
      let caught = false;
      try {
        PerfTimer.time('Matrix', '异常', (): number => {
          throw new Error('boom');
        });
      } catch (e) {
        caught = e !== null;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0600
     * @tc.name instanceStopNonNegative0600
     * @tc.desc Verify a single sample reports a non-negative duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('instance_stopNonNegative', 0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      const cost: number = t.stop();
      expect(cost >= 0).assertTrue();
      expect(t.count()).assertEqual(1);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0700
     * @tc.name countIncrementsPerStop0700
     * @tc.desc Verify each start/stop pair adds exactly one sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('count_incrementsPerStop', 0, () => {
      const t: PerfTimer = new PerfTimer();
      expect(t.count()).assertEqual(0);
      t.start();
      t.stop();
      expect(t.count()).assertEqual(1);
      t.start();
      t.stop();
      expect(t.count()).assertEqual(2);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0800
     * @tc.name statisticsInvariants0800
     * @tc.desc Verify min <= avg <= max across three samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('statistics_invariants', 0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.stop();
      t.start();
      t.stop();
      t.start();
      t.stop();
      expect(t.count()).assertEqual(3);
      expect(t.min() <= t.avg()).assertTrue();
      expect(t.avg() <= t.max()).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_0900
     * @tc.name avgRoundedToTwoDecimals0900
     * @tc.desc Verify the average is rounded to at most two decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('avg_roundedToTwoDecimals', 0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.stop();
      t.start();
      t.stop();
      const scaled: number = t.avg() * 100;
      expect(Math.abs(scaled - Math.round(scaled)) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_1000
     * @tc.name resetThenRestart1000
     * @tc.desc Verify a timer can record fresh samples after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('reset_thenRestart', 0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.stop();
      t.reset();
      expect(t.count()).assertEqual(0);
      t.start();
      const cost: number = t.stop();
      expect(cost >= 0).assertTrue();
      expect(t.count()).assertEqual(1);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_1100
     * @tc.name resetClearsStatistics1100
     * @tc.desc Verify reset returns avg, min and max to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('reset_clearsStatistics', 0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.stop();
      t.start();
      t.stop();
      t.reset();
      expect(t.avg()).assertEqual(0);
      expect(t.min()).assertEqual(0);
      expect(t.max()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_1200
     * @tc.name reportEmptyExactFormat1200
     * @tc.desc Verify an empty timer reports zeros in the documented format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('report_emptyExactFormat', 0, () => {
      const t: PerfTimer = new PerfTimer();
      expect(t.report('空场景')).assertEqual('空场景：0 次采样，平均 0ms，最小 0ms，最大 0ms');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_1300
     * @tc.name independentTimers1300
     * @tc.desc Verify separate timer instances keep independent sample counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('independent_timers', 0, () => {
      const t1: PerfTimer = new PerfTimer();
      const t2: PerfTimer = new PerfTimer();
      t1.start();
      t1.stop();
      t1.start();
      t1.stop();
      t2.start();
      t2.stop();
      expect(t1.count()).assertEqual(2);
      expect(t2.count()).assertEqual(1);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_1400
     * @tc.name reportDoesNotClearSamples1400
     * @tc.desc Verify generating a report leaves the recorded samples intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('report_doesNotClearSamples', 0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.stop();
      t.report('保留');
      expect(t.count()).assertEqual(1);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_1500
     * @tc.name reportIncludesSampleCount1500
     * @tc.desc Verify the report text embeds the current sample count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('report_includesSampleCount', 0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.stop();
      expect(t.report('场景A').includes('1 次采样')).assertTrue();
      expect(t.report('场景A').includes('场景A：')).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_PERFTIMERMATRIX_1600
     * @tc.name startResetsStartPoint1600
     * @tc.desc Verify a second start restarts timing and still records a sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('start_resetsStartPoint', 0, () => {
      const t: PerfTimer = new PerfTimer();
      t.start();
      t.start();
      const cost: number = t.stop();
      expect(cost >= 0).assertTrue();
      expect(t.count()).assertEqual(1);
    });
  });
}
