import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { PerfTimer, PerfRecord } from '../../../main/ets/model/utils/PerfTimer';

/**
 * PerfTimer 计时工具类设备侧测试
 * 覆盖：start/stop 打点、未 start 的 stop、measure 返回值与记录、summary 格式、clear
 */
export default function perfTimerTest() {
  describe('perfTimerTest', () => {
    beforeAll(() => {
      PerfTimer.clear();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMER_0100
     * @tc.name startStopNonNegative001
     * @tc.desc Verify start/stop timing returns a non-negative duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('startStop_nonNegative', 0, () => {
      PerfTimer.start('case1');
      const cost = PerfTimer.stop('case1');
      expect(cost >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMER_0200
     * @tc.name stopWithoutStartReturnsNegative002
     * @tc.desc Verify stop without a matching start returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stopWithoutStart_returnsNegative', 0, () => {
      expect(PerfTimer.stop('never_started')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMER_0300
     * @tc.name measureReturnsValue003
     * @tc.desc Verify measure returns the result of the wrapped function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('measure_returnsValue', 0, () => {
      const result = PerfTimer.measure<number>('measure_case', (): number => {
        return 42;
      });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMER_0400
     * @tc.name measureRecords004
     * @tc.desc Verify measure appends a labeled timing record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('measure_records', 0, () => {
      const before = PerfTimer.getRecords().length;
      PerfTimer.measure<number>('record_case', (): number => {
        return 1;
      });
      const records: PerfRecord[] = PerfTimer.getRecords();
      expect(records.length).assertEqual(before + 1);
      expect(records[records.length - 1].label).assertEqual('record_case');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMER_0500
     * @tc.name summaryFormat005
     * @tc.desc Verify summary output contains record lines with millisecond units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('summary_format', 0, () => {
      const text = PerfTimer.summary();
      expect(text.includes('=')).assertTrue();
      expect(text.includes('ms')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_PERFTIMER_0600
     * @tc.name clearEmpties006
     * @tc.desc Verify clear removes all recorded timings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clear_empties', 0, () => {
      PerfTimer.start('to_clear');
      PerfTimer.stop('to_clear');
      expect(PerfTimer.getRecords().length > 0).assertTrue();
      PerfTimer.clear();
      expect(PerfTimer.getRecords().length).assertEqual(0);
    });
  });
}
