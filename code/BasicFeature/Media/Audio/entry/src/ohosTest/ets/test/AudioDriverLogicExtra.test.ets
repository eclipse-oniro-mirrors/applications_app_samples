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
import { parseSeconds, uniqueCount, isSortedByLength } from './shared/AudioDriver';

function repeated(value: string, count: number): string[] {
  const list: string[] = [];
  for (let i = 0; i < count; i++) {
    list.push(value);
  }
  return list;
}

/**
 * 共享驱动纯函数补充（设备无关）
 *
 * 补充计时解析的空白/位数边界，以及去重计数与有序判断在较大集合下的行为。
 * 纯函数、确定性，执行快且稳定。
 */
export default function audioDriverLogicExtraTest() {
  describe('audioDriverLogicExtraTest', () => {
    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_EXTRA_0100
     * @tc.name parseSecondsRejectsSurroundingSpaces
     * @tc.desc Verify time strings with leading or trailing spaces are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('parseSecondsRejectsSurroundingSpaces', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(parseSeconds(' 00:00:00')).assertEqual(-1);
      expect(parseSeconds('00:00:00 ')).assertEqual(-1);
      expect(parseSeconds('\t00:00:00')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_EXTRA_0200
     * @tc.name parseSecondsRejectsWrongDigitWidths
     * @tc.desc Verify non two-digit hour/minute/second fields are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('parseSecondsRejectsWrongDigitWidths', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(parseSeconds('000:00:00')).assertEqual(-1);
      expect(parseSeconds('00:0:00')).assertEqual(-1);
      expect(parseSeconds('00:00:0')).assertEqual(-1);
      expect(parseSeconds('0:0:0')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_EXTRA_0300
     * @tc.name uniqueCountHundredIdentical
     * @tc.desc Verify one hundred identical values collapse to a single unique count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('uniqueCountHundredIdentical', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(uniqueCount(repeated('same', 100))).assertEqual(1);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_EXTRA_0400
     * @tc.name uniqueCountHundredDistinct
     * @tc.desc Verify one hundred distinct values keep a unique count of one hundred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('uniqueCountHundredDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: string[] = [];
      for (let i = 0; i < 100; i++) {
        values.push(`v${i}`);
      }
      expect(uniqueCount(values)).assertEqual(100);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_EXTRA_0500
     * @tc.name uniqueCountMixedEmojiAndCjk
     * @tc.desc Verify unique counting handles emoji and CJK values without splitting them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('uniqueCountMixedEmojiAndCjk', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(uniqueCount(['😀', '😀', '张', '张', '张'])).assertEqual(2);
      expect(uniqueCount(['😀', '张', '张'])).assertEqual(2);
    });

    /**
     * @tc.number SUB_AUDIO_DRIVER_LOGIC_EXTRA_0600
     * @tc.name sortedByLengthEqualAndDecreasing
     * @tc.desc Verify equal-length runs stay sorted while a shorter tail breaks ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sortedByLengthEqualAndDecreasing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(isSortedByLength(['aa', 'bb', 'ccc', 'dddd'])).assertTrue();
      expect(isSortedByLength(['abcd', 'abc'])).assertFalse();
      expect(isSortedByLength(['ab', 'ab', 'ab'])).assertTrue();
    });
  });
}
