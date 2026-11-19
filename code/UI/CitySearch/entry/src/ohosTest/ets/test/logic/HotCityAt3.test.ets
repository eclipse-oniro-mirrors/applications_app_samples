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
import { hotCityAt } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for hotCityAt (48 cases). */
export default function hotCityAt3Test(): void {
  describe('HotCityAt3Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0193
     * @tc.name      CitySearch_HotCityAt_0193
     * @tc.desc      hotCityAt(index=14) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0193 begin`);
      const actual: string = hotCityAt(14);
      logInfo(`hotCityAt(index=14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0193 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0194
     * @tc.name      CitySearch_HotCityAt_0194
     * @tc.desc      hotCityAt(index=139) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0194 begin`);
      const actual: string = hotCityAt(139);
      logInfo(`hotCityAt(index=139): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0194 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0195
     * @tc.name      CitySearch_HotCityAt_0195
     * @tc.desc      hotCityAt(index=-19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0195 begin`);
      const actual: string = hotCityAt(-19);
      logInfo(`hotCityAt(index=-19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0195 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0196
     * @tc.name      CitySearch_HotCityAt_0196
     * @tc.desc      hotCityAt(index=34.55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0196 begin`);
      const actual: string = hotCityAt(34.55);
      logInfo(`hotCityAt(index=34.55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0196 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0197
     * @tc.name      CitySearch_HotCityAt_0197
     * @tc.desc      hotCityAt(index=99.38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0197 begin`);
      const actual: string = hotCityAt(99.38);
      logInfo(`hotCityAt(index=99.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0197 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0198
     * @tc.name      CitySearch_HotCityAt_0198
     * @tc.desc      hotCityAt(index=13.22) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0198 begin`);
      const actual: string = hotCityAt(13.22);
      logInfo(`hotCityAt(index=13.22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0198 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0199
     * @tc.name      CitySearch_HotCityAt_0199
     * @tc.desc      hotCityAt(index=71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0199 begin`);
      const actual: string = hotCityAt(71);
      logInfo(`hotCityAt(index=71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0199 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0200
     * @tc.name      CitySearch_HotCityAt_0200
     * @tc.desc      hotCityAt(index=8.14) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0200 begin`);
      const actual: string = hotCityAt(8.14);
      logInfo(`hotCityAt(index=8.14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0200 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0201
     * @tc.name      CitySearch_HotCityAt_0201
     * @tc.desc      hotCityAt(index=54.07) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0201 begin`);
      const actual: string = hotCityAt(54.07);
      logInfo(`hotCityAt(index=54.07): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0201 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0202
     * @tc.name      CitySearch_HotCityAt_0202
     * @tc.desc      hotCityAt(index=84.85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0202 begin`);
      const actual: string = hotCityAt(84.85);
      logInfo(`hotCityAt(index=84.85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0202 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0203
     * @tc.name      CitySearch_HotCityAt_0203
     * @tc.desc      hotCityAt(index=26) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0203 begin`);
      const actual: string = hotCityAt(26);
      logInfo(`hotCityAt(index=26): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0203 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0204
     * @tc.name      CitySearch_HotCityAt_0204
     * @tc.desc      hotCityAt(index=102) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0204 begin`);
      const actual: string = hotCityAt(102);
      logInfo(`hotCityAt(index=102): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0204 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0205
     * @tc.name      CitySearch_HotCityAt_0205
     * @tc.desc      hotCityAt(index=14.62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0205 begin`);
      const actual: string = hotCityAt(14.62);
      logInfo(`hotCityAt(index=14.62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0205 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0206
     * @tc.name      CitySearch_HotCityAt_0206
     * @tc.desc      hotCityAt(index=74.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0206 begin`);
      const actual: string = hotCityAt(74.54);
      logInfo(`hotCityAt(index=74.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0206 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0207
     * @tc.name      CitySearch_HotCityAt_0207
     * @tc.desc      hotCityAt(index=-70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0207 begin`);
      const actual: string = hotCityAt(-70);
      logInfo(`hotCityAt(index=-70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0207 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0208
     * @tc.name      CitySearch_HotCityAt_0208
     * @tc.desc      hotCityAt(index=69.77) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0208 begin`);
      const actual: string = hotCityAt(69.77);
      logInfo(`hotCityAt(index=69.77): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0208 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0209
     * @tc.name      CitySearch_HotCityAt_0209
     * @tc.desc      hotCityAt(index=72) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0209 begin`);
      const actual: string = hotCityAt(72);
      logInfo(`hotCityAt(index=72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0209 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0210
     * @tc.name      CitySearch_HotCityAt_0210
     * @tc.desc      hotCityAt(index=198) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0210 begin`);
      const actual: string = hotCityAt(198);
      logInfo(`hotCityAt(index=198): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0210 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0211
     * @tc.name      CitySearch_HotCityAt_0211
     * @tc.desc      hotCityAt(index=-41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0211 begin`);
      const actual: string = hotCityAt(-41);
      logInfo(`hotCityAt(index=-41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0211 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0212
     * @tc.name      CitySearch_HotCityAt_0212
     * @tc.desc      hotCityAt(index=-85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0212 begin`);
      const actual: string = hotCityAt(-85);
      logInfo(`hotCityAt(index=-85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0212 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0213
     * @tc.name      CitySearch_HotCityAt_0213
     * @tc.desc      hotCityAt(index=-56) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0213 begin`);
      const actual: string = hotCityAt(-56);
      logInfo(`hotCityAt(index=-56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0213 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0214
     * @tc.name      CitySearch_HotCityAt_0214
     * @tc.desc      hotCityAt(index=56.01) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0214 begin`);
      const actual: string = hotCityAt(56.01);
      logInfo(`hotCityAt(index=56.01): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0214 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0215
     * @tc.name      CitySearch_HotCityAt_0215
     * @tc.desc      hotCityAt(index=32.71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0215 begin`);
      const actual: string = hotCityAt(32.71);
      logInfo(`hotCityAt(index=32.71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0215 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0216
     * @tc.name      CitySearch_HotCityAt_0216
     * @tc.desc      hotCityAt(index=4.58) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0216 begin`);
      const actual: string = hotCityAt(4.58);
      logInfo(`hotCityAt(index=4.58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0216 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0217
     * @tc.name      CitySearch_HotCityAt_0217
     * @tc.desc      hotCityAt(index=-11) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0217 begin`);
      const actual: string = hotCityAt(-11);
      logInfo(`hotCityAt(index=-11): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0217 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0218
     * @tc.name      CitySearch_HotCityAt_0218
     * @tc.desc      hotCityAt(index=22) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0218 begin`);
      const actual: string = hotCityAt(22);
      logInfo(`hotCityAt(index=22): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0218 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0219
     * @tc.name      CitySearch_HotCityAt_0219
     * @tc.desc      hotCityAt(index=36) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0219 begin`);
      const actual: string = hotCityAt(36);
      logInfo(`hotCityAt(index=36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0219 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0220
     * @tc.name      CitySearch_HotCityAt_0220
     * @tc.desc      hotCityAt(index=31.29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0220 begin`);
      const actual: string = hotCityAt(31.29);
      logInfo(`hotCityAt(index=31.29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0220 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0221
     * @tc.name      CitySearch_HotCityAt_0221
     * @tc.desc      hotCityAt(index=-40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0221 begin`);
      const actual: string = hotCityAt(-40);
      logInfo(`hotCityAt(index=-40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0221 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0222
     * @tc.name      CitySearch_HotCityAt_0222
     * @tc.desc      hotCityAt(index=9.5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0222 begin`);
      const actual: string = hotCityAt(9.5);
      logInfo(`hotCityAt(index=9.5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0222 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0223
     * @tc.name      CitySearch_HotCityAt_0223
     * @tc.desc      hotCityAt(index=54.8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0223 begin`);
      const actual: string = hotCityAt(54.8);
      logInfo(`hotCityAt(index=54.8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0223 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0224
     * @tc.name      CitySearch_HotCityAt_0224
     * @tc.desc      hotCityAt(index=21) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0224 begin`);
      const actual: string = hotCityAt(21);
      logInfo(`hotCityAt(index=21): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0224 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0225
     * @tc.name      CitySearch_HotCityAt_0225
     * @tc.desc      hotCityAt(index=171) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0225 begin`);
      const actual: string = hotCityAt(171);
      logInfo(`hotCityAt(index=171): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0225 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0226
     * @tc.name      CitySearch_HotCityAt_0226
     * @tc.desc      hotCityAt(index=-87) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0226 begin`);
      const actual: string = hotCityAt(-87);
      logInfo(`hotCityAt(index=-87): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0226 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0227
     * @tc.name      CitySearch_HotCityAt_0227
     * @tc.desc      hotCityAt(index=-75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0227 begin`);
      const actual: string = hotCityAt(-75);
      logInfo(`hotCityAt(index=-75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0227 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0228
     * @tc.name      CitySearch_HotCityAt_0228
     * @tc.desc      hotCityAt(index=14.65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0228 begin`);
      const actual: string = hotCityAt(14.65);
      logInfo(`hotCityAt(index=14.65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0228 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0229
     * @tc.name      CitySearch_HotCityAt_0229
     * @tc.desc      hotCityAt(index=21.73) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0229 begin`);
      const actual: string = hotCityAt(21.73);
      logInfo(`hotCityAt(index=21.73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0229 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0230
     * @tc.name      CitySearch_HotCityAt_0230
     * @tc.desc      hotCityAt(index=45.38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0230 begin`);
      const actual: string = hotCityAt(45.38);
      logInfo(`hotCityAt(index=45.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0230 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0231
     * @tc.name      CitySearch_HotCityAt_0231
     * @tc.desc      hotCityAt(index=61.97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0231 begin`);
      const actual: string = hotCityAt(61.97);
      logInfo(`hotCityAt(index=61.97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0231 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0232
     * @tc.name      CitySearch_HotCityAt_0232
     * @tc.desc      hotCityAt(index=184) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0232 begin`);
      const actual: string = hotCityAt(184);
      logInfo(`hotCityAt(index=184): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0232 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0233
     * @tc.name      CitySearch_HotCityAt_0233
     * @tc.desc      hotCityAt(index=9.28) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0233 begin`);
      const actual: string = hotCityAt(9.28);
      logInfo(`hotCityAt(index=9.28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0233 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0234
     * @tc.name      CitySearch_HotCityAt_0234
     * @tc.desc      hotCityAt(index=32.62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0234 begin`);
      const actual: string = hotCityAt(32.62);
      logInfo(`hotCityAt(index=32.62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0234 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0235
     * @tc.name      CitySearch_HotCityAt_0235
     * @tc.desc      hotCityAt(index=82) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0235 begin`);
      const actual: string = hotCityAt(82);
      logInfo(`hotCityAt(index=82): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0235 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0236
     * @tc.name      CitySearch_HotCityAt_0236
     * @tc.desc      hotCityAt(index=62.5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0236 begin`);
      const actual: string = hotCityAt(62.5);
      logInfo(`hotCityAt(index=62.5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0236 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0237
     * @tc.name      CitySearch_HotCityAt_0237
     * @tc.desc      hotCityAt(index=36.38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0237 begin`);
      const actual: string = hotCityAt(36.38);
      logInfo(`hotCityAt(index=36.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0237 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0238
     * @tc.name      CitySearch_HotCityAt_0238
     * @tc.desc      hotCityAt(index=-69) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0238 begin`);
      const actual: string = hotCityAt(-69);
      logInfo(`hotCityAt(index=-69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0238 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0239
     * @tc.name      CitySearch_HotCityAt_0239
     * @tc.desc      hotCityAt(index=58.96) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0239 begin`);
      const actual: string = hotCityAt(58.96);
      logInfo(`hotCityAt(index=58.96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0239 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0240
     * @tc.name      CitySearch_HotCityAt_0240
     * @tc.desc      hotCityAt(index=-53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0240 begin`);
      const actual: string = hotCityAt(-53);
      logInfo(`hotCityAt(index=-53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0240 end`);
    });
  });
}
