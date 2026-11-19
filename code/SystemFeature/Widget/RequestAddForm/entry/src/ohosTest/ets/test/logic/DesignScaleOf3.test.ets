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
import { designScaleOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for designScaleOf (48 cases). */
export default function designScaleOf3Test(): void {
  describe('DesignScaleOf3Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0193
     * @tc.name      RequestAddForm_DesignScaleOf_0193
     * @tc.desc      designScaleOf(cardWidth=1850.26) returns 2.5698055555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0193 begin`);
      const actual: number = designScaleOf(1850.26);
      logInfo(`designScaleOf(cardWidth=1850.26): actual=${actual}`);
      expect(actual).assertClose(2.5698055555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0193 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0194
     * @tc.name      RequestAddForm_DesignScaleOf_0194
     * @tc.desc      designScaleOf(cardWidth=-98) returns -0.1361111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0194 begin`);
      const actual: number = designScaleOf(-98);
      logInfo(`designScaleOf(cardWidth=-98): actual=${actual}`);
      expect(actual).assertClose(-0.1361111111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0194 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0195
     * @tc.name      RequestAddForm_DesignScaleOf_0195
     * @tc.desc      designScaleOf(cardWidth=2350) returns 3.263888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0195 begin`);
      const actual: number = designScaleOf(2350);
      logInfo(`designScaleOf(cardWidth=2350): actual=${actual}`);
      expect(actual).assertClose(3.263888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0195 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0196
     * @tc.name      RequestAddForm_DesignScaleOf_0196
     * @tc.desc      designScaleOf(cardWidth=-146) returns -0.20277777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0196 begin`);
      const actual: number = designScaleOf(-146);
      logInfo(`designScaleOf(cardWidth=-146): actual=${actual}`);
      expect(actual).assertClose(-0.20277777777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0196 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0197
     * @tc.name      RequestAddForm_DesignScaleOf_0197
     * @tc.desc      designScaleOf(cardWidth=2859) returns 3.970833333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0197 begin`);
      const actual: number = designScaleOf(2859);
      logInfo(`designScaleOf(cardWidth=2859): actual=${actual}`);
      expect(actual).assertClose(3.970833333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0197 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0198
     * @tc.name      RequestAddForm_DesignScaleOf_0198
     * @tc.desc      designScaleOf(cardWidth=1683) returns 2.3375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0198 begin`);
      const actual: number = designScaleOf(1683);
      logInfo(`designScaleOf(cardWidth=1683): actual=${actual}`);
      expect(actual).assertClose(2.3375, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0198 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0199
     * @tc.name      RequestAddForm_DesignScaleOf_0199
     * @tc.desc      designScaleOf(cardWidth=-358) returns -0.49722222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0199 begin`);
      const actual: number = designScaleOf(-358);
      logInfo(`designScaleOf(cardWidth=-358): actual=${actual}`);
      expect(actual).assertClose(-0.49722222222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0199 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0200
     * @tc.name      RequestAddForm_DesignScaleOf_0200
     * @tc.desc      designScaleOf(cardWidth=-1507) returns -2.0930555555555554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0200 begin`);
      const actual: number = designScaleOf(-1507);
      logInfo(`designScaleOf(cardWidth=-1507): actual=${actual}`);
      expect(actual).assertClose(-2.0930555555555554, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0200 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0201
     * @tc.name      RequestAddForm_DesignScaleOf_0201
     * @tc.desc      designScaleOf(cardWidth=694) returns 0.9638888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0201 begin`);
      const actual: number = designScaleOf(694);
      logInfo(`designScaleOf(cardWidth=694): actual=${actual}`);
      expect(actual).assertClose(0.9638888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0201 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0202
     * @tc.name      RequestAddForm_DesignScaleOf_0202
     * @tc.desc      designScaleOf(cardWidth=3454) returns 4.7972222222222225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0202 begin`);
      const actual: number = designScaleOf(3454);
      logInfo(`designScaleOf(cardWidth=3454): actual=${actual}`);
      expect(actual).assertClose(4.7972222222222225, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0202 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0203
     * @tc.name      RequestAddForm_DesignScaleOf_0203
     * @tc.desc      designScaleOf(cardWidth=1068) returns 1.4833333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0203 begin`);
      const actual: number = designScaleOf(1068);
      logInfo(`designScaleOf(cardWidth=1068): actual=${actual}`);
      expect(actual).assertClose(1.4833333333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0203 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0204
     * @tc.name      RequestAddForm_DesignScaleOf_0204
     * @tc.desc      designScaleOf(cardWidth=1270) returns 1.7638888888888888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0204 begin`);
      const actual: number = designScaleOf(1270);
      logInfo(`designScaleOf(cardWidth=1270): actual=${actual}`);
      expect(actual).assertClose(1.7638888888888888, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0204 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0205
     * @tc.name      RequestAddForm_DesignScaleOf_0205
     * @tc.desc      designScaleOf(cardWidth=2424) returns 3.3666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0205 begin`);
      const actual: number = designScaleOf(2424);
      logInfo(`designScaleOf(cardWidth=2424): actual=${actual}`);
      expect(actual).assertClose(3.3666666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0205 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0206
     * @tc.name      RequestAddForm_DesignScaleOf_0206
     * @tc.desc      designScaleOf(cardWidth=-1049) returns -1.4569444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0206 begin`);
      const actual: number = designScaleOf(-1049);
      logInfo(`designScaleOf(cardWidth=-1049): actual=${actual}`);
      expect(actual).assertClose(-1.4569444444444444, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0206 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0207
     * @tc.name      RequestAddForm_DesignScaleOf_0207
     * @tc.desc      designScaleOf(cardWidth=2223) returns 3.0875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0207 begin`);
      const actual: number = designScaleOf(2223);
      logInfo(`designScaleOf(cardWidth=2223): actual=${actual}`);
      expect(actual).assertClose(3.0875, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0207 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0208
     * @tc.name      RequestAddForm_DesignScaleOf_0208
     * @tc.desc      designScaleOf(cardWidth=3746) returns 5.2027777777777775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0208 begin`);
      const actual: number = designScaleOf(3746);
      logInfo(`designScaleOf(cardWidth=3746): actual=${actual}`);
      expect(actual).assertClose(5.2027777777777775, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0208 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0209
     * @tc.name      RequestAddForm_DesignScaleOf_0209
     * @tc.desc      designScaleOf(cardWidth=325) returns 0.4513888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0209 begin`);
      const actual: number = designScaleOf(325);
      logInfo(`designScaleOf(cardWidth=325): actual=${actual}`);
      expect(actual).assertClose(0.4513888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0209 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0210
     * @tc.name      RequestAddForm_DesignScaleOf_0210
     * @tc.desc      designScaleOf(cardWidth=-102) returns -0.14166666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0210 begin`);
      const actual: number = designScaleOf(-102);
      logInfo(`designScaleOf(cardWidth=-102): actual=${actual}`);
      expect(actual).assertClose(-0.14166666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0210 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0211
     * @tc.name      RequestAddForm_DesignScaleOf_0211
     * @tc.desc      designScaleOf(cardWidth=-1571) returns -2.1819444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0211 begin`);
      const actual: number = designScaleOf(-1571);
      logInfo(`designScaleOf(cardWidth=-1571): actual=${actual}`);
      expect(actual).assertClose(-2.1819444444444445, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0211 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0212
     * @tc.name      RequestAddForm_DesignScaleOf_0212
     * @tc.desc      designScaleOf(cardWidth=999.9) returns 1.38875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0212 begin`);
      const actual: number = designScaleOf(999.9);
      logInfo(`designScaleOf(cardWidth=999.9): actual=${actual}`);
      expect(actual).assertClose(1.38875, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0212 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0213
     * @tc.name      RequestAddForm_DesignScaleOf_0213
     * @tc.desc      designScaleOf(cardWidth=3440) returns 4.777777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0213 begin`);
      const actual: number = designScaleOf(3440);
      logInfo(`designScaleOf(cardWidth=3440): actual=${actual}`);
      expect(actual).assertClose(4.777777777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0213 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0214
     * @tc.name      RequestAddForm_DesignScaleOf_0214
     * @tc.desc      designScaleOf(cardWidth=1467) returns 2.0375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0214 begin`);
      const actual: number = designScaleOf(1467);
      logInfo(`designScaleOf(cardWidth=1467): actual=${actual}`);
      expect(actual).assertClose(2.0375, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0214 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0215
     * @tc.name      RequestAddForm_DesignScaleOf_0215
     * @tc.desc      designScaleOf(cardWidth=321) returns 0.44583333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0215 begin`);
      const actual: number = designScaleOf(321);
      logInfo(`designScaleOf(cardWidth=321): actual=${actual}`);
      expect(actual).assertClose(0.44583333333333336, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0215 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0216
     * @tc.name      RequestAddForm_DesignScaleOf_0216
     * @tc.desc      designScaleOf(cardWidth=1187.82) returns 1.6497499999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0216 begin`);
      const actual: number = designScaleOf(1187.82);
      logInfo(`designScaleOf(cardWidth=1187.82): actual=${actual}`);
      expect(actual).assertClose(1.6497499999999998, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0216 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0217
     * @tc.name      RequestAddForm_DesignScaleOf_0217
     * @tc.desc      designScaleOf(cardWidth=1157) returns 1.6069444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0217 begin`);
      const actual: number = designScaleOf(1157);
      logInfo(`designScaleOf(cardWidth=1157): actual=${actual}`);
      expect(actual).assertClose(1.6069444444444445, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0217 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0218
     * @tc.name      RequestAddForm_DesignScaleOf_0218
     * @tc.desc      designScaleOf(cardWidth=2079) returns 2.8875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0218 begin`);
      const actual: number = designScaleOf(2079);
      logInfo(`designScaleOf(cardWidth=2079): actual=${actual}`);
      expect(actual).assertClose(2.8875, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0218 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0219
     * @tc.name      RequestAddForm_DesignScaleOf_0219
     * @tc.desc      designScaleOf(cardWidth=-4) returns -0.005555555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0219 begin`);
      const actual: number = designScaleOf(-4);
      logInfo(`designScaleOf(cardWidth=-4): actual=${actual}`);
      expect(actual).assertClose(-0.005555555555555556, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0219 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0220
     * @tc.name      RequestAddForm_DesignScaleOf_0220
     * @tc.desc      designScaleOf(cardWidth=3288) returns 4.566666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0220 begin`);
      const actual: number = designScaleOf(3288);
      logInfo(`designScaleOf(cardWidth=3288): actual=${actual}`);
      expect(actual).assertClose(4.566666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0220 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0221
     * @tc.name      RequestAddForm_DesignScaleOf_0221
     * @tc.desc      designScaleOf(cardWidth=1808.24) returns 2.5114444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0221 begin`);
      const actual: number = designScaleOf(1808.24);
      logInfo(`designScaleOf(cardWidth=1808.24): actual=${actual}`);
      expect(actual).assertClose(2.5114444444444444, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0221 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0222
     * @tc.name      RequestAddForm_DesignScaleOf_0222
     * @tc.desc      designScaleOf(cardWidth=-733) returns -1.0180555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0222 begin`);
      const actual: number = designScaleOf(-733);
      logInfo(`designScaleOf(cardWidth=-733): actual=${actual}`);
      expect(actual).assertClose(-1.0180555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0222 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0223
     * @tc.name      RequestAddForm_DesignScaleOf_0223
     * @tc.desc      designScaleOf(cardWidth=192.84) returns 0.2678333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0223 begin`);
      const actual: number = designScaleOf(192.84);
      logInfo(`designScaleOf(cardWidth=192.84): actual=${actual}`);
      expect(actual).assertClose(0.2678333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0223 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0224
     * @tc.name      RequestAddForm_DesignScaleOf_0224
     * @tc.desc      designScaleOf(cardWidth=-1472) returns -2.0444444444444443
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0224 begin`);
      const actual: number = designScaleOf(-1472);
      logInfo(`designScaleOf(cardWidth=-1472): actual=${actual}`);
      expect(actual).assertClose(-2.0444444444444443, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0224 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0225
     * @tc.name      RequestAddForm_DesignScaleOf_0225
     * @tc.desc      designScaleOf(cardWidth=1174) returns 1.6305555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0225 begin`);
      const actual: number = designScaleOf(1174);
      logInfo(`designScaleOf(cardWidth=1174): actual=${actual}`);
      expect(actual).assertClose(1.6305555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0225 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0226
     * @tc.name      RequestAddForm_DesignScaleOf_0226
     * @tc.desc      designScaleOf(cardWidth=79.54) returns 0.11047222222222224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0226 begin`);
      const actual: number = designScaleOf(79.54);
      logInfo(`designScaleOf(cardWidth=79.54): actual=${actual}`);
      expect(actual).assertClose(0.11047222222222224, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0226 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0227
     * @tc.name      RequestAddForm_DesignScaleOf_0227
     * @tc.desc      designScaleOf(cardWidth=-765) returns -1.0625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0227 begin`);
      const actual: number = designScaleOf(-765);
      logInfo(`designScaleOf(cardWidth=-765): actual=${actual}`);
      expect(actual).assertClose(-1.0625, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0227 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0228
     * @tc.name      RequestAddForm_DesignScaleOf_0228
     * @tc.desc      designScaleOf(cardWidth=3340) returns 4.638888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0228 begin`);
      const actual: number = designScaleOf(3340);
      logInfo(`designScaleOf(cardWidth=3340): actual=${actual}`);
      expect(actual).assertClose(4.638888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0228 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0229
     * @tc.name      RequestAddForm_DesignScaleOf_0229
     * @tc.desc      designScaleOf(cardWidth=824.01) returns 1.1444583333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0229 begin`);
      const actual: number = designScaleOf(824.01);
      logInfo(`designScaleOf(cardWidth=824.01): actual=${actual}`);
      expect(actual).assertClose(1.1444583333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0229 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0230
     * @tc.name      RequestAddForm_DesignScaleOf_0230
     * @tc.desc      designScaleOf(cardWidth=2232) returns 3.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0230 begin`);
      const actual: number = designScaleOf(2232);
      logInfo(`designScaleOf(cardWidth=2232): actual=${actual}`);
      expect(actual).assertClose(3.1, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0230 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0231
     * @tc.name      RequestAddForm_DesignScaleOf_0231
     * @tc.desc      designScaleOf(cardWidth=1867) returns 2.5930555555555554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0231 begin`);
      const actual: number = designScaleOf(1867);
      logInfo(`designScaleOf(cardWidth=1867): actual=${actual}`);
      expect(actual).assertClose(2.5930555555555554, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0231 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0232
     * @tc.name      RequestAddForm_DesignScaleOf_0232
     * @tc.desc      designScaleOf(cardWidth=2866) returns 3.9805555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0232 begin`);
      const actual: number = designScaleOf(2866);
      logInfo(`designScaleOf(cardWidth=2866): actual=${actual}`);
      expect(actual).assertClose(3.9805555555555556, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0232 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0233
     * @tc.name      RequestAddForm_DesignScaleOf_0233
     * @tc.desc      designScaleOf(cardWidth=2516) returns 3.4944444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0233 begin`);
      const actual: number = designScaleOf(2516);
      logInfo(`designScaleOf(cardWidth=2516): actual=${actual}`);
      expect(actual).assertClose(3.4944444444444445, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0233 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0234
     * @tc.name      RequestAddForm_DesignScaleOf_0234
     * @tc.desc      designScaleOf(cardWidth=222) returns 0.30833333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0234 begin`);
      const actual: number = designScaleOf(222);
      logInfo(`designScaleOf(cardWidth=222): actual=${actual}`);
      expect(actual).assertClose(0.30833333333333335, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0234 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0235
     * @tc.name      RequestAddForm_DesignScaleOf_0235
     * @tc.desc      designScaleOf(cardWidth=3489) returns 4.845833333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0235 begin`);
      const actual: number = designScaleOf(3489);
      logInfo(`designScaleOf(cardWidth=3489): actual=${actual}`);
      expect(actual).assertClose(4.845833333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0235 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0236
     * @tc.name      RequestAddForm_DesignScaleOf_0236
     * @tc.desc      designScaleOf(cardWidth=502) returns 0.6972222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0236 begin`);
      const actual: number = designScaleOf(502);
      logInfo(`designScaleOf(cardWidth=502): actual=${actual}`);
      expect(actual).assertClose(0.6972222222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0236 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0237
     * @tc.name      RequestAddForm_DesignScaleOf_0237
     * @tc.desc      designScaleOf(cardWidth=1545.94) returns 2.147138888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0237 begin`);
      const actual: number = designScaleOf(1545.94);
      logInfo(`designScaleOf(cardWidth=1545.94): actual=${actual}`);
      expect(actual).assertClose(2.147138888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0237 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0238
     * @tc.name      RequestAddForm_DesignScaleOf_0238
     * @tc.desc      designScaleOf(cardWidth=3562) returns 4.947222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0238 begin`);
      const actual: number = designScaleOf(3562);
      logInfo(`designScaleOf(cardWidth=3562): actual=${actual}`);
      expect(actual).assertClose(4.947222222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0238 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0239
     * @tc.name      RequestAddForm_DesignScaleOf_0239
     * @tc.desc      designScaleOf(cardWidth=749) returns 1.0402777777777779
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0239 begin`);
      const actual: number = designScaleOf(749);
      logInfo(`designScaleOf(cardWidth=749): actual=${actual}`);
      expect(actual).assertClose(1.0402777777777779, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0239 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0240
     * @tc.name      RequestAddForm_DesignScaleOf_0240
     * @tc.desc      designScaleOf(cardWidth=-327) returns -0.45416666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0240 begin`);
      const actual: number = designScaleOf(-327);
      logInfo(`designScaleOf(cardWidth=-327): actual=${actual}`);
      expect(actual).assertClose(-0.45416666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0240 end`);
    });
  });
}
