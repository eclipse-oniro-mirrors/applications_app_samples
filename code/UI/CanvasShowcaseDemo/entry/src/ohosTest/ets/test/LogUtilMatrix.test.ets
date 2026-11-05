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

/**
 * LogUtil 日志工具类矩阵套件
 * 在 LogUtil.test 基础上补齐级别门限矩阵与时间戳/标签格式边界：
 * init 不带 minLevel 保持原级别、setMinLevel 上/下调、DEBUG/INFO/ERROR 门限行为、
 * 级别枚举数值序、固定时间格式化（上午/夜间/零点/补零）、时间戳模式校验、
 * 四级别整行格式、二次 init 替换 sink、标签含空格、中文消息、各标记行。
 */

/** 校验 'HH:mm:ss' 形态（8 字符、冒号位置、其余为数字） */
function isTimeToken(token: string): boolean {
  if (token.length !== 8 || token.charAt(2) !== ':' || token.charAt(5) !== ':') {
    return false;
  }
  const digitIdx: number[] = [0, 1, 3, 4, 6, 7];
  for (const i of digitIdx) {
    const ch: string = token.charAt(i);
    if (ch < '0' || ch > '9') {
      return false;
    }
  }
  return true;
}

export default function logUtilMatrixTest() {
  describe('logUtilMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0100
     * @tc.name initWithoutMinLevelKeepsLevel0100
     * @tc.desc Verify init without a level argument keeps the previously set minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_withoutMinLevel_keepsLevel', 0, () => {
      const lines: string[] = [];
      const sink: LogSink = (line: string) => {
        lines.push(line);
      };
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.init(sink);
      LogUtil.debug('Keep', 'debug 应被过滤');
      LogUtil.info('Keep', 'info 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.warn('Keep', 'warn 应通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0200
     * @tc.name setMinLevelDebugShowsAll0200
     * @tc.desc Verify lowering the threshold to DEBUG re-enables debug lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setMinLevel_debugShowsAll', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.WARN);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('Lower', 'debug 应通过');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[D][Lower]')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0300
     * @tc.name minLevelInfoFiltersDebug0300
     * @tc.desc Verify an INFO threshold filters debug but passes info and above
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('minLevel_info_filtersDebug', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.INFO);
      LogUtil.debug('InfoGate', 'debug 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.info('InfoGate', 'info 应通过');
      LogUtil.warn('InfoGate', 'warn 应通过');
      expect(lines.length).assertEqual(2);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0400
     * @tc.name minLevelErrorFiltersLower0400
     * @tc.desc Verify an ERROR threshold passes only error lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('minLevel_error_filtersLower', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.ERROR);
      LogUtil.debug('ErrGate', 'debug 应被过滤');
      LogUtil.info('ErrGate', 'info 应被过滤');
      LogUtil.warn('ErrGate', 'warn 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.error('ErrGate', 'error 应通过');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[E][ErrGate]')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0500
     * @tc.name levelMarkAllAndEnumOrder0500
     * @tc.desc Verify level marks and the numeric order of the level enum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelMark_allAndEnumOrder', 0, () => {
      expect(LogUtil.levelMark(LogLevel.DEBUG)).assertEqual('D');
      expect(LogUtil.levelMark(LogLevel.INFO)).assertEqual('I');
      expect(LogUtil.levelMark(LogLevel.WARN)).assertEqual('W');
      expect(LogUtil.levelMark(LogLevel.ERROR)).assertEqual('E');
      // 数值序：DEBUG < INFO < WARN < ERROR，供 minLevel 过滤使用
      expect(LogLevel.DEBUG < LogLevel.INFO).assertTrue();
      expect(LogLevel.INFO < LogLevel.WARN).assertTrue();
      expect(LogLevel.WARN < LogLevel.ERROR).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0600
     * @tc.name formatTimeFixedMorning0600
     * @tc.desc Verify formatTime renders a fixed morning Date as HH:mm:ss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_fixedMorning', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 2, 3, 4, 5))).assertEqual('03:04:05');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0700
     * @tc.name formatTimeFixedEvening0700
     * @tc.desc Verify formatTime renders a fixed late-evening Date as HH:mm:ss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_fixedEvening', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 2, 23, 59, 58))).assertEqual('23:59:58');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0800
     * @tc.name formatTimeMidnight0800
     * @tc.desc Verify midnight formats as 00:00:00 with zero padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_midnight', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 0, 0, 0))).assertEqual('00:00:00');
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 5, 6, 7))).assertEqual('05:06:07');
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_0900
     * @tc.name lineTimestampMatchesPattern0900
     * @tc.desc Verify the bracketed timestamp segment matches the HH:mm:ss pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('line_timestampMatchesPattern', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Stamp', '时间戳校验');
      expect(lines.length).assertEqual(1);
      expect(lines[0].charAt(0)).assertEqual('[');
      expect(lines[0].charAt(9)).assertEqual(']');
      expect(isTimeToken(lines[0].substring(1, 9))).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_1000
     * @tc.name lineFormatsAllLevels1000
     * @tc.desc Verify four consecutive levels each render their own letter marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('line_formatsAllLevels', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.debug('Multi', 'd');
      LogUtil.info('Multi', 'i');
      LogUtil.warn('Multi', 'w');
      LogUtil.error('Multi', 'e');
      expect(lines.length).assertEqual(4);
      expect(lines[0].includes('[D][Multi] d')).assertTrue();
      expect(lines[1].includes('[I][Multi] i')).assertTrue();
      expect(lines[2].includes('[W][Multi] w')).assertTrue();
      expect(lines[3].includes('[E][Multi] e')).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_1100
     * @tc.name sinkReplacedBySecondInit1100
     * @tc.desc Verify a second init redirects lines to the new sink only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sink_replacedBySecondInit', 0, () => {
      const first: string[] = [];
      const second: string[] = [];
      LogUtil.init((line: string) => {
        first.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Sink', '第一条');
      expect(first.length).assertEqual(1);
      LogUtil.init((line: string) => {
        second.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Sink', '第二条');
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(1);
      expect(second[0].includes('第二条')).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_1200
     * @tc.name tagWithSpacesPreserved1200
     * @tc.desc Verify a tag containing a space is preserved verbatim in the line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tag_withSpaces_preserved', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('A B', '带空格标签');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[I][A B] 带空格标签')).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_1300
     * @tc.name messageWithChinesePreserved1300
     * @tc.desc Verify Chinese tag and message survive formatting unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('message_withChinese_preserved', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.warn('中文标签', '中文消息 123');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[W][中文标签] 中文消息 123')).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_1400
     * @tc.name debugLineCarriesDMarker1400
     * @tc.desc Verify a debug line carries the [D] marker under a DEBUG threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('debug_lineCarriesDMarker', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.debug('Dbg', '调试行');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[D][Dbg] 调试行')).assertTrue();
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_1500
     * @tc.name setMinLevelLowerMidStream1500
     * @tc.desc Verify lowering the threshold mid-stream admits warn while debug stays filtered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setMinLevel_lowerMidStream', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.ERROR);
      LogUtil.error('Mid', 'error 先通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.warn('Mid', 'warn 后通过');
      LogUtil.debug('Mid', 'debug 仍被过滤');
      expect(lines.length).assertEqual(2);
      expect(lines[1].includes('[W][Mid]')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CANVAS_SHOWCASE_DEMO_LOGUTILMATRIX_1600
     * @tc.name errorDeliveredAtDebugLevel1600
     * @tc.desc Verify error lines are delivered under the most permissive threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('error_deliveredAtDebugLevel', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.error('All', '最宽松门限');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[E][All] 最宽松门限')).assertTrue();
    });
  });
}
