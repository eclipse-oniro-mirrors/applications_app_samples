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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { LogUtil, LogLevel, LogSink } from '../../../main/ets/model/utils/LogUtil';

export default function logUtilTest() {
  describe('logUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0050
     * @tc.name log_withoutInit_noThrow
     * @tc.desc Verify logging before any init (no sink) does not throw and is harmless
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('log_withoutInit_noThrow', 0, () => {
      // 本用例为套件内首个用例且先序套件不注入回调：此时 uiSink 尚为 null
      LogUtil.info('NoInit', '未初始化 info');
      LogUtil.warn('NoInit', '未初始化 warn');
      LogUtil.error('NoInit', '未初始化 error');
      LogUtil.debug('NoInit', '未初始化 debug');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0100
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0200
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0300
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0400
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0500
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0600
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
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0700
     * @tc.name formatTime_zeroPadding
     * @tc.desc Verify formatTime pads single-digit hour, minute and second with zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_zeroPadding', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 5, 6, 7))).assertEqual('05:06:07');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0800
     * @tc.name init_replacesSink
     * @tc.desc Verify a second init replaces the sink and the old sink receives nothing new
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
      const firstCountBefore = first.length;
      LogUtil.init((line: string) => {
        second.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Replace', 'replaced sink 消息');
      expect(first.length).assertEqual(firstCountBefore);
      expect(second.length).assertEqual(1);
      expect(second[0].includes('replaced sink 消息')).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_0900
     * @tc.name sink_linesPreserveOrder
     * @tc.desc Verify multiple logs at mixed levels arrive at the sink in call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sink_linesPreserveOrder', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.warn('Order', '第一条');
      LogUtil.debug('Order', '第二条');
      LogUtil.error('Order', '第三条');
      expect(lines.length).assertEqual(3);
      expect(lines[0].includes('[W][Order] 第一条')).assertTrue();
      expect(lines[1].includes('[D][Order] 第二条')).assertTrue();
      expect(lines[2].includes('[E][Order] 第三条')).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTIL_1000
     * @tc.name levelMark_unknown
     * @tc.desc Verify levelMark falls back to '?' for an out-of-enum level value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelMark_unknown', 0, () => {
      expect(LogUtil.levelMark(99 as LogLevel)).assertEqual('?');
      expect(LogUtil.levelMark(-1 as LogLevel)).assertEqual('?');
    });
  });
}
