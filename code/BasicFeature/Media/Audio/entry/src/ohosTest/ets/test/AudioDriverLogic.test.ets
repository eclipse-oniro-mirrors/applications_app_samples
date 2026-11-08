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
import { parseSeconds, isSortedByLength, uniqueCount, TIME_PATTERN } from './shared/AudioDriver';

/**
 * 共享驱动纯函数（设备无关）
 *
 * 计时解析、文本长度有序判断、去重计数与计时格式正则是录制/列表断言的基础，
 * 这里直接对真实实现做确定性校验，不依赖设备、不涉及时序，执行快且稳定。
 */
export default function audioDriverLogicTest() {
  describe('audioDriverLogicTest', () => {
    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_0100
     * @tc.name parseSecondsZeroAndSmall
     * @tc.desc Verify parseSeconds maps zero and sub-minute time strings to the exact seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('parseSecondsZeroAndSmall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(parseSeconds('00:00:00')).assertEqual(0);
      expect(parseSeconds('00:00:05')).assertEqual(5);
      expect(parseSeconds('00:00:59')).assertEqual(59);
      expect(parseSeconds('00:01:00')).assertEqual(60);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_0200
     * @tc.name parseSecondsMinuteAndHour
     * @tc.desc Verify parseSeconds combines hour, minute and second components correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('parseSecondsMinuteAndHour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(parseSeconds('00:02:30')).assertEqual(150);
      expect(parseSeconds('01:00:00')).assertEqual(3600);
      expect(parseSeconds('01:02:03')).assertEqual(3723);
      expect(parseSeconds('10:00:00')).assertEqual(36000);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_0300
     * @tc.name parseSecondsLargeValues
     * @tc.desc Verify parseSeconds keeps the exact arithmetic for large time strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('parseSecondsLargeValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(parseSeconds('59:59:59')).assertEqual(215999);
      expect(parseSeconds('99:99:99')).assertEqual(362439);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_0400
     * @tc.name parseSecondsInvalidShape
     * @tc.desc Verify parseSeconds returns minus one for malformed or non HH:mm:ss strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('parseSecondsInvalidShape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(parseSeconds('')).assertEqual(-1);
      expect(parseSeconds('00:00')).assertEqual(-1);
      expect(parseSeconds('5:03')).assertEqual(-1);
      expect(parseSeconds('00:00:00:00')).assertEqual(-1);
      expect(parseSeconds('aa:bb:cc')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_0500
     * @tc.name timePatternShape
     * @tc.desc Verify the time pattern accepts HH:mm:ss digits and rejects other shapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('timePatternShape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(TIME_PATTERN.test('00:00:00')).assertTrue();
      expect(TIME_PATTERN.test('12:34:56')).assertTrue();
      expect(TIME_PATTERN.test('1:2:3')).assertFalse();
      expect(TIME_PATTERN.test('00:00')).assertFalse();
      expect(TIME_PATTERN.test('aa:bb:cc')).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_0600
     * @tc.name sortedByLengthTrueCases
     * @tc.desc Verify isSortedByLength accepts empty, single and non-decreasing length lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('sortedByLengthTrueCases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(isSortedByLength([])).assertTrue();
      expect(isSortedByLength(['a'])).assertTrue();
      expect(isSortedByLength(['a', 'bb', 'ccc'])).assertTrue();
      expect(isSortedByLength(['ab', 'cd', 'ef'])).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_0700
     * @tc.name sortedByLengthFalseCases
     * @tc.desc Verify isSortedByLength rejects lists whose length decreases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sortedByLengthFalseCases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(isSortedByLength(['bb', 'a'])).assertFalse();
      expect(isSortedByLength(['a', 'bb', 'c'])).assertFalse();
      expect(isSortedByLength(['ccc', 'bb', 'a'])).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_0800
     * @tc.name uniqueCountCases
     * @tc.desc Verify uniqueCount counts distinct values including empty and CJK strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('uniqueCountCases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(uniqueCount([])).assertEqual(0);
      expect(uniqueCount(['a', 'a', 'b'])).assertEqual(2);
      expect(uniqueCount(['x', 'y', 'z'])).assertEqual(3);
      expect(uniqueCount(['', ''])).assertEqual(1);
      expect(uniqueCount(['张', '张', '李'])).assertEqual(2);
    });
  });
}
