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
import { titleOpacityOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for titleOpacityOf (50 cases). */
export default function titleOpacityOf3Test(): void {
  describe('TitleOpacityOf3Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0193
     * @tc.name      ExpandTitle_TitleOpacityOf_0193
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=360, expandTitleHeight=100) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0193 begin`);
      const actual: number = titleOpacityOf(1920, 360, 100);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}TitleOpacityOf_0193 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0194
     * @tc.name      ExpandTitle_TitleOpacityOf_0194
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=1, expandTitleHeight=1080) returns -0.001853568...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0194 begin`);
      const actual: number = titleOpacityOf(-1, 1, 1080);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.0018535681186283596, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0194 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0195
     * @tc.name      ExpandTitle_TitleOpacityOf_0195
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=100, expandTitleHeight=10) returns -2.88888888...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0195 begin`);
      const actual: number = titleOpacityOf(360, 100, 10);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-2.888888888888889, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0195 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0196
     * @tc.name      ExpandTitle_TitleOpacityOf_0196
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=360, expandTitleHeight=100) returns 1.015384615...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0196 begin`);
      const actual: number = titleOpacityOf(96, 360, 100);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.0153846153846153, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0196 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0197
     * @tc.name      ExpandTitle_TitleOpacityOf_0197
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=100, expandTitleHeight=360) returns -0.373076923...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0197 begin`);
      const actual: number = titleOpacityOf(3, 100, 360);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.3730769230769231, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0197 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0198
     * @tc.name      ExpandTitle_TitleOpacityOf_0198
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=360, expandTitleHeight=1920) returns 0.2307692...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0198 begin`);
      const actual: number = titleOpacityOf(720, 360, 1920);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.23076923076923078, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0198 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0199
     * @tc.name      ExpandTitle_TitleOpacityOf_0199
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=1920, expandTitleHeight=0) returns 0.625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0199 begin`);
      const actual: number = titleOpacityOf(720, 1920, 0);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.625, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0199 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0200
     * @tc.name      ExpandTitle_TitleOpacityOf_0200
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=0, expandTitleHeight=10) returns 108
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0200 begin`);
      const actual: number = titleOpacityOf(1080, 0, 10);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertEqual(108);
      logInfo(`${BUNDLE}TitleOpacityOf_0200 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0201
     * @tc.name      ExpandTitle_TitleOpacityOf_0201
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=1080, expandTitleHeight=360) returns 1.50138888...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0201 begin`);
      const actual: number = titleOpacityOf(-1, 1080, 360);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.5013888888888889, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0201 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0202
     * @tc.name      ExpandTitle_TitleOpacityOf_0202
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=2, expandTitleHeight=1080) returns 0.0871985157...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0202 begin`);
      const actual: number = titleOpacityOf(96, 2, 1080);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.08719851576994433, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0202 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0203
     * @tc.name      ExpandTitle_TitleOpacityOf_0203
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=2, expandTitleHeight=1080) returns 0.332096474...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0203 begin`);
      const actual: number = titleOpacityOf(360, 2, 1080);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.3320964749536178, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0203 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0204
     * @tc.name      ExpandTitle_TitleOpacityOf_0204
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=-1, expandTitleHeight=96) returns 0.010309278350...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0204 begin`);
      const actual: number = titleOpacityOf(0, -1, 96);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.010309278350515464, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0204 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0205
     * @tc.name      ExpandTitle_TitleOpacityOf_0205
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=3, expandTitleHeight=0) returns -31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0205 begin`);
      const actual: number = titleOpacityOf(96, 3, 0);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(-31);
      logInfo(`${BUNDLE}TitleOpacityOf_0205 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0206
     * @tc.name      ExpandTitle_TitleOpacityOf_0206
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=-1, expandTitleHeight=10) returns 0.181818181818...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0206 begin`);
      const actual: number = titleOpacityOf(1, -1, 10);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.18181818181818182, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0206 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0207
     * @tc.name      ExpandTitle_TitleOpacityOf_0207
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=3, expandTitleHeight=-1) returns -23.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0207 begin`);
      const actual: number = titleOpacityOf(96, 3, -1);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-23.25, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0207 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0208
     * @tc.name      ExpandTitle_TitleOpacityOf_0208
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=1080, expandTitleHeight=3) returns 0.9935004642...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0208 begin`);
      const actual: number = titleOpacityOf(10, 1080, 3);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.9935004642525533, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0208 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0209
     * @tc.name      ExpandTitle_TitleOpacityOf_0209
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=10, expandTitleHeight=360) returns -0.0257142857...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0209 begin`);
      const actual: number = titleOpacityOf(1, 10, 360);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.025714285714285714, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0209 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0210
     * @tc.name      ExpandTitle_TitleOpacityOf_0210
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=3, expandTitleHeight=100) returns 0.95876288659...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0210 begin`);
      const actual: number = titleOpacityOf(96, 3, 100);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.9587628865979382, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0210 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0211
     * @tc.name      ExpandTitle_TitleOpacityOf_0211
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=1080, expandTitleHeight=-1) returns 0.9981498612...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0211 begin`);
      const actual: number = titleOpacityOf(1, 1080, -1);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.9981498612395929, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0211 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0212
     * @tc.name      ExpandTitle_TitleOpacityOf_0212
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=10, expandTitleHeight=360) returns 0.257142857...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0212 begin`);
      const actual: number = titleOpacityOf(100, 10, 360);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.2571428571428571, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0212 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0213
     * @tc.name      ExpandTitle_TitleOpacityOf_0213
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=1080, expandTitleHeight=360) returns 1.495833333...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0213 begin`);
      const actual: number = titleOpacityOf(3, 1080, 360);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.4958333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0213 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0214
     * @tc.name      ExpandTitle_TitleOpacityOf_0214
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=100, expandTitleHeight=-1) returns -2.57425742...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0214 begin`);
      const actual: number = titleOpacityOf(360, 100, -1);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-2.5742574257425743, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0214 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0215
     * @tc.name      ExpandTitle_TitleOpacityOf_0215
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=100, expandTitleHeight=360) returns -0.34615384...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0215 begin`);
      const actual: number = titleOpacityOf(10, 100, 360);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.34615384615384615, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0215 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0216
     * @tc.name      ExpandTitle_TitleOpacityOf_0216
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=2, expandTitleHeight=10) returns 89.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0216 begin`);
      const actual: number = titleOpacityOf(720, 2, 10);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(89.75, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0216 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0217
     * @tc.name      ExpandTitle_TitleOpacityOf_0217
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=720, expandTitleHeight=3) returns 0.87029288702...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0217 begin`);
      const actual: number = titleOpacityOf(96, 720, 3);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.8702928870292888, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0217 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0218
     * @tc.name      ExpandTitle_TitleOpacityOf_0218
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=96, expandTitleHeight=3) returns 1.021505376344086
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0218 begin`);
      const actual: number = titleOpacityOf(1, 96, 3);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.021505376344086, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0218 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0219
     * @tc.name      ExpandTitle_TitleOpacityOf_0219
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=1080, expandTitleHeight=2) returns -0.7792207...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0219 begin`);
      const actual: number = titleOpacityOf(1920, 1080, 2);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-0.7792207792207793, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0219 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0220
     * @tc.name      ExpandTitle_TitleOpacityOf_0220
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=-1, expandTitleHeight=3) returns 270.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0220 begin`);
      const actual: number = titleOpacityOf(1080, -1, 3);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(270.25, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0220 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0221
     * @tc.name      ExpandTitle_TitleOpacityOf_0221
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=0, expandTitleHeight=1920) returns 0.00104166666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0221 begin`);
      const actual: number = titleOpacityOf(2, 0, 1920);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.0010416666666666667, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0221 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0222
     * @tc.name      ExpandTitle_TitleOpacityOf_0222
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=-1, expandTitleHeight=10) returns 98.27272727...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0222 begin`);
      const actual: number = titleOpacityOf(1080, -1, 10);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(98.27272727272727, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0222 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0223
     * @tc.name      ExpandTitle_TitleOpacityOf_0223
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=3, expandTitleHeight=2) returns -1077
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0223 begin`);
      const actual: number = titleOpacityOf(1080, 3, 2);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertEqual(-1077);
      logInfo(`${BUNDLE}TitleOpacityOf_0223 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0224
     * @tc.name      ExpandTitle_TitleOpacityOf_0224
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=96, expandTitleHeight=-1) returns -18.8041237...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0224 begin`);
      const actual: number = titleOpacityOf(1920, 96, -1);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-18.804123711340207, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0224 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0225
     * @tc.name      ExpandTitle_TitleOpacityOf_0225
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=1, expandTitleHeight=1080) returns 1.77849860...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0225 begin`);
      const actual: number = titleOpacityOf(1920, 1, 1080);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(1.778498609823911, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0225 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0226
     * @tc.name      ExpandTitle_TitleOpacityOf_0226
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=3, expandTitleHeight=720) returns 0.1352859135...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0226 begin`);
      const actual: number = titleOpacityOf(100, 3, 720);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.13528591352859135, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0226 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0227
     * @tc.name      ExpandTitle_TitleOpacityOf_0227
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=1080, expandTitleHeight=1920) returns -1.2821428...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0227 begin`);
      const actual: number = titleOpacityOf(3, 1080, 1920);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-1.2821428571428573, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0227 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0228
     * @tc.name      ExpandTitle_TitleOpacityOf_0228
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=96, expandTitleHeight=360) returns -0.3636363636...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0228 begin`);
      const actual: number = titleOpacityOf(0, 96, 360);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.36363636363636365, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0228 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0229
     * @tc.name      ExpandTitle_TitleOpacityOf_0229
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=1, expandTitleHeight=-1) returns -49.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0229 begin`);
      const actual: number = titleOpacityOf(100, 1, -1);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-49.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0229 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0230
     * @tc.name      ExpandTitle_TitleOpacityOf_0230
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=10, expandTitleHeight=720) returns -0.0112676056...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0230 begin`);
      const actual: number = titleOpacityOf(2, 10, 720);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.011267605633802818, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0230 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0231
     * @tc.name      ExpandTitle_TitleOpacityOf_0231
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=2, expandTitleHeight=96) returns -0.021276595744...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0231 begin`);
      const actual: number = titleOpacityOf(0, 2, 96);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.02127659574468085, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0231 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0232
     * @tc.name      ExpandTitle_TitleOpacityOf_0232
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=360, expandTitleHeight=96) returns 1.35227272727...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0232 begin`);
      const actual: number = titleOpacityOf(3, 360, 96);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.3522727272727273, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0232 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0233
     * @tc.name      ExpandTitle_TitleOpacityOf_0233
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=1920, expandTitleHeight=2) returns 0.948905109...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0233 begin`);
      const actual: number = titleOpacityOf(100, 1920, 2);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.948905109489051, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0233 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0234
     * @tc.name      ExpandTitle_TitleOpacityOf_0234
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=100, expandTitleHeight=720) returns 0.41935483...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0234 begin`);
      const actual: number = titleOpacityOf(360, 100, 720);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.41935483870967744, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0234 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0235
     * @tc.name      ExpandTitle_TitleOpacityOf_0235
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=96, expandTitleHeight=2) returns -6.6382978723...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0235 begin`);
      const actual: number = titleOpacityOf(720, 96, 2);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-6.638297872340425, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0235 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0236
     * @tc.name      ExpandTitle_TitleOpacityOf_0236
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=720, expandTitleHeight=1) returns 0.5006954102...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0236 begin`);
      const actual: number = titleOpacityOf(360, 720, 1);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.5006954102920723, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0236 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0237
     * @tc.name      ExpandTitle_TitleOpacityOf_0237
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=2, expandTitleHeight=0) returns -539
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0237 begin`);
      const actual: number = titleOpacityOf(1080, 2, 0);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertEqual(-539);
      logInfo(`${BUNDLE}TitleOpacityOf_0237 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0238
     * @tc.name      ExpandTitle_TitleOpacityOf_0238
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=0, expandTitleHeight=-1) returns -1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0238 begin`);
      const actual: number = titleOpacityOf(1920, 0, -1);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertEqual(-1920);
      logInfo(`${BUNDLE}TitleOpacityOf_0238 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0239
     * @tc.name      ExpandTitle_TitleOpacityOf_0239
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=360, expandTitleHeight=10) returns -1.02857142...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0239 begin`);
      const actual: number = titleOpacityOf(720, 360, 10);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-1.0285714285714285, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0239 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0240
     * @tc.name      ExpandTitle_TitleOpacityOf_0240
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=2, expandTitleHeight=360) returns 5.357541899...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0240 begin`);
      const actual: number = titleOpacityOf(1920, 2, 360);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(5.35754189944134, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0240 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0241
     * @tc.name      ExpandTitle_TitleOpacityOf_0241
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=1, expandTitleHeight=100) returns 0.020202020202...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0241 begin`);
      const actual: number = titleOpacityOf(3, 1, 100);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.020202020202020204, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0241 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0242
     * @tc.name      ExpandTitle_TitleOpacityOf_0242
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=720, expandTitleHeight=-1) returns -1.6643550...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0242 begin`);
      const actual: number = titleOpacityOf(1920, 720, -1);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-1.6643550624133148, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0242 end`);
    });
  });
}
