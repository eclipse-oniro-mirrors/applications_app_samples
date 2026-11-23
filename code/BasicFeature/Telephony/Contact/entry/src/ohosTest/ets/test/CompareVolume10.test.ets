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

export default function compareVolume10Test() {
  describe('CompareVolume10Test', () => {
    /**
     * @tc.name   testCompareVolume050343
     * @tc.number SUB_Contact_CMPR_0343
     * @tc.desc   多字符：ab c 对 abd，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050343 begin');
      const reverseResult: number = ContactLetterComparator.compare('abd', 'ab c');
      const selfResult: number = ContactLetterComparator.compare('ab c', 'ab c');
      const result: number = ContactLetterComparator.compare('ab c', 'abd');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050343 end');
    });

    /**
     * @tc.name   testCompareVolume050344
     * @tc.number SUB_Contact_CMPR_0344
     * @tc.desc   多字符：abd 对 ab c，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050344 begin');
      const reverseResult: number = ContactLetterComparator.compare('ab c', 'abd');
      const selfResult: number = ContactLetterComparator.compare('abd', 'abd');
      const result: number = ContactLetterComparator.compare('abd', 'ab c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050344 end');
    });

    /**
     * @tc.name   testCompareVolume050345
     * @tc.number SUB_Contact_CMPR_0345
     * @tc.desc   多字符：ab 对 ac，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050345 begin');
      const reverseResult: number = ContactLetterComparator.compare('ac', 'ab');
      const selfResult: number = ContactLetterComparator.compare('ab', 'ab');
      const result: number = ContactLetterComparator.compare('ab', 'ac');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050345 end');
    });

    /**
     * @tc.name   testCompareVolume050346
     * @tc.number SUB_Contact_CMPR_0346
     * @tc.desc   多字符：ac 对 ab，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050346 begin');
      const reverseResult: number = ContactLetterComparator.compare('ab', 'ac');
      const selfResult: number = ContactLetterComparator.compare('ac', 'ac');
      const result: number = ContactLetterComparator.compare('ac', 'ab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050346 end');
    });

    /**
     * @tc.name   testCompareVolume050347
     * @tc.number SUB_Contact_CMPR_0347
     * @tc.desc   多字符：中 对 文，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050347 begin');
      const reverseResult: number = ContactLetterComparator.compare('文', '中');
      const selfResult: number = ContactLetterComparator.compare('中', '中');
      const result: number = ContactLetterComparator.compare('中', '文');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050347 end');
    });

    /**
     * @tc.name   testCompareVolume050348
     * @tc.number SUB_Contact_CMPR_0348
     * @tc.desc   多字符：文 对 中，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050348 begin');
      const reverseResult: number = ContactLetterComparator.compare('中', '文');
      const selfResult: number = ContactLetterComparator.compare('文', '文');
      const result: number = ContactLetterComparator.compare('文', '中');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050348 end');
    });

    /**
     * @tc.name   testCompareVolume050349
     * @tc.number SUB_Contact_CMPR_0349
     * @tc.desc   多字符：中文 对 中国，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050349 begin');
      const reverseResult: number = ContactLetterComparator.compare('中国', '中文');
      const selfResult: number = ContactLetterComparator.compare('中文', '中文');
      const result: number = ContactLetterComparator.compare('中文', '中国');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050349 end');
    });

    /**
     * @tc.name   testCompareVolume050350
     * @tc.number SUB_Contact_CMPR_0350
     * @tc.desc   多字符：中国 对 中文，全串码元序比较
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050350 begin');
      const reverseResult: number = ContactLetterComparator.compare('中文', '中国');
      const selfResult: number = ContactLetterComparator.compare('中国', '中国');
      const result: number = ContactLetterComparator.compare('中国', '中文');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050350 end');
    });

    /**
     * @tc.name   testCompareVolume050351
     * @tc.number SUB_Contact_CMPR_0351
     * @tc.desc   多字符：s45 对 s46
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050351 begin');
      const reverseResult: number = ContactLetterComparator.compare('s46', 's45');
      const selfResult: number = ContactLetterComparator.compare('s45', 's45');
      const result: number = ContactLetterComparator.compare('s45', 's46');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050351 end');
    });

    /**
     * @tc.name   testCompareVolume050352
     * @tc.number SUB_Contact_CMPR_0352
     * @tc.desc   多字符：s46 对 s45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050352 begin');
      const reverseResult: number = ContactLetterComparator.compare('s45', 's46');
      const selfResult: number = ContactLetterComparator.compare('s46', 's46');
      const result: number = ContactLetterComparator.compare('s46', 's45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050352 end');
    });

    /**
     * @tc.name   testCompareVolume050353
     * @tc.number SUB_Contact_CMPR_0353
     * @tc.desc   多字符：s47 对 s48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050353 begin');
      const reverseResult: number = ContactLetterComparator.compare('s48', 's47');
      const selfResult: number = ContactLetterComparator.compare('s47', 's47');
      const result: number = ContactLetterComparator.compare('s47', 's48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050353 end');
    });

    /**
     * @tc.name   testCompareVolume050354
     * @tc.number SUB_Contact_CMPR_0354
     * @tc.desc   多字符：s48 对 s47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050354 begin');
      const reverseResult: number = ContactLetterComparator.compare('s47', 's48');
      const selfResult: number = ContactLetterComparator.compare('s48', 's48');
      const result: number = ContactLetterComparator.compare('s48', 's47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050354 end');
    });

    /**
     * @tc.name   testCompareVolume050355
     * @tc.number SUB_Contact_CMPR_0355
     * @tc.desc   多字符：s49 对 s50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050355 begin');
      const reverseResult: number = ContactLetterComparator.compare('s50', 's49');
      const selfResult: number = ContactLetterComparator.compare('s49', 's49');
      const result: number = ContactLetterComparator.compare('s49', 's50');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050355 end');
    });

    /**
     * @tc.name   testCompareVolume050356
     * @tc.number SUB_Contact_CMPR_0356
     * @tc.desc   多字符：s50 对 s49
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050356 begin');
      const reverseResult: number = ContactLetterComparator.compare('s49', 's50');
      const selfResult: number = ContactLetterComparator.compare('s50', 's50');
      const result: number = ContactLetterComparator.compare('s50', 's49');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050356 end');
    });

    /**
     * @tc.name   testCompareVolume050357
     * @tc.number SUB_Contact_CMPR_0357
     * @tc.desc   多字符：s51 对 s52
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050357 begin');
      const reverseResult: number = ContactLetterComparator.compare('s52', 's51');
      const selfResult: number = ContactLetterComparator.compare('s51', 's51');
      const result: number = ContactLetterComparator.compare('s51', 's52');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050357 end');
    });

    /**
     * @tc.name   testCompareVolume050358
     * @tc.number SUB_Contact_CMPR_0358
     * @tc.desc   多字符：s52 对 s51
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050358 begin');
      const reverseResult: number = ContactLetterComparator.compare('s51', 's52');
      const selfResult: number = ContactLetterComparator.compare('s52', 's52');
      const result: number = ContactLetterComparator.compare('s52', 's51');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050358 end');
    });

    /**
     * @tc.name   testCompareVolume050359
     * @tc.number SUB_Contact_CMPR_0359
     * @tc.desc   多字符：s53 对 s54
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050359 begin');
      const reverseResult: number = ContactLetterComparator.compare('s54', 's53');
      const selfResult: number = ContactLetterComparator.compare('s53', 's53');
      const result: number = ContactLetterComparator.compare('s53', 's54');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050359 end');
    });

    /**
     * @tc.name   testCompareVolume050360
     * @tc.number SUB_Contact_CMPR_0360
     * @tc.desc   多字符：s54 对 s53
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050360 begin');
      const reverseResult: number = ContactLetterComparator.compare('s53', 's54');
      const selfResult: number = ContactLetterComparator.compare('s54', 's54');
      const result: number = ContactLetterComparator.compare('s54', 's53');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050360 end');
    });

    /**
     * @tc.name   testCompareVolume050361
     * @tc.number SUB_Contact_CMPR_0361
     * @tc.desc   多字符：s55 对 s56
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050361 begin');
      const reverseResult: number = ContactLetterComparator.compare('s56', 's55');
      const selfResult: number = ContactLetterComparator.compare('s55', 's55');
      const result: number = ContactLetterComparator.compare('s55', 's56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050361 end');
    });

    /**
     * @tc.name   testCompareVolume050362
     * @tc.number SUB_Contact_CMPR_0362
     * @tc.desc   多字符：s56 对 s55
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050362 begin');
      const reverseResult: number = ContactLetterComparator.compare('s55', 's56');
      const selfResult: number = ContactLetterComparator.compare('s56', 's56');
      const result: number = ContactLetterComparator.compare('s56', 's55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050362 end');
    });

    /**
     * @tc.name   testCompareVolume050363
     * @tc.number SUB_Contact_CMPR_0363
     * @tc.desc   多字符：s57 对 s58
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050363 begin');
      const reverseResult: number = ContactLetterComparator.compare('s58', 's57');
      const selfResult: number = ContactLetterComparator.compare('s57', 's57');
      const result: number = ContactLetterComparator.compare('s57', 's58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050363 end');
    });

    /**
     * @tc.name   testCompareVolume050364
     * @tc.number SUB_Contact_CMPR_0364
     * @tc.desc   多字符：s58 对 s57
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050364 begin');
      const reverseResult: number = ContactLetterComparator.compare('s57', 's58');
      const selfResult: number = ContactLetterComparator.compare('s58', 's58');
      const result: number = ContactLetterComparator.compare('s58', 's57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050364 end');
    });

    /**
     * @tc.name   testCompareVolume050365
     * @tc.number SUB_Contact_CMPR_0365
     * @tc.desc   多字符：s59 对 s60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050365 begin');
      const reverseResult: number = ContactLetterComparator.compare('s60', 's59');
      const selfResult: number = ContactLetterComparator.compare('s59', 's59');
      const result: number = ContactLetterComparator.compare('s59', 's60');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050365 end');
    });

    /**
     * @tc.name   testCompareVolume050366
     * @tc.number SUB_Contact_CMPR_0366
     * @tc.desc   多字符：s60 对 s59
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050366 begin');
      const reverseResult: number = ContactLetterComparator.compare('s59', 's60');
      const selfResult: number = ContactLetterComparator.compare('s60', 's60');
      const result: number = ContactLetterComparator.compare('s60', 's59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050366 end');
    });

    /**
     * @tc.name   testCompareVolume050367
     * @tc.number SUB_Contact_CMPR_0367
     * @tc.desc   多字符：s61 对 s62
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050367 begin');
      const reverseResult: number = ContactLetterComparator.compare('s62', 's61');
      const selfResult: number = ContactLetterComparator.compare('s61', 's61');
      const result: number = ContactLetterComparator.compare('s61', 's62');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050367 end');
    });

    /**
     * @tc.name   testCompareVolume050368
     * @tc.number SUB_Contact_CMPR_0368
     * @tc.desc   多字符：s62 对 s61
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050368 begin');
      const reverseResult: number = ContactLetterComparator.compare('s61', 's62');
      const selfResult: number = ContactLetterComparator.compare('s62', 's62');
      const result: number = ContactLetterComparator.compare('s62', 's61');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050368 end');
    });

    /**
     * @tc.name   testCompareVolume050369
     * @tc.number SUB_Contact_CMPR_0369
     * @tc.desc   多字符：s63 对 s64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050369 begin');
      const reverseResult: number = ContactLetterComparator.compare('s64', 's63');
      const selfResult: number = ContactLetterComparator.compare('s63', 's63');
      const result: number = ContactLetterComparator.compare('s63', 's64');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050369 end');
    });

    /**
     * @tc.name   testCompareVolume050370
     * @tc.number SUB_Contact_CMPR_0370
     * @tc.desc   多字符：s64 对 s63
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050370 begin');
      const reverseResult: number = ContactLetterComparator.compare('s63', 's64');
      const selfResult: number = ContactLetterComparator.compare('s64', 's64');
      const result: number = ContactLetterComparator.compare('s64', 's63');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050370 end');
    });

    /**
     * @tc.name   testCompareVolume050371
     * @tc.number SUB_Contact_CMPR_0371
     * @tc.desc   多字符：s65 对 s66
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050371 begin');
      const reverseResult: number = ContactLetterComparator.compare('s66', 's65');
      const selfResult: number = ContactLetterComparator.compare('s65', 's65');
      const result: number = ContactLetterComparator.compare('s65', 's66');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050371 end');
    });

    /**
     * @tc.name   testCompareVolume050372
     * @tc.number SUB_Contact_CMPR_0372
     * @tc.desc   多字符：s66 对 s65
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050372 begin');
      const reverseResult: number = ContactLetterComparator.compare('s65', 's66');
      const selfResult: number = ContactLetterComparator.compare('s66', 's66');
      const result: number = ContactLetterComparator.compare('s66', 's65');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050372 end');
    });

    /**
     * @tc.name   testCompareVolume050373
     * @tc.number SUB_Contact_CMPR_0373
     * @tc.desc   多字符：s67 对 s68
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050373 begin');
      const reverseResult: number = ContactLetterComparator.compare('s68', 's67');
      const selfResult: number = ContactLetterComparator.compare('s67', 's67');
      const result: number = ContactLetterComparator.compare('s67', 's68');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050373 end');
    });

    /**
     * @tc.name   testCompareVolume050374
     * @tc.number SUB_Contact_CMPR_0374
     * @tc.desc   多字符：s68 对 s67
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050374 begin');
      const reverseResult: number = ContactLetterComparator.compare('s67', 's68');
      const selfResult: number = ContactLetterComparator.compare('s68', 's68');
      const result: number = ContactLetterComparator.compare('s68', 's67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050374 end');
    });

    /**
     * @tc.name   testCompareVolume050375
     * @tc.number SUB_Contact_CMPR_0375
     * @tc.desc   多字符：s69 对 s70
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050375 begin');
      const reverseResult: number = ContactLetterComparator.compare('s70', 's69');
      const selfResult: number = ContactLetterComparator.compare('s69', 's69');
      const result: number = ContactLetterComparator.compare('s69', 's70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050375 end');
    });

    /**
     * @tc.name   testCompareVolume050376
     * @tc.number SUB_Contact_CMPR_0376
     * @tc.desc   多字符：s70 对 s69
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050376 begin');
      const reverseResult: number = ContactLetterComparator.compare('s69', 's70');
      const selfResult: number = ContactLetterComparator.compare('s70', 's70');
      const result: number = ContactLetterComparator.compare('s70', 's69');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050376 end');
    });

    /**
     * @tc.name   testCompareVolume050377
     * @tc.number SUB_Contact_CMPR_0377
     * @tc.desc   多字符：s71 对 s72
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050377 begin');
      const reverseResult: number = ContactLetterComparator.compare('s72', 's71');
      const selfResult: number = ContactLetterComparator.compare('s71', 's71');
      const result: number = ContactLetterComparator.compare('s71', 's72');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050377 end');
    });

    /**
     * @tc.name   testCompareVolume050378
     * @tc.number SUB_Contact_CMPR_0378
     * @tc.desc   多字符：s72 对 s71
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050378 begin');
      const reverseResult: number = ContactLetterComparator.compare('s71', 's72');
      const selfResult: number = ContactLetterComparator.compare('s72', 's72');
      const result: number = ContactLetterComparator.compare('s72', 's71');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050378 end');
    });

    /**
     * @tc.name   testCompareVolume050379
     * @tc.number SUB_Contact_CMPR_0379
     * @tc.desc   多字符：s73 对 s74
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050379 begin');
      const reverseResult: number = ContactLetterComparator.compare('s74', 's73');
      const selfResult: number = ContactLetterComparator.compare('s73', 's73');
      const result: number = ContactLetterComparator.compare('s73', 's74');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050379 end');
    });

    /**
     * @tc.name   testCompareVolume050380
     * @tc.number SUB_Contact_CMPR_0380
     * @tc.desc   多字符：s74 对 s73
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume050380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050380 begin');
      const reverseResult: number = ContactLetterComparator.compare('s73', 's74');
      const selfResult: number = ContactLetterComparator.compare('s74', 's74');
      const result: number = ContactLetterComparator.compare('s74', 's73');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume050380 end');
    });
  });
}
