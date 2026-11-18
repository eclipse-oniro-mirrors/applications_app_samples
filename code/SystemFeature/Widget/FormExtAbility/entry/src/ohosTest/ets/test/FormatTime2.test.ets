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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { formatTime } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for formatTime (96 cases). */
export default function formatTime2Test(): void {
  describe('FormatTime2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0097
     * @tc.name      FormExtAbility_FormatTime_0097
     * @tc.desc      formatTime(hours=24, minutes=100, seconds=-1) returns "24:100:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0097 begin`);
      const actual: string = formatTime(24, 100, -1);
      logInfo(`formatTime(hours=24, minutes=100, seconds...: actual=${actual}`);
      expect(actual).assertEqual('24:100:0-1');
      logInfo(`${BUNDLE}FormatTime_0097 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0098
     * @tc.name      FormExtAbility_FormatTime_0098
     * @tc.desc      formatTime(hours=1, minutes=60, seconds=30) returns "01:60:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0098 begin`);
      const actual: string = formatTime(1, 60, 30);
      logInfo(`formatTime(hours=1, minutes=60, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('01:60:30');
      logInfo(`${BUNDLE}FormatTime_0098 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0099
     * @tc.name      FormExtAbility_FormatTime_0099
     * @tc.desc      formatTime(hours=3, minutes=10, seconds=1) returns "03:10:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0099 begin`);
      const actual: string = formatTime(3, 10, 1);
      logInfo(`formatTime(hours=3, minutes=10, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('03:10:01');
      logInfo(`${BUNDLE}FormatTime_0099 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0100
     * @tc.name      FormExtAbility_FormatTime_0100
     * @tc.desc      formatTime(hours=117, minutes=1, seconds=60) returns "117:01:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0100 begin`);
      const actual: string = formatTime(117, 1, 60);
      logInfo(`formatTime(hours=117, minutes=1, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('117:01:60');
      logInfo(`${BUNDLE}FormatTime_0100 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0101
     * @tc.name      FormExtAbility_FormatTime_0101
     * @tc.desc      formatTime(hours=5, minutes=5, seconds=10) returns "05:05:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0101 begin`);
      const actual: string = formatTime(5, 5, 10);
      logInfo(`formatTime(hours=5, minutes=5, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('05:05:10');
      logInfo(`${BUNDLE}FormatTime_0101 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0102
     * @tc.name      FormExtAbility_FormatTime_0102
     * @tc.desc      formatTime(hours=0, minutes=141, seconds=30) returns "00:141:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0102 begin`);
      const actual: string = formatTime(0, 141, 30);
      logInfo(`formatTime(hours=0, minutes=141, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('00:141:30');
      logInfo(`${BUNDLE}FormatTime_0102 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0103
     * @tc.name      FormExtAbility_FormatTime_0103
     * @tc.desc      formatTime(hours=24, minutes=100, seconds=0) returns "24:100:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0103 begin`);
      const actual: string = formatTime(24, 100, 0);
      logInfo(`formatTime(hours=24, minutes=100, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('24:100:00');
      logInfo(`${BUNDLE}FormatTime_0103 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0104
     * @tc.name      FormExtAbility_FormatTime_0104
     * @tc.desc      formatTime(hours=3, minutes=141, seconds=59) returns "03:141:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0104 begin`);
      const actual: string = formatTime(3, 141, 59);
      logInfo(`formatTime(hours=3, minutes=141, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('03:141:59');
      logInfo(`${BUNDLE}FormatTime_0104 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0105
     * @tc.name      FormExtAbility_FormatTime_0105
     * @tc.desc      formatTime(hours=0, minutes=100, seconds=10) returns "00:100:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0105 begin`);
      const actual: string = formatTime(0, 100, 10);
      logInfo(`formatTime(hours=0, minutes=100, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('00:100:10');
      logInfo(`${BUNDLE}FormatTime_0105 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0106
     * @tc.name      FormExtAbility_FormatTime_0106
     * @tc.desc      formatTime(hours=3, minutes=59, seconds=100) returns "03:59:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0106 begin`);
      const actual: string = formatTime(3, 59, 100);
      logInfo(`formatTime(hours=3, minutes=59, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('03:59:100');
      logInfo(`${BUNDLE}FormatTime_0106 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0107
     * @tc.name      FormExtAbility_FormatTime_0107
     * @tc.desc      formatTime(hours=0, minutes=1, seconds=5) returns "00:01:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0107 begin`);
      const actual: string = formatTime(0, 1, 5);
      logInfo(`formatTime(hours=0, minutes=1, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('00:01:05');
      logInfo(`${BUNDLE}FormatTime_0107 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0108
     * @tc.name      FormExtAbility_FormatTime_0108
     * @tc.desc      formatTime(hours=1, minutes=10, seconds=-9) returns "01:10:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0108 begin`);
      const actual: string = formatTime(1, 10, -9);
      logInfo(`formatTime(hours=1, minutes=10, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('01:10:0-9');
      logInfo(`${BUNDLE}FormatTime_0108 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0109
     * @tc.name      FormExtAbility_FormatTime_0109
     * @tc.desc      formatTime(hours=23, minutes=-1, seconds=60) returns "23:0-1:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0109 begin`);
      const actual: string = formatTime(23, -1, 60);
      logInfo(`formatTime(hours=23, minutes=-1, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('23:0-1:60');
      logInfo(`${BUNDLE}FormatTime_0109 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0110
     * @tc.name      FormExtAbility_FormatTime_0110
     * @tc.desc      formatTime(hours=3, minutes=141, seconds=10) returns "03:141:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0110 begin`);
      const actual: string = formatTime(3, 141, 10);
      logInfo(`formatTime(hours=3, minutes=141, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('03:141:10');
      logInfo(`${BUNDLE}FormatTime_0110 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0111
     * @tc.name      FormExtAbility_FormatTime_0111
     * @tc.desc      formatTime(hours=12, minutes=1, seconds=-1) returns "12:01:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0111 begin`);
      const actual: string = formatTime(12, 1, -1);
      logInfo(`formatTime(hours=12, minutes=1, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('12:01:0-1');
      logInfo(`${BUNDLE}FormatTime_0111 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0112
     * @tc.name      FormExtAbility_FormatTime_0112
     * @tc.desc      formatTime(hours=23, minutes=10, seconds=-9) returns "23:10:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0112 begin`);
      const actual: string = formatTime(23, 10, -9);
      logInfo(`formatTime(hours=23, minutes=10, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('23:10:0-9');
      logInfo(`${BUNDLE}FormatTime_0112 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0113
     * @tc.name      FormExtAbility_FormatTime_0113
     * @tc.desc      formatTime(hours=24, minutes=60, seconds=2) returns "24:60:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0113 begin`);
      const actual: string = formatTime(24, 60, 2);
      logInfo(`formatTime(hours=24, minutes=60, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('24:60:02');
      logInfo(`${BUNDLE}FormatTime_0113 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0114
     * @tc.name      FormExtAbility_FormatTime_0114
     * @tc.desc      formatTime(hours=0, minutes=59, seconds=2) returns "00:59:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0114 begin`);
      const actual: string = formatTime(0, 59, 2);
      logInfo(`formatTime(hours=0, minutes=59, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('00:59:02');
      logInfo(`${BUNDLE}FormatTime_0114 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0115
     * @tc.name      FormExtAbility_FormatTime_0115
     * @tc.desc      formatTime(hours=10, minutes=1, seconds=5) returns "10:01:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0115 begin`);
      const actual: string = formatTime(10, 1, 5);
      logInfo(`formatTime(hours=10, minutes=1, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('10:01:05');
      logInfo(`${BUNDLE}FormatTime_0115 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0116
     * @tc.name      FormExtAbility_FormatTime_0116
     * @tc.desc      formatTime(hours=3, minutes=30, seconds=10) returns "03:30:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0116 begin`);
      const actual: string = formatTime(3, 30, 10);
      logInfo(`formatTime(hours=3, minutes=30, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('03:30:10');
      logInfo(`${BUNDLE}FormatTime_0116 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0117
     * @tc.name      FormExtAbility_FormatTime_0117
     * @tc.desc      formatTime(hours=24, minutes=5, seconds=2) returns "24:05:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0117 begin`);
      const actual: string = formatTime(24, 5, 2);
      logInfo(`formatTime(hours=24, minutes=5, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('24:05:02');
      logInfo(`${BUNDLE}FormatTime_0117 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0118
     * @tc.name      FormExtAbility_FormatTime_0118
     * @tc.desc      formatTime(hours=24, minutes=60, seconds=59) returns "24:60:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0118 begin`);
      const actual: string = formatTime(24, 60, 59);
      logInfo(`formatTime(hours=24, minutes=60, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('24:60:59');
      logInfo(`${BUNDLE}FormatTime_0118 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0119
     * @tc.name      FormExtAbility_FormatTime_0119
     * @tc.desc      formatTime(hours=1, minutes=-1, seconds=-9) returns "01:0-1:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0119 begin`);
      const actual: string = formatTime(1, -1, -9);
      logInfo(`formatTime(hours=1, minutes=-1, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('01:0-1:0-9');
      logInfo(`${BUNDLE}FormatTime_0119 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0120
     * @tc.name      FormExtAbility_FormatTime_0120
     * @tc.desc      formatTime(hours=10, minutes=59, seconds=0) returns "10:59:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0120 begin`);
      const actual: string = formatTime(10, 59, 0);
      logInfo(`formatTime(hours=10, minutes=59, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('10:59:00');
      logInfo(`${BUNDLE}FormatTime_0120 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0121
     * @tc.name      FormExtAbility_FormatTime_0121
     * @tc.desc      formatTime(hours=24, minutes=59, seconds=-9) returns "24:59:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0121 begin`);
      const actual: string = formatTime(24, 59, -9);
      logInfo(`formatTime(hours=24, minutes=59, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('24:59:0-9');
      logInfo(`${BUNDLE}FormatTime_0121 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0122
     * @tc.name      FormExtAbility_FormatTime_0122
     * @tc.desc      formatTime(hours=2, minutes=5, seconds=60) returns "02:05:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0122 begin`);
      const actual: string = formatTime(2, 5, 60);
      logInfo(`formatTime(hours=2, minutes=5, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('02:05:60');
      logInfo(`${BUNDLE}FormatTime_0122 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0123
     * @tc.name      FormExtAbility_FormatTime_0123
     * @tc.desc      formatTime(hours=0, minutes=10, seconds=5) returns "00:10:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0123 begin`);
      const actual: string = formatTime(0, 10, 5);
      logInfo(`formatTime(hours=0, minutes=10, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('00:10:05');
      logInfo(`${BUNDLE}FormatTime_0123 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0124
     * @tc.name      FormExtAbility_FormatTime_0124
     * @tc.desc      formatTime(hours=23, minutes=0, seconds=-9) returns "23:00:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0124 begin`);
      const actual: string = formatTime(23, 0, -9);
      logInfo(`formatTime(hours=23, minutes=0, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('23:00:0-9');
      logInfo(`${BUNDLE}FormatTime_0124 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0125
     * @tc.name      FormExtAbility_FormatTime_0125
     * @tc.desc      formatTime(hours=23, minutes=60, seconds=60) returns "23:60:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0125 begin`);
      const actual: string = formatTime(23, 60, 60);
      logInfo(`formatTime(hours=23, minutes=60, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('23:60:60');
      logInfo(`${BUNDLE}FormatTime_0125 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0126
     * @tc.name      FormExtAbility_FormatTime_0126
     * @tc.desc      formatTime(hours=-1, minutes=-1, seconds=5) returns "0-1:0-1:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0126 begin`);
      const actual: string = formatTime(-1, -1, 5);
      logInfo(`formatTime(hours=-1, minutes=-1, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('0-1:0-1:05');
      logInfo(`${BUNDLE}FormatTime_0126 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0127
     * @tc.name      FormExtAbility_FormatTime_0127
     * @tc.desc      formatTime(hours=23, minutes=3, seconds=2) returns "23:03:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0127 begin`);
      const actual: string = formatTime(23, 3, 2);
      logInfo(`formatTime(hours=23, minutes=3, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('23:03:02');
      logInfo(`${BUNDLE}FormatTime_0127 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0128
     * @tc.name      FormExtAbility_FormatTime_0128
     * @tc.desc      formatTime(hours=-1, minutes=3, seconds=0) returns "0-1:03:00"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0128 begin`);
      const actual: string = formatTime(-1, 3, 0);
      logInfo(`formatTime(hours=-1, minutes=3, seconds=0): actual=${actual}`);
      expect(actual).assertEqual('0-1:03:00');
      logInfo(`${BUNDLE}FormatTime_0128 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0129
     * @tc.name      FormExtAbility_FormatTime_0129
     * @tc.desc      formatTime(hours=1, minutes=10, seconds=10) returns "01:10:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0129 begin`);
      const actual: string = formatTime(1, 10, 10);
      logInfo(`formatTime(hours=1, minutes=10, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('01:10:10');
      logInfo(`${BUNDLE}FormatTime_0129 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0130
     * @tc.name      FormExtAbility_FormatTime_0130
     * @tc.desc      formatTime(hours=5, minutes=-1, seconds=100) returns "05:0-1:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0130 begin`);
      const actual: string = formatTime(5, -1, 100);
      logInfo(`formatTime(hours=5, minutes=-1, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('05:0-1:100');
      logInfo(`${BUNDLE}FormatTime_0130 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0131
     * @tc.name      FormExtAbility_FormatTime_0131
     * @tc.desc      formatTime(hours=3, minutes=141, seconds=2) returns "03:141:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0131 begin`);
      const actual: string = formatTime(3, 141, 2);
      logInfo(`formatTime(hours=3, minutes=141, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('03:141:02');
      logInfo(`${BUNDLE}FormatTime_0131 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0132
     * @tc.name      FormExtAbility_FormatTime_0132
     * @tc.desc      formatTime(hours=100, minutes=2, seconds=60) returns "100:02:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0132 begin`);
      const actual: string = formatTime(100, 2, 60);
      logInfo(`formatTime(hours=100, minutes=2, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('100:02:60');
      logInfo(`${BUNDLE}FormatTime_0132 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0133
     * @tc.name      FormExtAbility_FormatTime_0133
     * @tc.desc      formatTime(hours=100, minutes=60, seconds=60) returns "100:60:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0133 begin`);
      const actual: string = formatTime(100, 60, 60);
      logInfo(`formatTime(hours=100, minutes=60, seconds...: actual=${actual}`);
      expect(actual).assertEqual('100:60:60');
      logInfo(`${BUNDLE}FormatTime_0133 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0134
     * @tc.name      FormExtAbility_FormatTime_0134
     * @tc.desc      formatTime(hours=2, minutes=10, seconds=1) returns "02:10:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0134 begin`);
      const actual: string = formatTime(2, 10, 1);
      logInfo(`formatTime(hours=2, minutes=10, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('02:10:01');
      logInfo(`${BUNDLE}FormatTime_0134 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0135
     * @tc.name      FormExtAbility_FormatTime_0135
     * @tc.desc      formatTime(hours=1, minutes=59, seconds=1) returns "01:59:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0135 begin`);
      const actual: string = formatTime(1, 59, 1);
      logInfo(`formatTime(hours=1, minutes=59, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('01:59:01');
      logInfo(`${BUNDLE}FormatTime_0135 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0136
     * @tc.name      FormExtAbility_FormatTime_0136
     * @tc.desc      formatTime(hours=10, minutes=59, seconds=30) returns "10:59:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0136 begin`);
      const actual: string = formatTime(10, 59, 30);
      logInfo(`formatTime(hours=10, minutes=59, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('10:59:30');
      logInfo(`${BUNDLE}FormatTime_0136 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0137
     * @tc.name      FormExtAbility_FormatTime_0137
     * @tc.desc      formatTime(hours=24, minutes=2, seconds=2) returns "24:02:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0137 begin`);
      const actual: string = formatTime(24, 2, 2);
      logInfo(`formatTime(hours=24, minutes=2, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('24:02:02');
      logInfo(`${BUNDLE}FormatTime_0137 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0138
     * @tc.name      FormExtAbility_FormatTime_0138
     * @tc.desc      formatTime(hours=100, minutes=59, seconds=2) returns "100:59:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0138 begin`);
      const actual: string = formatTime(100, 59, 2);
      logInfo(`formatTime(hours=100, minutes=59, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('100:59:02');
      logInfo(`${BUNDLE}FormatTime_0138 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0139
     * @tc.name      FormExtAbility_FormatTime_0139
     * @tc.desc      formatTime(hours=23, minutes=60, seconds=-9) returns "23:60:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0139 begin`);
      const actual: string = formatTime(23, 60, -9);
      logInfo(`formatTime(hours=23, minutes=60, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('23:60:0-9');
      logInfo(`${BUNDLE}FormatTime_0139 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0140
     * @tc.name      FormExtAbility_FormatTime_0140
     * @tc.desc      formatTime(hours=3, minutes=3, seconds=-9) returns "03:03:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0140 begin`);
      const actual: string = formatTime(3, 3, -9);
      logInfo(`formatTime(hours=3, minutes=3, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('03:03:0-9');
      logInfo(`${BUNDLE}FormatTime_0140 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0141
     * @tc.name      FormExtAbility_FormatTime_0141
     * @tc.desc      formatTime(hours=-1, minutes=5, seconds=-9) returns "0-1:05:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0141 begin`);
      const actual: string = formatTime(-1, 5, -9);
      logInfo(`formatTime(hours=-1, minutes=5, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('0-1:05:0-9');
      logInfo(`${BUNDLE}FormatTime_0141 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0142
     * @tc.name      FormExtAbility_FormatTime_0142
     * @tc.desc      formatTime(hours=100, minutes=5, seconds=5) returns "100:05:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0142 begin`);
      const actual: string = formatTime(100, 5, 5);
      logInfo(`formatTime(hours=100, minutes=5, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('100:05:05');
      logInfo(`${BUNDLE}FormatTime_0142 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0143
     * @tc.name      FormExtAbility_FormatTime_0143
     * @tc.desc      formatTime(hours=-1, minutes=3, seconds=10) returns "0-1:03:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0143 begin`);
      const actual: string = formatTime(-1, 3, 10);
      logInfo(`formatTime(hours=-1, minutes=3, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('0-1:03:10');
      logInfo(`${BUNDLE}FormatTime_0143 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0144
     * @tc.name      FormExtAbility_FormatTime_0144
     * @tc.desc      formatTime(hours=3, minutes=-1, seconds=100) returns "03:0-1:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0144 begin`);
      const actual: string = formatTime(3, -1, 100);
      logInfo(`formatTime(hours=3, minutes=-1, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('03:0-1:100');
      logInfo(`${BUNDLE}FormatTime_0144 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0145
     * @tc.name      FormExtAbility_FormatTime_0145
     * @tc.desc      formatTime(hours=100, minutes=5, seconds=30) returns "100:05:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0145 begin`);
      const actual: string = formatTime(100, 5, 30);
      logInfo(`formatTime(hours=100, minutes=5, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('100:05:30');
      logInfo(`${BUNDLE}FormatTime_0145 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0146
     * @tc.name      FormExtAbility_FormatTime_0146
     * @tc.desc      formatTime(hours=5, minutes=1, seconds=3) returns "05:01:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0146 begin`);
      const actual: string = formatTime(5, 1, 3);
      logInfo(`formatTime(hours=5, minutes=1, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('05:01:03');
      logInfo(`${BUNDLE}FormatTime_0146 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0147
     * @tc.name      FormExtAbility_FormatTime_0147
     * @tc.desc      formatTime(hours=100, minutes=2, seconds=100) returns "100:02:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0147 begin`);
      const actual: string = formatTime(100, 2, 100);
      logInfo(`formatTime(hours=100, minutes=2, seconds=...: actual=${actual}`);
      expect(actual).assertEqual('100:02:100');
      logInfo(`${BUNDLE}FormatTime_0147 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0148
     * @tc.name      FormExtAbility_FormatTime_0148
     * @tc.desc      formatTime(hours=2, minutes=60, seconds=10) returns "02:60:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0148 begin`);
      const actual: string = formatTime(2, 60, 10);
      logInfo(`formatTime(hours=2, minutes=60, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('02:60:10');
      logInfo(`${BUNDLE}FormatTime_0148 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0149
     * @tc.name      FormExtAbility_FormatTime_0149
     * @tc.desc      formatTime(hours=2, minutes=2, seconds=2) returns "02:02:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0149 begin`);
      const actual: string = formatTime(2, 2, 2);
      logInfo(`formatTime(hours=2, minutes=2, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('02:02:02');
      logInfo(`${BUNDLE}FormatTime_0149 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0150
     * @tc.name      FormExtAbility_FormatTime_0150
     * @tc.desc      formatTime(hours=2, minutes=10, seconds=60) returns "02:10:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0150 begin`);
      const actual: string = formatTime(2, 10, 60);
      logInfo(`formatTime(hours=2, minutes=10, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('02:10:60');
      logInfo(`${BUNDLE}FormatTime_0150 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0151
     * @tc.name      FormExtAbility_FormatTime_0151
     * @tc.desc      formatTime(hours=1, minutes=59, seconds=100) returns "01:59:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0151 begin`);
      const actual: string = formatTime(1, 59, 100);
      logInfo(`formatTime(hours=1, minutes=59, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('01:59:100');
      logInfo(`${BUNDLE}FormatTime_0151 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0152
     * @tc.name      FormExtAbility_FormatTime_0152
     * @tc.desc      formatTime(hours=10, minutes=2, seconds=100) returns "10:02:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0152 begin`);
      const actual: string = formatTime(10, 2, 100);
      logInfo(`formatTime(hours=10, minutes=2, seconds=100): actual=${actual}`);
      expect(actual).assertEqual('10:02:100');
      logInfo(`${BUNDLE}FormatTime_0152 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0153
     * @tc.name      FormExtAbility_FormatTime_0153
     * @tc.desc      formatTime(hours=117, minutes=100, seconds=10) returns "117:100:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0153 begin`);
      const actual: string = formatTime(117, 100, 10);
      logInfo(`formatTime(hours=117, minutes=100, second...: actual=${actual}`);
      expect(actual).assertEqual('117:100:10');
      logInfo(`${BUNDLE}FormatTime_0153 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0154
     * @tc.name      FormExtAbility_FormatTime_0154
     * @tc.desc      formatTime(hours=23, minutes=0, seconds=30) returns "23:00:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0154 begin`);
      const actual: string = formatTime(23, 0, 30);
      logInfo(`formatTime(hours=23, minutes=0, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('23:00:30');
      logInfo(`${BUNDLE}FormatTime_0154 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0155
     * @tc.name      FormExtAbility_FormatTime_0155
     * @tc.desc      formatTime(hours=0, minutes=2, seconds=10) returns "00:02:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0155 begin`);
      const actual: string = formatTime(0, 2, 10);
      logInfo(`formatTime(hours=0, minutes=2, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('00:02:10');
      logInfo(`${BUNDLE}FormatTime_0155 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0156
     * @tc.name      FormExtAbility_FormatTime_0156
     * @tc.desc      formatTime(hours=10, minutes=141, seconds=60) returns "10:141:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0156 begin`);
      const actual: string = formatTime(10, 141, 60);
      logInfo(`formatTime(hours=10, minutes=141, seconds...: actual=${actual}`);
      expect(actual).assertEqual('10:141:60');
      logInfo(`${BUNDLE}FormatTime_0156 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0157
     * @tc.name      FormExtAbility_FormatTime_0157
     * @tc.desc      formatTime(hours=5, minutes=-1, seconds=30) returns "05:0-1:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0157 begin`);
      const actual: string = formatTime(5, -1, 30);
      logInfo(`formatTime(hours=5, minutes=-1, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('05:0-1:30');
      logInfo(`${BUNDLE}FormatTime_0157 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0158
     * @tc.name      FormExtAbility_FormatTime_0158
     * @tc.desc      formatTime(hours=0, minutes=5, seconds=-9) returns "00:05:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0158 begin`);
      const actual: string = formatTime(0, 5, -9);
      logInfo(`formatTime(hours=0, minutes=5, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('00:05:0-9');
      logInfo(`${BUNDLE}FormatTime_0158 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0159
     * @tc.name      FormExtAbility_FormatTime_0159
     * @tc.desc      formatTime(hours=12, minutes=2, seconds=-1) returns "12:02:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0159 begin`);
      const actual: string = formatTime(12, 2, -1);
      logInfo(`formatTime(hours=12, minutes=2, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('12:02:0-1');
      logInfo(`${BUNDLE}FormatTime_0159 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0160
     * @tc.name      FormExtAbility_FormatTime_0160
     * @tc.desc      formatTime(hours=-1, minutes=-1, seconds=59) returns "0-1:0-1:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0160 begin`);
      const actual: string = formatTime(-1, -1, 59);
      logInfo(`formatTime(hours=-1, minutes=-1, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('0-1:0-1:59');
      logInfo(`${BUNDLE}FormatTime_0160 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0161
     * @tc.name      FormExtAbility_FormatTime_0161
     * @tc.desc      formatTime(hours=12, minutes=5, seconds=60) returns "12:05:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0161 begin`);
      const actual: string = formatTime(12, 5, 60);
      logInfo(`formatTime(hours=12, minutes=5, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('12:05:60');
      logInfo(`${BUNDLE}FormatTime_0161 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0162
     * @tc.name      FormExtAbility_FormatTime_0162
     * @tc.desc      formatTime(hours=100, minutes=141, seconds=100) returns "100:141:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0162 begin`);
      const actual: string = formatTime(100, 141, 100);
      logInfo(`formatTime(hours=100, minutes=141, second...: actual=${actual}`);
      expect(actual).assertEqual('100:141:100');
      logInfo(`${BUNDLE}FormatTime_0162 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0163
     * @tc.name      FormExtAbility_FormatTime_0163
     * @tc.desc      formatTime(hours=12, minutes=-1, seconds=60) returns "12:0-1:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0163 begin`);
      const actual: string = formatTime(12, -1, 60);
      logInfo(`formatTime(hours=12, minutes=-1, seconds=60): actual=${actual}`);
      expect(actual).assertEqual('12:0-1:60');
      logInfo(`${BUNDLE}FormatTime_0163 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0164
     * @tc.name      FormExtAbility_FormatTime_0164
     * @tc.desc      formatTime(hours=5, minutes=100, seconds=30) returns "05:100:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0164 begin`);
      const actual: string = formatTime(5, 100, 30);
      logInfo(`formatTime(hours=5, minutes=100, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('05:100:30');
      logInfo(`${BUNDLE}FormatTime_0164 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0165
     * @tc.name      FormExtAbility_FormatTime_0165
     * @tc.desc      formatTime(hours=-1, minutes=5, seconds=-1) returns "0-1:05:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0165 begin`);
      const actual: string = formatTime(-1, 5, -1);
      logInfo(`formatTime(hours=-1, minutes=5, seconds=-1): actual=${actual}`);
      expect(actual).assertEqual('0-1:05:0-1');
      logInfo(`${BUNDLE}FormatTime_0165 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0166
     * @tc.name      FormExtAbility_FormatTime_0166
     * @tc.desc      formatTime(hours=-1, minutes=100, seconds=60) returns "0-1:100:60"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0166 begin`);
      const actual: string = formatTime(-1, 100, 60);
      logInfo(`formatTime(hours=-1, minutes=100, seconds...: actual=${actual}`);
      expect(actual).assertEqual('0-1:100:60');
      logInfo(`${BUNDLE}FormatTime_0166 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0167
     * @tc.name      FormExtAbility_FormatTime_0167
     * @tc.desc      formatTime(hours=1, minutes=-1, seconds=2) returns "01:0-1:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0167 begin`);
      const actual: string = formatTime(1, -1, 2);
      logInfo(`formatTime(hours=1, minutes=-1, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('01:0-1:02');
      logInfo(`${BUNDLE}FormatTime_0167 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0168
     * @tc.name      FormExtAbility_FormatTime_0168
     * @tc.desc      formatTime(hours=24, minutes=0, seconds=59) returns "24:00:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0168 begin`);
      const actual: string = formatTime(24, 0, 59);
      logInfo(`formatTime(hours=24, minutes=0, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('24:00:59');
      logInfo(`${BUNDLE}FormatTime_0168 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0169
     * @tc.name      FormExtAbility_FormatTime_0169
     * @tc.desc      formatTime(hours=24, minutes=59, seconds=10) returns "24:59:10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0169 begin`);
      const actual: string = formatTime(24, 59, 10);
      logInfo(`formatTime(hours=24, minutes=59, seconds=10): actual=${actual}`);
      expect(actual).assertEqual('24:59:10');
      logInfo(`${BUNDLE}FormatTime_0169 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0170
     * @tc.name      FormExtAbility_FormatTime_0170
     * @tc.desc      formatTime(hours=0, minutes=1, seconds=1) returns "00:01:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0170 begin`);
      const actual: string = formatTime(0, 1, 1);
      logInfo(`formatTime(hours=0, minutes=1, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('00:01:01');
      logInfo(`${BUNDLE}FormatTime_0170 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0171
     * @tc.name      FormExtAbility_FormatTime_0171
     * @tc.desc      formatTime(hours=10, minutes=0, seconds=3) returns "10:00:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0171 begin`);
      const actual: string = formatTime(10, 0, 3);
      logInfo(`formatTime(hours=10, minutes=0, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('10:00:03');
      logInfo(`${BUNDLE}FormatTime_0171 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0172
     * @tc.name      FormExtAbility_FormatTime_0172
     * @tc.desc      formatTime(hours=3, minutes=-1, seconds=3) returns "03:0-1:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0172 begin`);
      const actual: string = formatTime(3, -1, 3);
      logInfo(`formatTime(hours=3, minutes=-1, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('03:0-1:03');
      logInfo(`${BUNDLE}FormatTime_0172 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0173
     * @tc.name      FormExtAbility_FormatTime_0173
     * @tc.desc      formatTime(hours=100, minutes=141, seconds=1) returns "100:141:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0173 begin`);
      const actual: string = formatTime(100, 141, 1);
      logInfo(`formatTime(hours=100, minutes=141, second...: actual=${actual}`);
      expect(actual).assertEqual('100:141:01');
      logInfo(`${BUNDLE}FormatTime_0173 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0174
     * @tc.name      FormExtAbility_FormatTime_0174
     * @tc.desc      formatTime(hours=23, minutes=3, seconds=-9) returns "23:03:0-9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0174 begin`);
      const actual: string = formatTime(23, 3, -9);
      logInfo(`formatTime(hours=23, minutes=3, seconds=-9): actual=${actual}`);
      expect(actual).assertEqual('23:03:0-9');
      logInfo(`${BUNDLE}FormatTime_0174 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0175
     * @tc.name      FormExtAbility_FormatTime_0175
     * @tc.desc      formatTime(hours=23, minutes=-1, seconds=30) returns "23:0-1:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0175 begin`);
      const actual: string = formatTime(23, -1, 30);
      logInfo(`formatTime(hours=23, minutes=-1, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('23:0-1:30');
      logInfo(`${BUNDLE}FormatTime_0175 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0176
     * @tc.name      FormExtAbility_FormatTime_0176
     * @tc.desc      formatTime(hours=2, minutes=100, seconds=2) returns "02:100:02"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0176 begin`);
      const actual: string = formatTime(2, 100, 2);
      logInfo(`formatTime(hours=2, minutes=100, seconds=2): actual=${actual}`);
      expect(actual).assertEqual('02:100:02');
      logInfo(`${BUNDLE}FormatTime_0176 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0177
     * @tc.name      FormExtAbility_FormatTime_0177
     * @tc.desc      formatTime(hours=-1, minutes=5, seconds=5) returns "0-1:05:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0177 begin`);
      const actual: string = formatTime(-1, 5, 5);
      logInfo(`formatTime(hours=-1, minutes=5, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('0-1:05:05');
      logInfo(`${BUNDLE}FormatTime_0177 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0178
     * @tc.name      FormExtAbility_FormatTime_0178
     * @tc.desc      formatTime(hours=117, minutes=-1, seconds=3) returns "117:0-1:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0178 begin`);
      const actual: string = formatTime(117, -1, 3);
      logInfo(`formatTime(hours=117, minutes=-1, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('117:0-1:03');
      logInfo(`${BUNDLE}FormatTime_0178 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0179
     * @tc.name      FormExtAbility_FormatTime_0179
     * @tc.desc      formatTime(hours=100, minutes=5, seconds=100) returns "100:05:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0179 begin`);
      const actual: string = formatTime(100, 5, 100);
      logInfo(`formatTime(hours=100, minutes=5, seconds=...: actual=${actual}`);
      expect(actual).assertEqual('100:05:100');
      logInfo(`${BUNDLE}FormatTime_0179 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0180
     * @tc.name      FormExtAbility_FormatTime_0180
     * @tc.desc      formatTime(hours=24, minutes=30, seconds=59) returns "24:30:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0180 begin`);
      const actual: string = formatTime(24, 30, 59);
      logInfo(`formatTime(hours=24, minutes=30, seconds=59): actual=${actual}`);
      expect(actual).assertEqual('24:30:59');
      logInfo(`${BUNDLE}FormatTime_0180 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0181
     * @tc.name      FormExtAbility_FormatTime_0181
     * @tc.desc      formatTime(hours=12, minutes=-1, seconds=3) returns "12:0-1:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0181 begin`);
      const actual: string = formatTime(12, -1, 3);
      logInfo(`formatTime(hours=12, minutes=-1, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('12:0-1:03');
      logInfo(`${BUNDLE}FormatTime_0181 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0182
     * @tc.name      FormExtAbility_FormatTime_0182
     * @tc.desc      formatTime(hours=0, minutes=10, seconds=3) returns "00:10:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0182 begin`);
      const actual: string = formatTime(0, 10, 3);
      logInfo(`formatTime(hours=0, minutes=10, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('00:10:03');
      logInfo(`${BUNDLE}FormatTime_0182 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0183
     * @tc.name      FormExtAbility_FormatTime_0183
     * @tc.desc      formatTime(hours=-1, minutes=141, seconds=30) returns "0-1:141:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0183 begin`);
      const actual: string = formatTime(-1, 141, 30);
      logInfo(`formatTime(hours=-1, minutes=141, seconds...: actual=${actual}`);
      expect(actual).assertEqual('0-1:141:30');
      logInfo(`${BUNDLE}FormatTime_0183 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0184
     * @tc.name      FormExtAbility_FormatTime_0184
     * @tc.desc      formatTime(hours=3, minutes=60, seconds=3) returns "03:60:03"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0184 begin`);
      const actual: string = formatTime(3, 60, 3);
      logInfo(`formatTime(hours=3, minutes=60, seconds=3): actual=${actual}`);
      expect(actual).assertEqual('03:60:03');
      logInfo(`${BUNDLE}FormatTime_0184 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0185
     * @tc.name      FormExtAbility_FormatTime_0185
     * @tc.desc      formatTime(hours=2, minutes=141, seconds=30) returns "02:141:30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0185 begin`);
      const actual: string = formatTime(2, 141, 30);
      logInfo(`formatTime(hours=2, minutes=141, seconds=30): actual=${actual}`);
      expect(actual).assertEqual('02:141:30');
      logInfo(`${BUNDLE}FormatTime_0185 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0186
     * @tc.name      FormExtAbility_FormatTime_0186
     * @tc.desc      formatTime(hours=100, minutes=10, seconds=-1) returns "100:10:0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0186 begin`);
      const actual: string = formatTime(100, 10, -1);
      logInfo(`formatTime(hours=100, minutes=10, seconds...: actual=${actual}`);
      expect(actual).assertEqual('100:10:0-1');
      logInfo(`${BUNDLE}FormatTime_0186 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0187
     * @tc.name      FormExtAbility_FormatTime_0187
     * @tc.desc      formatTime(hours=12, minutes=60, seconds=5) returns "12:60:05"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0187 begin`);
      const actual: string = formatTime(12, 60, 5);
      logInfo(`formatTime(hours=12, minutes=60, seconds=5): actual=${actual}`);
      expect(actual).assertEqual('12:60:05');
      logInfo(`${BUNDLE}FormatTime_0187 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0188
     * @tc.name      FormExtAbility_FormatTime_0188
     * @tc.desc      formatTime(hours=12, minutes=141, seconds=1) returns "12:141:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0188 begin`);
      const actual: string = formatTime(12, 141, 1);
      logInfo(`formatTime(hours=12, minutes=141, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('12:141:01');
      logInfo(`${BUNDLE}FormatTime_0188 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0189
     * @tc.name      FormExtAbility_FormatTime_0189
     * @tc.desc      formatTime(hours=24, minutes=60, seconds=1) returns "24:60:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0189 begin`);
      const actual: string = formatTime(24, 60, 1);
      logInfo(`formatTime(hours=24, minutes=60, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('24:60:01');
      logInfo(`${BUNDLE}FormatTime_0189 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0190
     * @tc.name      FormExtAbility_FormatTime_0190
     * @tc.desc      formatTime(hours=117, minutes=1, seconds=1) returns "117:01:01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0190 begin`);
      const actual: string = formatTime(117, 1, 1);
      logInfo(`formatTime(hours=117, minutes=1, seconds=1): actual=${actual}`);
      expect(actual).assertEqual('117:01:01');
      logInfo(`${BUNDLE}FormatTime_0190 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0191
     * @tc.name      FormExtAbility_FormatTime_0191
     * @tc.desc      formatTime(hours=117, minutes=30, seconds=59) returns "117:30:59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormatTime_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormatTime_0191 begin`);
      const actual: string = formatTime(117, 30, 59);
      logInfo(`formatTime(hours=117, minutes=30, seconds...: actual=${actual}`);
      expect(actual).assertEqual('117:30:59');
      logInfo(`${BUNDLE}FormatTime_0191 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORMAT_TIME_0192
     * @tc.name      FormExtAbility_FormatTime_0192
     * @tc.desc      formatTime(hours=100, minutes=-1, seconds=100) returns "100:0-1:100"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_FormatTime_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}FormatTime_0192 begin`);
      const actual: string = formatTime(100, -1, 100);
      logInfo(`formatTime(hours=100, minutes=-1, seconds...: actual=${actual}`);
      expect(actual).assertEqual('100:0-1:100');
      logInfo(`${BUNDLE}FormatTime_0192 end`);
    });
  });
}
