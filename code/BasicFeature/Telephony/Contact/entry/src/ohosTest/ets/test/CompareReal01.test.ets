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
import contact from '@ohos.contact';
import { ContactLetterComparator } from '../../../main/ets/utils/ContactLetterComparator';
import { ContactFieldExtractor } from '../../../main/ets/utils/ContactFieldExtractor';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

export default function compareReal01Test() {
  describe('CompareReal01Test', () => {
    /**
     * @tc.name   testCompareReal010001
     * @tc.number SUB_Contact_CMPRR_0001
     * @tc.desc   合法值字母对：输入 'A'/'B'，期望 -1（'A'=U+0041(65) < 'B'=U+0042(66)，按 UTF-16 码元序规格常量写死）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010001 begin');
      const forward: number = ContactLetterComparator.compare('A', 'B');
      const reverse: number = ContactLetterComparator.compare('B', 'A');
      const selfCompare: number = ContactLetterComparator.compare('A', 'A');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010001 end');
    });
    /**
     * @tc.name   testCompareReal010002
     * @tc.number SUB_Contact_CMPRR_0002
     * @tc.desc   合法值字母对：输入 'M'/'N'，期望 -1（'M'=U+004D(77) < 'N'=U+004E(78)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010002 begin');
      const forward: number = ContactLetterComparator.compare('M', 'N');
      const reverse: number = ContactLetterComparator.compare('N', 'M');
      const selfCompare: number = ContactLetterComparator.compare('M', 'M');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010002 end');
    });
    /**
     * @tc.name   testCompareReal010003
     * @tc.number SUB_Contact_CMPRR_0003
     * @tc.desc   合法值字母对：输入 'Z'/'A'，期望 1（'Z'=U+005A(90) > 'A'=U+0041(65)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010003 begin');
      const forward: number = ContactLetterComparator.compare('Z', 'A');
      const reverse: number = ContactLetterComparator.compare('A', 'Z');
      const selfCompare: number = ContactLetterComparator.compare('Z', 'Z');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010003 end');
    });
    /**
     * @tc.name   testCompareReal010004
     * @tc.number SUB_Contact_CMPRR_0004
     * @tc.desc   合法值字母对：输入 'a'/'b'，期望 -1（'a'=U+0061(97) < 'b'=U+0062(98)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010004 begin');
      const forward: number = ContactLetterComparator.compare('a', 'b');
      const reverse: number = ContactLetterComparator.compare('b', 'a');
      const selfCompare: number = ContactLetterComparator.compare('a', 'a');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010004 end');
    });
    /**
     * @tc.name   testCompareReal010005
     * @tc.number SUB_Contact_CMPRR_0005
     * @tc.desc   合法值字母对：输入 'c'/'d'，期望 -1（'c'=U+0063(99) < 'd'=U+0064(100)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010005 begin');
      const forward: number = ContactLetterComparator.compare('c', 'd');
      const reverse: number = ContactLetterComparator.compare('d', 'c');
      const selfCompare: number = ContactLetterComparator.compare('c', 'c');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010005 end');
    });
    /**
     * @tc.name   testCompareReal010006
     * @tc.number SUB_Contact_CMPRR_0006
     * @tc.desc   合法值字母对：输入 'x'/'y'，期望 -1（'x'=U+0078(120) < 'y'=U+0079(121)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010006 begin');
      const forward: number = ContactLetterComparator.compare('x', 'y');
      const reverse: number = ContactLetterComparator.compare('y', 'x');
      const selfCompare: number = ContactLetterComparator.compare('x', 'x');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010006 end');
    });
    /**
     * @tc.name   testCompareReal010007
     * @tc.number SUB_Contact_CMPRR_0007
     * @tc.desc   合法值字母对：输入 'A'/'Z'，期望 -1（'A'=U+0041(65) < 'Z'=U+005A(90)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010007 begin');
      const forward: number = ContactLetterComparator.compare('A', 'Z');
      const reverse: number = ContactLetterComparator.compare('Z', 'A');
      const selfCompare: number = ContactLetterComparator.compare('A', 'A');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010007 end');
    });
    /**
     * @tc.name   testCompareReal010008
     * @tc.number SUB_Contact_CMPRR_0008
     * @tc.desc   合法值字母对：输入 'a'/'A'，期望 1（'a'=U+0061(97) > 'A'=U+0041(65)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010008 begin');
      const forward: number = ContactLetterComparator.compare('a', 'A');
      const reverse: number = ContactLetterComparator.compare('A', 'a');
      const selfCompare: number = ContactLetterComparator.compare('a', 'a');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010008 end');
    });
    /**
     * @tc.name   testCompareReal010009
     * @tc.number SUB_Contact_CMPRR_0009
     * @tc.desc   合法值字母对：输入 'B'/'b'，期望 -1（'B'=U+0042(66) < 'b'=U+0062(98)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010009 begin');
      const forward: number = ContactLetterComparator.compare('B', 'b');
      const reverse: number = ContactLetterComparator.compare('b', 'B');
      const selfCompare: number = ContactLetterComparator.compare('B', 'B');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010009 end');
    });
    /**
     * @tc.name   testCompareReal010010
     * @tc.number SUB_Contact_CMPRR_0010
     * @tc.desc   合法值字母对：输入 'M'/'m'，期望 -1（'M'=U+004D(77) < 'm'=U+006D(109)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010010 begin');
      const forward: number = ContactLetterComparator.compare('M', 'm');
      const reverse: number = ContactLetterComparator.compare('m', 'M');
      const selfCompare: number = ContactLetterComparator.compare('M', 'M');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010010 end');
    });
    /**
     * @tc.name   testCompareReal010011
     * @tc.number SUB_Contact_CMPRR_0011
     * @tc.desc   边界值空串对：输入 ''/''，期望 0（长度 0 无码元可比，码元序规格常量），并对照空串对 'A' 恒为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010011 begin');
      const forward: number = ContactLetterComparator.compare('', '');
      const reverse: number = ContactLetterComparator.compare('', '');
      const contrastAscending: number = ContactLetterComparator.compare('', 'A');
      const contrastDescending: number = ContactLetterComparator.compare('A', '');
      expect(forward).assertEqual(0);
      expect(reverse).assertEqual(0);
      expect(contrastAscending).assertEqual(-1);
      expect(contrastDescending).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010011 end');
    });
    /**
     * @tc.name   testCompareReal010012
     * @tc.number SUB_Contact_CMPRR_0012
     * @tc.desc   边界值空串对：输入 ''/'A'，期望 -1（空串码元最小，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010012 begin');
      const forward: number = ContactLetterComparator.compare('', 'A');
      const reverse: number = ContactLetterComparator.compare('A', '');
      const selfCompare: number = ContactLetterComparator.compare('', '');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010012 end');
    });
    /**
     * @tc.name   testCompareReal010013
     * @tc.number SUB_Contact_CMPRR_0013
     * @tc.desc   边界值空串对：输入 'A'/''，期望 1（非空串大于空串，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010013 begin');
      const forward: number = ContactLetterComparator.compare('A', '');
      const reverse: number = ContactLetterComparator.compare('', 'A');
      const selfCompare: number = ContactLetterComparator.compare('A', 'A');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010013 end');
    });
    /**
     * @tc.name   testCompareReal010014
     * @tc.number SUB_Contact_CMPRR_0014
     * @tc.desc   边界值空串对：输入 ''/'a'，期望 -1（空串码元最小，与 ''/'A' 同为 -1，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010014 begin');
      const forward: number = ContactLetterComparator.compare('', 'a');
      const reverse: number = ContactLetterComparator.compare('a', '');
      const contrast: number = ContactLetterComparator.compare('', 'A');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(contrast).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010014 end');
    });
    /**
     * @tc.name   testCompareReal010015
     * @tc.number SUB_Contact_CMPRR_0015
     * @tc.desc   边界值空串对：输入 ' '/''，期望 1（' '=U+0020(32) 大于空串，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010015 begin');
      const forward: number = ContactLetterComparator.compare(' ', '');
      const reverse: number = ContactLetterComparator.compare('', ' ');
      const selfCompare: number = ContactLetterComparator.compare(' ', ' ');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010015 end');
    });
    /**
     * @tc.name   testCompareReal010016
     * @tc.number SUB_Contact_CMPRR_0016
     * @tc.desc   非法值符号数字混比：输入 '0'/'A'，期望 -1（'0'=U+0030(48) < 'A'=U+0041(65)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010016 begin');
      const forward: number = ContactLetterComparator.compare('0', 'A');
      const reverse: number = ContactLetterComparator.compare('A', '0');
      const selfCompare: number = ContactLetterComparator.compare('0', '0');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010016 end');
    });
    /**
     * @tc.name   testCompareReal010017
     * @tc.number SUB_Contact_CMPRR_0017
     * @tc.desc   非法值符号数字混比：输入 '9'/'0'，期望 1（'9'=U+0039(57) > '0'=U+0030(48)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010017 begin');
      const forward: number = ContactLetterComparator.compare('9', '0');
      const reverse: number = ContactLetterComparator.compare('0', '9');
      const selfCompare: number = ContactLetterComparator.compare('9', '9');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010017 end');
    });
    /**
     * @tc.name   testCompareReal010018
     * @tc.number SUB_Contact_CMPRR_0018
     * @tc.desc   非法值符号数字混比：输入 '!'/'0'，期望 -1（'!'=U+0021(33) < '0'=U+0030(48)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010018 begin');
      const forward: number = ContactLetterComparator.compare('!', '0');
      const reverse: number = ContactLetterComparator.compare('0', '!');
      const selfCompare: number = ContactLetterComparator.compare('!', '!');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010018 end');
    });
    /**
     * @tc.name   testCompareReal010019
     * @tc.number SUB_Contact_CMPRR_0019
     * @tc.desc   非法值符号数字混比：输入 '~'/'!'，期望 1（'~'=U+007E(126) > '!'=U+0021(33)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010019 begin');
      const forward: number = ContactLetterComparator.compare('~', '!');
      const reverse: number = ContactLetterComparator.compare('!', '~');
      const selfCompare: number = ContactLetterComparator.compare('~', '~');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010019 end');
    });
    /**
     * @tc.name   testCompareReal010020
     * @tc.number SUB_Contact_CMPRR_0020
     * @tc.desc   非法值符号数字混比：输入 '@'/'A'，期望 -1（'@'=U+0040(64) < 'A'=U+0041(65)，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010020 begin');
      const forward: number = ContactLetterComparator.compare('@', 'A');
      const reverse: number = ContactLetterComparator.compare('A', '@');
      const selfCompare: number = ContactLetterComparator.compare('@', '@');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010020 end');
    });
    /**
     * @tc.name   testCompareReal010021
     * @tc.number SUB_Contact_CMPRR_0021
     * @tc.desc   极值超长串：输入 'a'x100 / 'a'x99，前 99 码元相同、前者更长，期望 1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010021 begin');
      const longA: string = 'a'.repeat(100);
      const shorter: string = 'a'.repeat(99);
      const forward: number = ContactLetterComparator.compare(longA, shorter);
      const reverse: number = ContactLetterComparator.compare(shorter, longA);
      const selfCompare: number = ContactLetterComparator.compare(longA, longA);
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010021 end');
    });
    /**
     * @tc.name   testCompareReal010022
     * @tc.number SUB_Contact_CMPRR_0022
     * @tc.desc   极值超长串：输入 'a'x1000 / 'b'，首码元 'a'(97) < 'b'(98) 定序，期望 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010022 begin');
      const longA: string = 'a'.repeat(1000);
      const forward: number = ContactLetterComparator.compare(longA, 'b');
      const reverse: number = ContactLetterComparator.compare('b', longA);
      const selfCompare: number = ContactLetterComparator.compare('b', 'b');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010022 end');
    });
    /**
     * @tc.name   testCompareReal010023
     * @tc.number SUB_Contact_CMPRR_0023
     * @tc.desc   极值超长串：输入 'z'x500 / 'z'x500，内容全同，期望 0，并对照长度差 1 时短者为 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010023 begin');
      const longZ: string = 'z'.repeat(500);
      const forward: number = ContactLetterComparator.compare(longZ, longZ);
      const contrastAscending: number = ContactLetterComparator.compare(longZ, 'z'.repeat(499));
      const contrastDescending: number = ContactLetterComparator.compare('z'.repeat(499), longZ);
      expect(forward).assertEqual(0);
      expect(contrastAscending).assertEqual(1);
      expect(contrastDescending).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010023 end');
    });
    /**
     * @tc.name   testCompareReal010024
     * @tc.number SUB_Contact_CMPRR_0024
     * @tc.desc   极值超长串：输入 'A'x999 / 'A'x999+'a'，前 999 码元相同、后者更长，期望 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010024 begin');
      const baseA: string = 'A'.repeat(999);
      const longer: string = 'A'.repeat(999) + 'a';
      const forward: number = ContactLetterComparator.compare(baseA, longer);
      const reverse: number = ContactLetterComparator.compare(longer, baseA);
      const selfCompare: number = ContactLetterComparator.compare(baseA, baseA);
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010024 end');
    });
    /**
     * @tc.name   testCompareReal010025
     * @tc.number SUB_Contact_CMPRR_0025
     * @tc.desc   极值超长串：输入 '0'x2000 / ''，空串码元最小，期望 1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010025 begin');
      const longZero: string = '0'.repeat(2000);
      const forward: number = ContactLetterComparator.compare(longZero, '');
      const reverse: number = ContactLetterComparator.compare('', longZero);
      const selfCompare: number = ContactLetterComparator.compare(longZero, longZero);
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010025 end');
    });
    /**
     * @tc.name   testCompareReal010026
     * @tc.number SUB_Contact_CMPRR_0026
     * @tc.desc   组合值多字符串对：输入 'AB'/'AC'，第二码元 'B'(66) < 'C'(67)，期望 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010026 begin');
      const forward: number = ContactLetterComparator.compare('AB', 'AC');
      const reverse: number = ContactLetterComparator.compare('AC', 'AB');
      const selfCompare: number = ContactLetterComparator.compare('AB', 'AB');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010026 end');
    });
    /**
     * @tc.name   testCompareReal010027
     * @tc.number SUB_Contact_CMPRR_0027
     * @tc.desc   组合值多字符串对：输入 'ABC'/'ABD'，第三码元 'C'(67) < 'D'(68)，期望 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010027 begin');
      const forward: number = ContactLetterComparator.compare('ABC', 'ABD');
      const reverse: number = ContactLetterComparator.compare('ABD', 'ABC');
      const selfCompare: number = ContactLetterComparator.compare('ABC', 'ABC');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010027 end');
    });
    /**
     * @tc.name   testCompareReal010028
     * @tc.number SUB_Contact_CMPRR_0028
     * @tc.desc   组合值多字符串对：输入 'AZ'/'BA'，首码元 'A'(65) < 'B'(66) 定序，期望 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010028 begin');
      const forward: number = ContactLetterComparator.compare('AZ', 'BA');
      const reverse: number = ContactLetterComparator.compare('BA', 'AZ');
      const selfCompare: number = ContactLetterComparator.compare('AZ', 'AZ');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010028 end');
    });
    /**
     * @tc.name   testCompareReal010029
     * @tc.number SUB_Contact_CMPRR_0029
     * @tc.desc   组合值多字符串对：输入 'a1'/'a2'，第二码元 '1'(49) < '2'(50)，期望 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010029 begin');
      const forward: number = ContactLetterComparator.compare('a1', 'a2');
      const reverse: number = ContactLetterComparator.compare('a2', 'a1');
      const selfCompare: number = ContactLetterComparator.compare('a1', 'a1');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010029 end');
    });
    /**
     * @tc.name   testCompareReal010030
     * @tc.number SUB_Contact_CMPRR_0030
     * @tc.desc   组合值多字符串对：输入 '中文'/'中国'，首码元同为 '中'，'文'=U+6587(25991) > '国'=U+56FD(22269)，期望 1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010030 begin');
      const forward: number = ContactLetterComparator.compare('中文', '中国');
      const reverse: number = ContactLetterComparator.compare('中国', '中文');
      const selfCompare: number = ContactLetterComparator.compare('中文', '中文');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010030 end');
    });
    /**
     * @tc.name   testCompareReal010031
     * @tc.number SUB_Contact_CMPRR_0031
     * @tc.desc   组合值多字符串对：输入 'zhang'/'zhao'，第四码元 'n'(110) < 'o'(111)，期望 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010031 begin');
      const forward: number = ContactLetterComparator.compare('zhang', 'zhao');
      const reverse: number = ContactLetterComparator.compare('zhao', 'zhang');
      const selfCompare: number = ContactLetterComparator.compare('zhang', 'zhang');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010031 end');
    });
    /**
     * @tc.name   testCompareReal010032
     * @tc.number SUB_Contact_CMPRR_0032
     * @tc.desc   组合值多字符串对：输入 'Zhang'/'zhang'，首码元 'Z'(90) < 'z'(122)，期望 -1（码元序规格常量，大小写敏感）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010032 begin');
      const forward: number = ContactLetterComparator.compare('Zhang', 'zhang');
      const reverse: number = ContactLetterComparator.compare('zhang', 'Zhang');
      const selfCompare: number = ContactLetterComparator.compare('Zhang', 'Zhang');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010032 end');
    });
    /**
     * @tc.name   testCompareReal010033
     * @tc.number SUB_Contact_CMPRR_0033
     * @tc.desc   组合值多字符串对：输入 'ABC'/'abc'，首码元 'A'(65) < 'a'(97)，期望 -1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010033 begin');
      const forward: number = ContactLetterComparator.compare('ABC', 'abc');
      const reverse: number = ContactLetterComparator.compare('abc', 'ABC');
      const selfCompare: number = ContactLetterComparator.compare('ABC', 'ABC');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010033 end');
    });
    /**
     * @tc.name   testCompareReal010034
     * @tc.number SUB_Contact_CMPRR_0034
     * @tc.desc   组合值多字符串对：输入 'A1'/'A!'，第二码元 '1'(49) > '!'(33)，期望 1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010034 begin');
      const forward: number = ContactLetterComparator.compare('A1', 'A!');
      const reverse: number = ContactLetterComparator.compare('A!', 'A1');
      const selfCompare: number = ContactLetterComparator.compare('A1', 'A1');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010034 end');
    });
    /**
     * @tc.name   testCompareReal010035
     * @tc.number SUB_Contact_CMPRR_0035
     * @tc.desc   组合值多字符串对：输入 '99'/'100'，首码元 '9'(57) > '1'(49) 定序，期望 1（码元序规格常量，非数值比较）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010035 begin');
      const forward: number = ContactLetterComparator.compare('99', '100');
      const reverse: number = ContactLetterComparator.compare('100', '99');
      const selfCompare: number = ContactLetterComparator.compare('99', '99');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010035 end');
    });
    /**
     * @tc.name   testCompareReal010036
     * @tc.number SUB_Contact_CMPRR_0036
     * @tc.desc   状态替代幂等：'Hello'/'World' 连续 3 次均为 -1（'H'(72) < 'W'(87)，码元序规格常量），并与反向 1 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010036 begin');
      const run1: number = ContactLetterComparator.compare('Hello', 'World');
      const run2: number = ContactLetterComparator.compare('Hello', 'World');
      const run3: number = ContactLetterComparator.compare('Hello', 'World');
      const reverseRun: number = ContactLetterComparator.compare('World', 'Hello');
      expect(run1).assertEqual(-1);
      expect(run2).assertEqual(run1);
      expect(run3).assertEqual(run1);
      expect(reverseRun).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010036 end');
    });
    /**
     * @tc.name   testCompareReal010037
     * @tc.number SUB_Contact_CMPRR_0037
     * @tc.desc   状态替代幂等：'abc'/'abd' 连续 3 次均为 -1（'c'(99) < 'd'(100)，码元序规格常量），并与自反 0 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010037 begin');
      const run1: number = ContactLetterComparator.compare('abc', 'abd');
      const run2: number = ContactLetterComparator.compare('abc', 'abd');
      const run3: number = ContactLetterComparator.compare('abc', 'abd');
      const selfRun: number = ContactLetterComparator.compare('abc', 'abc');
      expect(run1).assertEqual(-1);
      expect(run2).assertEqual(run1);
      expect(run3).assertEqual(run1);
      expect(selfRun).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010037 end');
    });
    /**
     * @tc.name   testCompareReal010038
     * @tc.number SUB_Contact_CMPRR_0038
     * @tc.desc   状态替代幂等：'x'/'x' 连续 3 次均为 0（相同码元，码元序规格常量），并与 'x'/'y' 为 -1 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010038 begin');
      const run1: number = ContactLetterComparator.compare('x', 'x');
      const run2: number = ContactLetterComparator.compare('x', 'x');
      const run3: number = ContactLetterComparator.compare('x', 'x');
      const contrastRun: number = ContactLetterComparator.compare('x', 'y');
      expect(run1).assertEqual(0);
      expect(run2).assertEqual(run1);
      expect(run3).assertEqual(run1);
      expect(contrastRun).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010038 end');
    });
    /**
     * @tc.name   testCompareReal010039
     * @tc.number SUB_Contact_CMPRR_0039
     * @tc.desc   状态替代幂等：'A'/'a' 连续 3 次均为 -1（'A'(65) < 'a'(97)，码元序规格常量），并与 'a'/'A' 为 1 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010039 begin');
      const run1: number = ContactLetterComparator.compare('A', 'a');
      const run2: number = ContactLetterComparator.compare('A', 'a');
      const run3: number = ContactLetterComparator.compare('A', 'a');
      const contrastRun: number = ContactLetterComparator.compare('a', 'A');
      expect(run1).assertEqual(-1);
      expect(run2).assertEqual(run1);
      expect(run3).assertEqual(run1);
      expect(contrastRun).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010039 end');
    });
    /**
     * @tc.name   testCompareReal010040
     * @tc.number SUB_Contact_CMPRR_0040
     * @tc.desc   状态替代幂等：'1'/'2' 连续 3 次均为 -1（'1'(49) < '2'(50)，码元序规格常量），并与 '2'/'1' 为 1 对照
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010040 begin');
      const run1: number = ContactLetterComparator.compare('1', '2');
      const run2: number = ContactLetterComparator.compare('1', '2');
      const run3: number = ContactLetterComparator.compare('1', '2');
      const contrastRun: number = ContactLetterComparator.compare('2', '1');
      expect(run1).assertEqual(-1);
      expect(run2).assertEqual(run1);
      expect(run3).assertEqual(run1);
      expect(contrastRun).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010040 end');
    });
    /**
     * @tc.name   testCompareReal010041
     * @tc.number SUB_Contact_CMPRR_0041
     * @tc.desc   26 字母全序链抽样：输入 'A'/'B' 相邻对，期望 -1（码元 65 < 66 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010041 begin');
      const forward: number = ContactLetterComparator.compare('A', 'B');
      const reverse: number = ContactLetterComparator.compare('B', 'A');
      const selfCompare: number = ContactLetterComparator.compare('A', 'A');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010041 end');
    });
    /**
     * @tc.name   testCompareReal010042
     * @tc.number SUB_Contact_CMPRR_0042
     * @tc.desc   26 字母全序链抽样：输入 'B'/'C' 相邻对，期望 -1（码元 66 < 67 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010042 begin');
      const forward: number = ContactLetterComparator.compare('B', 'C');
      const reverse: number = ContactLetterComparator.compare('C', 'B');
      const selfCompare: number = ContactLetterComparator.compare('B', 'B');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010042 end');
    });
    /**
     * @tc.name   testCompareReal010043
     * @tc.number SUB_Contact_CMPRR_0043
     * @tc.desc   26 字母全序链抽样：输入 'C'/'D' 相邻对，期望 -1（码元 67 < 68 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010043 begin');
      const forward: number = ContactLetterComparator.compare('C', 'D');
      const reverse: number = ContactLetterComparator.compare('D', 'C');
      const selfCompare: number = ContactLetterComparator.compare('C', 'C');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010043 end');
    });
    /**
     * @tc.name   testCompareReal010044
     * @tc.number SUB_Contact_CMPRR_0044
     * @tc.desc   26 字母全序链抽样：输入 'D'/'E' 相邻对，期望 -1（码元 68 < 69 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010044 begin');
      const forward: number = ContactLetterComparator.compare('D', 'E');
      const reverse: number = ContactLetterComparator.compare('E', 'D');
      const selfCompare: number = ContactLetterComparator.compare('D', 'D');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010044 end');
    });
    /**
     * @tc.name   testCompareReal010045
     * @tc.number SUB_Contact_CMPRR_0045
     * @tc.desc   26 字母全序链抽样：输入 'E'/'F' 相邻对，期望 -1（码元 69 < 70 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010045 begin');
      const forward: number = ContactLetterComparator.compare('E', 'F');
      const reverse: number = ContactLetterComparator.compare('F', 'E');
      const selfCompare: number = ContactLetterComparator.compare('E', 'E');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010045 end');
    });
    /**
     * @tc.name   testCompareReal010046
     * @tc.number SUB_Contact_CMPRR_0046
     * @tc.desc   26 字母全序链抽样：输入 'F'/'G' 相邻对，期望 -1（码元 70 < 71 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010046 begin');
      const forward: number = ContactLetterComparator.compare('F', 'G');
      const reverse: number = ContactLetterComparator.compare('G', 'F');
      const selfCompare: number = ContactLetterComparator.compare('F', 'F');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010046 end');
    });
    /**
     * @tc.name   testCompareReal010047
     * @tc.number SUB_Contact_CMPRR_0047
     * @tc.desc   26 字母全序链抽样：输入 'G'/'H' 相邻对，期望 -1（码元 71 < 72 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010047 begin');
      const forward: number = ContactLetterComparator.compare('G', 'H');
      const reverse: number = ContactLetterComparator.compare('H', 'G');
      const selfCompare: number = ContactLetterComparator.compare('G', 'G');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010047 end');
    });
    /**
     * @tc.name   testCompareReal010048
     * @tc.number SUB_Contact_CMPRR_0048
     * @tc.desc   26 字母全序链抽样：输入 'H'/'I' 相邻对，期望 -1（码元 72 < 73 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010048 begin');
      const forward: number = ContactLetterComparator.compare('H', 'I');
      const reverse: number = ContactLetterComparator.compare('I', 'H');
      const selfCompare: number = ContactLetterComparator.compare('H', 'H');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010048 end');
    });
    /**
     * @tc.name   testCompareReal010049
     * @tc.number SUB_Contact_CMPRR_0049
     * @tc.desc   26 字母全序链抽样：输入 'I'/'J' 相邻对，期望 -1（码元 73 < 74 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010049 begin');
      const forward: number = ContactLetterComparator.compare('I', 'J');
      const reverse: number = ContactLetterComparator.compare('J', 'I');
      const selfCompare: number = ContactLetterComparator.compare('I', 'I');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010049 end');
    });
    /**
     * @tc.name   testCompareReal010050
     * @tc.number SUB_Contact_CMPRR_0050
     * @tc.desc   26 字母全序链抽样：输入 'J'/'K' 相邻对，期望 -1（码元 74 < 75 严格递增，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010050 begin');
      const forward: number = ContactLetterComparator.compare('J', 'K');
      const reverse: number = ContactLetterComparator.compare('K', 'J');
      const selfCompare: number = ContactLetterComparator.compare('J', 'J');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010050 end');
    });
    /**
     * @tc.name   testCompareReal010051
     * @tc.number SUB_Contact_CMPRR_0051
     * @tc.desc   大小写矩阵：输入 'a'/'b' 与 'A'/'B' 均期望 -1（码元 97<98、65<66 同序同符号，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010051 begin');
      const lowerPair: number = ContactLetterComparator.compare('a', 'b');
      const upperPair: number = ContactLetterComparator.compare('A', 'B');
      const reverseLower: number = ContactLetterComparator.compare('b', 'a');
      const selfCompare: number = ContactLetterComparator.compare('a', 'a');
      expect(lowerPair).assertEqual(-1);
      expect(upperPair).assertEqual(-1);
      expect(reverseLower).assertEqual(1);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010051 end');
    });
    /**
     * @tc.name   testCompareReal010052
     * @tc.number SUB_Contact_CMPRR_0052
     * @tc.desc   大小写矩阵：输入 'c'/'d' 与 'C'/'D' 均期望 -1（码元 99<100、67<68 同序同符号，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010052 begin');
      const lowerPair: number = ContactLetterComparator.compare('c', 'd');
      const upperPair: number = ContactLetterComparator.compare('C', 'D');
      const reverseLower: number = ContactLetterComparator.compare('d', 'c');
      const selfCompare: number = ContactLetterComparator.compare('c', 'c');
      expect(lowerPair).assertEqual(-1);
      expect(upperPair).assertEqual(-1);
      expect(reverseLower).assertEqual(1);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010052 end');
    });
    /**
     * @tc.name   testCompareReal010053
     * @tc.number SUB_Contact_CMPRR_0053
     * @tc.desc   大小写矩阵：输入 'e'/'f' 与 'E'/'F' 均期望 -1（码元 101<102、69<70 同序同符号，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010053 begin');
      const lowerPair: number = ContactLetterComparator.compare('e', 'f');
      const upperPair: number = ContactLetterComparator.compare('E', 'F');
      const reverseLower: number = ContactLetterComparator.compare('f', 'e');
      const selfCompare: number = ContactLetterComparator.compare('e', 'e');
      expect(lowerPair).assertEqual(-1);
      expect(upperPair).assertEqual(-1);
      expect(reverseLower).assertEqual(1);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010053 end');
    });
    /**
     * @tc.name   testCompareReal010054
     * @tc.number SUB_Contact_CMPRR_0054
     * @tc.desc   大小写矩阵：输入 'a'/'A' 期望 1（'a'=97 > 'A'=65 大小写互比，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010054 begin');
      const forward: number = ContactLetterComparator.compare('a', 'A');
      const reverse: number = ContactLetterComparator.compare('A', 'a');
      const selfCompare: number = ContactLetterComparator.compare('a', 'a');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010054 end');
    });
    /**
     * @tc.name   testCompareReal010055
     * @tc.number SUB_Contact_CMPRR_0055
     * @tc.desc   大小写矩阵：输入 'z'/'Z' 期望 1（'z'=122 > 'Z'=90 大小写互比，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010055 begin');
      const forward: number = ContactLetterComparator.compare('z', 'Z');
      const reverse: number = ContactLetterComparator.compare('Z', 'z');
      const selfCompare: number = ContactLetterComparator.compare('z', 'z');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010055 end');
    });
    /**
     * @tc.name   testCompareReal010056
     * @tc.number SUB_Contact_CMPRR_0056
     * @tc.desc   大小写矩阵：输入 'm'/'M' 期望 1（'m'=109 > 'M'=77 大小写互比，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010056 begin');
      const forward: number = ContactLetterComparator.compare('m', 'M');
      const reverse: number = ContactLetterComparator.compare('M', 'm');
      const selfCompare: number = ContactLetterComparator.compare('m', 'm');
      expect(forward).assertEqual(1);
      expect(reverse).assertEqual(-1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010056 end');
    });
    /**
     * @tc.name   testCompareReal010057
     * @tc.number SUB_Contact_CMPRR_0057
     * @tc.desc   大小写矩阵：输入 'A'/'a' 期望 -1（'A'=65 < 'a'=97 大小写互比，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010057 begin');
      const forward: number = ContactLetterComparator.compare('A', 'a');
      const reverse: number = ContactLetterComparator.compare('a', 'A');
      const selfCompare: number = ContactLetterComparator.compare('A', 'A');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010057 end');
    });
    /**
     * @tc.name   testCompareReal010058
     * @tc.number SUB_Contact_CMPRR_0058
     * @tc.desc   大小写矩阵：输入 'Z'/'z' 期望 -1（'Z'=90 < 'z'=122 大小写互比，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010058 begin');
      const forward: number = ContactLetterComparator.compare('Z', 'z');
      const reverse: number = ContactLetterComparator.compare('z', 'Z');
      const selfCompare: number = ContactLetterComparator.compare('Z', 'Z');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010058 end');
    });
    /**
     * @tc.name   testCompareReal010059
     * @tc.number SUB_Contact_CMPRR_0059
     * @tc.desc   大小写矩阵：输入 'M'/'m' 期望 -1（'M'=77 < 'm'=109 大小写互比，码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010059 begin');
      const forward: number = ContactLetterComparator.compare('M', 'm');
      const reverse: number = ContactLetterComparator.compare('m', 'M');
      const selfCompare: number = ContactLetterComparator.compare('M', 'M');
      expect(forward).assertEqual(-1);
      expect(reverse).assertEqual(1);
      expect(forward + reverse).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010059 end');
    });
    /**
     * @tc.name   testCompareReal010060
     * @tc.number SUB_Contact_CMPRR_0060
     * @tc.desc   大小写矩阵：输入 'Z'/'a' 期望 -1（'Z'=90 < 'a'=97 跨区间互比），并对照 'z'/'A' 期望 1（码元序规格常量）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareReal010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010060 begin');
      const forward: number = ContactLetterComparator.compare('Z', 'a');
      const contrast: number = ContactLetterComparator.compare('z', 'A');
      const selfCompare: number = ContactLetterComparator.compare('Z', 'Z');
      expect(forward).assertEqual(-1);
      expect(contrast).assertEqual(1);
      expect(forward + contrast).assertEqual(0);
      expect(selfCompare).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareReal010060 end');
    });
  });
}
