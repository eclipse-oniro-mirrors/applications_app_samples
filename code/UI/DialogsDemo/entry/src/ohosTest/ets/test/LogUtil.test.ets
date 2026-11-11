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
 
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { LogUtil, LogLevel, LogSink } from '../../../main/ets/model/utils/LogUtil';

/**
 * LogUtil 日志工具类设备侧测试
 * 覆盖：init 注入后回调送达、行格式（时间戳/级别/标签）、级别过滤、
 * levelMark 映射、formatTime 格式、恢复默认级别
 */
export default function logUtilTest() {
  describe('logUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0100
     * @tc.name initDeliversToSink001
     * @tc.desc Verify LogUtil delivers formatted lines to an injected sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_deliversToSink', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0200
     * @tc.name lineFormatTimestamp002
     * @tc.desc Verify log line format [HH:mm:ss][level][tag] message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('lineFormat_timestamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0300
     * @tc.name levelFilter003
     * @tc.desc Verify min-level filtering drops lower-priority lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0400
     * @tc.name levelMarkMapping004
     * @tc.desc Verify level marks map to D/I/W/E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelMark_mapping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogUtil.levelMark(LogLevel.DEBUG)).assertEqual('D');
      expect(LogUtil.levelMark(LogLevel.INFO)).assertEqual('I');
      expect(LogUtil.levelMark(LogLevel.WARN)).assertEqual('W');
      expect(LogUtil.levelMark(LogLevel.ERROR)).assertEqual('E');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0500
     * @tc.name formatTimeFormat005
     * @tc.desc Verify formatTime outputs HH:mm:ss with separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_format', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const t = LogUtil.formatTime(new Date());
      expect(t.length).assertEqual(8);
      expect(t.charAt(2)).assertEqual(':');
      expect(t.charAt(5)).assertEqual(':');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0600
     * @tc.name errorLevelDelivered006
     * @tc.desc Verify error-level lines reach the sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('errorLevel_delivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.error('Err', '错误通道校验');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[E][Err]')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0700
     * @tc.name formatTimeZeroPadding007
     * @tc.desc Verify formatTime pads single-digit hours, minutes and seconds to two digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_zeroPadding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const d = new Date(2024, 0, 1, 5, 6, 7);
      expect(LogUtil.formatTime(d)).assertEqual('05:06:07');
      const d2 = new Date(2024, 0, 1, 15, 16, 17);
      expect(LogUtil.formatTime(d2)).assertEqual('15:16:17');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0800
     * @tc.name levelMarkUnknown008
     * @tc.desc Verify an out-of-range level maps to the '?' fallback mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelMark_unknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogUtil.levelMark(99 as LogLevel)).assertEqual('?');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_0900
     * @tc.name initKeepsMinLevelWhenOmitted009
     * @tc.desc Verify init without a min level keeps the previously configured threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_keepsMinLevelWhenOmitted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.WARN);
      LogUtil.init((line: string) => {
        lines.push(line);
      });
      LogUtil.info('Keep', 'info 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.warn('Keep', 'warn 应通过');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[W][Keep] warn 应通过')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_1000
     * @tc.name initReplacesSink010
     * @tc.desc Verify a later init replaces the previous sink so only the newest sink receives lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_replacesSink', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const first: string[] = [];
      const second: string[] = [];
      LogUtil.init((line: string) => {
        first.push(line);
      }, LogLevel.DEBUG);
      LogUtil.init((line: string) => {
        second.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Sink', 'replace 校验');
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(1);
      expect(second[0].includes('[I][Sink] replace 校验')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_1100
     * @tc.name minLevelBoundaryEqual011
     * @tc.desc Verify a line whose level equals the threshold is delivered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('minLevel_boundaryEqual', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.INFO);
      LogUtil.debug('Boundary', 'debug 应被过滤');
      LogUtil.info('Boundary', 'info 应通过');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[I][Boundary] info 应通过')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTIL_1200
     * @tc.name setMinLevelAppliesImmediately012
     * @tc.desc Verify setMinLevel changes filtering for subsequent calls in both directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setMinLevel_appliesImmediately', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.info('Shift', 'info 应被过滤');
      LogUtil.warn('Shift', 'warn 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.error('Shift', 'error 应通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('Shift', 'debug 恢复后应通过');
      expect(lines.length).assertEqual(2);
      expect(lines[1].includes('[D][Shift] debug 恢复后应通过')).assertTrue();
    });
  });
}
