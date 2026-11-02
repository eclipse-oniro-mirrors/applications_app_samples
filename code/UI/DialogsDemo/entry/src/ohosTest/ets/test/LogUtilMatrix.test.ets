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
 * LogUtil 矩阵套件
 * 补充基线未覆盖的分支：init 不写面板、级别枚举序、固定时刻格式化、
 * 时间令牌形状、四级行格式、标签 / 消息保真与多行消息
 */

const COLON: number = 58;
const ZERO: number = 48;
const NINE: number = 57;

function isTimeToken(token: string): boolean {
  if (token.length !== 8) {
    return false;
  }
  for (let i = 0; i < 8; i++) {
    const code: number = token.charCodeAt(i);
    if (i === 2 || i === 5) {
      if (code !== COLON) {
        return false;
      }
    } else if (code < ZERO || code > NINE) {
      return false;
    }
  }
  return true;
}

function repeatChar(ch: string, n: number): string {
  let out: string = '';
  for (let i = 0; i < n; i++) {
    out += ch;
  }
  return out;
}

export default function logUtilMatrixTest() {
  describe('logUtilMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0100
     * @tc.name initDoesNotEmitSinkLine001
     * @tc.desc Verify init itself does not push a formatted line into the sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotEmitSinkLine', 0, () => {
      const lines: string[] = [];
      const sink: LogSink = (line: string) => {
        lines.push(line);
      };
      LogUtil.init(sink, LogLevel.DEBUG);
      expect(lines.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0200
     * @tc.name levelEnumOrder002
     * @tc.desc Verify LogLevel numeric order is DEBUG < INFO < WARN < ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelEnum_order', 0, () => {
      expect(LogLevel.DEBUG).assertEqual(0);
      expect(LogLevel.INFO).assertEqual(1);
      expect(LogLevel.WARN).assertEqual(2);
      expect(LogLevel.ERROR).assertEqual(3);
      expect(LogLevel.DEBUG < LogLevel.INFO).assertTrue();
      expect(LogLevel.INFO < LogLevel.WARN).assertTrue();
      expect(LogLevel.WARN < LogLevel.ERROR).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0300
     * @tc.name formatTimeFixedMorning003
     * @tc.desc Verify a fixed morning date formats as 03:04:05
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_fixedMorning', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 5, 1, 3, 4, 5))).assertEqual('03:04:05');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0400
     * @tc.name formatTimeMidnight004
     * @tc.desc Verify midnight formats as 00:00:00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_midnight', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 0, 0, 0))).assertEqual('00:00:00');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0500
     * @tc.name formatTimeNoon005
     * @tc.desc Verify noon formats as 12:00:00 without a 24-hour rollover
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_noon', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 12, 0, 0))).assertEqual('12:00:00');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0600
     * @tc.name formatTimeHourBoundary006
     * @tc.desc Verify the last hour of the day formats as 23:00:00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_hourBoundary', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 23, 0, 0))).assertEqual('23:00:00');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0700
     * @tc.name formatTimeSecondBoundary007
     * @tc.desc Verify the last second of the hour formats as 12:59:59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_secondBoundary', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 12, 59, 59))).assertEqual('12:59:59');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0800
     * @tc.name formatTimeTokenShape008
     * @tc.desc Verify formatTime output is exactly eight characters shaped HH:mm:ss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTime_tokenShape', 0, () => {
      expect(isTimeToken(LogUtil.formatTime(new Date()))).assertTrue();
      expect(isTimeToken('3:04:05')).assertFalse();
      expect(isTimeToken('03-04-05')).assertFalse();
      expect(isTimeToken('24:00:00x')).assertFalse();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_0900
     * @tc.name fourLevelLineFormat009
     * @tc.desc Verify one line per level keeps D/I/W/E marks, tag and message in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fourLevel_lineFormat', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.debug('L', 'd');
      LogUtil.info('L', 'i');
      LogUtil.warn('L', 'w');
      LogUtil.error('L', 'e');
      expect(lines.length).assertEqual(4);
      expect(lines[0].includes('[D][L] d')).assertTrue();
      expect(lines[1].includes('[I][L] i')).assertTrue();
      expect(lines[2].includes('[W][L] w')).assertTrue();
      expect(lines[3].includes('[E][L] e')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_1000
     * @tc.name tagWithSpacesPreserved010
     * @tc.desc Verify a tag containing spaces is not trimmed or split
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tag_withSpacesPreserved', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('UI Panel', '空格标签');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[I][UI Panel] 空格标签')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_1100
     * @tc.name tagChinesePreserved011
     * @tc.desc Verify a Chinese tag is preserved inside the brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tag_chinesePreserved', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.warn('弹窗', '中文标签');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[W][弹窗] 中文标签')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_1200
     * @tc.name messageWithBracketsPreserved012
     * @tc.desc Verify brackets inside the message are not confused with the line prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('message_withBracketsPreserved', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Bracket', '[步骤][1] 打开弹窗');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[I][Bracket] [步骤][1] 打开弹窗')).assertTrue();
      expect(lines[0].charAt(0)).assertEqual('[');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_1300
     * @tc.name debugMarkDelivered013
     * @tc.desc Verify a debug line is delivered with the D mark when the threshold is DEBUG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('debug_markDelivered', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.debug('Dbg', '调试消息');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[D][Dbg] 调试消息')).assertTrue();
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_1400
     * @tc.name emptyTagAndMessage014
     * @tc.desc Verify an empty tag and message still produce the bracket skeleton
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('emptyTagAndMessage', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.debug('', '');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[D][]')).assertTrue();
      expect(lines[0].charAt(lines[0].length - 1)).assertEqual(' ');
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_1500
     * @tc.name longMessagePreserved015
     * @tc.desc Verify a 300-character message is delivered without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longMessage_preserved', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      const long: string = repeatChar('y', 300);
      LogUtil.info('Long', long);
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes(long)).assertTrue();
      expect(lines[0].length).assertEqual(10 + 3 + 6 + 1 + 300);
    });

    /**
     * @tc.number SUB_DIALOGS_DEMO_LOGUTILMATRIX_1600
     * @tc.name messageNewlineSingleDelivery016
     * @tc.desc Verify a message containing a newline is delivered as one sink call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('message_newlineSingleDelivery', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Multi', 'a\nb');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('a\nb')).assertTrue();
    });
  });
}
