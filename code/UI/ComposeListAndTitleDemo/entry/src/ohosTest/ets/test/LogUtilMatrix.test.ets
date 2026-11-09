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
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0100
     * @tc.name initDoesNotEmitSinkLine001
     * @tc.desc Verify init itself writes to hilog only and never pushes a panel line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('initDoesNotEmitSinkLine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      expect(lines.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0200
     * @tc.name setMinLevelUpFiltersInfo002
     * @tc.desc Verify raising the minimum level filters debug and info but passes warn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setMinLevelUpFiltersInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0300
     * @tc.name setMinLevelDownRestoresDelivery003
     * @tc.desc Verify lowering the minimum level lets info messages through again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setMinLevelDownRestoresDelivery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0400
     * @tc.name errorGateFiltersWarn004
     * @tc.desc Verify an ERROR minimum level passes only error messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('errorGateFiltersWarn004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0500
     * @tc.name levelEnumOrder005
     * @tc.desc Verify the LogLevel enum numeric order is DEBUG<INFO<WARN<ERROR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('levelEnumOrder005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogLevel.DEBUG).assertEqual(0);
      expect(LogLevel.INFO).assertEqual(1);
      expect(LogLevel.WARN).assertEqual(2);
      expect(LogLevel.ERROR).assertEqual(3);
      expect(LogLevel.DEBUG < LogLevel.INFO).assertTrue();
      expect(LogLevel.INFO < LogLevel.WARN).assertTrue();
      expect(LogLevel.WARN < LogLevel.ERROR).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0600
     * @tc.name formatTimeFixedMorning006
     * @tc.desc Verify a fixed morning moment formats as 03:04:05
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeFixedMorning006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 2, 3, 4, 5))).assertEqual('03:04:05');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0700
     * @tc.name formatTimeMidnight007
     * @tc.desc Verify midnight formats as 00:00:00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeMidnight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogUtil.formatTime(new Date(2024, 0, 1, 0, 0, 0))).assertEqual('00:00:00');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0800
     * @tc.name formatTimeSingleDigitAllNines008
     * @tc.desc Verify every single-digit field is zero padded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeSingleDigitAllNines008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogUtil.formatTime(new Date(2024, 11, 31, 9, 9, 9))).assertEqual('09:09:09');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_0900
     * @tc.name formatTimeTokenShape009
     * @tc.desc Verify the formatted time matches the HH:mm:ss token shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeTokenShape009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(isTimeToken(LogUtil.formatTime(new Date()))).assertTrue();
      expect(isTimeToken('12:34:56')).assertTrue();
      expect(isTimeToken('12:34:5')).assertFalse();
      expect(isTimeToken('12-34-56')).assertFalse();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1000
     * @tc.name fourLevelLineFormat010
     * @tc.desc Verify each level produces a line with its own mark and tag prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fourLevelLineFormat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1100
     * @tc.name sinkReplacementPreservesLevel011
     * @tc.desc Verify replacing the sink keeps the current minimum level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sinkReplacementPreservesLevel011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1200
     * @tc.name tagWithSpacesPreserved012
     * @tc.desc Verify a tag containing spaces is preserved inside brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagWithSpacesPreserved012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('My Tag', '带空格标签');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[My Tag]')).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1300
     * @tc.name tagChinesePreserved013
     * @tc.desc Verify a Chinese tag is preserved inside brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagChinesePreserved013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('日志', '中文标签');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[日志]')).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1400
     * @tc.name debugMarkDelivered014
     * @tc.desc Verify debug messages reach the sink with the [D] mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('debugMarkDelivered014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.debug('Dbg', '调试消息');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('[D][Dbg]')).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1500
     * @tc.name messageWithBracketsPreserved015
     * @tc.desc Verify brackets inside the message body are kept verbatim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('messageWithBracketsPreserved015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1600
     * @tc.name midStreamLevelChange016
     * @tc.desc Verify changing the level mid-stream affects only subsequent messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('midStreamLevelChange016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1700
     * @tc.name formatTimeNoon017
     * @tc.desc Verify noon formats as 12:00:00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeNoon017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogUtil.formatTime(new Date(2024, 6, 15, 12, 0, 0))).assertEqual('12:00:00');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1800
     * @tc.name formatTimeHourBoundary018
     * @tc.desc Verify the last hour of the day formats as 23:00:00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeHourBoundary018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogUtil.formatTime(new Date(2024, 11, 31, 23, 0, 0))).assertEqual('23:00:00');
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_1900
     * @tc.name emptyMessagePreserved019
     * @tc.desc Verify an empty message still produces a line ending after the tag space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('emptyMessagePreserved019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Empty', '');
      expect(lines.length).assertEqual(1);
      // 消息为空时行以标签后的空格结尾
      expect(lines[0].includes('[I][Empty]')).assertTrue();
      expect(lines[0].endsWith(' ')).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_2000
     * @tc.name multilineMessagePreserved020
     * @tc.desc Verify a message containing newlines is passed through verbatim in one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('multilineMessagePreserved020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      LogUtil.init((line: string) => {
        lines.push(line);
      }, LogLevel.DEBUG);
      LogUtil.info('Multi', '第一行\n第二行');
      expect(lines.length).assertEqual(1);
      expect(lines[0].includes('第一行\n第二行')).assertTrue();
    });

    /**
     * @tc.number SUB_COMPOSE_LIST_DEMO_LOGUTILMATRIX_2100
     * @tc.name formatTimeDoubleDigits021
     * @tc.desc Verify double-digit hour/minute/second moments format without padding changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('formatTimeDoubleDigits021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(LogUtil.formatTime(new Date(2024, 5, 10, 12, 34, 56))).assertEqual('12:34:56');
      expect(LogUtil.formatTime(new Date(2024, 5, 10, 23, 45, 59))).assertEqual('23:45:59');
      expect(LogUtil.formatTime(new Date(2024, 5, 10, 10, 0, 0))).assertEqual('10:00:00');
    });
  });
}
