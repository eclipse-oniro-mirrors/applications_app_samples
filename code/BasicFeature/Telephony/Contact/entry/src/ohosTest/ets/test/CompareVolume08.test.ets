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

export default function compareVolume08Test() {
  describe('CompareVolume08Test', () => {
    /**
     * @tc.name   testCompareVolume030191
     * @tc.number SUB_Contact_CMPR_0191
     * @tc.desc   符号相邻：^ 对 %，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030191 begin');
      const reverseResult: number = ContactLetterComparator.compare('%', '^');
      const selfResult: number = ContactLetterComparator.compare('^', '^');
      const result: number = ContactLetterComparator.compare('^', '%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030191 end');
    });

    /**
     * @tc.name   testCompareVolume030192
     * @tc.number SUB_Contact_CMPR_0192
     * @tc.desc   符号相邻：^ 对 &，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030192 begin');
      const reverseResult: number = ContactLetterComparator.compare('&', '^');
      const selfResult: number = ContactLetterComparator.compare('^', '^');
      const result: number = ContactLetterComparator.compare('^', '&');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030192 end');
    });

    /**
     * @tc.name   testCompareVolume030193
     * @tc.number SUB_Contact_CMPR_0193
     * @tc.desc   符号相邻：& 对 ^，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030193 begin');
      const reverseResult: number = ContactLetterComparator.compare('^', '&');
      const selfResult: number = ContactLetterComparator.compare('&', '&');
      const result: number = ContactLetterComparator.compare('&', '^');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030193 end');
    });

    /**
     * @tc.name   testCompareVolume030194
     * @tc.number SUB_Contact_CMPR_0194
     * @tc.desc   符号相邻：& 对 *，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030194 begin');
      const reverseResult: number = ContactLetterComparator.compare('*', '&');
      const selfResult: number = ContactLetterComparator.compare('&', '&');
      const result: number = ContactLetterComparator.compare('&', '*');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030194 end');
    });

    /**
     * @tc.name   testCompareVolume030195
     * @tc.number SUB_Contact_CMPR_0195
     * @tc.desc   符号相邻：* 对 &，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030195 begin');
      const reverseResult: number = ContactLetterComparator.compare('&', '*');
      const selfResult: number = ContactLetterComparator.compare('*', '*');
      const result: number = ContactLetterComparator.compare('*', '&');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030195 end');
    });

    /**
     * @tc.name   testCompareVolume030196
     * @tc.number SUB_Contact_CMPR_0196
     * @tc.desc   符号相邻：* 对 (，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030196 begin');
      const reverseResult: number = ContactLetterComparator.compare('(', '*');
      const selfResult: number = ContactLetterComparator.compare('*', '*');
      const result: number = ContactLetterComparator.compare('*', '(');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030196 end');
    });

    /**
     * @tc.name   testCompareVolume030197
     * @tc.number SUB_Contact_CMPR_0197
     * @tc.desc   符号相邻：( 对 *，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030197 begin');
      const reverseResult: number = ContactLetterComparator.compare('*', '(');
      const selfResult: number = ContactLetterComparator.compare('(', '(');
      const result: number = ContactLetterComparator.compare('(', '*');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030197 end');
    });

    /**
     * @tc.name   testCompareVolume030198
     * @tc.number SUB_Contact_CMPR_0198
     * @tc.desc   符号相邻：( 对 )，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030198 begin');
      const reverseResult: number = ContactLetterComparator.compare(')', '(');
      const selfResult: number = ContactLetterComparator.compare('(', '(');
      const result: number = ContactLetterComparator.compare('(', ')');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030198 end');
    });

    /**
     * @tc.name   testCompareVolume030199
     * @tc.number SUB_Contact_CMPR_0199
     * @tc.desc   符号相邻：) 对 (，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030199 begin');
      const reverseResult: number = ContactLetterComparator.compare('(', ')');
      const selfResult: number = ContactLetterComparator.compare(')', ')');
      const result: number = ContactLetterComparator.compare(')', '(');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030199 end');
    });

    /**
     * @tc.name   testCompareVolume030200
     * @tc.number SUB_Contact_CMPR_0200
     * @tc.desc   符号相邻：) 对 +，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030200 begin');
      const reverseResult: number = ContactLetterComparator.compare('+', ')');
      const selfResult: number = ContactLetterComparator.compare(')', ')');
      const result: number = ContactLetterComparator.compare(')', '+');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030200 end');
    });

    /**
     * @tc.name   testCompareVolume030201
     * @tc.number SUB_Contact_CMPR_0201
     * @tc.desc   符号相邻：+ 对 )，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030201 begin');
      const reverseResult: number = ContactLetterComparator.compare(')', '+');
      const selfResult: number = ContactLetterComparator.compare('+', '+');
      const result: number = ContactLetterComparator.compare('+', ')');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030201 end');
    });

    /**
     * @tc.name   testCompareVolume030202
     * @tc.number SUB_Contact_CMPR_0202
     * @tc.desc   符号相邻：+ 对 -，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030202 begin');
      const reverseResult: number = ContactLetterComparator.compare('-', '+');
      const selfResult: number = ContactLetterComparator.compare('+', '+');
      const result: number = ContactLetterComparator.compare('+', '-');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030202 end');
    });

    /**
     * @tc.name   testCompareVolume030203
     * @tc.number SUB_Contact_CMPR_0203
     * @tc.desc   符号相邻：- 对 +，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030203 begin');
      const reverseResult: number = ContactLetterComparator.compare('+', '-');
      const selfResult: number = ContactLetterComparator.compare('-', '-');
      const result: number = ContactLetterComparator.compare('-', '+');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030203 end');
    });

    /**
     * @tc.name   testCompareVolume030204
     * @tc.number SUB_Contact_CMPR_0204
     * @tc.desc   符号相邻：- 对 =，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030204 begin');
      const reverseResult: number = ContactLetterComparator.compare('=', '-');
      const selfResult: number = ContactLetterComparator.compare('-', '-');
      const result: number = ContactLetterComparator.compare('-', '=');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030204 end');
    });

    /**
     * @tc.name   testCompareVolume030205
     * @tc.number SUB_Contact_CMPR_0205
     * @tc.desc   符号相邻：= 对 -，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030205 begin');
      const reverseResult: number = ContactLetterComparator.compare('-', '=');
      const selfResult: number = ContactLetterComparator.compare('=', '=');
      const result: number = ContactLetterComparator.compare('=', '-');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030205 end');
    });

    /**
     * @tc.name   testCompareVolume030206
     * @tc.number SUB_Contact_CMPR_0206
     * @tc.desc   符号相邻：= 对 [，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030206 begin');
      const reverseResult: number = ContactLetterComparator.compare('[', '=');
      const selfResult: number = ContactLetterComparator.compare('=', '=');
      const result: number = ContactLetterComparator.compare('=', '[');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030206 end');
    });

    /**
     * @tc.name   testCompareVolume030207
     * @tc.number SUB_Contact_CMPR_0207
     * @tc.desc   符号相邻：[ 对 =，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030207 begin');
      const reverseResult: number = ContactLetterComparator.compare('=', '[');
      const selfResult: number = ContactLetterComparator.compare('[', '[');
      const result: number = ContactLetterComparator.compare('[', '=');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030207 end');
    });

    /**
     * @tc.name   testCompareVolume030208
     * @tc.number SUB_Contact_CMPR_0208
     * @tc.desc   符号相邻：[ 对 ]，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030208 begin');
      const reverseResult: number = ContactLetterComparator.compare(']', '[');
      const selfResult: number = ContactLetterComparator.compare('[', '[');
      const result: number = ContactLetterComparator.compare('[', ']');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030208 end');
    });

    /**
     * @tc.name   testCompareVolume030209
     * @tc.number SUB_Contact_CMPR_0209
     * @tc.desc   符号相邻：] 对 [，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030209 begin');
      const reverseResult: number = ContactLetterComparator.compare('[', ']');
      const selfResult: number = ContactLetterComparator.compare(']', ']');
      const result: number = ContactLetterComparator.compare(']', '[');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030209 end');
    });

    /**
     * @tc.name   testCompareVolume030210
     * @tc.number SUB_Contact_CMPR_0210
     * @tc.desc   符号相邻：] 对 {，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030210 begin');
      const reverseResult: number = ContactLetterComparator.compare('{', ']');
      const selfResult: number = ContactLetterComparator.compare(']', ']');
      const result: number = ContactLetterComparator.compare(']', '{');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030210 end');
    });

    /**
     * @tc.name   testCompareVolume030211
     * @tc.number SUB_Contact_CMPR_0211
     * @tc.desc   符号相邻：{ 对 ]，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030211 begin');
      const reverseResult: number = ContactLetterComparator.compare(']', '{');
      const selfResult: number = ContactLetterComparator.compare('{', '{');
      const result: number = ContactLetterComparator.compare('{', ']');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030211 end');
    });

    /**
     * @tc.name   testCompareVolume030212
     * @tc.number SUB_Contact_CMPR_0212
     * @tc.desc   数字对字母：9(57) 对 A(65)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030212 begin');
      const reverseResult: number = ContactLetterComparator.compare('A', '9');
      const selfResult: number = ContactLetterComparator.compare('9', '9');
      const result: number = ContactLetterComparator.compare('9', 'A');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030212 end');
    });

    /**
     * @tc.name   testCompareVolume030213
     * @tc.number SUB_Contact_CMPR_0213
     * @tc.desc   字母对数字：A(65) 对 9(57)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030213 begin');
      const reverseResult: number = ContactLetterComparator.compare('9', 'A');
      const selfResult: number = ContactLetterComparator.compare('A', 'A');
      const result: number = ContactLetterComparator.compare('A', '9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030213 end');
    });

    /**
     * @tc.name   testCompareVolume030214
     * @tc.number SUB_Contact_CMPR_0214
     * @tc.desc   符号对数字：!(33) 对 0(48)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030214 begin');
      const reverseResult: number = ContactLetterComparator.compare('0', '!');
      const selfResult: number = ContactLetterComparator.compare('!', '!');
      const result: number = ContactLetterComparator.compare('!', '0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030214 end');
    });

    /**
     * @tc.name   testCompareVolume030215
     * @tc.number SUB_Contact_CMPR_0215
     * @tc.desc   补齐：q0 对 q1，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030215 begin');
      const reverseResult: number = ContactLetterComparator.compare('q1', 'q0');
      const selfResult: number = ContactLetterComparator.compare('q0', 'q0');
      const result: number = ContactLetterComparator.compare('q0', 'q1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030215 end');
    });

    /**
     * @tc.name   testCompareVolume030216
     * @tc.number SUB_Contact_CMPR_0216
     * @tc.desc   补齐：q1 对 q2，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030216 begin');
      const reverseResult: number = ContactLetterComparator.compare('q2', 'q1');
      const selfResult: number = ContactLetterComparator.compare('q1', 'q1');
      const result: number = ContactLetterComparator.compare('q1', 'q2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030216 end');
    });

    /**
     * @tc.name   testCompareVolume030217
     * @tc.number SUB_Contact_CMPR_0217
     * @tc.desc   补齐：q2 对 q3，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030217 begin');
      const reverseResult: number = ContactLetterComparator.compare('q3', 'q2');
      const selfResult: number = ContactLetterComparator.compare('q2', 'q2');
      const result: number = ContactLetterComparator.compare('q2', 'q3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030217 end');
    });

    /**
     * @tc.name   testCompareVolume030218
     * @tc.number SUB_Contact_CMPR_0218
     * @tc.desc   补齐：q3 对 q4，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030218 begin');
      const reverseResult: number = ContactLetterComparator.compare('q4', 'q3');
      const selfResult: number = ContactLetterComparator.compare('q3', 'q3');
      const result: number = ContactLetterComparator.compare('q3', 'q4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030218 end');
    });

    /**
     * @tc.name   testCompareVolume030219
     * @tc.number SUB_Contact_CMPR_0219
     * @tc.desc   补齐：q4 对 q5，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030219 begin');
      const reverseResult: number = ContactLetterComparator.compare('q5', 'q4');
      const selfResult: number = ContactLetterComparator.compare('q4', 'q4');
      const result: number = ContactLetterComparator.compare('q4', 'q5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030219 end');
    });

    /**
     * @tc.name   testCompareVolume030220
     * @tc.number SUB_Contact_CMPR_0220
     * @tc.desc   补齐：q5 对 q6，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030220 begin');
      const reverseResult: number = ContactLetterComparator.compare('q6', 'q5');
      const selfResult: number = ContactLetterComparator.compare('q5', 'q5');
      const result: number = ContactLetterComparator.compare('q5', 'q6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030220 end');
    });

    /**
     * @tc.name   testCompareVolume030221
     * @tc.number SUB_Contact_CMPR_0221
     * @tc.desc   补齐：q6 对 q7，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030221 begin');
      const reverseResult: number = ContactLetterComparator.compare('q7', 'q6');
      const selfResult: number = ContactLetterComparator.compare('q6', 'q6');
      const result: number = ContactLetterComparator.compare('q6', 'q7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030221 end');
    });

    /**
     * @tc.name   testCompareVolume030222
     * @tc.number SUB_Contact_CMPR_0222
     * @tc.desc   补齐：q7 对 q8，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030222 begin');
      const reverseResult: number = ContactLetterComparator.compare('q8', 'q7');
      const selfResult: number = ContactLetterComparator.compare('q7', 'q7');
      const result: number = ContactLetterComparator.compare('q7', 'q8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030222 end');
    });

    /**
     * @tc.name   testCompareVolume030223
     * @tc.number SUB_Contact_CMPR_0223
     * @tc.desc   补齐：q8 对 q9，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030223 begin');
      const reverseResult: number = ContactLetterComparator.compare('q9', 'q8');
      const selfResult: number = ContactLetterComparator.compare('q8', 'q8');
      const result: number = ContactLetterComparator.compare('q8', 'q9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030223 end');
    });

    /**
     * @tc.name   testCompareVolume030224
     * @tc.number SUB_Contact_CMPR_0224
     * @tc.desc   补齐：q9 对 q10，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030224 begin');
      const reverseResult: number = ContactLetterComparator.compare('q10', 'q9');
      const selfResult: number = ContactLetterComparator.compare('q9', 'q9');
      const result: number = ContactLetterComparator.compare('q9', 'q10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(1));
      expect(result).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030224 end');
    });

    /**
     * @tc.name   testCompareVolume030225
     * @tc.number SUB_Contact_CMPR_0225
     * @tc.desc   补齐：q10 对 q11，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030225 begin');
      const reverseResult: number = ContactLetterComparator.compare('q11', 'q10');
      const selfResult: number = ContactLetterComparator.compare('q10', 'q10');
      const result: number = ContactLetterComparator.compare('q10', 'q11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030225 end');
    });

    /**
     * @tc.name   testCompareVolume030226
     * @tc.number SUB_Contact_CMPR_0226
     * @tc.desc   补齐：q11 对 q12，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030226 begin');
      const reverseResult: number = ContactLetterComparator.compare('q12', 'q11');
      const selfResult: number = ContactLetterComparator.compare('q11', 'q11');
      const result: number = ContactLetterComparator.compare('q11', 'q12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030226 end');
    });

    /**
     * @tc.name   testCompareVolume030227
     * @tc.number SUB_Contact_CMPR_0227
     * @tc.desc   补齐：q12 对 q13，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030227 begin');
      const reverseResult: number = ContactLetterComparator.compare('q13', 'q12');
      const selfResult: number = ContactLetterComparator.compare('q12', 'q12');
      const result: number = ContactLetterComparator.compare('q12', 'q13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030227 end');
    });

    /**
     * @tc.name   testCompareVolume030228
     * @tc.number SUB_Contact_CMPR_0228
     * @tc.desc   补齐：q13 对 q14，按码元序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCompareVolume030228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030228 begin');
      const reverseResult: number = ContactLetterComparator.compare('q14', 'q13');
      const selfResult: number = ContactLetterComparator.compare('q13', 'q13');
      const result: number = ContactLetterComparator.compare('q13', 'q14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(-1));
      expect(result).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s e' +
        'xpected=%{public}s', String(reverseResult + result), String(0));
      expect(reverseResult + result).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(selfResult), String(0));
      expect(selfResult).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCompareVolume030228 end');
    });
  });
}
