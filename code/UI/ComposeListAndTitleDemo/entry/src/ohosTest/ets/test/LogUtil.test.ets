import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { LogUtil, LogLevel, LogSink } from '../../../main/ets/model/utils/LogUtil';

/**
 * LogUtil 日志工具类设备侧测试
 * 覆盖：init 注入后回调送达、行格式（时间戳/级别/标签）、级别过滤、
 * levelMark 映射、formatTime 格式与补零、恢复默认级别、重复 init 替换 sink、
 * 省略 minLevel 时保留原级别
 */
export default function logUtilTest() {
  describe('logUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0100
     * @tc.name init_deliversToSink
     * @tc.desc Verify LogUtil.init delivers a formatted message to the injected sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_deliversToSink', 0, () => {
      const lines: string[] = [];
      const sink: LogSink = (line: string) => {
        lines.push(line);
      };
      LogUtil.init(sink, LogLevel.DEBUG);
      LogUtil.info('LogUtilTest', 'init_deliversToSink 消息');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('init_deliversToSink 消息')).assertTrue();
      expect(lines[0].includes('[I][LogUtilTest]')).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0200
     * @tc.name lineFormat_timestamp
     * @tc.desc Verify log lines start with [HH:mm:ss] and carry the level and tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lineFormat_timestamp', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.warn('Fmt', '格式校验');
      // 格式：[HH:mm:ss][W][Fmt] 消息
      expect(lines.length).assertEqual(1);
      expect(lines[0].length >= 8).assertTrue();
      expect(lines[0].charAt(0)).assertEqual('[');
      expect(lines[0].charAt(3)).assertEqual(':');
      expect(lines[0].charAt(6)).assertEqual(':');
      expect(lines[0].charAt(9)).assertEqual(']');
      expect(lines[0].includes('[W][Fmt]')).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0300
     * @tc.name levelFilter
     * @tc.desc Verify the minimum level filters debug/info and passes warn/error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelFilter', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.WARN);
      LogUtil.debug('Filter', 'debug 应被过滤');
      LogUtil.info('Filter', 'info 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.warn('Filter', 'warn 应通过');
      LogUtil.error('Filter', 'error 应通过');
      expect(lines.length).assertEqual(2);
      // 恢复默认级别，避免影响其他用例
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0400
     * @tc.name levelMark_mapping
     * @tc.desc Verify levelMark maps each log level to its single-letter mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelMark_mapping', 0, () => {
      expect(LogUtil.levelMark(LogLevel.DEBUG)).assertEqual('D');
      expect(LogUtil.levelMark(LogLevel.INFO)).assertEqual('I');
      expect(LogUtil.levelMark(LogLevel.WARN)).assertEqual('W');
      expect(LogUtil.levelMark(LogLevel.ERROR)).assertEqual('E');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0500
     * @tc.name formatTime_format
     * @tc.desc Verify formatTime returns an HH:mm:ss formatted string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_format', 0, () => {
      const t = LogUtil.formatTime(new Date());
      expect(t.length).assertEqual(8);
      expect(t.charAt(2)).assertEqual(':');
      expect(t.charAt(5)).assertEqual(':');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0600
     * @tc.name errorLevel_delivered
     * @tc.desc Verify error level messages reach the sink with the [E] mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('errorLevel_delivered', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.error('Err', '错误通道校验');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[E][Err]')).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0700
     * @tc.name formatTime_zeroPadding
     * @tc.desc Verify formatTime pads single-digit hours/minutes/seconds with zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_zeroPadding', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 5, 6, 7))).assertEqual('05:06:07');
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 23, 59, 58))).assertEqual('23:59:58');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0800
     * @tc.name init_keepsMinLevelWhenOmitted
     * @tc.desc Verify init without minLevel keeps the previously configured level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_keepsMinLevelWhenOmitted', 0, () => {
      LogUtil.setMinLevel(LogLevel.WARN);
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      });
      LogUtil.debug('KeepLevel', 'debug 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.warn('KeepLevel', 'warn 应通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTIL_0900
     * @tc.name init_replacesSink
     * @tc.desc Verify re-initializing replaces the sink and the old sink stops receiving
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_replacesSink', 0, () => {
      const first: string[] = [];
      const second: string[] = [];
      LogUtil.init((line: string) => {
        first.push(line);
      }, LogLevel.DEBUG);
      LogUtil.init((line: string) => {
        second.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Sink', '替换后消息');
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(1);
      expect(second[0].includes('替换后消息')).assertTrue();
    });
  });
}
