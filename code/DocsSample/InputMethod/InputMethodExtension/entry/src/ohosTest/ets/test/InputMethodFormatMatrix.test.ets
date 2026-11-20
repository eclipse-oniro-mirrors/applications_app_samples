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

import { describe, expect, it } from '@ohos/hypium';
import {
  describeStatusWithCode,
  formatDateTime,
  formatDuration,
  formatTime,
  pad2,
  truncateMiddle
} from '../../../main/ets/utils/FormatUtil';

/**
 * 格式化矩阵：补零、时间、时长分桶、中段截断。
 * 每条只压一个判定边界（两位/三位补零、59.999 s 的向上取整、预算 4/5/6/7 的取整方向），
 * 断言全部落在 main/ets/utils/FormatUtil 的真实实现上，期望值按代码分支手算。
 */
export default function inputMethodFormatMatrixTest() {
  describe('InputMethodFormatMatrixTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0100
     * @tc.name testFormatMatrix0001
     * @tc.desc Verify every single digit is padded to two characters so the time text keeps a fixed width.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0001', 0, () => {
      expect(pad2(0)).assertEqual('00');
      expect(pad2(1)).assertEqual('01');
      expect(pad2(9)).assertEqual('09');
      expect(pad2(5).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0200
     * @tc.name testFormatMatrix0002
     * @tc.desc Verify values that already have two digits are returned as is without an extra zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0002', 0, () => {
      expect(pad2(10)).assertEqual('10');
      expect(pad2(42)).assertEqual('42');
      expect(pad2(59)).assertEqual('59');
      expect(pad2(10).startsWith('0')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0300
     * @tc.name testFormatMatrix0003
     * @tc.desc Verify three and four digit values are not truncated, which would happen if the code sliced the text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0003', 0, () => {
      expect(pad2(100)).assertEqual('100');
      expect(pad2(1234)).assertEqual('1234');
      expect(pad2(100).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0400
     * @tc.name testFormatMatrix0004
     * @tc.desc Verify a negative value keeps its sign in the text instead of being clamped or losing the minus.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0004', 0, () => {
      expect(pad2(-1)).assertEqual('0-1');
      expect(pad2(-10)).assertEqual('0-10');
      expect(pad2(-1).includes('-')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0500
     * @tc.name testFormatMatrix0005
     * @tc.desc Verify the first second of a day renders as 00:00:00 with three colon separated groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0005', 0, () => {
      const text = formatTime(new Date(2026, 0, 1, 0, 0, 0));
      expect(text).assertEqual('00:00:00');
      expect(text.length).assertEqual(8);
      expect(text.split(':').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0600
     * @tc.name testFormatMatrix0006
     * @tc.desc Verify the last second of a day is rendered literally without rolling over to the next day.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0006', 0, () => {
      expect(formatTime(new Date(2026, 11, 31, 23, 59, 59))).assertEqual('23:59:59');
      expect(formatTime(new Date(2026, 11, 31, 23, 0, 0))).assertEqual('23:00:00');
      expect(formatTime(new Date(2026, 11, 31, 23, 59, 59)).startsWith('23')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0700
     * @tc.name testFormatMatrix0007
     * @tc.desc Verify hour minute and second each get their own zero padding in one string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0007', 0, () => {
      const text = formatTime(new Date(2026, 5, 15, 9, 8, 7));
      expect(text).assertEqual('09:08:07');
      expect(text.includes(':08:')).assertTrue();
      expect(text.endsWith(':07')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0800
     * @tc.name testFormatMatrix0008
     * @tc.desc Verify the first day of a year renders with a padded month and day next to the time.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0008', 0, () => {
      const text = formatDateTime(new Date(2026, 0, 1, 0, 0, 0));
      expect(text).assertEqual('2026-01-01 00:00:00');
      expect(text.startsWith('2026-01-')).assertTrue();
      expect(text.includes(' ')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_0900
     * @tc.name testFormatMatrix0009
     * @tc.desc Verify December 31st keeps month twelve, catching the classic month minus one mistake.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0009', 0, () => {
      expect(formatDateTime(new Date(2026, 11, 31, 23, 59, 59))).assertEqual('2026-12-31 23:59:59');
      expect(formatDateTime(new Date(2026, 11, 1, 0, 0, 0))).assertEqual('2026-12-01 00:00:00');
      expect(formatDateTime(new Date(2026, 11, 31, 23, 59, 59)).includes('-12-')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1000
     * @tc.name testFormatMatrix0010
     * @tc.desc Verify September the ninth keeps both its leading zeros in the date part.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0010', 0, () => {
      const text = formatDateTime(new Date(1999, 8, 9, 1, 2, 3));
      expect(text).assertEqual('1999-09-09 01:02:03');
      expect(text.includes('-09-09')).assertTrue();
      expect(text.startsWith('1999')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1100
     * @tc.name testFormatMatrix0011
     * @tc.desc Verify the millisecond bucket ends at 999 while 1000 switches to the seconds bucket.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0011', 0, () => {
      expect(formatDuration(1)).assertEqual('1 ms');
      expect(formatDuration(999)).assertEqual('999 ms');
      expect(formatDuration(1000)).assertEqual('1.0 s');
      expect(formatDuration(999).endsWith('ms')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1200
     * @tc.name testFormatMatrix0012
     * @tc.desc Verify the seconds bucket keeps a single decimal so 1001 and 1499 both round down visually.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0012', 0, () => {
      expect(formatDuration(1001)).assertEqual('1.0 s');
      expect(formatDuration(1499)).assertEqual('1.5 s');
      expect(formatDuration(1500)).assertEqual('1.5 s');
      expect(formatDuration(1234)).assertEqual('1.2 s');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1300
     * @tc.name testFormatMatrix0013
     * @tc.desc Verify 59999 ms still uses the seconds bucket and prints 60.0 s rather than a minute.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0013', 0, () => {
      expect(formatDuration(59000)).assertEqual('59.0 s');
      expect(formatDuration(59999)).assertEqual('60.0 s');
      expect(formatDuration(59999).includes('min')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1400
     * @tc.name testFormatMatrix0014
     * @tc.desc Verify the minute bucket floors seconds, so 119999 ms stays at one minute fifty nine seconds.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0014', 0, () => {
      expect(formatDuration(60000)).assertEqual('1 min 0 s');
      expect(formatDuration(61000)).assertEqual('1 min 1 s');
      expect(formatDuration(119999)).assertEqual('1 min 59 s');
      expect(formatDuration(119999).startsWith('1 min')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1500
     * @tc.name testFormatMatrix0015
     * @tc.desc Verify the minute bucket does not roll into hours, which is what the page label promises.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0015', 0, () => {
      expect(formatDuration(3599999)).assertEqual('59 min 59 s');
      expect(formatDuration(3600000)).assertEqual('60 min 0 s');
      expect(formatDuration(86400000)).assertEqual('1440 min 0 s');
      expect(formatDuration(86400000).includes('h')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1600
     * @tc.name testFormatMatrix0016
     * @tc.desc Verify zero and negative durations render as zero milliseconds without a minus sign.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0016', 0, () => {
      expect(formatDuration(0)).assertEqual('0 ms');
      expect(formatDuration(-1)).assertEqual('0 ms');
      expect(formatDuration(-60000)).assertEqual('0 ms');
      expect(formatDuration(-1).includes('-')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1700
     * @tc.name testFormatMatrix0017
     * @tc.desc Verify a budget of three or less returns the original text, so the ellipsis never eats the content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0017', 0, () => {
      expect(truncateMiddle('abcdef', 3)).assertEqual('abcdef');
      expect(truncateMiddle('abcdef', 2)).assertEqual('abcdef');
      expect(truncateMiddle('abcdef', 0)).assertEqual('abcdef');
      expect(truncateMiddle('abcdef', -5)).assertEqual('abcdef');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1800
     * @tc.name testFormatMatrix0018
     * @tc.desc Verify text at or below the budget is returned unchanged including the empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0018', 0, () => {
      expect(truncateMiddle('abcde', 5)).assertEqual('abcde');
      expect(truncateMiddle('abcd', 5)).assertEqual('abcd');
      expect(truncateMiddle('', 5)).assertEqual('');
      expect(truncateMiddle('abcde', 5).includes('…')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_1900
     * @tc.name testFormatMatrix0019
     * @tc.desc Verify an even budget splits the kept characters evenly around one ellipsis character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0019', 0, () => {
      expect(truncateMiddle('abcdef', 4)).assertEqual('ab…f');
      expect(truncateMiddle('abcdefghij', 6)).assertEqual('abc…ij');
      expect(truncateMiddle('abcdef', 4).length).assertEqual(4);
      expect(truncateMiddle('abcdefghij', 6).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_2000
     * @tc.name testFormatMatrix0020
     * @tc.desc Verify an odd budget gives the extra character to the head side and still fills the budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0020', 0, () => {
      expect(truncateMiddle('abcdef', 5)).assertEqual('ab…ef');
      expect(truncateMiddle('abcdefghij', 7)).assertEqual('abc…hij');
      expect(truncateMiddle('abcdef', 5).length).assertEqual(5);
      expect(truncateMiddle('abcdefghij', 7).endsWith('hij')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_2100
     * @tc.name testFormatMatrix0021
     * @tc.desc Verify CJK text is cut by code unit the same way ASCII is, keeping the ellipsis in the middle.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0021', 0, () => {
      expect(truncateMiddle('中文字符串', 4)).assertEqual('中文…串');
      expect(truncateMiddle('中文', 4)).assertEqual('中文');
      expect(truncateMiddle('中文字符串', 4).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_2200
     * @tc.name testFormatMatrix0022
     * @tc.desc Verify a text made of surrogate pairs stays untouched while its code unit length fits the budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0022', 0, () => {
      expect('😀😀'.length).assertEqual(4);
      expect(truncateMiddle('😀😀', 4)).assertEqual('😀😀');
      expect(truncateMiddle('😀😀', 4).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_2300
     * @tc.name testFormatMatrix0023
     * @tc.desc Verify a zero code is dropped from the label so未开始 and success never print a bracket.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0023', 0, () => {
      expect(describeStatusWithCode('未开始', 0)).assertEqual('未开始');
      expect(describeStatusWithCode('成功', 0)).assertEqual('成功');
      expect(describeStatusWithCode('成功', 0).includes('（')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_2400
     * @tc.name testFormatMatrix0024
     * @tc.desc Verify the local placeholder codes are printed, keeping a silent failure visible on the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0024', 0, () => {
      expect(describeStatusWithCode('失败', -1)).assertEqual('失败（-1）');
      expect(describeStatusWithCode('超时', -3)).assertEqual('超时（-3）');
      expect(describeStatusWithCode('失败', -1).endsWith('（-1）')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FMT_2500
     * @tc.name testFormatMatrix0025
     * @tc.desc Verify an empty status still prints the code alone instead of returning an empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFormatMatrix0025', 0, () => {
      expect(describeStatusWithCode('', 0)).assertEqual('');
      expect(describeStatusWithCode('', 401)).assertEqual('（401）');
      expect(describeStatusWithCode('', 401).length).assertEqual(5);
    });
  });
}
