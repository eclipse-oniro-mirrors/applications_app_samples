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

/** Logic checks for designScaleOf (96 cases). */
export default function designScaleOf2Test(): void {
  describe('DesignScaleOf2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0097
     * @tc.name      RequestAddForm_DesignScaleOf_0097
     * @tc.desc      designScaleOf(cardWidth=2915) returns 4.048611111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0097 begin`);
      const actual: number = designScaleOf(2915);
      logInfo(`designScaleOf(cardWidth=2915): actual=${actual}`);
      expect(actual).assertClose(4.048611111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0098
     * @tc.name      RequestAddForm_DesignScaleOf_0098
     * @tc.desc      designScaleOf(cardWidth=1055) returns 1.4652777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0098 begin`);
      const actual: number = designScaleOf(1055);
      logInfo(`designScaleOf(cardWidth=1055): actual=${actual}`);
      expect(actual).assertClose(1.4652777777777777, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0099
     * @tc.name      RequestAddForm_DesignScaleOf_0099
     * @tc.desc      designScaleOf(cardWidth=2588) returns 3.5944444444444446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0099 begin`);
      const actual: number = designScaleOf(2588);
      logInfo(`designScaleOf(cardWidth=2588): actual=${actual}`);
      expect(actual).assertClose(3.5944444444444446, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0100
     * @tc.name      RequestAddForm_DesignScaleOf_0100
     * @tc.desc      designScaleOf(cardWidth=818) returns 1.136111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0100 begin`);
      const actual: number = designScaleOf(818);
      logInfo(`designScaleOf(cardWidth=818): actual=${actual}`);
      expect(actual).assertClose(1.136111111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0101
     * @tc.name      RequestAddForm_DesignScaleOf_0101
     * @tc.desc      designScaleOf(cardWidth=110.79) returns 0.153875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0101 begin`);
      const actual: number = designScaleOf(110.79);
      logInfo(`designScaleOf(cardWidth=110.79): actual=${actual}`);
      expect(actual).assertClose(0.153875, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0102
     * @tc.name      RequestAddForm_DesignScaleOf_0102
     * @tc.desc      designScaleOf(cardWidth=-1339) returns -1.8597222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0102 begin`);
      const actual: number = designScaleOf(-1339);
      logInfo(`designScaleOf(cardWidth=-1339): actual=${actual}`);
      expect(actual).assertClose(-1.8597222222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0103
     * @tc.name      RequestAddForm_DesignScaleOf_0103
     * @tc.desc      designScaleOf(cardWidth=2499) returns 3.470833333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0103 begin`);
      const actual: number = designScaleOf(2499);
      logInfo(`designScaleOf(cardWidth=2499): actual=${actual}`);
      expect(actual).assertClose(3.470833333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0104
     * @tc.name      RequestAddForm_DesignScaleOf_0104
     * @tc.desc      designScaleOf(cardWidth=-677) returns -0.9402777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0104 begin`);
      const actual: number = designScaleOf(-677);
      logInfo(`designScaleOf(cardWidth=-677): actual=${actual}`);
      expect(actual).assertClose(-0.9402777777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0105
     * @tc.name      RequestAddForm_DesignScaleOf_0105
     * @tc.desc      designScaleOf(cardWidth=-1264) returns -1.7555555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0105 begin`);
      const actual: number = designScaleOf(-1264);
      logInfo(`designScaleOf(cardWidth=-1264): actual=${actual}`);
      expect(actual).assertClose(-1.7555555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0106
     * @tc.name      RequestAddForm_DesignScaleOf_0106
     * @tc.desc      designScaleOf(cardWidth=765) returns 1.0625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0106 begin`);
      const actual: number = designScaleOf(765);
      logInfo(`designScaleOf(cardWidth=765): actual=${actual}`);
      expect(actual).assertClose(1.0625, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0107
     * @tc.name      RequestAddForm_DesignScaleOf_0107
     * @tc.desc      designScaleOf(cardWidth=1429) returns 1.9847222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0107 begin`);
      const actual: number = designScaleOf(1429);
      logInfo(`designScaleOf(cardWidth=1429): actual=${actual}`);
      expect(actual).assertClose(1.9847222222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0108
     * @tc.name      RequestAddForm_DesignScaleOf_0108
     * @tc.desc      designScaleOf(cardWidth=3251) returns 4.5152777777777775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0108 begin`);
      const actual: number = designScaleOf(3251);
      logInfo(`designScaleOf(cardWidth=3251): actual=${actual}`);
      expect(actual).assertClose(4.5152777777777775, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0109
     * @tc.name      RequestAddForm_DesignScaleOf_0109
     * @tc.desc      designScaleOf(cardWidth=2213) returns 3.073611111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0109 begin`);
      const actual: number = designScaleOf(2213);
      logInfo(`designScaleOf(cardWidth=2213): actual=${actual}`);
      expect(actual).assertClose(3.073611111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0110
     * @tc.name      RequestAddForm_DesignScaleOf_0110
     * @tc.desc      designScaleOf(cardWidth=2621) returns 3.640277777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0110 begin`);
      const actual: number = designScaleOf(2621);
      logInfo(`designScaleOf(cardWidth=2621): actual=${actual}`);
      expect(actual).assertClose(3.640277777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0111
     * @tc.name      RequestAddForm_DesignScaleOf_0111
     * @tc.desc      designScaleOf(cardWidth=1807.72) returns 2.5107222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0111 begin`);
      const actual: number = designScaleOf(1807.72);
      logInfo(`designScaleOf(cardWidth=1807.72): actual=${actual}`);
      expect(actual).assertClose(2.5107222222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0112
     * @tc.name      RequestAddForm_DesignScaleOf_0112
     * @tc.desc      designScaleOf(cardWidth=791) returns 1.0986111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0112 begin`);
      const actual: number = designScaleOf(791);
      logInfo(`designScaleOf(cardWidth=791): actual=${actual}`);
      expect(actual).assertClose(1.0986111111111112, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0113
     * @tc.name      RequestAddForm_DesignScaleOf_0113
     * @tc.desc      designScaleOf(cardWidth=1911.25) returns 2.654513888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0113 begin`);
      const actual: number = designScaleOf(1911.25);
      logInfo(`designScaleOf(cardWidth=1911.25): actual=${actual}`);
      expect(actual).assertClose(2.654513888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0114
     * @tc.name      RequestAddForm_DesignScaleOf_0114
     * @tc.desc      designScaleOf(cardWidth=-336) returns -0.4666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0114 begin`);
      const actual: number = designScaleOf(-336);
      logInfo(`designScaleOf(cardWidth=-336): actual=${actual}`);
      expect(actual).assertClose(-0.4666666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0115
     * @tc.name      RequestAddForm_DesignScaleOf_0115
     * @tc.desc      designScaleOf(cardWidth=-1534) returns -2.1305555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0115 begin`);
      const actual: number = designScaleOf(-1534);
      logInfo(`designScaleOf(cardWidth=-1534): actual=${actual}`);
      expect(actual).assertClose(-2.1305555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0116
     * @tc.name      RequestAddForm_DesignScaleOf_0116
     * @tc.desc      designScaleOf(cardWidth=2159) returns 2.998611111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0116 begin`);
      const actual: number = designScaleOf(2159);
      logInfo(`designScaleOf(cardWidth=2159): actual=${actual}`);
      expect(actual).assertClose(2.998611111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0117
     * @tc.name      RequestAddForm_DesignScaleOf_0117
     * @tc.desc      designScaleOf(cardWidth=3558) returns 4.941666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0117 begin`);
      const actual: number = designScaleOf(3558);
      logInfo(`designScaleOf(cardWidth=3558): actual=${actual}`);
      expect(actual).assertClose(4.941666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0118
     * @tc.name      RequestAddForm_DesignScaleOf_0118
     * @tc.desc      designScaleOf(cardWidth=2354) returns 3.2694444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0118 begin`);
      const actual: number = designScaleOf(2354);
      logInfo(`designScaleOf(cardWidth=2354): actual=${actual}`);
      expect(actual).assertClose(3.2694444444444444, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0119
     * @tc.name      RequestAddForm_DesignScaleOf_0119
     * @tc.desc      designScaleOf(cardWidth=613.74) returns 0.8524166666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0119 begin`);
      const actual: number = designScaleOf(613.74);
      logInfo(`designScaleOf(cardWidth=613.74): actual=${actual}`);
      expect(actual).assertClose(0.8524166666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0120
     * @tc.name      RequestAddForm_DesignScaleOf_0120
     * @tc.desc      designScaleOf(cardWidth=3667) returns 5.093055555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0120 begin`);
      const actual: number = designScaleOf(3667);
      logInfo(`designScaleOf(cardWidth=3667): actual=${actual}`);
      expect(actual).assertClose(5.093055555555556, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0121
     * @tc.name      RequestAddForm_DesignScaleOf_0121
     * @tc.desc      designScaleOf(cardWidth=-1773) returns -2.4625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0121 begin`);
      const actual: number = designScaleOf(-1773);
      logInfo(`designScaleOf(cardWidth=-1773): actual=${actual}`);
      expect(actual).assertClose(-2.4625, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0122
     * @tc.name      RequestAddForm_DesignScaleOf_0122
     * @tc.desc      designScaleOf(cardWidth=-1608) returns -2.2333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0122 begin`);
      const actual: number = designScaleOf(-1608);
      logInfo(`designScaleOf(cardWidth=-1608): actual=${actual}`);
      expect(actual).assertClose(-2.2333333333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0123
     * @tc.name      RequestAddForm_DesignScaleOf_0123
     * @tc.desc      designScaleOf(cardWidth=-1444) returns -2.0055555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0123 begin`);
      const actual: number = designScaleOf(-1444);
      logInfo(`designScaleOf(cardWidth=-1444): actual=${actual}`);
      expect(actual).assertClose(-2.0055555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0124
     * @tc.name      RequestAddForm_DesignScaleOf_0124
     * @tc.desc      designScaleOf(cardWidth=2339) returns 3.248611111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0124 begin`);
      const actual: number = designScaleOf(2339);
      logInfo(`designScaleOf(cardWidth=2339): actual=${actual}`);
      expect(actual).assertClose(3.248611111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0125
     * @tc.name      RequestAddForm_DesignScaleOf_0125
     * @tc.desc      designScaleOf(cardWidth=2800) returns 3.888888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0125 begin`);
      const actual: number = designScaleOf(2800);
      logInfo(`designScaleOf(cardWidth=2800): actual=${actual}`);
      expect(actual).assertClose(3.888888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0125 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0126
     * @tc.name      RequestAddForm_DesignScaleOf_0126
     * @tc.desc      designScaleOf(cardWidth=2849) returns 3.9569444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0126 begin`);
      const actual: number = designScaleOf(2849);
      logInfo(`designScaleOf(cardWidth=2849): actual=${actual}`);
      expect(actual).assertClose(3.9569444444444444, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0126 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0127
     * @tc.name      RequestAddForm_DesignScaleOf_0127
     * @tc.desc      designScaleOf(cardWidth=-1510) returns -2.0972222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0127 begin`);
      const actual: number = designScaleOf(-1510);
      logInfo(`designScaleOf(cardWidth=-1510): actual=${actual}`);
      expect(actual).assertClose(-2.0972222222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0127 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0128
     * @tc.name      RequestAddForm_DesignScaleOf_0128
     * @tc.desc      designScaleOf(cardWidth=1312.19) returns 1.8224861111111113
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0128 begin`);
      const actual: number = designScaleOf(1312.19);
      logInfo(`designScaleOf(cardWidth=1312.19): actual=${actual}`);
      expect(actual).assertClose(1.8224861111111113, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0128 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0129
     * @tc.name      RequestAddForm_DesignScaleOf_0129
     * @tc.desc      designScaleOf(cardWidth=3476) returns 4.8277777777777775
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0129 begin`);
      const actual: number = designScaleOf(3476);
      logInfo(`designScaleOf(cardWidth=3476): actual=${actual}`);
      expect(actual).assertClose(4.8277777777777775, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0129 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0130
     * @tc.name      RequestAddForm_DesignScaleOf_0130
     * @tc.desc      designScaleOf(cardWidth=-655) returns -0.9097222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0130 begin`);
      const actual: number = designScaleOf(-655);
      logInfo(`designScaleOf(cardWidth=-655): actual=${actual}`);
      expect(actual).assertClose(-0.9097222222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0130 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0131
     * @tc.name      RequestAddForm_DesignScaleOf_0131
     * @tc.desc      designScaleOf(cardWidth=3370) returns 4.680555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0131 begin`);
      const actual: number = designScaleOf(3370);
      logInfo(`designScaleOf(cardWidth=3370): actual=${actual}`);
      expect(actual).assertClose(4.680555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0131 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0132
     * @tc.name      RequestAddForm_DesignScaleOf_0132
     * @tc.desc      designScaleOf(cardWidth=3111) returns 4.320833333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0132 begin`);
      const actual: number = designScaleOf(3111);
      logInfo(`designScaleOf(cardWidth=3111): actual=${actual}`);
      expect(actual).assertClose(4.320833333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0132 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0133
     * @tc.name      RequestAddForm_DesignScaleOf_0133
     * @tc.desc      designScaleOf(cardWidth=176.18) returns 0.24469444444444446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0133 begin`);
      const actual: number = designScaleOf(176.18);
      logInfo(`designScaleOf(cardWidth=176.18): actual=${actual}`);
      expect(actual).assertClose(0.24469444444444446, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0133 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0134
     * @tc.name      RequestAddForm_DesignScaleOf_0134
     * @tc.desc      designScaleOf(cardWidth=3503) returns 4.865277777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0134 begin`);
      const actual: number = designScaleOf(3503);
      logInfo(`designScaleOf(cardWidth=3503): actual=${actual}`);
      expect(actual).assertClose(4.865277777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0134 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0135
     * @tc.name      RequestAddForm_DesignScaleOf_0135
     * @tc.desc      designScaleOf(cardWidth=3037) returns 4.218055555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0135 begin`);
      const actual: number = designScaleOf(3037);
      logInfo(`designScaleOf(cardWidth=3037): actual=${actual}`);
      expect(actual).assertClose(4.218055555555556, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0135 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0136
     * @tc.name      RequestAddForm_DesignScaleOf_0136
     * @tc.desc      designScaleOf(cardWidth=-1012) returns -1.4055555555555554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0136 begin`);
      const actual: number = designScaleOf(-1012);
      logInfo(`designScaleOf(cardWidth=-1012): actual=${actual}`);
      expect(actual).assertClose(-1.4055555555555554, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0136 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0137
     * @tc.name      RequestAddForm_DesignScaleOf_0137
     * @tc.desc      designScaleOf(cardWidth=435) returns 0.6041666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0137 begin`);
      const actual: number = designScaleOf(435);
      logInfo(`designScaleOf(cardWidth=435): actual=${actual}`);
      expect(actual).assertClose(0.6041666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0137 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0138
     * @tc.name      RequestAddForm_DesignScaleOf_0138
     * @tc.desc      designScaleOf(cardWidth=232.83) returns 0.323375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0138 begin`);
      const actual: number = designScaleOf(232.83);
      logInfo(`designScaleOf(cardWidth=232.83): actual=${actual}`);
      expect(actual).assertClose(0.323375, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0138 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0139
     * @tc.name      RequestAddForm_DesignScaleOf_0139
     * @tc.desc      designScaleOf(cardWidth=-147) returns -0.20416666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0139 begin`);
      const actual: number = designScaleOf(-147);
      logInfo(`designScaleOf(cardWidth=-147): actual=${actual}`);
      expect(actual).assertClose(-0.20416666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0139 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0140
     * @tc.name      RequestAddForm_DesignScaleOf_0140
     * @tc.desc      designScaleOf(cardWidth=3075) returns 4.270833333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0140 begin`);
      const actual: number = designScaleOf(3075);
      logInfo(`designScaleOf(cardWidth=3075): actual=${actual}`);
      expect(actual).assertClose(4.270833333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0140 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0141
     * @tc.name      RequestAddForm_DesignScaleOf_0141
     * @tc.desc      designScaleOf(cardWidth=881) returns 1.2236111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0141 begin`);
      const actual: number = designScaleOf(881);
      logInfo(`designScaleOf(cardWidth=881): actual=${actual}`);
      expect(actual).assertClose(1.2236111111111112, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0141 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0142
     * @tc.name      RequestAddForm_DesignScaleOf_0142
     * @tc.desc      designScaleOf(cardWidth=-163) returns -0.2263888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0142 begin`);
      const actual: number = designScaleOf(-163);
      logInfo(`designScaleOf(cardWidth=-163): actual=${actual}`);
      expect(actual).assertClose(-0.2263888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0142 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0143
     * @tc.name      RequestAddForm_DesignScaleOf_0143
     * @tc.desc      designScaleOf(cardWidth=3464) returns 4.811111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0143 begin`);
      const actual: number = designScaleOf(3464);
      logInfo(`designScaleOf(cardWidth=3464): actual=${actual}`);
      expect(actual).assertClose(4.811111111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0143 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0144
     * @tc.name      RequestAddForm_DesignScaleOf_0144
     * @tc.desc      designScaleOf(cardWidth=-237) returns -0.32916666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0144 begin`);
      const actual: number = designScaleOf(-237);
      logInfo(`designScaleOf(cardWidth=-237): actual=${actual}`);
      expect(actual).assertClose(-0.32916666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0144 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0145
     * @tc.name      RequestAddForm_DesignScaleOf_0145
     * @tc.desc      designScaleOf(cardWidth=2987) returns 4.148611111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0145 begin`);
      const actual: number = designScaleOf(2987);
      logInfo(`designScaleOf(cardWidth=2987): actual=${actual}`);
      expect(actual).assertClose(4.148611111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0145 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0146
     * @tc.name      RequestAddForm_DesignScaleOf_0146
     * @tc.desc      designScaleOf(cardWidth=1524) returns 2.1166666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0146 begin`);
      const actual: number = designScaleOf(1524);
      logInfo(`designScaleOf(cardWidth=1524): actual=${actual}`);
      expect(actual).assertClose(2.1166666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0146 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0147
     * @tc.name      RequestAddForm_DesignScaleOf_0147
     * @tc.desc      designScaleOf(cardWidth=274.47) returns 0.38120833333333337
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0147 begin`);
      const actual: number = designScaleOf(274.47);
      logInfo(`designScaleOf(cardWidth=274.47): actual=${actual}`);
      expect(actual).assertClose(0.38120833333333337, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0147 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0148
     * @tc.name      RequestAddForm_DesignScaleOf_0148
     * @tc.desc      designScaleOf(cardWidth=2789) returns 3.873611111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0148 begin`);
      const actual: number = designScaleOf(2789);
      logInfo(`designScaleOf(cardWidth=2789): actual=${actual}`);
      expect(actual).assertClose(3.873611111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0148 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0149
     * @tc.name      RequestAddForm_DesignScaleOf_0149
     * @tc.desc      designScaleOf(cardWidth=3129) returns 4.345833333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0149 begin`);
      const actual: number = designScaleOf(3129);
      logInfo(`designScaleOf(cardWidth=3129): actual=${actual}`);
      expect(actual).assertClose(4.345833333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0149 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0150
     * @tc.name      RequestAddForm_DesignScaleOf_0150
     * @tc.desc      designScaleOf(cardWidth=1166.23) returns 1.619763888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0150 begin`);
      const actual: number = designScaleOf(1166.23);
      logInfo(`designScaleOf(cardWidth=1166.23): actual=${actual}`);
      expect(actual).assertClose(1.619763888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0150 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0151
     * @tc.name      RequestAddForm_DesignScaleOf_0151
     * @tc.desc      designScaleOf(cardWidth=769) returns 1.0680555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0151 begin`);
      const actual: number = designScaleOf(769);
      logInfo(`designScaleOf(cardWidth=769): actual=${actual}`);
      expect(actual).assertClose(1.0680555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0151 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0152
     * @tc.name      RequestAddForm_DesignScaleOf_0152
     * @tc.desc      designScaleOf(cardWidth=789.19) returns 1.0960972222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0152 begin`);
      const actual: number = designScaleOf(789.19);
      logInfo(`designScaleOf(cardWidth=789.19): actual=${actual}`);
      expect(actual).assertClose(1.0960972222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0152 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0153
     * @tc.name      RequestAddForm_DesignScaleOf_0153
     * @tc.desc      designScaleOf(cardWidth=1742.94) returns 2.42075
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0153 begin`);
      const actual: number = designScaleOf(1742.94);
      logInfo(`designScaleOf(cardWidth=1742.94): actual=${actual}`);
      expect(actual).assertClose(2.42075, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0153 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0154
     * @tc.name      RequestAddForm_DesignScaleOf_0154
     * @tc.desc      designScaleOf(cardWidth=1122.82) returns 1.5594722222222221
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0154 begin`);
      const actual: number = designScaleOf(1122.82);
      logInfo(`designScaleOf(cardWidth=1122.82): actual=${actual}`);
      expect(actual).assertClose(1.5594722222222221, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0154 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0155
     * @tc.name      RequestAddForm_DesignScaleOf_0155
     * @tc.desc      designScaleOf(cardWidth=1711.49) returns 2.3770694444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0155 begin`);
      const actual: number = designScaleOf(1711.49);
      logInfo(`designScaleOf(cardWidth=1711.49): actual=${actual}`);
      expect(actual).assertClose(2.3770694444444445, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0155 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0156
     * @tc.name      RequestAddForm_DesignScaleOf_0156
     * @tc.desc      designScaleOf(cardWidth=-189) returns -0.2625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0156 begin`);
      const actual: number = designScaleOf(-189);
      logInfo(`designScaleOf(cardWidth=-189): actual=${actual}`);
      expect(actual).assertClose(-0.2625, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0156 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0157
     * @tc.name      RequestAddForm_DesignScaleOf_0157
     * @tc.desc      designScaleOf(cardWidth=1841.15) returns 2.557152777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0157 begin`);
      const actual: number = designScaleOf(1841.15);
      logInfo(`designScaleOf(cardWidth=1841.15): actual=${actual}`);
      expect(actual).assertClose(2.557152777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0157 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0158
     * @tc.name      RequestAddForm_DesignScaleOf_0158
     * @tc.desc      designScaleOf(cardWidth=-215) returns -0.2986111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0158 begin`);
      const actual: number = designScaleOf(-215);
      logInfo(`designScaleOf(cardWidth=-215): actual=${actual}`);
      expect(actual).assertClose(-0.2986111111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0158 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0159
     * @tc.name      RequestAddForm_DesignScaleOf_0159
     * @tc.desc      designScaleOf(cardWidth=954.77) returns 1.3260694444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0159 begin`);
      const actual: number = designScaleOf(954.77);
      logInfo(`designScaleOf(cardWidth=954.77): actual=${actual}`);
      expect(actual).assertClose(1.3260694444444445, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0159 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0160
     * @tc.name      RequestAddForm_DesignScaleOf_0160
     * @tc.desc      designScaleOf(cardWidth=3697) returns 5.134722222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0160 begin`);
      const actual: number = designScaleOf(3697);
      logInfo(`designScaleOf(cardWidth=3697): actual=${actual}`);
      expect(actual).assertClose(5.134722222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0160 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0161
     * @tc.name      RequestAddForm_DesignScaleOf_0161
     * @tc.desc      designScaleOf(cardWidth=1176) returns 1.6333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0161 begin`);
      const actual: number = designScaleOf(1176);
      logInfo(`designScaleOf(cardWidth=1176): actual=${actual}`);
      expect(actual).assertClose(1.6333333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0161 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0162
     * @tc.name      RequestAddForm_DesignScaleOf_0162
     * @tc.desc      designScaleOf(cardWidth=49.76) returns 0.06911111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0162 begin`);
      const actual: number = designScaleOf(49.76);
      logInfo(`designScaleOf(cardWidth=49.76): actual=${actual}`);
      expect(actual).assertClose(0.06911111111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0162 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0163
     * @tc.name      RequestAddForm_DesignScaleOf_0163
     * @tc.desc      designScaleOf(cardWidth=1432) returns 1.988888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0163 begin`);
      const actual: number = designScaleOf(1432);
      logInfo(`designScaleOf(cardWidth=1432): actual=${actual}`);
      expect(actual).assertClose(1.988888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0163 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0164
     * @tc.name      RequestAddForm_DesignScaleOf_0164
     * @tc.desc      designScaleOf(cardWidth=2986) returns 4.147222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0164 begin`);
      const actual: number = designScaleOf(2986);
      logInfo(`designScaleOf(cardWidth=2986): actual=${actual}`);
      expect(actual).assertClose(4.147222222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0164 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0165
     * @tc.name      RequestAddForm_DesignScaleOf_0165
     * @tc.desc      designScaleOf(cardWidth=2671) returns 3.709722222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0165 begin`);
      const actual: number = designScaleOf(2671);
      logInfo(`designScaleOf(cardWidth=2671): actual=${actual}`);
      expect(actual).assertClose(3.709722222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0165 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0166
     * @tc.name      RequestAddForm_DesignScaleOf_0166
     * @tc.desc      designScaleOf(cardWidth=1342.17) returns 1.864125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0166 begin`);
      const actual: number = designScaleOf(1342.17);
      logInfo(`designScaleOf(cardWidth=1342.17): actual=${actual}`);
      expect(actual).assertClose(1.864125, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0166 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0167
     * @tc.name      RequestAddForm_DesignScaleOf_0167
     * @tc.desc      designScaleOf(cardWidth=-1661) returns -2.3069444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0167 begin`);
      const actual: number = designScaleOf(-1661);
      logInfo(`designScaleOf(cardWidth=-1661): actual=${actual}`);
      expect(actual).assertClose(-2.3069444444444445, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0167 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0168
     * @tc.name      RequestAddForm_DesignScaleOf_0168
     * @tc.desc      designScaleOf(cardWidth=-758) returns -1.0527777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0168 begin`);
      const actual: number = designScaleOf(-758);
      logInfo(`designScaleOf(cardWidth=-758): actual=${actual}`);
      expect(actual).assertClose(-1.0527777777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0168 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0169
     * @tc.name      RequestAddForm_DesignScaleOf_0169
     * @tc.desc      designScaleOf(cardWidth=-1089) returns -1.5125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0169 begin`);
      const actual: number = designScaleOf(-1089);
      logInfo(`designScaleOf(cardWidth=-1089): actual=${actual}`);
      expect(actual).assertClose(-1.5125, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0169 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0170
     * @tc.name      RequestAddForm_DesignScaleOf_0170
     * @tc.desc      designScaleOf(cardWidth=183.84) returns 0.25533333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0170 begin`);
      const actual: number = designScaleOf(183.84);
      logInfo(`designScaleOf(cardWidth=183.84): actual=${actual}`);
      expect(actual).assertClose(0.25533333333333336, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0170 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0171
     * @tc.name      RequestAddForm_DesignScaleOf_0171
     * @tc.desc      designScaleOf(cardWidth=407) returns 0.5652777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0171 begin`);
      const actual: number = designScaleOf(407);
      logInfo(`designScaleOf(cardWidth=407): actual=${actual}`);
      expect(actual).assertClose(0.5652777777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0171 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0172
     * @tc.name      RequestAddForm_DesignScaleOf_0172
     * @tc.desc      designScaleOf(cardWidth=3083) returns 4.281944444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0172 begin`);
      const actual: number = designScaleOf(3083);
      logInfo(`designScaleOf(cardWidth=3083): actual=${actual}`);
      expect(actual).assertClose(4.281944444444444, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0172 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0173
     * @tc.name      RequestAddForm_DesignScaleOf_0173
     * @tc.desc      designScaleOf(cardWidth=1547.29) returns 2.149013888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0173 begin`);
      const actual: number = designScaleOf(1547.29);
      logInfo(`designScaleOf(cardWidth=1547.29): actual=${actual}`);
      expect(actual).assertClose(2.149013888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0173 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0174
     * @tc.name      RequestAddForm_DesignScaleOf_0174
     * @tc.desc      designScaleOf(cardWidth=-1415) returns -1.9652777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0174 begin`);
      const actual: number = designScaleOf(-1415);
      logInfo(`designScaleOf(cardWidth=-1415): actual=${actual}`);
      expect(actual).assertClose(-1.9652777777777777, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0174 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0175
     * @tc.name      RequestAddForm_DesignScaleOf_0175
     * @tc.desc      designScaleOf(cardWidth=2050) returns 2.8472222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0175 begin`);
      const actual: number = designScaleOf(2050);
      logInfo(`designScaleOf(cardWidth=2050): actual=${actual}`);
      expect(actual).assertClose(2.8472222222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0175 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0176
     * @tc.name      RequestAddForm_DesignScaleOf_0176
     * @tc.desc      designScaleOf(cardWidth=1392) returns 1.9333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0176 begin`);
      const actual: number = designScaleOf(1392);
      logInfo(`designScaleOf(cardWidth=1392): actual=${actual}`);
      expect(actual).assertClose(1.9333333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0176 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0177
     * @tc.name      RequestAddForm_DesignScaleOf_0177
     * @tc.desc      designScaleOf(cardWidth=1259) returns 1.7486111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0177 begin`);
      const actual: number = designScaleOf(1259);
      logInfo(`designScaleOf(cardWidth=1259): actual=${actual}`);
      expect(actual).assertClose(1.7486111111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0177 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0178
     * @tc.name      RequestAddForm_DesignScaleOf_0178
     * @tc.desc      designScaleOf(cardWidth=-337) returns -0.46805555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0178 begin`);
      const actual: number = designScaleOf(-337);
      logInfo(`designScaleOf(cardWidth=-337): actual=${actual}`);
      expect(actual).assertClose(-0.46805555555555556, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0178 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0179
     * @tc.name      RequestAddForm_DesignScaleOf_0179
     * @tc.desc      designScaleOf(cardWidth=3556) returns 4.938888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0179 begin`);
      const actual: number = designScaleOf(3556);
      logInfo(`designScaleOf(cardWidth=3556): actual=${actual}`);
      expect(actual).assertClose(4.938888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0179 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0180
     * @tc.name      RequestAddForm_DesignScaleOf_0180
     * @tc.desc      designScaleOf(cardWidth=-108) returns -0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0180 begin`);
      const actual: number = designScaleOf(-108);
      logInfo(`designScaleOf(cardWidth=-108): actual=${actual}`);
      expect(actual).assertClose(-0.15, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0180 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0181
     * @tc.name      RequestAddForm_DesignScaleOf_0181
     * @tc.desc      designScaleOf(cardWidth=-1171) returns -1.6263888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0181 begin`);
      const actual: number = designScaleOf(-1171);
      logInfo(`designScaleOf(cardWidth=-1171): actual=${actual}`);
      expect(actual).assertClose(-1.6263888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0181 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0182
     * @tc.name      RequestAddForm_DesignScaleOf_0182
     * @tc.desc      designScaleOf(cardWidth=1350.1) returns 1.8751388888888887
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0182 begin`);
      const actual: number = designScaleOf(1350.1);
      logInfo(`designScaleOf(cardWidth=1350.1): actual=${actual}`);
      expect(actual).assertClose(1.8751388888888887, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0182 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0183
     * @tc.name      RequestAddForm_DesignScaleOf_0183
     * @tc.desc      designScaleOf(cardWidth=967) returns 1.3430555555555554
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0183 begin`);
      const actual: number = designScaleOf(967);
      logInfo(`designScaleOf(cardWidth=967): actual=${actual}`);
      expect(actual).assertClose(1.3430555555555554, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0183 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0184
     * @tc.name      RequestAddForm_DesignScaleOf_0184
     * @tc.desc      designScaleOf(cardWidth=862) returns 1.1972222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0184 begin`);
      const actual: number = designScaleOf(862);
      logInfo(`designScaleOf(cardWidth=862): actual=${actual}`);
      expect(actual).assertClose(1.1972222222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0184 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0185
     * @tc.name      RequestAddForm_DesignScaleOf_0185
     * @tc.desc      designScaleOf(cardWidth=430) returns 0.5972222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0185 begin`);
      const actual: number = designScaleOf(430);
      logInfo(`designScaleOf(cardWidth=430): actual=${actual}`);
      expect(actual).assertClose(0.5972222222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0185 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0186
     * @tc.name      RequestAddForm_DesignScaleOf_0186
     * @tc.desc      designScaleOf(cardWidth=1698.82) returns 2.359472222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0186 begin`);
      const actual: number = designScaleOf(1698.82);
      logInfo(`designScaleOf(cardWidth=1698.82): actual=${actual}`);
      expect(actual).assertClose(2.359472222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0186 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0187
     * @tc.name      RequestAddForm_DesignScaleOf_0187
     * @tc.desc      designScaleOf(cardWidth=-1588) returns -2.2055555555555557
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0187 begin`);
      const actual: number = designScaleOf(-1588);
      logInfo(`designScaleOf(cardWidth=-1588): actual=${actual}`);
      expect(actual).assertClose(-2.2055555555555557, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0187 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0188
     * @tc.name      RequestAddForm_DesignScaleOf_0188
     * @tc.desc      designScaleOf(cardWidth=2817) returns 3.9125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0188 begin`);
      const actual: number = designScaleOf(2817);
      logInfo(`designScaleOf(cardWidth=2817): actual=${actual}`);
      expect(actual).assertClose(3.9125, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0188 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0189
     * @tc.name      RequestAddForm_DesignScaleOf_0189
     * @tc.desc      designScaleOf(cardWidth=950.46) returns 1.3200833333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0189 begin`);
      const actual: number = designScaleOf(950.46);
      logInfo(`designScaleOf(cardWidth=950.46): actual=${actual}`);
      expect(actual).assertClose(1.3200833333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0189 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0190
     * @tc.name      RequestAddForm_DesignScaleOf_0190
     * @tc.desc      designScaleOf(cardWidth=305.38) returns 0.4241388888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0190 begin`);
      const actual: number = designScaleOf(305.38);
      logInfo(`designScaleOf(cardWidth=305.38): actual=${actual}`);
      expect(actual).assertClose(0.4241388888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0190 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0191
     * @tc.name      RequestAddForm_DesignScaleOf_0191
     * @tc.desc      designScaleOf(cardWidth=3540) returns 4.916666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0191 begin`);
      const actual: number = designScaleOf(3540);
      logInfo(`designScaleOf(cardWidth=3540): actual=${actual}`);
      expect(actual).assertClose(4.916666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0191 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0192
     * @tc.name      RequestAddForm_DesignScaleOf_0192
     * @tc.desc      designScaleOf(cardWidth=-904) returns -1.2555555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0192 begin`);
      const actual: number = designScaleOf(-904);
      logInfo(`designScaleOf(cardWidth=-904): actual=${actual}`);
      expect(actual).assertClose(-1.2555555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0192 end`);
    });
  });
}
