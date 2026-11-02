import { describe, beforeAll, afterAll, afterEach, it, expect } from '@ohos/hypium';
import { LogUtil, LogLevel, LogSink } from '../../../main/ets/model/utils/LogUtil';

/**
 * LogUtil 日志工具矩阵测试
 *
 * 覆盖：最低级别 × 实际级别的 4×4 过滤矩阵、setMinLevel 即时生效、
 * init 替换回调、formatTime 补零矩阵、空标签/空消息的行格式。
 * 每个用例结束后恢复 DEBUG 级别，避免污染其他套件。
 */

function collectSink(lines: string[]): LogSink {
  return (line: string) => {
    lines.push(line);
  };
}

function emitAllLevels(): void {
  LogUtil.debug('Matrix', 'debug 消息');
  LogUtil.info('Matrix', 'info 消息');
  LogUtil.warn('Matrix', 'warn 消息');
  LogUtil.error('Matrix', 'error 消息');
}

export default function logUtilMatrixTest() {
  describe('logUtilMatrixTest', () => {
    beforeAll(() => {
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    afterAll(() => {
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    afterEach(() => {
      // 用例中断言失败或提前返回时，避免级别残留影响后续用例
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0100
     * @tc.name filter_min_debug
     * @tc.desc Verify a DEBUG threshold delivers all four levels to the sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_min_debug', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.DEBUG);
      emitAllLevels();
      expect(lines.length).assertEqual(4);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0200
     * @tc.name filter_min_info
     * @tc.desc Verify an INFO threshold drops the DEBUG record and delivers the remaining three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_min_info', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.INFO);
      emitAllLevels();
      expect(lines.length).assertEqual(3);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0300
     * @tc.name filter_min_warn
     * @tc.desc Verify a WARN threshold delivers only the warn and error records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_min_warn', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.WARN);
      emitAllLevels();
      expect(lines.length).assertEqual(2);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0400
     * @tc.name filter_min_error
     * @tc.desc Verify an ERROR threshold delivers only the error record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_min_error', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.ERROR);
      emitAllLevels();
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0500
     * @tc.name filter_marks_match_level
     * @tc.desc Verify each delivered line carries the level mark matching its log call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('filter_marks_match_level', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.DEBUG);
      emitAllLevels();
      expect(lines[0].includes('[D][Matrix]')).assertTrue();
      expect(lines[1].includes('[I][Matrix]')).assertTrue();
      expect(lines[2].includes('[W][Matrix]')).assertTrue();
      expect(lines[3].includes('[E][Matrix]')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0600
     * @tc.name setMinLevel_applies_immediately
     * @tc.desc Verify raising the threshold after init filters the next record without re-initialising
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setMinLevel_applies_immediately', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.info('Immediate', '应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.error('Immediate', '应通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0700
     * @tc.name init_replaces_previous_sink
     * @tc.desc Verify a second init replaces the previous sink so only the new one receives lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_replaces_previous_sink', 0, () => {
      const first: string[] = [];
      const second: string[] = [];
      LogUtil.init(collectSink(first), LogLevel.DEBUG);
      LogUtil.init(collectSink(second), LogLevel.DEBUG);
      LogUtil.info('Replace', '只进新回调');
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(1);
      expect(second[0].includes('只进新回调')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0800
     * @tc.name formatTime_midnight_pad
     * @tc.desc Verify just past midnight formats as 00:00:05 with zero padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_midnight_pad', 0, () => {
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 0, 0, 5))).assertEqual('00:00:05');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_0900
     * @tc.name formatTime_last_second
     * @tc.desc Verify the last second of the day formats as 23:59:59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_last_second', 0, () => {
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 23, 59, 59))).assertEqual('23:59:59');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_1000
     * @tc.name formatTime_single_digits
     * @tc.desc Verify single-digit hour minute and second all receive a leading zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_single_digits', 0, () => {
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 9, 8, 7))).assertEqual('09:08:07');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_1100
     * @tc.name formatTime_two_digits
     * @tc.desc Verify double-digit hour minute and second are not padded further
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_two_digits', 0, () => {
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 10, 10, 10))).assertEqual('10:10:10');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_1200
     * @tc.name line_has_timestamp_level_and_tag
     * @tc.desc Verify a delivered line follows the bracketed timestamp level and tag layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('line_has_timestamp_level_and_tag', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.DEBUG);
      LogUtil.warn('Format', '行格式');
      const line = lines[0];
      expect(line.charAt(0)).assertEqual('[');
      expect(line.charAt(3)).assertEqual(':');
      expect(line.charAt(6)).assertEqual(':');
      expect(line.charAt(9)).assertEqual(']');
      expect(line.includes('[W][Format] 行格式')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_1300
     * @tc.name line_accepts_empty_tag_and_message
     * @tc.desc Verify empty tag and message still deliver a line containing empty brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('line_accepts_empty_tag_and_message', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.DEBUG);
      LogUtil.info('', '');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[I][]')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_LOGUTILMATRIX_1400
     * @tc.name line_keeps_brackets_in_message
     * @tc.desc Verify brackets inside the message body are preserved verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('line_keeps_brackets_in_message', 0, () => {
      const lines: string[] = [];
      LogUtil.init(collectSink(lines), LogLevel.DEBUG);
      LogUtil.info('Bracket', '值=[1,2,3]');
      expect(lines[0].includes('值=[1,2,3]')).assertTrue();
    });
  });
}
