import { describe, beforeAll, afterAll, it, expect } from '@ohos/hypium';
import { PerfTimer, PerfRecord } from '../../../main/ets/model/utils/PerfTimer';

/**
 * PerfTimer 计时器矩阵测试
 *
 * 覆盖：多标签独立打点、同名 restart 覆盖、stop 后重复 stop、
 * measure 的泛型返回值（number/string/boolean/数组）、summary 多记录拼接、
 * clear 对已记录与未结束打点的影响、记录顺序。
 */

export default function perfTimerMatrixTest() {
  describe('perfTimerMatrixTest', () => {
    beforeAll(() => {
      PerfTimer.clear();
    });

    afterAll(() => {
      PerfTimer.clear();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0100
     * @tc.name labels_are_independent
     * @tc.desc Verify two labels can be started and stopped independently producing two records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('labels_are_independent', 0, () => {
      PerfTimer.clear();
      PerfTimer.start('alpha');
      PerfTimer.start('beta');
      const alphaCost = PerfTimer.stop('alpha');
      const betaCost = PerfTimer.stop('beta');
      expect(alphaCost >= 0).assertTrue();
      expect(betaCost >= 0).assertTrue();
      expect(PerfTimer.getRecords().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0200
     * @tc.name restart_overwrites_previous_mark
     * @tc.desc Verify restarting the same label keeps a single record labelled with that name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restart_overwrites_previous_mark', 0, () => {
      PerfTimer.clear();
      PerfTimer.start('same');
      PerfTimer.start('same');
      const cost = PerfTimer.stop('same');
      expect(cost >= 0).assertTrue();
      expect(PerfTimer.getRecords().length).assertEqual(1);
      expect(PerfTimer.getRecords()[0].label).assertEqual('same');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0300
     * @tc.name stop_twice_returns_minus_one
     * @tc.desc Verify stopping an already stopped label returns minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stop_twice_returns_minus_one', 0, () => {
      PerfTimer.clear();
      PerfTimer.start('once');
      expect(PerfTimer.stop('once') >= 0).assertTrue();
      expect(PerfTimer.stop('once')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0400
     * @tc.name measure_returns_number
     * @tc.desc Verify measure passes a wrapped number result through unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('measure_returns_number', 0, () => {
      const result = PerfTimer.measure<number>('num', (): number => {
        return 7;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0500
     * @tc.name measure_returns_string
     * @tc.desc Verify measure passes a wrapped string result through unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('measure_returns_string', 0, () => {
      const result = PerfTimer.measure<string>('str', (): string => {
        return 'value';
      });
      expect(result).assertEqual('value');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0600
     * @tc.name measure_returns_boolean
     * @tc.desc Verify measure passes a wrapped boolean result through unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('measure_returns_boolean', 0, () => {
      const result = PerfTimer.measure<boolean>('bool', (): boolean => {
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0700
     * @tc.name measure_returns_array
     * @tc.desc Verify measure passes a wrapped array result through unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('measure_returns_array', 0, () => {
      const result = PerfTimer.measure<number[]>('arr', (): number[] => {
        return [1, 2, 3];
      });
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0800
     * @tc.name summary_joins_multiple_records
     * @tc.desc Verify summary lists every measured label separated by the full-width comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('summary_joins_multiple_records', 0, () => {
      PerfTimer.clear();
      PerfTimer.measure<number>('first', (): number => {
        return 1;
      });
      PerfTimer.measure<number>('second', (): number => {
        return 2;
      });
      const text = PerfTimer.summary();
      expect(text.includes('first=')).assertTrue();
      expect(text.includes('second=')).assertTrue();
      expect(text.includes('，')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_0900
     * @tc.name summary_after_clear_is_placeholder
     * @tc.desc Verify summary of an empty record set returns the Chinese no-records placeholder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('summary_after_clear_is_placeholder', 0, () => {
      PerfTimer.clear();
      expect(PerfTimer.summary()).assertEqual('（无计时记录）');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_1000
     * @tc.name clear_drops_pending_mark
     * @tc.desc Verify clearing after a start discards the pending mark so stop returns minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clear_drops_pending_mark', 0, () => {
      PerfTimer.clear();
      PerfTimer.start('pending');
      PerfTimer.clear();
      expect(PerfTimer.stop('pending')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_1100
     * @tc.name records_keep_insertion_order
     * @tc.desc Verify records are reported in the order they were measured
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('records_keep_insertion_order', 0, () => {
      PerfTimer.clear();
      PerfTimer.measure<number>('one', (): number => {
        return 1;
      });
      PerfTimer.measure<number>('two', (): number => {
        return 2;
      });
      const records: PerfRecord[] = PerfTimer.getRecords();
      expect(records[0].label).assertEqual('one');
      expect(records[1].label).assertEqual('two');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMERMATRIX_1200
     * @tc.name busy_loop_cost_is_non_negative
     * @tc.desc Verify a measured busy loop yields a non-negative elapsed cost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('busy_loop_cost_is_non_negative', 0, () => {
      PerfTimer.clear();
      PerfTimer.start('busy');
      let sum = 0;
      for (let i = 0; i < 100000; i++) {
        sum += i;
      }
      const cost = PerfTimer.stop('busy');
      expect(cost >= 0).assertTrue();
      expect(sum > 0).assertTrue();
    });
  });
}
