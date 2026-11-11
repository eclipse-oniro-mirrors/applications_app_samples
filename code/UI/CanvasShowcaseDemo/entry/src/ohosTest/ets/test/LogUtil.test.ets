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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTIL_0100
     * @tc.name initDeliversToSink001
     * @tc.desc Verify init injects a sink that receives formatted info lines
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTIL_0200
     * @tc.name lineFormatTimestamp002
     * @tc.desc Verify the line starts with [HH:mm:ss] and level/tag markers
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
      expect(lines[0].substring(1, 9).length).assertEqual(8);
      expect(lines[0].includes('[W][Fmt]')).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTIL_0300
     * @tc.name levelFilter003
     * @tc.desc Verify the minimum level filters debug/info and passes warn/error
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTIL_0400
     * @tc.name levelMarkMapping004
     * @tc.desc Verify levelMark maps each level to its letter
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTIL_0500
     * @tc.name formatTimeFormat005
     * @tc.desc Verify formatTime renders an 8-character HH:mm:ss string
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
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTIL_0600
     * @tc.name errorLevelDelivered006
     * @tc.desc Verify error lines carry the [E] marker
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
  });
}
