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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { parseSeconds, uniqueCount, isSortedByLength, TIME_PATTERN } from './shared/AudioDriver';

/**
 * 共享驱动纯函数补充二（设备无关）
 *
 * 追加计时解析、时间正则、去重计数与长度有序的确定性边界，全部为纯函数，
 * 不依赖 UiTest 与音频硬件，执行快且不涉时序。
 */
export default function audioDriverLogicMoreTest() {
  describe('audioDriverLogicMoreTest', () => {
    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0100
     * @tc.name parseSecondsMinuteRange
     * @tc.desc Verify minute-level time strings convert to the exact total seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('parseSecondsMinuteRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(parseSeconds('00:10:00')).assertEqual(600);
      expect(parseSeconds('00:30:00')).assertEqual(1800);
      expect(parseSeconds('00:59:59')).assertEqual(3599);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0200
     * @tc.name parseSecondsHourRange
     * @tc.desc Verify hour-level time strings convert to the exact total seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('parseSecondsHourRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(parseSeconds('05:06:07')).assertEqual(18367);
      expect(parseSeconds('12:00:00')).assertEqual(43200);
      expect(parseSeconds('23:59:59')).assertEqual(86399);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0300
     * @tc.name parseSecondsSeparatorOnlyRejected
     * @tc.desc Verify separator-only strings are rejected as malformed times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('parseSecondsSeparatorOnlyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(parseSeconds(':')).assertEqual(-1);
      expect(parseSeconds('::')).assertEqual(-1);
      expect(parseSeconds(':::')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0400
     * @tc.name parseSecondsMixedWidthRejected
     * @tc.desc Verify mixed one/two digit fields are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('parseSecondsMixedWidthRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(parseSeconds('1:02:03')).assertEqual(-1);
      expect(parseSeconds('01:2:03')).assertEqual(-1);
      expect(parseSeconds('01:02:3')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0500
     * @tc.name timePatternRejectsNonDigit
     * @tc.desc Verify the time pattern rejects non-digit and wrong-width forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('timePatternRejectsNonDigit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(TIME_PATTERN.test('00:00:0a')).assertFalse();
      expect(TIME_PATTERN.test('100:00:00')).assertFalse();
      expect(TIME_PATTERN.test('00-00-00')).assertFalse();
      expect(TIME_PATTERN.test('0 0:00:00')).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0600
     * @tc.name uniqueCountWhitespaceDistinct
     * @tc.desc Verify whitespace strings are counted as distinct values from each other and empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('uniqueCountWhitespaceDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(uniqueCount([' ', '  ', '\t'])).assertEqual(3);
      expect(uniqueCount(['', ' '])).assertEqual(2);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0700
     * @tc.name uniqueCountCaseSensitive
     * @tc.desc Verify unique counting treats upper and lower case as distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('uniqueCountCaseSensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(uniqueCount(['a', 'A'])).assertEqual(2);
      expect(uniqueCount(['张', '张'])).assertEqual(1);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0800
     * @tc.name uniqueCountNumericStrings
     * @tc.desc Verify numeric-looking strings compare as text rather than numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('uniqueCountNumericStrings', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(uniqueCount(['1', '01', '1'])).assertEqual(2);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_0900
     * @tc.name sortedByLengthEmptyStrings
     * @tc.desc Verify empty strings participate in length ordering correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sortedByLengthEmptyStrings', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(isSortedByLength(['', 'a'])).assertTrue();
      expect(isSortedByLength(['a', ''])).assertFalse();
      expect(isSortedByLength(['', ''])).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_MORE_1000
     * @tc.name sortedByLengthTwoElements
     * @tc.desc Verify two-element ordering follows increasing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sortedByLengthTwoElements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(isSortedByLength(['aa', 'b'])).assertFalse();
      expect(isSortedByLength(['b', 'aa'])).assertTrue();
    });
  });
}
