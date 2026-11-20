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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { letterAtIndex } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for letterAtIndex (48 cases). */
export default function letterAtIndex3Test(): void {
  describe('LetterAtIndex3Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0193
     * @tc.name      CitySearch_LetterAtIndex_0193
     * @tc.desc      letterAtIndex(index=81.63) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0193 begin`);
      const actual: string = letterAtIndex(81.63);
      logInfo(`letterAtIndex(index=81.63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0193 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0194
     * @tc.name      CitySearch_LetterAtIndex_0194
     * @tc.desc      letterAtIndex(index=-79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0194 begin`);
      const actual: string = letterAtIndex(-79);
      logInfo(`letterAtIndex(index=-79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0194 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0195
     * @tc.name      CitySearch_LetterAtIndex_0195
     * @tc.desc      letterAtIndex(index=16) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0195 begin`);
      const actual: string = letterAtIndex(16);
      logInfo(`letterAtIndex(index=16): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0195 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0196
     * @tc.name      CitySearch_LetterAtIndex_0196
     * @tc.desc      letterAtIndex(index=102) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0196 begin`);
      const actual: string = letterAtIndex(102);
      logInfo(`letterAtIndex(index=102): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0196 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0197
     * @tc.name      CitySearch_LetterAtIndex_0197
     * @tc.desc      letterAtIndex(index=-96) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0197 begin`);
      const actual: string = letterAtIndex(-96);
      logInfo(`letterAtIndex(index=-96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0197 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0198
     * @tc.name      CitySearch_LetterAtIndex_0198
     * @tc.desc      letterAtIndex(index=61.44) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0198 begin`);
      const actual: string = letterAtIndex(61.44);
      logInfo(`letterAtIndex(index=61.44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0198 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0199
     * @tc.name      CitySearch_LetterAtIndex_0199
     * @tc.desc      letterAtIndex(index=28) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0199 begin`);
      const actual: string = letterAtIndex(28);
      logInfo(`letterAtIndex(index=28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0199 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0200
     * @tc.name      CitySearch_LetterAtIndex_0200
     * @tc.desc      letterAtIndex(index=121) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0200 begin`);
      const actual: string = letterAtIndex(121);
      logInfo(`letterAtIndex(index=121): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0200 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0201
     * @tc.name      CitySearch_LetterAtIndex_0201
     * @tc.desc      letterAtIndex(index=61) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0201 begin`);
      const actual: string = letterAtIndex(61);
      logInfo(`letterAtIndex(index=61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0201 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0202
     * @tc.name      CitySearch_LetterAtIndex_0202
     * @tc.desc      letterAtIndex(index=111) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0202 begin`);
      const actual: string = letterAtIndex(111);
      logInfo(`letterAtIndex(index=111): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0202 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0203
     * @tc.name      CitySearch_LetterAtIndex_0203
     * @tc.desc      letterAtIndex(index=28.68) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0203 begin`);
      const actual: string = letterAtIndex(28.68);
      logInfo(`letterAtIndex(index=28.68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0203 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0204
     * @tc.name      CitySearch_LetterAtIndex_0204
     * @tc.desc      letterAtIndex(index=26.24) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0204 begin`);
      const actual: string = letterAtIndex(26.24);
      logInfo(`letterAtIndex(index=26.24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0204 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0205
     * @tc.name      CitySearch_LetterAtIndex_0205
     * @tc.desc      letterAtIndex(index=62.02) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0205 begin`);
      const actual: string = letterAtIndex(62.02);
      logInfo(`letterAtIndex(index=62.02): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0205 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0206
     * @tc.name      CitySearch_LetterAtIndex_0206
     * @tc.desc      letterAtIndex(index=48) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0206 begin`);
      const actual: string = letterAtIndex(48);
      logInfo(`letterAtIndex(index=48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0206 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0207
     * @tc.name      CitySearch_LetterAtIndex_0207
     * @tc.desc      letterAtIndex(index=-18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0207 begin`);
      const actual: string = letterAtIndex(-18);
      logInfo(`letterAtIndex(index=-18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0207 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0208
     * @tc.name      CitySearch_LetterAtIndex_0208
     * @tc.desc      letterAtIndex(index=-7) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0208 begin`);
      const actual: string = letterAtIndex(-7);
      logInfo(`letterAtIndex(index=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0208 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0209
     * @tc.name      CitySearch_LetterAtIndex_0209
     * @tc.desc      letterAtIndex(index=181) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0209 begin`);
      const actual: string = letterAtIndex(181);
      logInfo(`letterAtIndex(index=181): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0209 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0210
     * @tc.name      CitySearch_LetterAtIndex_0210
     * @tc.desc      letterAtIndex(index=73) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0210 begin`);
      const actual: string = letterAtIndex(73);
      logInfo(`letterAtIndex(index=73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0210 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0211
     * @tc.name      CitySearch_LetterAtIndex_0211
     * @tc.desc      letterAtIndex(index=92.19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0211 begin`);
      const actual: string = letterAtIndex(92.19);
      logInfo(`letterAtIndex(index=92.19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0211 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0212
     * @tc.name      CitySearch_LetterAtIndex_0212
     * @tc.desc      letterAtIndex(index=-59) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0212 begin`);
      const actual: string = letterAtIndex(-59);
      logInfo(`letterAtIndex(index=-59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0212 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0213
     * @tc.name      CitySearch_LetterAtIndex_0213
     * @tc.desc      letterAtIndex(index=95.03) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0213 begin`);
      const actual: string = letterAtIndex(95.03);
      logInfo(`letterAtIndex(index=95.03): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0213 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0214
     * @tc.name      CitySearch_LetterAtIndex_0214
     * @tc.desc      letterAtIndex(index=29.28) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0214 begin`);
      const actual: string = letterAtIndex(29.28);
      logInfo(`letterAtIndex(index=29.28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0214 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0215
     * @tc.name      CitySearch_LetterAtIndex_0215
     * @tc.desc      letterAtIndex(index=11.91) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0215 begin`);
      const actual: string = letterAtIndex(11.91);
      logInfo(`letterAtIndex(index=11.91): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0215 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0216
     * @tc.name      CitySearch_LetterAtIndex_0216
     * @tc.desc      letterAtIndex(index=65.37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0216 begin`);
      const actual: string = letterAtIndex(65.37);
      logInfo(`letterAtIndex(index=65.37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0216 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0217
     * @tc.name      CitySearch_LetterAtIndex_0217
     * @tc.desc      letterAtIndex(index=77.5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0217 begin`);
      const actual: string = letterAtIndex(77.5);
      logInfo(`letterAtIndex(index=77.5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0217 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0218
     * @tc.name      CitySearch_LetterAtIndex_0218
     * @tc.desc      letterAtIndex(index=-16) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0218 begin`);
      const actual: string = letterAtIndex(-16);
      logInfo(`letterAtIndex(index=-16): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0218 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0219
     * @tc.name      CitySearch_LetterAtIndex_0219
     * @tc.desc      letterAtIndex(index=41.64) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0219 begin`);
      const actual: string = letterAtIndex(41.64);
      logInfo(`letterAtIndex(index=41.64): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0219 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0220
     * @tc.name      CitySearch_LetterAtIndex_0220
     * @tc.desc      letterAtIndex(index=108) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0220 begin`);
      const actual: string = letterAtIndex(108);
      logInfo(`letterAtIndex(index=108): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0220 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0221
     * @tc.name      CitySearch_LetterAtIndex_0221
     * @tc.desc      letterAtIndex(index=25.55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0221 begin`);
      const actual: string = letterAtIndex(25.55);
      logInfo(`letterAtIndex(index=25.55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0221 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0222
     * @tc.name      CitySearch_LetterAtIndex_0222
     * @tc.desc      letterAtIndex(index=-32) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0222 begin`);
      const actual: string = letterAtIndex(-32);
      logInfo(`letterAtIndex(index=-32): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0222 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0223
     * @tc.name      CitySearch_LetterAtIndex_0223
     * @tc.desc      letterAtIndex(index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0223 begin`);
      const actual: string = letterAtIndex(133);
      logInfo(`letterAtIndex(index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0223 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0224
     * @tc.name      CitySearch_LetterAtIndex_0224
     * @tc.desc      letterAtIndex(index=41.85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0224 begin`);
      const actual: string = letterAtIndex(41.85);
      logInfo(`letterAtIndex(index=41.85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0224 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0225
     * @tc.name      CitySearch_LetterAtIndex_0225
     * @tc.desc      letterAtIndex(index=23.67) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0225 begin`);
      const actual: string = letterAtIndex(23.67);
      logInfo(`letterAtIndex(index=23.67): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0225 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0226
     * @tc.name      CitySearch_LetterAtIndex_0226
     * @tc.desc      letterAtIndex(index=176) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0226 begin`);
      const actual: string = letterAtIndex(176);
      logInfo(`letterAtIndex(index=176): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0226 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0227
     * @tc.name      CitySearch_LetterAtIndex_0227
     * @tc.desc      letterAtIndex(index=-33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0227 begin`);
      const actual: string = letterAtIndex(-33);
      logInfo(`letterAtIndex(index=-33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0227 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0228
     * @tc.name      CitySearch_LetterAtIndex_0228
     * @tc.desc      letterAtIndex(index=-92) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0228 begin`);
      const actual: string = letterAtIndex(-92);
      logInfo(`letterAtIndex(index=-92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0228 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0229
     * @tc.name      CitySearch_LetterAtIndex_0229
     * @tc.desc      letterAtIndex(index=68.63) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0229 begin`);
      const actual: string = letterAtIndex(68.63);
      logInfo(`letterAtIndex(index=68.63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0229 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0230
     * @tc.name      CitySearch_LetterAtIndex_0230
     * @tc.desc      letterAtIndex(index=14.11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0230 begin`);
      const actual: string = letterAtIndex(14.11);
      logInfo(`letterAtIndex(index=14.11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0230 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0231
     * @tc.name      CitySearch_LetterAtIndex_0231
     * @tc.desc      letterAtIndex(index=97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0231 begin`);
      const actual: string = letterAtIndex(97);
      logInfo(`letterAtIndex(index=97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0231 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0232
     * @tc.name      CitySearch_LetterAtIndex_0232
     * @tc.desc      letterAtIndex(index=54.69) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0232 begin`);
      const actual: string = letterAtIndex(54.69);
      logInfo(`letterAtIndex(index=54.69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0232 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0233
     * @tc.name      CitySearch_LetterAtIndex_0233
     * @tc.desc      letterAtIndex(index=95.5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0233 begin`);
      const actual: string = letterAtIndex(95.5);
      logInfo(`letterAtIndex(index=95.5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0233 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0234
     * @tc.name      CitySearch_LetterAtIndex_0234
     * @tc.desc      letterAtIndex(index=70.6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0234 begin`);
      const actual: string = letterAtIndex(70.6);
      logInfo(`letterAtIndex(index=70.6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0234 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0235
     * @tc.name      CitySearch_LetterAtIndex_0235
     * @tc.desc      letterAtIndex(index=-44) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0235 begin`);
      const actual: string = letterAtIndex(-44);
      logInfo(`letterAtIndex(index=-44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0235 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0236
     * @tc.name      CitySearch_LetterAtIndex_0236
     * @tc.desc      letterAtIndex(index=-73) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0236 begin`);
      const actual: string = letterAtIndex(-73);
      logInfo(`letterAtIndex(index=-73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0236 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0237
     * @tc.name      CitySearch_LetterAtIndex_0237
     * @tc.desc      letterAtIndex(index=-86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0237 begin`);
      const actual: string = letterAtIndex(-86);
      logInfo(`letterAtIndex(index=-86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0237 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0238
     * @tc.name      CitySearch_LetterAtIndex_0238
     * @tc.desc      letterAtIndex(index=-10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterAtIndex_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0238 begin`);
      const actual: string = letterAtIndex(-10);
      logInfo(`letterAtIndex(index=-10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0238 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0239
     * @tc.name      CitySearch_LetterAtIndex_0239
     * @tc.desc      letterAtIndex(index=72) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0239 begin`);
      const actual: string = letterAtIndex(72);
      logInfo(`letterAtIndex(index=72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0239 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_AT_INDEX_0240
     * @tc.name      CitySearch_LetterAtIndex_0240
     * @tc.desc      letterAtIndex(index=197) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterAtIndex_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterAtIndex_0240 begin`);
      const actual: string = letterAtIndex(197);
      logInfo(`letterAtIndex(index=197): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterAtIndex_0240 end`);
    });
  });
}
