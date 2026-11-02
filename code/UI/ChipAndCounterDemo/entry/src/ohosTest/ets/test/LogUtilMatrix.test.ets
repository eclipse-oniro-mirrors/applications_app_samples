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
import { LogUtil, LogLevel } from '../../../main/ets/model/utils/LogUtil';

/** 判断字符串是否为 HH:mm:ss 形状（8 位、第 3/6 位为冒号、其余为数字） */
function isTimeToken(token: string): boolean {
  if (token.length !== 8) {
    return false;
  }
  for (let i = 0; i < 8; i++) {
    if (i === 2 || i === 5) {
      if (token.charAt(i) !== ':') {
        return false;
      }
    } else {
      const code: number = token.charCodeAt(i);
      if (code < 48 || code > 57) {
        return false;
      }
    }
  }
  return true;
}

export default function logUtilMatrixTest() {
  describe('logUtilMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0100
     * @tc.name initDoesNotEmitSinkLine001
     * @tc.desc Verify init itself writes to hilog only and never pushes a panel line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('initDoesNotEmitSinkLine001', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      expect(lines.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0200
     * @tc.name initWithoutLevelPreservesMinLevel002
     * @tc.desc Verify init without a level keeps the previously configured minimum level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('initWithoutLevelPreservesMinLevel002', 0, () => {
      LogUtil.setMinLevel(LogLevel.WARN);
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      });
      LogUtil.info('Keep', 'info 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.warn('Keep', 'warn 应通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0300
     * @tc.name setMinLevelUpFiltersInfo003
     * @tc.desc Verify raising the minimum level filters debug and info but passes warn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setMinLevelUpFiltersInfo003', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('Up', 'debug 过滤');
      LogUtil.info('Up', 'info 过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.warn('Up', 'warn 通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0400
     * @tc.name setMinLevelDownRestoresDelivery004
     * @tc.desc Verify lowering the minimum level lets info messages through again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setMinLevelDownRestoresDelivery004', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.ERROR);
      LogUtil.info('Down', 'error 门槛下被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.info('Down', '恢复后通过');
      expect(lines.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0500
     * @tc.name errorGateFiltersWarn005
     * @tc.desc Verify an ERROR minimum level passes only error messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('errorGateFiltersWarn005', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.ERROR);
      LogUtil.warn('Gate', 'warn 应被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.error('Gate', 'error 应通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0600
     * @tc.name levelEnumOrder006
     * @tc.desc Verify the LogLevel enum numeric order is DEBUG<INFO<WARN<ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelEnumOrder006', 0, () => {
      expect(LogLevel.DEBUG).assertEqual(0);
      expect(LogLevel.INFO).assertEqual(1);
      expect(LogLevel.WARN).assertEqual(2);
      expect(LogLevel.ERROR).assertEqual(3);
      expect(LogLevel.DEBUG < LogLevel.INFO).assertTrue();
      expect(LogLevel.INFO < LogLevel.WARN).assertTrue();
      expect(LogLevel.WARN < LogLevel.ERROR).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0700
     * @tc.name formatTimeFixedMorning007
     * @tc.desc Verify a fixed morning moment formats as 03:04:05
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeFixedMorning007', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 2, 3, 4, 5))).assertEqual('03:04:05');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0800
     * @tc.name formatTimeEvening008
     * @tc.desc Verify a late evening moment formats as 23:59:58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeEvening008', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 5, 15, 23, 59, 58))).assertEqual('23:59:58');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_0900
     * @tc.name formatTimeMidnight009
     * @tc.desc Verify midnight formats as 00:00:00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeMidnight009', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 0, 0, 0))).assertEqual('00:00:00');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1000
     * @tc.name formatTimeTokenShape010
     * @tc.desc Verify the formatted time matches the HH:mm:ss token shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeTokenShape010', 0, () => {
      expect(isTimeToken(LogUtil.formatTime(new Date()))).assertTrue();
      expect(isTimeToken('12:34:56')).assertTrue();
      expect(isTimeToken('12:34:5')).assertFalse();
      expect(isTimeToken('12-34-56')).assertFalse();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1100
     * @tc.name fourLevelLineFormat011
     * @tc.desc Verify each level produces a line with its own mark and tag prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fourLevelLineFormat011', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.debug('T', 'd');
      LogUtil.info('T', 'i');
      LogUtil.warn('T', 'w');
      LogUtil.error('T', 'e');
      expect(lines.length).assertEqual(4);
      expect(lines[0].includes('[D][T]')).assertTrue();
      expect(lines[1].includes('[I][T]')).assertTrue();
      expect(lines[2].includes('[W][T]')).assertTrue();
      expect(lines[3].includes('[E][T]')).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1200
     * @tc.name sinkReplacementPreservesLevel012
     * @tc.desc Verify replacing the sink keeps the current minimum level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sinkReplacementPreservesLevel012', 0, () => {
      LogUtil.init((line: string) => {
      }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      });
      LogUtil.debug('Replace2', '仍被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.warn('Replace2', '应通过');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1300
     * @tc.name tagWithSpacesPreserved013
     * @tc.desc Verify a tag containing spaces is preserved inside brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagWithSpacesPreserved013', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('My Tag', '带空格标签');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[My Tag]')).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1400
     * @tc.name tagChinesePreserved014
     * @tc.desc Verify a Chinese tag is preserved inside brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagChinesePreserved014', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('日志', '中文标签');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[日志]')).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1500
     * @tc.name debugMarkDelivered015
     * @tc.desc Verify debug messages reach the sink with the [D] mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('debugMarkDelivered015', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.debug('Dbg', '调试消息');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[D][Dbg]')).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1600
     * @tc.name messageWithBracketsPreserved016
     * @tc.desc Verify brackets inside the message body are kept verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('messageWithBracketsPreserved016', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Bracket', '值=[10]');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('值=[10]')).assertTrue();
      expect(lines[0].endsWith('值=[10]')).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1700
     * @tc.name midStreamLevelChange017
     * @tc.desc Verify changing the level mid-stream affects only subsequent messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('midStreamLevelChange017', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Mid', '第一条');
      expect(lines.length).assertEqual(1);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.info('Mid', '应被过滤');
      expect(lines.length).assertEqual(1);
      LogUtil.error('Mid', '错误通过');
      expect(lines.length).assertEqual(2);
      expect(lines[1].includes('[E][Mid]')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1800
     * @tc.name formatTimeSingleDigitBoth018
     * @tc.desc Verify every single-digit field is zero padded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeSingleDigitBoth018', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 11, 31, 9, 9, 9))).assertEqual('09:09:09');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_1900
     * @tc.name initExplicitLevelFiltersBelow019
     * @tc.desc Verify init with an explicit minLevel filters info and delivers error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('initExplicitLevelFiltersBelow019', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.ERROR);
      LogUtil.info('Matrix', '低于门槛被过滤');
      LogUtil.warn('Matrix', '同样被过滤');
      expect(lines.length).assertEqual(0);
      LogUtil.error('Matrix', '门槛之上');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[E][Matrix] 门槛之上')).assertTrue();
      LogUtil.setMinLevel(LogLevel.DEBUG);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_2000
     * @tc.name emptyMessagePreserved020
     * @tc.desc Verify an empty message still produces a well-formed line with trailing separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('emptyMessagePreserved020', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Empty', '');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[I][Empty]')).assertTrue();
      expect(lines[0].charAt(lines[0].length - 1)).assertEqual(' ');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_2100
     * @tc.name multilineMessagePreserved021
     * @tc.desc Verify newline characters inside a message are passed through untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('multilineMessagePreserved021', 0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Multi', '第一行\n第二行');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('第一行\n第二行')).assertTrue();
      expect(lines[0].includes('[I][Multi]')).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_LOGUTILMATRIX_2200
     * @tc.name formatTimeDoubleDigits022
     * @tc.desc Verify two-digit hour/minute/second values are formatted without padding artifacts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeDoubleDigits022', 0, () => {
      expect(LogUtil.formatTime(new Date(2024, 5, 15, 12, 34, 56))).assertEqual('12:34:56');
      expect(LogUtil.formatTime(new Date(2024, 5, 15, 23, 45, 59))).assertEqual('23:45:59');
      expect(LogUtil.formatTime(new Date(2024, 5, 15, 10, 0, 0))).assertEqual('10:00:00');
    });
  });
}
