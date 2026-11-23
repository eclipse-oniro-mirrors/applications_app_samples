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

export default function compareVolume04Test() {
  describe('CompareVolume04Test', () => {

    /**
     * @tc.name   testCompareVolume04Anchor01
     * @tc.number SUB_Contact_CMPR_0229
     * @tc.desc   空串码元序最小，空串对任意字符返回 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume04Anchor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume04Anchor01 begin');
      const emptyVsA: number = ContactLetterComparator.compare('', 'A');
      const aVsEmpty: number = ContactLetterComparator.compare('A', '');
      const emptyVsEmpty: number = ContactLetterComparator.compare('', '');
      expect(emptyVsA).assertEqual(-1);
      expect(aVsEmpty).assertEqual(1);
      expect(emptyVsEmpty).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume04Anchor01 end');
    });
    /**
     * @tc.name   testCompareVolume040230
     * @tc.number SUB_Contact_CMPR_0230
     * @tc.desc   空串自反：空串对空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040230 begin');
      const reverseResult: number = ContactLetterComparator.compare('', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(0));
      expect(result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040230 end');
    });

    /**
     * @tc.name   testCompareVolume040231
     * @tc.number SUB_Contact_CMPR_0231
     * @tc.desc   空串对字母：空串 对 A，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040231 begin');
      const reverseResult: number = ContactLetterComparator.compare('A', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040231 end');
    });

    /**
     * @tc.name   testCompareVolume040232
     * @tc.number SUB_Contact_CMPR_0232
     * @tc.desc   字母对空串：A 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040232 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'A');
      const selfResult: number = ContactLetterComparator.compare('A', 'A');
      const result: number = ContactLetterComparator.compare('A', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040232 end');
    });

    /**
     * @tc.name   testCompareVolume040233
     * @tc.number SUB_Contact_CMPR_0233
     * @tc.desc   空串对字母：空串 对 B，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040233 begin');
      const reverseResult: number = ContactLetterComparator.compare('B', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040233 end');
    });

    /**
     * @tc.name   testCompareVolume040234
     * @tc.number SUB_Contact_CMPR_0234
     * @tc.desc   字母对空串：B 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040234 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'B');
      const selfResult: number = ContactLetterComparator.compare('B', 'B');
      const result: number = ContactLetterComparator.compare('B', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040234 end');
    });

    /**
     * @tc.name   testCompareVolume040235
     * @tc.number SUB_Contact_CMPR_0235
     * @tc.desc   空串对字母：空串 对 C，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040235 begin');
      const reverseResult: number = ContactLetterComparator.compare('C', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'C');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040235 end');
    });

    /**
     * @tc.name   testCompareVolume040236
     * @tc.number SUB_Contact_CMPR_0236
     * @tc.desc   字母对空串：C 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040236 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'C');
      const selfResult: number = ContactLetterComparator.compare('C', 'C');
      const result: number = ContactLetterComparator.compare('C', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040236 end');
    });

    /**
     * @tc.name   testCompareVolume040237
     * @tc.number SUB_Contact_CMPR_0237
     * @tc.desc   空串对字母：空串 对 D，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040237 begin');
      const reverseResult: number = ContactLetterComparator.compare('D', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'D');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040237 end');
    });

    /**
     * @tc.name   testCompareVolume040238
     * @tc.number SUB_Contact_CMPR_0238
     * @tc.desc   字母对空串：D 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040238 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'D');
      const selfResult: number = ContactLetterComparator.compare('D', 'D');
      const result: number = ContactLetterComparator.compare('D', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040238 end');
    });

    /**
     * @tc.name   testCompareVolume040239
     * @tc.number SUB_Contact_CMPR_0239
     * @tc.desc   空串对字母：空串 对 E，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040239 begin');
      const reverseResult: number = ContactLetterComparator.compare('E', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'E');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040239 end');
    });

    /**
     * @tc.name   testCompareVolume040240
     * @tc.number SUB_Contact_CMPR_0240
     * @tc.desc   字母对空串：E 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040240 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'E');
      const selfResult: number = ContactLetterComparator.compare('E', 'E');
      const result: number = ContactLetterComparator.compare('E', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040240 end');
    });

    /**
     * @tc.name   testCompareVolume040241
     * @tc.number SUB_Contact_CMPR_0241
     * @tc.desc   空串对字母：空串 对 F，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040241 begin');
      const reverseResult: number = ContactLetterComparator.compare('F', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'F');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040241 end');
    });

    /**
     * @tc.name   testCompareVolume040242
     * @tc.number SUB_Contact_CMPR_0242
     * @tc.desc   字母对空串：F 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040242 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'F');
      const selfResult: number = ContactLetterComparator.compare('F', 'F');
      const result: number = ContactLetterComparator.compare('F', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040242 end');
    });

    /**
     * @tc.name   testCompareVolume040243
     * @tc.number SUB_Contact_CMPR_0243
     * @tc.desc   空串对字母：空串 对 G，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040243 begin');
      const reverseResult: number = ContactLetterComparator.compare('G', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'G');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040243 end');
    });

    /**
     * @tc.name   testCompareVolume040244
     * @tc.number SUB_Contact_CMPR_0244
     * @tc.desc   字母对空串：G 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040244 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'G');
      const selfResult: number = ContactLetterComparator.compare('G', 'G');
      const result: number = ContactLetterComparator.compare('G', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040244 end');
    });

    /**
     * @tc.name   testCompareVolume040245
     * @tc.number SUB_Contact_CMPR_0245
     * @tc.desc   空串对字母：空串 对 H，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040245 begin');
      const reverseResult: number = ContactLetterComparator.compare('H', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'H');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040245 end');
    });

    /**
     * @tc.name   testCompareVolume040246
     * @tc.number SUB_Contact_CMPR_0246
     * @tc.desc   字母对空串：H 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040246 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'H');
      const selfResult: number = ContactLetterComparator.compare('H', 'H');
      const result: number = ContactLetterComparator.compare('H', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040246 end');
    });

    /**
     * @tc.name   testCompareVolume040247
     * @tc.number SUB_Contact_CMPR_0247
     * @tc.desc   空串对字母：空串 对 I，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040247 begin');
      const reverseResult: number = ContactLetterComparator.compare('I', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'I');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040247 end');
    });

    /**
     * @tc.name   testCompareVolume040248
     * @tc.number SUB_Contact_CMPR_0248
     * @tc.desc   字母对空串：I 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040248 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'I');
      const selfResult: number = ContactLetterComparator.compare('I', 'I');
      const result: number = ContactLetterComparator.compare('I', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040248 end');
    });

    /**
     * @tc.name   testCompareVolume040249
     * @tc.number SUB_Contact_CMPR_0249
     * @tc.desc   空串对字母：空串 对 J，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040249 begin');
      const reverseResult: number = ContactLetterComparator.compare('J', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'J');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040249 end');
    });

    /**
     * @tc.name   testCompareVolume040250
     * @tc.number SUB_Contact_CMPR_0250
     * @tc.desc   字母对空串：J 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040250 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'J');
      const selfResult: number = ContactLetterComparator.compare('J', 'J');
      const result: number = ContactLetterComparator.compare('J', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040250 end');
    });

    /**
     * @tc.name   testCompareVolume040251
     * @tc.number SUB_Contact_CMPR_0251
     * @tc.desc   空串对字母：空串 对 K，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040251 begin');
      const reverseResult: number = ContactLetterComparator.compare('K', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'K');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040251 end');
    });

    /**
     * @tc.name   testCompareVolume040252
     * @tc.number SUB_Contact_CMPR_0252
     * @tc.desc   字母对空串：K 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040252 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'K');
      const selfResult: number = ContactLetterComparator.compare('K', 'K');
      const result: number = ContactLetterComparator.compare('K', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040252 end');
    });

    /**
     * @tc.name   testCompareVolume040253
     * @tc.number SUB_Contact_CMPR_0253
     * @tc.desc   空串对字母：空串 对 L，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040253 begin');
      const reverseResult: number = ContactLetterComparator.compare('L', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'L');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040253 end');
    });

    /**
     * @tc.name   testCompareVolume040254
     * @tc.number SUB_Contact_CMPR_0254
     * @tc.desc   字母对空串：L 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040254 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'L');
      const selfResult: number = ContactLetterComparator.compare('L', 'L');
      const result: number = ContactLetterComparator.compare('L', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040254 end');
    });

    /**
     * @tc.name   testCompareVolume040255
     * @tc.number SUB_Contact_CMPR_0255
     * @tc.desc   空串对字母：空串 对 M，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040255 begin');
      const reverseResult: number = ContactLetterComparator.compare('M', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'M');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040255 end');
    });

    /**
     * @tc.name   testCompareVolume040256
     * @tc.number SUB_Contact_CMPR_0256
     * @tc.desc   字母对空串：M 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040256 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'M');
      const selfResult: number = ContactLetterComparator.compare('M', 'M');
      const result: number = ContactLetterComparator.compare('M', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040256 end');
    });

    /**
     * @tc.name   testCompareVolume040257
     * @tc.number SUB_Contact_CMPR_0257
     * @tc.desc   空串对字母：空串 对 N，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040257 begin');
      const reverseResult: number = ContactLetterComparator.compare('N', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'N');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040257 end');
    });

    /**
     * @tc.name   testCompareVolume040258
     * @tc.number SUB_Contact_CMPR_0258
     * @tc.desc   字母对空串：N 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040258 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'N');
      const selfResult: number = ContactLetterComparator.compare('N', 'N');
      const result: number = ContactLetterComparator.compare('N', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040258 end');
    });

    /**
     * @tc.name   testCompareVolume040259
     * @tc.number SUB_Contact_CMPR_0259
     * @tc.desc   空串对字母：空串 对 O，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040259 begin');
      const reverseResult: number = ContactLetterComparator.compare('O', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'O');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040259 end');
    });

    /**
     * @tc.name   testCompareVolume040260
     * @tc.number SUB_Contact_CMPR_0260
     * @tc.desc   字母对空串：O 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040260 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'O');
      const selfResult: number = ContactLetterComparator.compare('O', 'O');
      const result: number = ContactLetterComparator.compare('O', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040260 end');
    });

    /**
     * @tc.name   testCompareVolume040261
     * @tc.number SUB_Contact_CMPR_0261
     * @tc.desc   空串对字母：空串 对 P，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040261 begin');
      const reverseResult: number = ContactLetterComparator.compare('P', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'P');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040261 end');
    });

    /**
     * @tc.name   testCompareVolume040262
     * @tc.number SUB_Contact_CMPR_0262
     * @tc.desc   字母对空串：P 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040262 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'P');
      const selfResult: number = ContactLetterComparator.compare('P', 'P');
      const result: number = ContactLetterComparator.compare('P', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040262 end');
    });

    /**
     * @tc.name   testCompareVolume040263
     * @tc.number SUB_Contact_CMPR_0263
     * @tc.desc   空串对字母：空串 对 Q，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040263 begin');
      const reverseResult: number = ContactLetterComparator.compare('Q', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'Q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040263 end');
    });

    /**
     * @tc.name   testCompareVolume040264
     * @tc.number SUB_Contact_CMPR_0264
     * @tc.desc   字母对空串：Q 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040264 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'Q');
      const selfResult: number = ContactLetterComparator.compare('Q', 'Q');
      const result: number = ContactLetterComparator.compare('Q', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040264 end');
    });

    /**
     * @tc.name   testCompareVolume040265
     * @tc.number SUB_Contact_CMPR_0265
     * @tc.desc   空串对字母：空串 对 R，空串码元序在前
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040265 begin');
      const reverseResult: number = ContactLetterComparator.compare('R', '');
      const selfResult: number = ContactLetterComparator.compare('', '');
      const result: number = ContactLetterComparator.compare('', 'R');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040265 end');
    });

    /**
     * @tc.name   testCompareVolume040266
     * @tc.number SUB_Contact_CMPR_0266
     * @tc.desc   字母对空串：R 对 空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume040266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040266 begin');
      const reverseResult: number = ContactLetterComparator.compare('', 'R');
      const selfResult: number = ContactLetterComparator.compare('R', 'R');
      const result: number = ContactLetterComparator.compare('R', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume040266 end');
    });


  });
}
