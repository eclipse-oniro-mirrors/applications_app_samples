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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ContactLetterComparator } from '../../../main/ets/utils/ContactLetterComparator';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function compareVolume02Test() {
  describe('CompareVolume02Test', () => {

    /**
     * @tc.name   testCompareVolume02Anchor01
     * @tc.number SUB_Contact_CMPR_0077
     * @tc.desc   大小写码元序：小写 a 大于大写 A
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume02Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume02Anchor01 begin');
      const lowerVsUpper: number = ContactLetterComparator.compare('a', 'A');
      const upperVsLower: number = ContactLetterComparator.compare('A', 'a');
      const sameCase: number = ContactLetterComparator.compare('a', 'a');
      expect(lowerVsUpper).assertEqual(1);
      expect(upperVsLower).assertEqual(-1);
      expect(sameCase).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume02Anchor01 end');
    });
    /**
     * @tc.name   testCompareVolume020078
     * @tc.number SUB_Contact_CMPR_0078
     * @tc.desc   大小写：a(97+0) 对 A(65)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020078 begin');
      const reverseResult: number = ContactLetterComparator.compare('A', 'a');
      const selfResult: number = ContactLetterComparator.compare('a', 'a');
      const result: number = ContactLetterComparator.compare('a', 'A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020078 end');
    });

    /**
     * @tc.name   testCompareVolume020079
     * @tc.number SUB_Contact_CMPR_0079
     * @tc.desc   大写自反：A 对 A
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020079 begin');
      const reverseResult: number = ContactLetterComparator.compare('A', 'A');
      const selfResult: number = ContactLetterComparator.compare('A', 'A');
      const result: number = ContactLetterComparator.compare('A', 'A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020079 end');
    });

    /**
     * @tc.name   testCompareVolume020080
     * @tc.number SUB_Contact_CMPR_0080
     * @tc.desc   大小写：b(97+1) 对 B(66)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020080 begin');
      const reverseResult: number = ContactLetterComparator.compare('B', 'b');
      const selfResult: number = ContactLetterComparator.compare('b', 'b');
      const result: number = ContactLetterComparator.compare('b', 'B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020080 end');
    });

    /**
     * @tc.name   testCompareVolume020081
     * @tc.number SUB_Contact_CMPR_0081
     * @tc.desc   大写自反：B 对 B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020081 begin');
      const reverseResult: number = ContactLetterComparator.compare('B', 'B');
      const selfResult: number = ContactLetterComparator.compare('B', 'B');
      const result: number = ContactLetterComparator.compare('B', 'B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020081 end');
    });

    /**
     * @tc.name   testCompareVolume020082
     * @tc.number SUB_Contact_CMPR_0082
     * @tc.desc   大小写：c(97+2) 对 C(67)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020082 begin');
      const reverseResult: number = ContactLetterComparator.compare('C', 'c');
      const selfResult: number = ContactLetterComparator.compare('c', 'c');
      const result: number = ContactLetterComparator.compare('c', 'C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020082 end');
    });

    /**
     * @tc.name   testCompareVolume020083
     * @tc.number SUB_Contact_CMPR_0083
     * @tc.desc   大写自反：C 对 C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020083 begin');
      const reverseResult: number = ContactLetterComparator.compare('C', 'C');
      const selfResult: number = ContactLetterComparator.compare('C', 'C');
      const result: number = ContactLetterComparator.compare('C', 'C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020083 end');
    });

    /**
     * @tc.name   testCompareVolume020084
     * @tc.number SUB_Contact_CMPR_0084
     * @tc.desc   大小写：d(97+3) 对 D(68)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020084 begin');
      const reverseResult: number = ContactLetterComparator.compare('D', 'd');
      const selfResult: number = ContactLetterComparator.compare('d', 'd');
      const result: number = ContactLetterComparator.compare('d', 'D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020084 end');
    });

    /**
     * @tc.name   testCompareVolume020085
     * @tc.number SUB_Contact_CMPR_0085
     * @tc.desc   大写自反：D 对 D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020085 begin');
      const reverseResult: number = ContactLetterComparator.compare('D', 'D');
      const selfResult: number = ContactLetterComparator.compare('D', 'D');
      const result: number = ContactLetterComparator.compare('D', 'D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020085 end');
    });

    /**
     * @tc.name   testCompareVolume020086
     * @tc.number SUB_Contact_CMPR_0086
     * @tc.desc   大小写：e(97+4) 对 E(69)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020086 begin');
      const reverseResult: number = ContactLetterComparator.compare('E', 'e');
      const selfResult: number = ContactLetterComparator.compare('e', 'e');
      const result: number = ContactLetterComparator.compare('e', 'E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020086 end');
    });

    /**
     * @tc.name   testCompareVolume020087
     * @tc.number SUB_Contact_CMPR_0087
     * @tc.desc   大写自反：E 对 E
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020087 begin');
      const reverseResult: number = ContactLetterComparator.compare('E', 'E');
      const selfResult: number = ContactLetterComparator.compare('E', 'E');
      const result: number = ContactLetterComparator.compare('E', 'E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020087 end');
    });

    /**
     * @tc.name   testCompareVolume020088
     * @tc.number SUB_Contact_CMPR_0088
     * @tc.desc   大小写：f(97+5) 对 F(70)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020088 begin');
      const reverseResult: number = ContactLetterComparator.compare('F', 'f');
      const selfResult: number = ContactLetterComparator.compare('f', 'f');
      const result: number = ContactLetterComparator.compare('f', 'F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020088 end');
    });

    /**
     * @tc.name   testCompareVolume020089
     * @tc.number SUB_Contact_CMPR_0089
     * @tc.desc   大写自反：F 对 F
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020089 begin');
      const reverseResult: number = ContactLetterComparator.compare('F', 'F');
      const selfResult: number = ContactLetterComparator.compare('F', 'F');
      const result: number = ContactLetterComparator.compare('F', 'F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020089 end');
    });

    /**
     * @tc.name   testCompareVolume020090
     * @tc.number SUB_Contact_CMPR_0090
     * @tc.desc   大小写：g(97+6) 对 G(71)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020090 begin');
      const reverseResult: number = ContactLetterComparator.compare('G', 'g');
      const selfResult: number = ContactLetterComparator.compare('g', 'g');
      const result: number = ContactLetterComparator.compare('g', 'G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020090 end');
    });

    /**
     * @tc.name   testCompareVolume020091
     * @tc.number SUB_Contact_CMPR_0091
     * @tc.desc   大写自反：G 对 G
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020091 begin');
      const reverseResult: number = ContactLetterComparator.compare('G', 'G');
      const selfResult: number = ContactLetterComparator.compare('G', 'G');
      const result: number = ContactLetterComparator.compare('G', 'G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020091 end');
    });

    /**
     * @tc.name   testCompareVolume020092
     * @tc.number SUB_Contact_CMPR_0092
     * @tc.desc   大小写：h(97+7) 对 H(72)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020092 begin');
      const reverseResult: number = ContactLetterComparator.compare('H', 'h');
      const selfResult: number = ContactLetterComparator.compare('h', 'h');
      const result: number = ContactLetterComparator.compare('h', 'H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020092 end');
    });

    /**
     * @tc.name   testCompareVolume020093
     * @tc.number SUB_Contact_CMPR_0093
     * @tc.desc   大写自反：H 对 H
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020093 begin');
      const reverseResult: number = ContactLetterComparator.compare('H', 'H');
      const selfResult: number = ContactLetterComparator.compare('H', 'H');
      const result: number = ContactLetterComparator.compare('H', 'H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020093 end');
    });

    /**
     * @tc.name   testCompareVolume020094
     * @tc.number SUB_Contact_CMPR_0094
     * @tc.desc   大小写：i(97+8) 对 I(73)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020094 begin');
      const reverseResult: number = ContactLetterComparator.compare('I', 'i');
      const selfResult: number = ContactLetterComparator.compare('i', 'i');
      const result: number = ContactLetterComparator.compare('i', 'I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020094 end');
    });

    /**
     * @tc.name   testCompareVolume020095
     * @tc.number SUB_Contact_CMPR_0095
     * @tc.desc   大写自反：I 对 I
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020095 begin');
      const reverseResult: number = ContactLetterComparator.compare('I', 'I');
      const selfResult: number = ContactLetterComparator.compare('I', 'I');
      const result: number = ContactLetterComparator.compare('I', 'I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020095 end');
    });

    /**
     * @tc.name   testCompareVolume020096
     * @tc.number SUB_Contact_CMPR_0096
     * @tc.desc   大小写：j(97+9) 对 J(74)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020096 begin');
      const reverseResult: number = ContactLetterComparator.compare('J', 'j');
      const selfResult: number = ContactLetterComparator.compare('j', 'j');
      const result: number = ContactLetterComparator.compare('j', 'J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020096 end');
    });

    /**
     * @tc.name   testCompareVolume020097
     * @tc.number SUB_Contact_CMPR_0097
     * @tc.desc   大写自反：J 对 J
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020097 begin');
      const reverseResult: number = ContactLetterComparator.compare('J', 'J');
      const selfResult: number = ContactLetterComparator.compare('J', 'J');
      const result: number = ContactLetterComparator.compare('J', 'J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020097 end');
    });

    /**
     * @tc.name   testCompareVolume020098
     * @tc.number SUB_Contact_CMPR_0098
     * @tc.desc   大小写：k(97+10) 对 K(75)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020098 begin');
      const reverseResult: number = ContactLetterComparator.compare('K', 'k');
      const selfResult: number = ContactLetterComparator.compare('k', 'k');
      const result: number = ContactLetterComparator.compare('k', 'K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020098 end');
    });

    /**
     * @tc.name   testCompareVolume020099
     * @tc.number SUB_Contact_CMPR_0099
     * @tc.desc   大写自反：K 对 K
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020099 begin');
      const reverseResult: number = ContactLetterComparator.compare('K', 'K');
      const selfResult: number = ContactLetterComparator.compare('K', 'K');
      const result: number = ContactLetterComparator.compare('K', 'K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020099 end');
    });

    /**
     * @tc.name   testCompareVolume020100
     * @tc.number SUB_Contact_CMPR_0100
     * @tc.desc   大小写：l(97+11) 对 L(76)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020100 begin');
      const reverseResult: number = ContactLetterComparator.compare('L', 'l');
      const selfResult: number = ContactLetterComparator.compare('l', 'l');
      const result: number = ContactLetterComparator.compare('l', 'L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020100 end');
    });

    /**
     * @tc.name   testCompareVolume020101
     * @tc.number SUB_Contact_CMPR_0101
     * @tc.desc   大写自反：L 对 L
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020101 begin');
      const reverseResult: number = ContactLetterComparator.compare('L', 'L');
      const selfResult: number = ContactLetterComparator.compare('L', 'L');
      const result: number = ContactLetterComparator.compare('L', 'L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020101 end');
    });

    /**
     * @tc.name   testCompareVolume020102
     * @tc.number SUB_Contact_CMPR_0102
     * @tc.desc   大小写：m(97+12) 对 M(77)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020102 begin');
      const reverseResult: number = ContactLetterComparator.compare('M', 'm');
      const selfResult: number = ContactLetterComparator.compare('m', 'm');
      const result: number = ContactLetterComparator.compare('m', 'M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020102 end');
    });

    /**
     * @tc.name   testCompareVolume020103
     * @tc.number SUB_Contact_CMPR_0103
     * @tc.desc   大写自反：M 对 M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020103 begin');
      const reverseResult: number = ContactLetterComparator.compare('M', 'M');
      const selfResult: number = ContactLetterComparator.compare('M', 'M');
      const result: number = ContactLetterComparator.compare('M', 'M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020103 end');
    });

    /**
     * @tc.name   testCompareVolume020104
     * @tc.number SUB_Contact_CMPR_0104
     * @tc.desc   大小写：n(97+13) 对 N(78)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020104 begin');
      const reverseResult: number = ContactLetterComparator.compare('N', 'n');
      const selfResult: number = ContactLetterComparator.compare('n', 'n');
      const result: number = ContactLetterComparator.compare('n', 'N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020104 end');
    });

    /**
     * @tc.name   testCompareVolume020105
     * @tc.number SUB_Contact_CMPR_0105
     * @tc.desc   大写自反：N 对 N
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020105 begin');
      const reverseResult: number = ContactLetterComparator.compare('N', 'N');
      const selfResult: number = ContactLetterComparator.compare('N', 'N');
      const result: number = ContactLetterComparator.compare('N', 'N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020105 end');
    });

    /**
     * @tc.name   testCompareVolume020106
     * @tc.number SUB_Contact_CMPR_0106
     * @tc.desc   大小写：o(97+14) 对 O(79)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020106 begin');
      const reverseResult: number = ContactLetterComparator.compare('O', 'o');
      const selfResult: number = ContactLetterComparator.compare('o', 'o');
      const result: number = ContactLetterComparator.compare('o', 'O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020106 end');
    });

    /**
     * @tc.name   testCompareVolume020107
     * @tc.number SUB_Contact_CMPR_0107
     * @tc.desc   大写自反：O 对 O
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020107 begin');
      const reverseResult: number = ContactLetterComparator.compare('O', 'O');
      const selfResult: number = ContactLetterComparator.compare('O', 'O');
      const result: number = ContactLetterComparator.compare('O', 'O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020107 end');
    });

    /**
     * @tc.name   testCompareVolume020108
     * @tc.number SUB_Contact_CMPR_0108
     * @tc.desc   大小写：p(97+15) 对 P(80)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020108 begin');
      const reverseResult: number = ContactLetterComparator.compare('P', 'p');
      const selfResult: number = ContactLetterComparator.compare('p', 'p');
      const result: number = ContactLetterComparator.compare('p', 'P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020108 end');
    });

    /**
     * @tc.name   testCompareVolume020109
     * @tc.number SUB_Contact_CMPR_0109
     * @tc.desc   大写自反：P 对 P
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020109 begin');
      const reverseResult: number = ContactLetterComparator.compare('P', 'P');
      const selfResult: number = ContactLetterComparator.compare('P', 'P');
      const result: number = ContactLetterComparator.compare('P', 'P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020109 end');
    });

    /**
     * @tc.name   testCompareVolume020110
     * @tc.number SUB_Contact_CMPR_0110
     * @tc.desc   大小写：q(97+16) 对 Q(81)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020110 begin');
      const reverseResult: number = ContactLetterComparator.compare('Q', 'q');
      const selfResult: number = ContactLetterComparator.compare('q', 'q');
      const result: number = ContactLetterComparator.compare('q', 'Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020110 end');
    });

    /**
     * @tc.name   testCompareVolume020111
     * @tc.number SUB_Contact_CMPR_0111
     * @tc.desc   大写自反：Q 对 Q
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020111 begin');
      const reverseResult: number = ContactLetterComparator.compare('Q', 'Q');
      const selfResult: number = ContactLetterComparator.compare('Q', 'Q');
      const result: number = ContactLetterComparator.compare('Q', 'Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020111 end');
    });

    /**
     * @tc.name   testCompareVolume020112
     * @tc.number SUB_Contact_CMPR_0112
     * @tc.desc   大小写：r(97+17) 对 R(82)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020112 begin');
      const reverseResult: number = ContactLetterComparator.compare('R', 'r');
      const selfResult: number = ContactLetterComparator.compare('r', 'r');
      const result: number = ContactLetterComparator.compare('r', 'R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020112 end');
    });

    /**
     * @tc.name   testCompareVolume020113
     * @tc.number SUB_Contact_CMPR_0113
     * @tc.desc   大写自反：R 对 R
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020113 begin');
      const reverseResult: number = ContactLetterComparator.compare('R', 'R');
      const selfResult: number = ContactLetterComparator.compare('R', 'R');
      const result: number = ContactLetterComparator.compare('R', 'R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020113 end');
    });

    /**
     * @tc.name   testCompareVolume020114
     * @tc.number SUB_Contact_CMPR_0114
     * @tc.desc   大小写：s(97+18) 对 S(83)，小写码元更大
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume020114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020114 begin');
      const reverseResult: number = ContactLetterComparator.compare('S', 's');
      const selfResult: number = ContactLetterComparator.compare('s', 's');
      const result: number = ContactLetterComparator.compare('s', 'S');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume020114 end');
    });


  });
}
