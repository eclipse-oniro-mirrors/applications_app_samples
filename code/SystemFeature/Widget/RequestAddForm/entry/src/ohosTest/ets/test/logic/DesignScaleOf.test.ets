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
export default function designScaleOfTest(): void {
  describe('DesignScaleOfTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0001
     * @tc.name      RequestAddForm_DesignScaleOf_0001
     * @tc.desc      designScaleOf(cardWidth=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_DesignScaleOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0001 begin`);
      const actual: number = designScaleOf(0);
      logInfo(`designScaleOf(cardWidth=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DesignScaleOf_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0002
     * @tc.name      RequestAddForm_DesignScaleOf_0002
     * @tc.desc      designScaleOf(cardWidth=1) returns 0.001388888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_DesignScaleOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0002 begin`);
      const actual: number = designScaleOf(1);
      logInfo(`designScaleOf(cardWidth=1): actual=${actual}`);
      expect(actual).assertClose(0.001388888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0003
     * @tc.name      RequestAddForm_DesignScaleOf_0003
     * @tc.desc      designScaleOf(cardWidth=100) returns 0.1388888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0003 begin`);
      const actual: number = designScaleOf(100);
      logInfo(`designScaleOf(cardWidth=100): actual=${actual}`);
      expect(actual).assertClose(0.1388888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0004
     * @tc.name      RequestAddForm_DesignScaleOf_0004
     * @tc.desc      designScaleOf(cardWidth=360) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0004 begin`);
      const actual: number = designScaleOf(360);
      logInfo(`designScaleOf(cardWidth=360): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0005
     * @tc.name      RequestAddForm_DesignScaleOf_0005
     * @tc.desc      designScaleOf(cardWidth=720) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0005 begin`);
      const actual: number = designScaleOf(720);
      logInfo(`designScaleOf(cardWidth=720): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}DesignScaleOf_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0006
     * @tc.name      RequestAddForm_DesignScaleOf_0006
     * @tc.desc      designScaleOf(cardWidth=1080) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0006 begin`);
      const actual: number = designScaleOf(1080);
      logInfo(`designScaleOf(cardWidth=1080): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0007
     * @tc.name      RequestAddForm_DesignScaleOf_0007
     * @tc.desc      designScaleOf(cardWidth=1920) returns 2.6666666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0007 begin`);
      const actual: number = designScaleOf(1920);
      logInfo(`designScaleOf(cardWidth=1920): actual=${actual}`);
      expect(actual).assertClose(2.6666666666666665, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0008
     * @tc.name      RequestAddForm_DesignScaleOf_0008
     * @tc.desc      designScaleOf(cardWidth=-1) returns -0.001388888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0008 begin`);
      const actual: number = designScaleOf(-1);
      logInfo(`designScaleOf(cardWidth=-1): actual=${actual}`);
      expect(actual).assertClose(-0.001388888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0009
     * @tc.name      RequestAddForm_DesignScaleOf_0009
     * @tc.desc      designScaleOf(cardWidth=2) returns 0.002777777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0009 begin`);
      const actual: number = designScaleOf(2);
      logInfo(`designScaleOf(cardWidth=2): actual=${actual}`);
      expect(actual).assertClose(0.002777777777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0010
     * @tc.name      RequestAddForm_DesignScaleOf_0010
     * @tc.desc      designScaleOf(cardWidth=3) returns 0.004166666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0010 begin`);
      const actual: number = designScaleOf(3);
      logInfo(`designScaleOf(cardWidth=3): actual=${actual}`);
      expect(actual).assertClose(0.004166666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0011
     * @tc.name      RequestAddForm_DesignScaleOf_0011
     * @tc.desc      designScaleOf(cardWidth=10) returns 0.013888888888888888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0011 begin`);
      const actual: number = designScaleOf(10);
      logInfo(`designScaleOf(cardWidth=10): actual=${actual}`);
      expect(actual).assertClose(0.013888888888888888, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0012
     * @tc.name      RequestAddForm_DesignScaleOf_0012
     * @tc.desc      designScaleOf(cardWidth=96) returns 0.13333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0012 begin`);
      const actual: number = designScaleOf(96);
      logInfo(`designScaleOf(cardWidth=96): actual=${actual}`);
      expect(actual).assertClose(0.13333333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0013
     * @tc.name      RequestAddForm_DesignScaleOf_0013
     * @tc.desc      designScaleOf(cardWidth=192) returns 0.26666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0013 begin`);
      const actual: number = designScaleOf(192);
      logInfo(`designScaleOf(cardWidth=192): actual=${actual}`);
      expect(actual).assertClose(0.26666666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0014
     * @tc.name      RequestAddForm_DesignScaleOf_0014
     * @tc.desc      designScaleOf(cardWidth=288) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0014 begin`);
      const actual: number = designScaleOf(288);
      logInfo(`designScaleOf(cardWidth=288): actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0015
     * @tc.name      RequestAddForm_DesignScaleOf_0015
     * @tc.desc      designScaleOf(cardWidth=384) returns 0.5333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0015 begin`);
      const actual: number = designScaleOf(384);
      logInfo(`designScaleOf(cardWidth=384): actual=${actual}`);
      expect(actual).assertClose(0.5333333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0016
     * @tc.name      RequestAddForm_DesignScaleOf_0016
     * @tc.desc      designScaleOf(cardWidth=480) returns 0.6666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0016 begin`);
      const actual: number = designScaleOf(480);
      logInfo(`designScaleOf(cardWidth=480): actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0017
     * @tc.name      RequestAddForm_DesignScaleOf_0017
     * @tc.desc      designScaleOf(cardWidth=576) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0017 begin`);
      const actual: number = designScaleOf(576);
      logInfo(`designScaleOf(cardWidth=576): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0018
     * @tc.name      RequestAddForm_DesignScaleOf_0018
     * @tc.desc      designScaleOf(cardWidth=672) returns 0.9333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0018 begin`);
      const actual: number = designScaleOf(672);
      logInfo(`designScaleOf(cardWidth=672): actual=${actual}`);
      expect(actual).assertClose(0.9333333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0019
     * @tc.name      RequestAddForm_DesignScaleOf_0019
     * @tc.desc      designScaleOf(cardWidth=768) returns 1.0666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0019 begin`);
      const actual: number = designScaleOf(768);
      logInfo(`designScaleOf(cardWidth=768): actual=${actual}`);
      expect(actual).assertClose(1.0666666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0020
     * @tc.name      RequestAddForm_DesignScaleOf_0020
     * @tc.desc      designScaleOf(cardWidth=864) returns 1.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0020 begin`);
      const actual: number = designScaleOf(864);
      logInfo(`designScaleOf(cardWidth=864): actual=${actual}`);
      expect(actual).assertClose(1.2, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0021
     * @tc.name      RequestAddForm_DesignScaleOf_0021
     * @tc.desc      designScaleOf(cardWidth=960) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0021 begin`);
      const actual: number = designScaleOf(960);
      logInfo(`designScaleOf(cardWidth=960): actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0022
     * @tc.name      RequestAddForm_DesignScaleOf_0022
     * @tc.desc      designScaleOf(cardWidth=1056) returns 1.4666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0022 begin`);
      const actual: number = designScaleOf(1056);
      logInfo(`designScaleOf(cardWidth=1056): actual=${actual}`);
      expect(actual).assertClose(1.4666666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0023
     * @tc.name      RequestAddForm_DesignScaleOf_0023
     * @tc.desc      designScaleOf(cardWidth=1152) returns 1.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0023 begin`);
      const actual: number = designScaleOf(1152);
      logInfo(`designScaleOf(cardWidth=1152): actual=${actual}`);
      expect(actual).assertClose(1.6, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0024
     * @tc.name      RequestAddForm_DesignScaleOf_0024
     * @tc.desc      designScaleOf(cardWidth=1248) returns 1.7333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0024 begin`);
      const actual: number = designScaleOf(1248);
      logInfo(`designScaleOf(cardWidth=1248): actual=${actual}`);
      expect(actual).assertClose(1.7333333333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0025
     * @tc.name      RequestAddForm_DesignScaleOf_0025
     * @tc.desc      designScaleOf(cardWidth=1344) returns 1.8666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0025 begin`);
      const actual: number = designScaleOf(1344);
      logInfo(`designScaleOf(cardWidth=1344): actual=${actual}`);
      expect(actual).assertClose(1.8666666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0026
     * @tc.name      RequestAddForm_DesignScaleOf_0026
     * @tc.desc      designScaleOf(cardWidth=1440) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0026 begin`);
      const actual: number = designScaleOf(1440);
      logInfo(`designScaleOf(cardWidth=1440): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}DesignScaleOf_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0027
     * @tc.name      RequestAddForm_DesignScaleOf_0027
     * @tc.desc      designScaleOf(cardWidth=1536) returns 2.1333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0027 begin`);
      const actual: number = designScaleOf(1536);
      logInfo(`designScaleOf(cardWidth=1536): actual=${actual}`);
      expect(actual).assertClose(2.1333333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0028
     * @tc.name      RequestAddForm_DesignScaleOf_0028
     * @tc.desc      designScaleOf(cardWidth=1632) returns 2.2666666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0028 begin`);
      const actual: number = designScaleOf(1632);
      logInfo(`designScaleOf(cardWidth=1632): actual=${actual}`);
      expect(actual).assertClose(2.2666666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0029
     * @tc.name      RequestAddForm_DesignScaleOf_0029
     * @tc.desc      designScaleOf(cardWidth=1728) returns 2.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0029 begin`);
      const actual: number = designScaleOf(1728);
      logInfo(`designScaleOf(cardWidth=1728): actual=${actual}`);
      expect(actual).assertClose(2.4, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0030
     * @tc.name      RequestAddForm_DesignScaleOf_0030
     * @tc.desc      designScaleOf(cardWidth=1824) returns 2.533333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0030 begin`);
      const actual: number = designScaleOf(1824);
      logInfo(`designScaleOf(cardWidth=1824): actual=${actual}`);
      expect(actual).assertClose(2.533333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0031
     * @tc.name      RequestAddForm_DesignScaleOf_0031
     * @tc.desc      designScaleOf(cardWidth=2016) returns 2.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0031 begin`);
      const actual: number = designScaleOf(2016);
      logInfo(`designScaleOf(cardWidth=2016): actual=${actual}`);
      expect(actual).assertClose(2.8, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0032
     * @tc.name      RequestAddForm_DesignScaleOf_0032
     * @tc.desc      designScaleOf(cardWidth=2112) returns 2.933333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0032 begin`);
      const actual: number = designScaleOf(2112);
      logInfo(`designScaleOf(cardWidth=2112): actual=${actual}`);
      expect(actual).assertClose(2.933333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0033
     * @tc.name      RequestAddForm_DesignScaleOf_0033
     * @tc.desc      designScaleOf(cardWidth=2208) returns 3.066666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0033 begin`);
      const actual: number = designScaleOf(2208);
      logInfo(`designScaleOf(cardWidth=2208): actual=${actual}`);
      expect(actual).assertClose(3.066666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0034
     * @tc.name      RequestAddForm_DesignScaleOf_0034
     * @tc.desc      designScaleOf(cardWidth=2304) returns 3.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0034 begin`);
      const actual: number = designScaleOf(2304);
      logInfo(`designScaleOf(cardWidth=2304): actual=${actual}`);
      expect(actual).assertClose(3.2, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0035
     * @tc.name      RequestAddForm_DesignScaleOf_0035
     * @tc.desc      designScaleOf(cardWidth=2400) returns 3.3333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0035 begin`);
      const actual: number = designScaleOf(2400);
      logInfo(`designScaleOf(cardWidth=2400): actual=${actual}`);
      expect(actual).assertClose(3.3333333333333335, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0036
     * @tc.name      RequestAddForm_DesignScaleOf_0036
     * @tc.desc      designScaleOf(cardWidth=2496) returns 3.466666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0036 begin`);
      const actual: number = designScaleOf(2496);
      logInfo(`designScaleOf(cardWidth=2496): actual=${actual}`);
      expect(actual).assertClose(3.466666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0037
     * @tc.name      RequestAddForm_DesignScaleOf_0037
     * @tc.desc      designScaleOf(cardWidth=2592) returns 3.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0037 begin`);
      const actual: number = designScaleOf(2592);
      logInfo(`designScaleOf(cardWidth=2592): actual=${actual}`);
      expect(actual).assertClose(3.6, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0038
     * @tc.name      RequestAddForm_DesignScaleOf_0038
     * @tc.desc      designScaleOf(cardWidth=2688) returns 3.7333333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0038 begin`);
      const actual: number = designScaleOf(2688);
      logInfo(`designScaleOf(cardWidth=2688): actual=${actual}`);
      expect(actual).assertClose(3.7333333333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0039
     * @tc.name      RequestAddForm_DesignScaleOf_0039
     * @tc.desc      designScaleOf(cardWidth=2784) returns 3.8666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0039 begin`);
      const actual: number = designScaleOf(2784);
      logInfo(`designScaleOf(cardWidth=2784): actual=${actual}`);
      expect(actual).assertClose(3.8666666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0040
     * @tc.name      RequestAddForm_DesignScaleOf_0040
     * @tc.desc      designScaleOf(cardWidth=2880) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0040 begin`);
      const actual: number = designScaleOf(2880);
      logInfo(`designScaleOf(cardWidth=2880): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}DesignScaleOf_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0041
     * @tc.name      RequestAddForm_DesignScaleOf_0041
     * @tc.desc      designScaleOf(cardWidth=2976) returns 4.133333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0041 begin`);
      const actual: number = designScaleOf(2976);
      logInfo(`designScaleOf(cardWidth=2976): actual=${actual}`);
      expect(actual).assertClose(4.133333333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0042
     * @tc.name      RequestAddForm_DesignScaleOf_0042
     * @tc.desc      designScaleOf(cardWidth=3072) returns 4.266666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0042 begin`);
      const actual: number = designScaleOf(3072);
      logInfo(`designScaleOf(cardWidth=3072): actual=${actual}`);
      expect(actual).assertClose(4.266666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0043
     * @tc.name      RequestAddForm_DesignScaleOf_0043
     * @tc.desc      designScaleOf(cardWidth=3168) returns 4.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0043 begin`);
      const actual: number = designScaleOf(3168);
      logInfo(`designScaleOf(cardWidth=3168): actual=${actual}`);
      expect(actual).assertClose(4.4, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0044
     * @tc.name      RequestAddForm_DesignScaleOf_0044
     * @tc.desc      designScaleOf(cardWidth=3264) returns 4.533333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0044 begin`);
      const actual: number = designScaleOf(3264);
      logInfo(`designScaleOf(cardWidth=3264): actual=${actual}`);
      expect(actual).assertClose(4.533333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0045
     * @tc.name      RequestAddForm_DesignScaleOf_0045
     * @tc.desc      designScaleOf(cardWidth=3360) returns 4.666666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0045 begin`);
      const actual: number = designScaleOf(3360);
      logInfo(`designScaleOf(cardWidth=3360): actual=${actual}`);
      expect(actual).assertClose(4.666666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0046
     * @tc.name      RequestAddForm_DesignScaleOf_0046
     * @tc.desc      designScaleOf(cardWidth=3456) returns 4.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0046 begin`);
      const actual: number = designScaleOf(3456);
      logInfo(`designScaleOf(cardWidth=3456): actual=${actual}`);
      expect(actual).assertClose(4.8, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0047
     * @tc.name      RequestAddForm_DesignScaleOf_0047
     * @tc.desc      designScaleOf(cardWidth=3552) returns 4.933333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0047 begin`);
      const actual: number = designScaleOf(3552);
      logInfo(`designScaleOf(cardWidth=3552): actual=${actual}`);
      expect(actual).assertClose(4.933333333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0048
     * @tc.name      RequestAddForm_DesignScaleOf_0048
     * @tc.desc      designScaleOf(cardWidth=3648) returns 5.066666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0048 begin`);
      const actual: number = designScaleOf(3648);
      logInfo(`designScaleOf(cardWidth=3648): actual=${actual}`);
      expect(actual).assertClose(5.066666666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0049
     * @tc.name      RequestAddForm_DesignScaleOf_0049
     * @tc.desc      designScaleOf(cardWidth=3744) returns 5.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0049 begin`);
      const actual: number = designScaleOf(3744);
      logInfo(`designScaleOf(cardWidth=3744): actual=${actual}`);
      expect(actual).assertClose(5.2, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0050
     * @tc.name      RequestAddForm_DesignScaleOf_0050
     * @tc.desc      designScaleOf(cardWidth=3840) returns 5.333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0050 begin`);
      const actual: number = designScaleOf(3840);
      logInfo(`designScaleOf(cardWidth=3840): actual=${actual}`);
      expect(actual).assertClose(5.333333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0051
     * @tc.name      RequestAddForm_DesignScaleOf_0051
     * @tc.desc      designScaleOf(cardWidth=162) returns 0.225
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0051 begin`);
      const actual: number = designScaleOf(162);
      logInfo(`designScaleOf(cardWidth=162): actual=${actual}`);
      expect(actual).assertClose(0.225, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0052
     * @tc.name      RequestAddForm_DesignScaleOf_0052
     * @tc.desc      designScaleOf(cardWidth=2580) returns 3.5833333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0052 begin`);
      const actual: number = designScaleOf(2580);
      logInfo(`designScaleOf(cardWidth=2580): actual=${actual}`);
      expect(actual).assertClose(3.5833333333333335, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0053
     * @tc.name      RequestAddForm_DesignScaleOf_0053
     * @tc.desc      designScaleOf(cardWidth=453.38) returns 0.6296944444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0053 begin`);
      const actual: number = designScaleOf(453.38);
      logInfo(`designScaleOf(cardWidth=453.38): actual=${actual}`);
      expect(actual).assertClose(0.6296944444444444, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0054
     * @tc.name      RequestAddForm_DesignScaleOf_0054
     * @tc.desc      designScaleOf(cardWidth=2233) returns 3.1013888888888888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0054 begin`);
      const actual: number = designScaleOf(2233);
      logInfo(`designScaleOf(cardWidth=2233): actual=${actual}`);
      expect(actual).assertClose(3.1013888888888888, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0055
     * @tc.name      RequestAddForm_DesignScaleOf_0055
     * @tc.desc      designScaleOf(cardWidth=484) returns 0.6722222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0055 begin`);
      const actual: number = designScaleOf(484);
      logInfo(`designScaleOf(cardWidth=484): actual=${actual}`);
      expect(actual).assertClose(0.6722222222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0056
     * @tc.name      RequestAddForm_DesignScaleOf_0056
     * @tc.desc      designScaleOf(cardWidth=126) returns 0.175
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0056 begin`);
      const actual: number = designScaleOf(126);
      logInfo(`designScaleOf(cardWidth=126): actual=${actual}`);
      expect(actual).assertClose(0.175, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0057
     * @tc.name      RequestAddForm_DesignScaleOf_0057
     * @tc.desc      designScaleOf(cardWidth=3823) returns 5.309722222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0057 begin`);
      const actual: number = designScaleOf(3823);
      logInfo(`designScaleOf(cardWidth=3823): actual=${actual}`);
      expect(actual).assertClose(5.309722222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0058
     * @tc.name      RequestAddForm_DesignScaleOf_0058
     * @tc.desc      designScaleOf(cardWidth=2435) returns 3.3819444444444446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0058 begin`);
      const actual: number = designScaleOf(2435);
      logInfo(`designScaleOf(cardWidth=2435): actual=${actual}`);
      expect(actual).assertClose(3.3819444444444446, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0059
     * @tc.name      RequestAddForm_DesignScaleOf_0059
     * @tc.desc      designScaleOf(cardWidth=-501) returns -0.6958333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0059 begin`);
      const actual: number = designScaleOf(-501);
      logInfo(`designScaleOf(cardWidth=-501): actual=${actual}`);
      expect(actual).assertClose(-0.6958333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0060
     * @tc.name      RequestAddForm_DesignScaleOf_0060
     * @tc.desc      designScaleOf(cardWidth=405) returns 0.5625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0060 begin`);
      const actual: number = designScaleOf(405);
      logInfo(`designScaleOf(cardWidth=405): actual=${actual}`);
      expect(actual).assertClose(0.5625, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0061
     * @tc.name      RequestAddForm_DesignScaleOf_0061
     * @tc.desc      designScaleOf(cardWidth=255) returns 0.3541666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0061 begin`);
      const actual: number = designScaleOf(255);
      logInfo(`designScaleOf(cardWidth=255): actual=${actual}`);
      expect(actual).assertClose(0.3541666666666667, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0062
     * @tc.name      RequestAddForm_DesignScaleOf_0062
     * @tc.desc      designScaleOf(cardWidth=3815) returns 5.298611111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0062 begin`);
      const actual: number = designScaleOf(3815);
      logInfo(`designScaleOf(cardWidth=3815): actual=${actual}`);
      expect(actual).assertClose(5.298611111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0063
     * @tc.name      RequestAddForm_DesignScaleOf_0063
     * @tc.desc      designScaleOf(cardWidth=2837) returns 3.9402777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0063 begin`);
      const actual: number = designScaleOf(2837);
      logInfo(`designScaleOf(cardWidth=2837): actual=${actual}`);
      expect(actual).assertClose(3.9402777777777778, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0064
     * @tc.name      RequestAddForm_DesignScaleOf_0064
     * @tc.desc      designScaleOf(cardWidth=172.45) returns 0.23951388888888886
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0064 begin`);
      const actual: number = designScaleOf(172.45);
      logInfo(`designScaleOf(cardWidth=172.45): actual=${actual}`);
      expect(actual).assertClose(0.23951388888888886, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0065
     * @tc.name      RequestAddForm_DesignScaleOf_0065
     * @tc.desc      designScaleOf(cardWidth=1114.83) returns 1.5483749999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0065 begin`);
      const actual: number = designScaleOf(1114.83);
      logInfo(`designScaleOf(cardWidth=1114.83): actual=${actual}`);
      expect(actual).assertClose(1.5483749999999998, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0066
     * @tc.name      RequestAddForm_DesignScaleOf_0066
     * @tc.desc      designScaleOf(cardWidth=1477.57) returns 2.0521805555555557
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0066 begin`);
      const actual: number = designScaleOf(1477.57);
      logInfo(`designScaleOf(cardWidth=1477.57): actual=${actual}`);
      expect(actual).assertClose(2.0521805555555557, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0067
     * @tc.name      RequestAddForm_DesignScaleOf_0067
     * @tc.desc      designScaleOf(cardWidth=88.77) returns 0.12329166666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0067 begin`);
      const actual: number = designScaleOf(88.77);
      logInfo(`designScaleOf(cardWidth=88.77): actual=${actual}`);
      expect(actual).assertClose(0.12329166666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0068
     * @tc.name      RequestAddForm_DesignScaleOf_0068
     * @tc.desc      designScaleOf(cardWidth=1655.91) returns 2.299875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0068 begin`);
      const actual: number = designScaleOf(1655.91);
      logInfo(`designScaleOf(cardWidth=1655.91): actual=${actual}`);
      expect(actual).assertClose(2.299875, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0069
     * @tc.name      RequestAddForm_DesignScaleOf_0069
     * @tc.desc      designScaleOf(cardWidth=690) returns 0.9583333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0069 begin`);
      const actual: number = designScaleOf(690);
      logInfo(`designScaleOf(cardWidth=690): actual=${actual}`);
      expect(actual).assertClose(0.9583333333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0070
     * @tc.name      RequestAddForm_DesignScaleOf_0070
     * @tc.desc      designScaleOf(cardWidth=1086) returns 1.5083333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0070 begin`);
      const actual: number = designScaleOf(1086);
      logInfo(`designScaleOf(cardWidth=1086): actual=${actual}`);
      expect(actual).assertClose(1.5083333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0071
     * @tc.name      RequestAddForm_DesignScaleOf_0071
     * @tc.desc      designScaleOf(cardWidth=533.89) returns 0.7415138888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0071 begin`);
      const actual: number = designScaleOf(533.89);
      logInfo(`designScaleOf(cardWidth=533.89): actual=${actual}`);
      expect(actual).assertClose(0.7415138888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0072
     * @tc.name      RequestAddForm_DesignScaleOf_0072
     * @tc.desc      designScaleOf(cardWidth=2973) returns 4.129166666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0072 begin`);
      const actual: number = designScaleOf(2973);
      logInfo(`designScaleOf(cardWidth=2973): actual=${actual}`);
      expect(actual).assertClose(4.129166666666666, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0073
     * @tc.name      RequestAddForm_DesignScaleOf_0073
     * @tc.desc      designScaleOf(cardWidth=734) returns 1.0194444444444444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0073 begin`);
      const actual: number = designScaleOf(734);
      logInfo(`designScaleOf(cardWidth=734): actual=${actual}`);
      expect(actual).assertClose(1.0194444444444444, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0074
     * @tc.name      RequestAddForm_DesignScaleOf_0074
     * @tc.desc      designScaleOf(cardWidth=-152) returns -0.2111111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0074 begin`);
      const actual: number = designScaleOf(-152);
      logInfo(`designScaleOf(cardWidth=-152): actual=${actual}`);
      expect(actual).assertClose(-0.2111111111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0075
     * @tc.name      RequestAddForm_DesignScaleOf_0075
     * @tc.desc      designScaleOf(cardWidth=662.11) returns 0.9195972222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0075 begin`);
      const actual: number = designScaleOf(662.11);
      logInfo(`designScaleOf(cardWidth=662.11): actual=${actual}`);
      expect(actual).assertClose(0.9195972222222223, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0076
     * @tc.name      RequestAddForm_DesignScaleOf_0076
     * @tc.desc      designScaleOf(cardWidth=467) returns 0.6486111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0076 begin`);
      const actual: number = designScaleOf(467);
      logInfo(`designScaleOf(cardWidth=467): actual=${actual}`);
      expect(actual).assertClose(0.6486111111111111, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0077
     * @tc.name      RequestAddForm_DesignScaleOf_0077
     * @tc.desc      designScaleOf(cardWidth=277) returns 0.38472222222222224
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0077 begin`);
      const actual: number = designScaleOf(277);
      logInfo(`designScaleOf(cardWidth=277): actual=${actual}`);
      expect(actual).assertClose(0.38472222222222224, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0078
     * @tc.name      RequestAddForm_DesignScaleOf_0078
     * @tc.desc      designScaleOf(cardWidth=-355) returns -0.4930555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0078 begin`);
      const actual: number = designScaleOf(-355);
      logInfo(`designScaleOf(cardWidth=-355): actual=${actual}`);
      expect(actual).assertClose(-0.4930555555555556, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0079
     * @tc.name      RequestAddForm_DesignScaleOf_0079
     * @tc.desc      designScaleOf(cardWidth=40) returns 0.05555555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0079 begin`);
      const actual: number = designScaleOf(40);
      logInfo(`designScaleOf(cardWidth=40): actual=${actual}`);
      expect(actual).assertClose(0.05555555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0080
     * @tc.name      RequestAddForm_DesignScaleOf_0080
     * @tc.desc      designScaleOf(cardWidth=438) returns 0.6083333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0080 begin`);
      const actual: number = designScaleOf(438);
      logInfo(`designScaleOf(cardWidth=438): actual=${actual}`);
      expect(actual).assertClose(0.6083333333333333, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0081
     * @tc.name      RequestAddForm_DesignScaleOf_0081
     * @tc.desc      designScaleOf(cardWidth=1817) returns 2.5236111111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0081 begin`);
      const actual: number = designScaleOf(1817);
      logInfo(`designScaleOf(cardWidth=1817): actual=${actual}`);
      expect(actual).assertClose(2.5236111111111112, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0082
     * @tc.name      RequestAddForm_DesignScaleOf_0082
     * @tc.desc      designScaleOf(cardWidth=2205) returns 3.0625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0082 begin`);
      const actual: number = designScaleOf(2205);
      logInfo(`designScaleOf(cardWidth=2205): actual=${actual}`);
      expect(actual).assertClose(3.0625, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0083
     * @tc.name      RequestAddForm_DesignScaleOf_0083
     * @tc.desc      designScaleOf(cardWidth=228.65) returns 0.31756944444444446
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0083 begin`);
      const actual: number = designScaleOf(228.65);
      logInfo(`designScaleOf(cardWidth=228.65): actual=${actual}`);
      expect(actual).assertClose(0.31756944444444446, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0084
     * @tc.name      RequestAddForm_DesignScaleOf_0084
     * @tc.desc      designScaleOf(cardWidth=-1526) returns -2.1194444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0084 begin`);
      const actual: number = designScaleOf(-1526);
      logInfo(`designScaleOf(cardWidth=-1526): actual=${actual}`);
      expect(actual).assertClose(-2.1194444444444445, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0085
     * @tc.name      RequestAddForm_DesignScaleOf_0085
     * @tc.desc      designScaleOf(cardWidth=531.71) returns 0.7384861111111112
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0085 begin`);
      const actual: number = designScaleOf(531.71);
      logInfo(`designScaleOf(cardWidth=531.71): actual=${actual}`);
      expect(actual).assertClose(0.7384861111111112, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0086
     * @tc.name      RequestAddForm_DesignScaleOf_0086
     * @tc.desc      designScaleOf(cardWidth=-312) returns -0.43333333333333335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_DesignScaleOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0086 begin`);
      const actual: number = designScaleOf(-312);
      logInfo(`designScaleOf(cardWidth=-312): actual=${actual}`);
      expect(actual).assertClose(-0.43333333333333335, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0087
     * @tc.name      RequestAddForm_DesignScaleOf_0087
     * @tc.desc      designScaleOf(cardWidth=3709) returns 5.151388888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0087 begin`);
      const actual: number = designScaleOf(3709);
      logInfo(`designScaleOf(cardWidth=3709): actual=${actual}`);
      expect(actual).assertClose(5.151388888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0088
     * @tc.name      RequestAddForm_DesignScaleOf_0088
     * @tc.desc      designScaleOf(cardWidth=2119) returns 2.9430555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0088 begin`);
      const actual: number = designScaleOf(2119);
      logInfo(`designScaleOf(cardWidth=2119): actual=${actual}`);
      expect(actual).assertClose(2.9430555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0089
     * @tc.name      RequestAddForm_DesignScaleOf_0089
     * @tc.desc      designScaleOf(cardWidth=1180) returns 1.6388888888888888
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0089 begin`);
      const actual: number = designScaleOf(1180);
      logInfo(`designScaleOf(cardWidth=1180): actual=${actual}`);
      expect(actual).assertClose(1.6388888888888888, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0090
     * @tc.name      RequestAddForm_DesignScaleOf_0090
     * @tc.desc      designScaleOf(cardWidth=3268) returns 4.538888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0090 begin`);
      const actual: number = designScaleOf(3268);
      logInfo(`designScaleOf(cardWidth=3268): actual=${actual}`);
      expect(actual).assertClose(4.538888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0091
     * @tc.name      RequestAddForm_DesignScaleOf_0091
     * @tc.desc      designScaleOf(cardWidth=1516.52) returns 2.1062777777777777
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0091 begin`);
      const actual: number = designScaleOf(1516.52);
      logInfo(`designScaleOf(cardWidth=1516.52): actual=${actual}`);
      expect(actual).assertClose(2.1062777777777777, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0092
     * @tc.name      RequestAddForm_DesignScaleOf_0092
     * @tc.desc      designScaleOf(cardWidth=1810) returns 2.513888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0092 begin`);
      const actual: number = designScaleOf(1810);
      logInfo(`designScaleOf(cardWidth=1810): actual=${actual}`);
      expect(actual).assertClose(2.513888888888889, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0093
     * @tc.name      RequestAddForm_DesignScaleOf_0093
     * @tc.desc      designScaleOf(cardWidth=1849) returns 2.5680555555555555
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0093 begin`);
      const actual: number = designScaleOf(1849);
      logInfo(`designScaleOf(cardWidth=1849): actual=${actual}`);
      expect(actual).assertClose(2.5680555555555555, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0094
     * @tc.name      RequestAddForm_DesignScaleOf_0094
     * @tc.desc      designScaleOf(cardWidth=945) returns 1.3125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0094 begin`);
      const actual: number = designScaleOf(945);
      logInfo(`designScaleOf(cardWidth=945): actual=${actual}`);
      expect(actual).assertClose(1.3125, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0095
     * @tc.name      RequestAddForm_DesignScaleOf_0095
     * @tc.desc      designScaleOf(cardWidth=2248) returns 3.1222222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0095 begin`);
      const actual: number = designScaleOf(2248);
      logInfo(`designScaleOf(cardWidth=2248): actual=${actual}`);
      expect(actual).assertClose(3.1222222222222222, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_DESIGN_SCALE_OF_0096
     * @tc.name      RequestAddForm_DesignScaleOf_0096
     * @tc.desc      designScaleOf(cardWidth=524.13) returns 0.7279583333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_DesignScaleOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}DesignScaleOf_0096 begin`);
      const actual: number = designScaleOf(524.13);
      logInfo(`designScaleOf(cardWidth=524.13): actual=${actual}`);
      expect(actual).assertClose(0.7279583333333334, PRECISION);
      logInfo(`${BUNDLE}DesignScaleOf_0096 end`);
    });
  });
}
