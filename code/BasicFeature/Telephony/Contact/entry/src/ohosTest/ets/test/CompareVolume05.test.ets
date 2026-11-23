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

export default function compareVolume05Test() {
  describe('CompareVolume05Test', () => {

    /**
     * @tc.name   testCompareVolume05Anchor01
     * @tc.number SUB_Contact_CMPR_0305
     * @tc.desc   多字符全串码元序：ABC 小于 ABD，前缀关系不影响
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume05Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume05Anchor01 begin');
      const abcVsAbd: number = ContactLetterComparator.compare('ABC', 'ABD');
      const abcVsAbcd: number = ContactLetterComparator.compare('ABC', 'ABCD');
      const selfLong: number = ContactLetterComparator.compare('ABC', 'ABC');
      expect(abcVsAbd).assertEqual(-1);
      expect(abcVsAbcd).assertEqual(-1);
      expect(selfLong).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume05Anchor01 end');
    });
    /**
     * @tc.name   testCompareVolume050306
     * @tc.number SUB_Contact_CMPR_0306
     * @tc.desc   多字符：AB 对 AC，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050306 begin');
      const reverseResult: number = ContactLetterComparator.compare('AC', 'AB');
      const selfResult: number = ContactLetterComparator.compare('AB', 'AB');
      const result: number = ContactLetterComparator.compare('AB', 'AC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050306 end');
    });

    /**
     * @tc.name   testCompareVolume050307
     * @tc.number SUB_Contact_CMPR_0307
     * @tc.desc   多字符：AC 对 AB，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050307 begin');
      const reverseResult: number = ContactLetterComparator.compare('AB', 'AC');
      const selfResult: number = ContactLetterComparator.compare('AC', 'AC');
      const result: number = ContactLetterComparator.compare('AC', 'AB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050307 end');
    });

    /**
     * @tc.name   testCompareVolume050308
     * @tc.number SUB_Contact_CMPR_0308
     * @tc.desc   多字符：BB 对 BC，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050308 begin');
      const reverseResult: number = ContactLetterComparator.compare('BC', 'BB');
      const selfResult: number = ContactLetterComparator.compare('BB', 'BB');
      const result: number = ContactLetterComparator.compare('BB', 'BC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050308 end');
    });

    /**
     * @tc.name   testCompareVolume050309
     * @tc.number SUB_Contact_CMPR_0309
     * @tc.desc   多字符：BC 对 BB，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050309 begin');
      const reverseResult: number = ContactLetterComparator.compare('BB', 'BC');
      const selfResult: number = ContactLetterComparator.compare('BC', 'BC');
      const result: number = ContactLetterComparator.compare('BC', 'BB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050309 end');
    });

    /**
     * @tc.name   testCompareVolume050310
     * @tc.number SUB_Contact_CMPR_0310
     * @tc.desc   多字符：AZ 对 BA，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050310 begin');
      const reverseResult: number = ContactLetterComparator.compare('BA', 'AZ');
      const selfResult: number = ContactLetterComparator.compare('AZ', 'AZ');
      const result: number = ContactLetterComparator.compare('AZ', 'BA');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050310 end');
    });

    /**
     * @tc.name   testCompareVolume050311
     * @tc.number SUB_Contact_CMPR_0311
     * @tc.desc   多字符：BA 对 AZ，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050311 begin');
      const reverseResult: number = ContactLetterComparator.compare('AZ', 'BA');
      const selfResult: number = ContactLetterComparator.compare('BA', 'BA');
      const result: number = ContactLetterComparator.compare('BA', 'AZ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050311 end');
    });

    /**
     * @tc.name   testCompareVolume050312
     * @tc.number SUB_Contact_CMPR_0312
     * @tc.desc   多字符：abc 对 abd，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050312 begin');
      const reverseResult: number = ContactLetterComparator.compare('abd', 'abc');
      const selfResult: number = ContactLetterComparator.compare('abc', 'abc');
      const result: number = ContactLetterComparator.compare('abc', 'abd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050312 end');
    });

    /**
     * @tc.name   testCompareVolume050313
     * @tc.number SUB_Contact_CMPR_0313
     * @tc.desc   多字符：abd 对 abc，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050313 begin');
      const reverseResult: number = ContactLetterComparator.compare('abc', 'abd');
      const selfResult: number = ContactLetterComparator.compare('abd', 'abd');
      const result: number = ContactLetterComparator.compare('abd', 'abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050313 end');
    });

    /**
     * @tc.name   testCompareVolume050314
     * @tc.number SUB_Contact_CMPR_0314
     * @tc.desc   多字符：aB 对 aC，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050314 begin');
      const reverseResult: number = ContactLetterComparator.compare('aC', 'aB');
      const selfResult: number = ContactLetterComparator.compare('aB', 'aB');
      const result: number = ContactLetterComparator.compare('aB', 'aC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050314 end');
    });

    /**
     * @tc.name   testCompareVolume050315
     * @tc.number SUB_Contact_CMPR_0315
     * @tc.desc   多字符：aC 对 aB，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050315 begin');
      const reverseResult: number = ContactLetterComparator.compare('aB', 'aC');
      const selfResult: number = ContactLetterComparator.compare('aC', 'aC');
      const result: number = ContactLetterComparator.compare('aC', 'aB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050315 end');
    });

    /**
     * @tc.name   testCompareVolume050316
     * @tc.number SUB_Contact_CMPR_0316
     * @tc.desc   多字符：a1 对 a2，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050316 begin');
      const reverseResult: number = ContactLetterComparator.compare('a2', 'a1');
      const selfResult: number = ContactLetterComparator.compare('a1', 'a1');
      const result: number = ContactLetterComparator.compare('a1', 'a2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050316 end');
    });

    /**
     * @tc.name   testCompareVolume050317
     * @tc.number SUB_Contact_CMPR_0317
     * @tc.desc   多字符：a2 对 a1，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050317 begin');
      const reverseResult: number = ContactLetterComparator.compare('a1', 'a2');
      const selfResult: number = ContactLetterComparator.compare('a2', 'a2');
      const result: number = ContactLetterComparator.compare('a2', 'a1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050317 end');
    });

    /**
     * @tc.name   testCompareVolume050318
     * @tc.number SUB_Contact_CMPR_0318
     * @tc.desc   多字符：Zz 对 pP，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050318 begin');
      const reverseResult: number = ContactLetterComparator.compare('pP', 'Zz');
      const selfResult: number = ContactLetterComparator.compare('Zz', 'Zz');
      const result: number = ContactLetterComparator.compare('Zz', 'pP');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050318 end');
    });

    /**
     * @tc.name   testCompareVolume050319
     * @tc.number SUB_Contact_CMPR_0319
     * @tc.desc   多字符：pP 对 Zz，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050319 begin');
      const reverseResult: number = ContactLetterComparator.compare('Zz', 'pP');
      const selfResult: number = ContactLetterComparator.compare('pP', 'pP');
      const result: number = ContactLetterComparator.compare('pP', 'Zz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050319 end');
    });

    /**
     * @tc.name   testCompareVolume050320
     * @tc.number SUB_Contact_CMPR_0320
     * @tc.desc   多字符：ABC 对 ABCD，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050320 begin');
      const reverseResult: number = ContactLetterComparator.compare('ABCD', 'ABC');
      const selfResult: number = ContactLetterComparator.compare('ABC', 'ABC');
      const result: number = ContactLetterComparator.compare('ABC', 'ABCD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050320 end');
    });

    /**
     * @tc.name   testCompareVolume050321
     * @tc.number SUB_Contact_CMPR_0321
     * @tc.desc   多字符：ABCD 对 ABC，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050321 begin');
      const reverseResult: number = ContactLetterComparator.compare('ABC', 'ABCD');
      const selfResult: number = ContactLetterComparator.compare('ABCD', 'ABCD');
      const result: number = ContactLetterComparator.compare('ABCD', 'ABC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050321 end');
    });

    /**
     * @tc.name   testCompareVolume050322
     * @tc.number SUB_Contact_CMPR_0322
     * @tc.desc   多字符：A 对 BB，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050322 begin');
      const reverseResult: number = ContactLetterComparator.compare('BB', 'A');
      const selfResult: number = ContactLetterComparator.compare('A', 'A');
      const result: number = ContactLetterComparator.compare('A', 'BB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050322 end');
    });

    /**
     * @tc.name   testCompareVolume050323
     * @tc.number SUB_Contact_CMPR_0323
     * @tc.desc   多字符：BB 对 A，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050323 begin');
      const reverseResult: number = ContactLetterComparator.compare('A', 'BB');
      const selfResult: number = ContactLetterComparator.compare('BB', 'BB');
      const result: number = ContactLetterComparator.compare('BB', 'A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050323 end');
    });

    /**
     * @tc.name   testCompareVolume050324
     * @tc.number SUB_Contact_CMPR_0324
     * @tc.desc   多字符：Zhang 对 Wang，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050324 begin');
      const reverseResult: number = ContactLetterComparator.compare('Wang', 'Zhang');
      const selfResult: number = ContactLetterComparator.compare('Zhang', 'Zhang');
      const result: number = ContactLetterComparator.compare('Zhang', 'Wang');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050324 end');
    });

    /**
     * @tc.name   testCompareVolume050325
     * @tc.number SUB_Contact_CMPR_0325
     * @tc.desc   多字符：Wang 对 Zhang，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050325 begin');
      const reverseResult: number = ContactLetterComparator.compare('Zhang', 'Wang');
      const selfResult: number = ContactLetterComparator.compare('Wang', 'Wang');
      const result: number = ContactLetterComparator.compare('Wang', 'Zhang');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050325 end');
    });

    /**
     * @tc.name   testCompareVolume050326
     * @tc.number SUB_Contact_CMPR_0326
     * @tc.desc   多字符：Li 对 Liu，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050326 begin');
      const reverseResult: number = ContactLetterComparator.compare('Liu', 'Li');
      const selfResult: number = ContactLetterComparator.compare('Li', 'Li');
      const result: number = ContactLetterComparator.compare('Li', 'Liu');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050326 end');
    });

    /**
     * @tc.name   testCompareVolume050327
     * @tc.number SUB_Contact_CMPR_0327
     * @tc.desc   多字符：Liu 对 Li，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050327 begin');
      const reverseResult: number = ContactLetterComparator.compare('Li', 'Liu');
      const selfResult: number = ContactLetterComparator.compare('Liu', 'Liu');
      const result: number = ContactLetterComparator.compare('Liu', 'Li');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050327 end');
    });

    /**
     * @tc.name   testCompareVolume050328
     * @tc.number SUB_Contact_CMPR_0328
     * @tc.desc   多字符：zz 对 zzz，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050328 begin');
      const reverseResult: number = ContactLetterComparator.compare('zzz', 'zz');
      const selfResult: number = ContactLetterComparator.compare('zz', 'zz');
      const result: number = ContactLetterComparator.compare('zz', 'zzz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050328 end');
    });

    /**
     * @tc.name   testCompareVolume050329
     * @tc.number SUB_Contact_CMPR_0329
     * @tc.desc   多字符：zzz 对 zz，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050329 begin');
      const reverseResult: number = ContactLetterComparator.compare('zz', 'zzz');
      const selfResult: number = ContactLetterComparator.compare('zzz', 'zzz');
      const result: number = ContactLetterComparator.compare('zzz', 'zz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050329 end');
    });

    /**
     * @tc.name   testCompareVolume050330
     * @tc.number SUB_Contact_CMPR_0330
     * @tc.desc   多字符：a 对 b，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050330 begin');
      const reverseResult: number = ContactLetterComparator.compare('b', 'a');
      const selfResult: number = ContactLetterComparator.compare('a', 'a');
      const result: number = ContactLetterComparator.compare('a', 'b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050330 end');
    });

    /**
     * @tc.name   testCompareVolume050331
     * @tc.number SUB_Contact_CMPR_0331
     * @tc.desc   多字符：b 对 a，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050331 begin');
      const reverseResult: number = ContactLetterComparator.compare('a', 'b');
      const selfResult: number = ContactLetterComparator.compare('b', 'b');
      const result: number = ContactLetterComparator.compare('b', 'a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050331 end');
    });

    /**
     * @tc.name   testCompareVolume050332
     * @tc.number SUB_Contact_CMPR_0332
     * @tc.desc   多字符：abc 对 abc，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050332 begin');
      const reverseResult: number = ContactLetterComparator.compare('abc', 'abc');
      const selfResult: number = ContactLetterComparator.compare('abc', 'abc');
      const result: number = ContactLetterComparator.compare('abc', 'abc');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050332 end');
    });

    /**
     * @tc.name   testCompareVolume050333
     * @tc.number SUB_Contact_CMPR_0333
     * @tc.desc   多字符：ABC 对 ABC，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050333 begin');
      const reverseResult: number = ContactLetterComparator.compare('ABC', 'ABC');
      const selfResult: number = ContactLetterComparator.compare('ABC', 'ABC');
      const result: number = ContactLetterComparator.compare('ABC', 'ABC');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050333 end');
    });

    /**
     * @tc.name   testCompareVolume050334
     * @tc.number SUB_Contact_CMPR_0334
     * @tc.desc   多字符：a1 对 a1，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050334 begin');
      const reverseResult: number = ContactLetterComparator.compare('a1', 'a1');
      const selfResult: number = ContactLetterComparator.compare('a1', 'a1');
      const result: number = ContactLetterComparator.compare('a1', 'a1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050334 end');
    });

    /**
     * @tc.name   testCompareVolume050335
     * @tc.number SUB_Contact_CMPR_0335
     * @tc.desc   多字符：A! 对 A@，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050335 begin');
      const reverseResult: number = ContactLetterComparator.compare('A@', 'A!');
      const selfResult: number = ContactLetterComparator.compare('A!', 'A!');
      const result: number = ContactLetterComparator.compare('A!', 'A@');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050335 end');
    });

    /**
     * @tc.name   testCompareVolume050336
     * @tc.number SUB_Contact_CMPR_0336
     * @tc.desc   多字符：A@ 对 A!，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050336 begin');
      const reverseResult: number = ContactLetterComparator.compare('A!', 'A@');
      const selfResult: number = ContactLetterComparator.compare('A@', 'A@');
      const result: number = ContactLetterComparator.compare('A@', 'A!');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050336 end');
    });

    /**
     * @tc.name   testCompareVolume050337
     * @tc.number SUB_Contact_CMPR_0337
     * @tc.desc   多字符：0A 对 1A，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050337 begin');
      const reverseResult: number = ContactLetterComparator.compare('1A', '0A');
      const selfResult: number = ContactLetterComparator.compare('0A', '0A');
      const result: number = ContactLetterComparator.compare('0A', '1A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050337 end');
    });

    /**
     * @tc.name   testCompareVolume050338
     * @tc.number SUB_Contact_CMPR_0338
     * @tc.desc   多字符：1A 对 0A，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050338 begin');
      const reverseResult: number = ContactLetterComparator.compare('0A', '1A');
      const selfResult: number = ContactLetterComparator.compare('1A', '1A');
      const result: number = ContactLetterComparator.compare('1A', '0A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050338 end');
    });

    /**
     * @tc.name   testCompareVolume050339
     * @tc.number SUB_Contact_CMPR_0339
     * @tc.desc   多字符：9z 对 :a，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050339 begin');
      const reverseResult: number = ContactLetterComparator.compare(':a', '9z');
      const selfResult: number = ContactLetterComparator.compare('9z', '9z');
      const result: number = ContactLetterComparator.compare('9z', ':a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050339 end');
    });

    /**
     * @tc.name   testCompareVolume050340
     * @tc.number SUB_Contact_CMPR_0340
     * @tc.desc   多字符：:a 对 9z，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050340 begin');
      const reverseResult: number = ContactLetterComparator.compare('9z', ':a');
      const selfResult: number = ContactLetterComparator.compare(':a', ':a');
      const result: number = ContactLetterComparator.compare(':a', '9z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050340 end');
    });

    /**
     * @tc.name   testCompareVolume050341
     * @tc.number SUB_Contact_CMPR_0341
     * @tc.desc   多字符：~ 对 ~，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050341 begin');
      const reverseResult: number = ContactLetterComparator.compare('~', '~');
      const selfResult: number = ContactLetterComparator.compare('~', '~');
      const result: number = ContactLetterComparator.compare('~', '~');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050341 end');
    });

    /**
     * @tc.name   testCompareVolume050342
     * @tc.number SUB_Contact_CMPR_0342
     * @tc.desc   多字符：~~ 对 ~~，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050342 begin');
      const reverseResult: number = ContactLetterComparator.compare('~~', '~~');
      const selfResult: number = ContactLetterComparator.compare('~~', '~~');
      const result: number = ContactLetterComparator.compare('~~', '~~');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050342 end');
    });


  });
}
