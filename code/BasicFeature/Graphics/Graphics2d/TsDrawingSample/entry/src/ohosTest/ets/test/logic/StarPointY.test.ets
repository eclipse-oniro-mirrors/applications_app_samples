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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { starPointY } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for starPointY (75 cases). */
export default function starPointYTest(): void {
  describe('StarPointYTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0001
     * @tc.name      TsDrawingSample_StarPointY_0001
     * @tc.desc      starPointY(index=0, aY=18, len=0) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_StarPointY_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StarPointY_0001 begin`);
      const actual: number = starPointY(0, 18, 0);
      logInfo(`starPointY(index=0, aY=18, len=0): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}StarPointY_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0002
     * @tc.name      TsDrawingSample_StarPointY_0002
     * @tc.desc      starPointY(index=18, aY=18, len=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_StarPointY_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StarPointY_0002 begin`);
      const actual: number = starPointY(18, 18, 0);
      logInfo(`starPointY(index=18, aY=18, len=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}StarPointY_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0003
     * @tc.name      TsDrawingSample_StarPointY_0003
     * @tc.desc      starPointY(index=0, aY=17, len=0) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0003 begin`);
      const actual: number = starPointY(0, 17, 0);
      logInfo(`starPointY(index=0, aY=17, len=0): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}StarPointY_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0004
     * @tc.name      TsDrawingSample_StarPointY_0004
     * @tc.desc      starPointY(index=0, aY=19, len=0) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0004 begin`);
      const actual: number = starPointY(0, 19, 0);
      logInfo(`starPointY(index=0, aY=19, len=0): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}StarPointY_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0005
     * @tc.name      TsDrawingSample_StarPointY_0005
     * @tc.desc      starPointY(index=0, aY=36, len=0) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_StarPointY_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StarPointY_0005 begin`);
      const actual: number = starPointY(0, 36, 0);
      logInfo(`starPointY(index=0, aY=36, len=0): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}StarPointY_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0006
     * @tc.name      TsDrawingSample_StarPointY_0006
     * @tc.desc      starPointY(index=0, aY=9, len=0) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_StarPointY_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StarPointY_0006 begin`);
      const actual: number = starPointY(0, 9, 0);
      logInfo(`starPointY(index=0, aY=9, len=0): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}StarPointY_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0007
     * @tc.name      TsDrawingSample_StarPointY_0007
     * @tc.desc      starPointY(index=0, aY=2, len=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0007 begin`);
      const actual: number = starPointY(0, 2, 0);
      logInfo(`starPointY(index=0, aY=2, len=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}StarPointY_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0008
     * @tc.name      TsDrawingSample_StarPointY_0008
     * @tc.desc      starPointY(index=0, aY=1, len=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0008 begin`);
      const actual: number = starPointY(0, 1, 0);
      logInfo(`starPointY(index=0, aY=1, len=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}StarPointY_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0009
     * @tc.name      TsDrawingSample_StarPointY_0009
     * @tc.desc      starPointY(index=0, aY=3, len=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0009 begin`);
      const actual: number = starPointY(0, 3, 0);
      logInfo(`starPointY(index=0, aY=3, len=0): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StarPointY_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0010
     * @tc.name      TsDrawingSample_StarPointY_0010
     * @tc.desc      starPointY(index=0, aY=0, len=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0010 begin`);
      const actual: number = starPointY(0, 0, 0);
      logInfo(`starPointY(index=0, aY=0, len=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StarPointY_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0011
     * @tc.name      TsDrawingSample_StarPointY_0011
     * @tc.desc      starPointY(index=0, aY=-1, len=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0011 begin`);
      const actual: number = starPointY(0, -1, 0);
      logInfo(`starPointY(index=0, aY=-1, len=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StarPointY_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0012
     * @tc.name      TsDrawingSample_StarPointY_0012
     * @tc.desc      starPointY(index=0, aY=4, len=0) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0012 begin`);
      const actual: number = starPointY(0, 4, 0);
      logInfo(`starPointY(index=0, aY=4, len=0): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}StarPointY_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0013
     * @tc.name      TsDrawingSample_StarPointY_0013
     * @tc.desc      starPointY(index=0, aY=5, len=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0013 begin`);
      const actual: number = starPointY(0, 5, 0);
      logInfo(`starPointY(index=0, aY=5, len=0): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}StarPointY_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0014
     * @tc.name      TsDrawingSample_StarPointY_0014
     * @tc.desc      starPointY(index=2, aY=19, len=17) returns 30.225384040149365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0014 begin`);
      const actual: number = starPointY(2, 19, 17);
      logInfo(`starPointY(index=2, aY=19, len=17): actual=${actual}`);
      expect(actual).assertClose(30.225384040149365, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0015
     * @tc.name      TsDrawingSample_StarPointY_0015
     * @tc.desc      starPointY(index=3, aY=17, len=17) returns 28.225384040149365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0015 begin`);
      const actual: number = starPointY(3, 17, 17);
      logInfo(`starPointY(index=3, aY=17, len=17): actual=${actual}`);
      expect(actual).assertClose(28.225384040149365, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0016
     * @tc.name      TsDrawingSample_StarPointY_0016
     * @tc.desc      starPointY(index=3, aY=1, len=1) returns 1.6603167082440802
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0016 begin`);
      const actual: number = starPointY(3, 1, 1);
      logInfo(`starPointY(index=3, aY=1, len=1): actual=${actual}`);
      expect(actual).assertClose(1.6603167082440802, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0017
     * @tc.name      TsDrawingSample_StarPointY_0017
     * @tc.desc      starPointY(index=4, aY=5, len=4) returns 11.332048489081336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0017 begin`);
      const actual: number = starPointY(4, 5, 4);
      logInfo(`starPointY(index=4, aY=5, len=4): actual=${actual}`);
      expect(actual).assertClose(11.332048489081336, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0018
     * @tc.name      TsDrawingSample_StarPointY_0018
     * @tc.desc      starPointY(index=4, aY=2, len=36) returns 58.98843640173184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0018 begin`);
      const actual: number = starPointY(4, 2, 36);
      logInfo(`starPointY(index=4, aY=2, len=36): actual=${actual}`);
      expect(actual).assertClose(58.98843640173184, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0019
     * @tc.name      TsDrawingSample_StarPointY_0019
     * @tc.desc      starPointY(index=1, aY=1, len=9) returns 15.247109100432937
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0019 begin`);
      const actual: number = starPointY(1, 1, 9);
      logInfo(`starPointY(index=1, aY=1, len=9): actual=${actual}`);
      expect(actual).assertClose(15.247109100432937, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0020
     * @tc.name      TsDrawingSample_StarPointY_0020
     * @tc.desc      starPointY(index=2, aY=9, len=1) returns 9.66031670824408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0020 begin`);
      const actual: number = starPointY(2, 9, 1);
      logInfo(`starPointY(index=2, aY=9, len=1): actual=${actual}`);
      expect(actual).assertClose(9.66031670824408, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0021
     * @tc.name      TsDrawingSample_StarPointY_0021
     * @tc.desc      starPointY(index=4, aY=-1, len=4) returns 5.332048489081336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0021 begin`);
      const actual: number = starPointY(4, -1, 4);
      logInfo(`starPointY(index=4, aY=-1, len=4): actual=${actual}`);
      expect(actual).assertClose(5.332048489081336, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0022
     * @tc.name      TsDrawingSample_StarPointY_0022
     * @tc.desc      starPointY(index=3, aY=19, len=2) returns 20.32063341648816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0022 begin`);
      const actual: number = starPointY(3, 19, 2);
      logInfo(`starPointY(index=3, aY=19, len=2): actual=${actual}`);
      expect(actual).assertClose(20.32063341648816, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0023
     * @tc.name      TsDrawingSample_StarPointY_0023
     * @tc.desc      starPointY(index=2, aY=0, len=17) returns 11.225384040149363
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0023 begin`);
      const actual: number = starPointY(2, 0, 17);
      logInfo(`starPointY(index=2, aY=0, len=17): actual=${actual}`);
      expect(actual).assertClose(11.225384040149363, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0024
     * @tc.name      TsDrawingSample_StarPointY_0024
     * @tc.desc      starPointY(index=2, aY=19, len=4) returns 21.64126683297632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0024 begin`);
      const actual: number = starPointY(2, 19, 4);
      logInfo(`starPointY(index=2, aY=19, len=4): actual=${actual}`);
      expect(actual).assertClose(21.64126683297632, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0025
     * @tc.name      TsDrawingSample_StarPointY_0025
     * @tc.desc      starPointY(index=2, aY=18, len=4) returns 20.64126683297632
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0025 begin`);
      const actual: number = starPointY(2, 18, 4);
      logInfo(`starPointY(index=2, aY=18, len=4): actual=${actual}`);
      expect(actual).assertClose(20.64126683297632, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0026
     * @tc.name      TsDrawingSample_StarPointY_0026
     * @tc.desc      starPointY(index=1, aY=9, len=5) returns 16.915060611351656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0026 begin`);
      const actual: number = starPointY(1, 9, 5);
      logInfo(`starPointY(index=1, aY=9, len=5): actual=${actual}`);
      expect(actual).assertClose(16.915060611351656, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0027
     * @tc.name      TsDrawingSample_StarPointY_0027
     * @tc.desc      starPointY(index=3, aY=3, len=36) returns 26.771401496786886
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0027 begin`);
      const actual: number = starPointY(3, 3, 36);
      logInfo(`starPointY(index=3, aY=3, len=36): actual=${actual}`);
      expect(actual).assertClose(26.771401496786886, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0028
     * @tc.name      TsDrawingSample_StarPointY_0028
     * @tc.desc      starPointY(index=1, aY=3, len=19) returns 33.07723032313625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0028 begin`);
      const actual: number = starPointY(1, 3, 19);
      logInfo(`starPointY(index=1, aY=3, len=19): actual=${actual}`);
      expect(actual).assertClose(33.07723032313625, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0029
     * @tc.name      TsDrawingSample_StarPointY_0029
     * @tc.desc      starPointY(index=1, aY=3, len=5) returns 10.915060611351656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0029 begin`);
      const actual: number = starPointY(1, 3, 5);
      logInfo(`starPointY(index=1, aY=3, len=5): actual=${actual}`);
      expect(actual).assertClose(10.915060611351656, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0030
     * @tc.name      TsDrawingSample_StarPointY_0030
     * @tc.desc      starPointY(index=4, aY=1, len=5) returns 8.915060611351656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0030 begin`);
      const actual: number = starPointY(4, 1, 5);
      logInfo(`starPointY(index=4, aY=1, len=5): actual=${actual}`);
      expect(actual).assertClose(8.915060611351656, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0031
     * @tc.name      TsDrawingSample_StarPointY_0031
     * @tc.desc      starPointY(index=3, aY=5, len=2) returns 6.32063341648816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0031 begin`);
      const actual: number = starPointY(3, 5, 2);
      logInfo(`starPointY(index=3, aY=5, len=2): actual=${actual}`);
      expect(actual).assertClose(6.32063341648816, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0032
     * @tc.name      TsDrawingSample_StarPointY_0032
     * @tc.desc      starPointY(index=3, aY=18, len=-1) returns 17.339683291755918
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0032 begin`);
      const actual: number = starPointY(3, 18, -1);
      logInfo(`starPointY(index=3, aY=18, len=-1): actual=${actual}`);
      expect(actual).assertClose(17.339683291755918, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0033
     * @tc.name      TsDrawingSample_StarPointY_0033
     * @tc.desc      starPointY(index=3, aY=36, len=19) returns 48.54601745663752
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0033 begin`);
      const actual: number = starPointY(3, 36, 19);
      logInfo(`starPointY(index=3, aY=36, len=19): actual=${actual}`);
      expect(actual).assertClose(48.54601745663752, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0034
     * @tc.name      TsDrawingSample_StarPointY_0034
     * @tc.desc      starPointY(index=4, aY=3, len=-1) returns 4.58301212227032
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0034 begin`);
      const actual: number = starPointY(4, 3, -1);
      logInfo(`starPointY(index=4, aY=3, len=-1): actual=${actual}`);
      expect(actual).assertClose(4.58301212227032, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0035
     * @tc.name      TsDrawingSample_StarPointY_0035
     * @tc.desc      starPointY(index=2, aY=0, len=3) returns 1.9809501247322405
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0035 begin`);
      const actual: number = starPointY(2, 0, 3);
      logInfo(`starPointY(index=2, aY=0, len=3): actual=${actual}`);
      expect(actual).assertClose(1.9809501247322405, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0036
     * @tc.name      TsDrawingSample_StarPointY_0036
     * @tc.desc      starPointY(index=4, aY=-1, len=1) returns 0.5830121222703204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0036 begin`);
      const actual: number = starPointY(4, -1, 1);
      logInfo(`starPointY(index=4, aY=-1, len=1): actual=${actual}`);
      expect(actual).assertClose(0.5830121222703204, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0037
     * @tc.name      TsDrawingSample_StarPointY_0037
     * @tc.desc      starPointY(index=4, aY=5, len=17) returns 31.911206078595608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0037 begin`);
      const actual: number = starPointY(4, 5, 17);
      logInfo(`starPointY(index=4, aY=5, len=17): actual=${actual}`);
      expect(actual).assertClose(31.911206078595608, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0038
     * @tc.name      TsDrawingSample_StarPointY_0038
     * @tc.desc      starPointY(index=2, aY=36, len=9) returns 41.94285037419672
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0038 begin`);
      const actual: number = starPointY(2, 36, 9);
      logInfo(`starPointY(index=2, aY=36, len=9): actual=${actual}`);
      expect(actual).assertClose(41.94285037419672, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0039
     * @tc.name      TsDrawingSample_StarPointY_0039
     * @tc.desc      starPointY(index=4, aY=4, len=2) returns 7.16602424454064
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0039 begin`);
      const actual: number = starPointY(4, 4, 2);
      logInfo(`starPointY(index=4, aY=4, len=2): actual=${actual}`);
      expect(actual).assertClose(7.16602424454064, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0040
     * @tc.name      TsDrawingSample_StarPointY_0040
     * @tc.desc      starPointY(index=2, aY=4, len=3) returns 5.9809501247322405
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0040 begin`);
      const actual: number = starPointY(2, 4, 3);
      logInfo(`starPointY(index=2, aY=4, len=3): actual=${actual}`);
      expect(actual).assertClose(5.9809501247322405, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0041
     * @tc.name      TsDrawingSample_StarPointY_0041
     * @tc.desc      starPointY(index=1, aY=5, len=36) returns 61.98843640173184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0041 begin`);
      const actual: number = starPointY(1, 5, 36);
      logInfo(`starPointY(index=1, aY=5, len=36): actual=${actual}`);
      expect(actual).assertClose(61.98843640173184, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0042
     * @tc.name      TsDrawingSample_StarPointY_0042
     * @tc.desc      starPointY(index=4, aY=0, len=1) returns 1.5830121222703204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0042 begin`);
      const actual: number = starPointY(4, 0, 1);
      logInfo(`starPointY(index=4, aY=0, len=1): actual=${actual}`);
      expect(actual).assertClose(1.5830121222703204, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0043
     * @tc.name      TsDrawingSample_StarPointY_0043
     * @tc.desc      starPointY(index=2, aY=2, len=4) returns 4.641266832976321
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0043 begin`);
      const actual: number = starPointY(2, 2, 4);
      logInfo(`starPointY(index=2, aY=2, len=4): actual=${actual}`);
      expect(actual).assertClose(4.641266832976321, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0044
     * @tc.name      TsDrawingSample_StarPointY_0044
     * @tc.desc      starPointY(index=2, aY=4, len=18) returns 15.885700748393443
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0044 begin`);
      const actual: number = starPointY(2, 4, 18);
      logInfo(`starPointY(index=2, aY=4, len=18): actual=${actual}`);
      expect(actual).assertClose(15.885700748393443, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0045
     * @tc.name      TsDrawingSample_StarPointY_0045
     * @tc.desc      starPointY(index=3, aY=-1, len=1) returns -0.3396832917559198
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0045 begin`);
      const actual: number = starPointY(3, -1, 1);
      logInfo(`starPointY(index=3, aY=-1, len=1): actual=${actual}`);
      expect(actual).assertClose(-0.3396832917559198, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0046
     * @tc.name      TsDrawingSample_StarPointY_0046
     * @tc.desc      starPointY(index=4, aY=18, len=1) returns 19.583012122270322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0046 begin`);
      const actual: number = starPointY(4, 18, 1);
      logInfo(`starPointY(index=4, aY=18, len=1): actual=${actual}`);
      expect(actual).assertClose(19.583012122270322, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0047
     * @tc.name      TsDrawingSample_StarPointY_0047
     * @tc.desc      starPointY(index=2, aY=3, len=1) returns 3.66031670824408
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0047 begin`);
      const actual: number = starPointY(2, 3, 1);
      logInfo(`starPointY(index=2, aY=3, len=1): actual=${actual}`);
      expect(actual).assertClose(3.66031670824408, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0048
     * @tc.name      TsDrawingSample_StarPointY_0048
     * @tc.desc      starPointY(index=4, aY=-1, len=2) returns 2.166024244540641
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0048 begin`);
      const actual: number = starPointY(4, -1, 2);
      logInfo(`starPointY(index=4, aY=-1, len=2): actual=${actual}`);
      expect(actual).assertClose(2.166024244540641, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0049
     * @tc.name      TsDrawingSample_StarPointY_0049
     * @tc.desc      starPointY(index=2, aY=17, len=36) returns 40.771401496786886
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0049 begin`);
      const actual: number = starPointY(2, 17, 36);
      logInfo(`starPointY(index=2, aY=17, len=36): actual=${actual}`);
      expect(actual).assertClose(40.771401496786886, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0050
     * @tc.name      TsDrawingSample_StarPointY_0050
     * @tc.desc      starPointY(index=2, aY=1, len=17) returns 12.225384040149363
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0050 begin`);
      const actual: number = starPointY(2, 1, 17);
      logInfo(`starPointY(index=2, aY=1, len=17): actual=${actual}`);
      expect(actual).assertClose(12.225384040149363, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0051
     * @tc.name      TsDrawingSample_StarPointY_0051
     * @tc.desc      starPointY(index=3, aY=36, len=36) returns 59.771401496786886
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0051 begin`);
      const actual: number = starPointY(3, 36, 36);
      logInfo(`starPointY(index=3, aY=36, len=36): actual=${actual}`);
      expect(actual).assertClose(59.771401496786886, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0052
     * @tc.name      TsDrawingSample_StarPointY_0052
     * @tc.desc      starPointY(index=4, aY=36, len=3) returns 40.74903636681096
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0052 begin`);
      const actual: number = starPointY(4, 36, 3);
      logInfo(`starPointY(index=4, aY=36, len=3): actual=${actual}`);
      expect(actual).assertClose(40.74903636681096, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0053
     * @tc.name      TsDrawingSample_StarPointY_0053
     * @tc.desc      starPointY(index=1, aY=18, len=3) returns 22.749036366810962
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0053 begin`);
      const actual: number = starPointY(1, 18, 3);
      logInfo(`starPointY(index=1, aY=18, len=3): actual=${actual}`);
      expect(actual).assertClose(22.749036366810962, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0054
     * @tc.name      TsDrawingSample_StarPointY_0054
     * @tc.desc      starPointY(index=1, aY=18, len=19) returns 48.07723032313625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0054 begin`);
      const actual: number = starPointY(1, 18, 19);
      logInfo(`starPointY(index=1, aY=18, len=19): actual=${actual}`);
      expect(actual).assertClose(48.07723032313625, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0055
     * @tc.name      TsDrawingSample_StarPointY_0055
     * @tc.desc      starPointY(index=4, aY=36, len=18) returns 64.49421820086593
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0055 begin`);
      const actual: number = starPointY(4, 36, 18);
      logInfo(`starPointY(index=4, aY=36, len=18): actual=${actual}`);
      expect(actual).assertClose(64.49421820086593, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0056
     * @tc.name      TsDrawingSample_StarPointY_0056
     * @tc.desc      starPointY(index=1, aY=0, len=19) returns 30.07723032313625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0056 begin`);
      const actual: number = starPointY(1, 0, 19);
      logInfo(`starPointY(index=1, aY=0, len=19): actual=${actual}`);
      expect(actual).assertClose(30.07723032313625, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0057
     * @tc.name      TsDrawingSample_StarPointY_0057
     * @tc.desc      starPointY(index=3, aY=0, len=19) returns 12.546017456637523
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0057 begin`);
      const actual: number = starPointY(3, 0, 19);
      logInfo(`starPointY(index=3, aY=0, len=19): actual=${actual}`);
      expect(actual).assertClose(12.546017456637523, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0058
     * @tc.name      TsDrawingSample_StarPointY_0058
     * @tc.desc      starPointY(index=1, aY=36, len=2) returns 39.166024244540644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0058 begin`);
      const actual: number = starPointY(1, 36, 2);
      logInfo(`starPointY(index=1, aY=36, len=2): actual=${actual}`);
      expect(actual).assertClose(39.166024244540644, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0059
     * @tc.name      TsDrawingSample_StarPointY_0059
     * @tc.desc      starPointY(index=3, aY=19, len=5) returns 22.301583541220403
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0059 begin`);
      const actual: number = starPointY(3, 19, 5);
      logInfo(`starPointY(index=3, aY=19, len=5): actual=${actual}`);
      expect(actual).assertClose(22.301583541220403, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0060
     * @tc.name      TsDrawingSample_StarPointY_0060
     * @tc.desc      starPointY(index=1, aY=2, len=4) returns 8.332048489081336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0060 begin`);
      const actual: number = starPointY(1, 2, 4);
      logInfo(`starPointY(index=1, aY=2, len=4): actual=${actual}`);
      expect(actual).assertClose(8.332048489081336, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0061
     * @tc.name      TsDrawingSample_StarPointY_0061
     * @tc.desc      starPointY(index=4, aY=19, len=17) returns 45.91120607859561
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0061 begin`);
      const actual: number = starPointY(4, 19, 17);
      logInfo(`starPointY(index=4, aY=19, len=17): actual=${actual}`);
      expect(actual).assertClose(45.91120607859561, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0062
     * @tc.name      TsDrawingSample_StarPointY_0062
     * @tc.desc      starPointY(index=3, aY=9, len=-1) returns 8.33968329175592
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0062 begin`);
      const actual: number = starPointY(3, 9, -1);
      logInfo(`starPointY(index=3, aY=9, len=-1): actual=${actual}`);
      expect(actual).assertClose(8.33968329175592, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0063
     * @tc.name      TsDrawingSample_StarPointY_0063
     * @tc.desc      starPointY(index=4, aY=19, len=5) returns 26.915060611351656
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0063 begin`);
      const actual: number = starPointY(4, 19, 5);
      logInfo(`starPointY(index=4, aY=19, len=5): actual=${actual}`);
      expect(actual).assertClose(26.915060611351656, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0064
     * @tc.name      TsDrawingSample_StarPointY_0064
     * @tc.desc      starPointY(index=1, aY=-1, len=3) returns 3.7490363668109614
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0064 begin`);
      const actual: number = starPointY(1, -1, 3);
      logInfo(`starPointY(index=1, aY=-1, len=3): actual=${actual}`);
      expect(actual).assertClose(3.7490363668109614, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0065
     * @tc.name      TsDrawingSample_StarPointY_0065
     * @tc.desc      starPointY(index=4, aY=2, len=17) returns 28.911206078595608
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0065 begin`);
      const actual: number = starPointY(4, 2, 17);
      logInfo(`starPointY(index=4, aY=2, len=17): actual=${actual}`);
      expect(actual).assertClose(28.911206078595608, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0066
     * @tc.name      TsDrawingSample_StarPointY_0066
     * @tc.desc      starPointY(index=4, aY=9, len=4) returns 15.332048489081336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0066 begin`);
      const actual: number = starPointY(4, 9, 4);
      logInfo(`starPointY(index=4, aY=9, len=4): actual=${actual}`);
      expect(actual).assertClose(15.332048489081336, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0067
     * @tc.name      TsDrawingSample_StarPointY_0067
     * @tc.desc      starPointY(index=1, aY=0, len=4) returns 6.332048489081336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0067 begin`);
      const actual: number = starPointY(1, 0, 4);
      logInfo(`starPointY(index=1, aY=0, len=4): actual=${actual}`);
      expect(actual).assertClose(6.332048489081336, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0068
     * @tc.name      TsDrawingSample_StarPointY_0068
     * @tc.desc      starPointY(index=1, aY=5, len=-1) returns 6.58301212227032
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0068 begin`);
      const actual: number = starPointY(1, 5, -1);
      logInfo(`starPointY(index=1, aY=5, len=-1): actual=${actual}`);
      expect(actual).assertClose(6.58301212227032, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0069
     * @tc.name      TsDrawingSample_StarPointY_0069
     * @tc.desc      starPointY(index=2, aY=36, len=2) returns 37.320633416488164
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0069 begin`);
      const actual: number = starPointY(2, 36, 2);
      logInfo(`starPointY(index=2, aY=36, len=2): actual=${actual}`);
      expect(actual).assertClose(37.320633416488164, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0070
     * @tc.name      TsDrawingSample_StarPointY_0070
     * @tc.desc      starPointY(index=3, aY=18, len=5) returns 21.301583541220403
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0070 begin`);
      const actual: number = starPointY(3, 18, 5);
      logInfo(`starPointY(index=3, aY=18, len=5): actual=${actual}`);
      expect(actual).assertClose(21.301583541220403, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0071
     * @tc.name      TsDrawingSample_StarPointY_0071
     * @tc.desc      starPointY(index=3, aY=19, len=1) returns 19.660316708244082
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0071 begin`);
      const actual: number = starPointY(3, 19, 1);
      logInfo(`starPointY(index=3, aY=19, len=1): actual=${actual}`);
      expect(actual).assertClose(19.660316708244082, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0072
     * @tc.name      TsDrawingSample_StarPointY_0072
     * @tc.desc      starPointY(index=4, aY=17, len=-1) returns 18.583012122270322
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0072 begin`);
      const actual: number = starPointY(4, 17, -1);
      logInfo(`starPointY(index=4, aY=17, len=-1): actual=${actual}`);
      expect(actual).assertClose(18.583012122270322, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0073
     * @tc.name      TsDrawingSample_StarPointY_0073
     * @tc.desc      starPointY(index=3, aY=1, len=4) returns 3.6412668329763207
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0073 begin`);
      const actual: number = starPointY(3, 1, 4);
      logInfo(`starPointY(index=3, aY=1, len=4): actual=${actual}`);
      expect(actual).assertClose(3.6412668329763207, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0074
     * @tc.name      TsDrawingSample_StarPointY_0074
     * @tc.desc      starPointY(index=4, aY=19, len=2) returns 22.16602424454064
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0074 begin`);
      const actual: number = starPointY(4, 19, 2);
      logInfo(`starPointY(index=4, aY=19, len=2): actual=${actual}`);
      expect(actual).assertClose(22.16602424454064, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0074 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_Y_0075
     * @tc.name      TsDrawingSample_StarPointY_0075
     * @tc.desc      starPointY(index=2, aY=17, len=2) returns 18.32063341648816
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointY_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointY_0075 begin`);
      const actual: number = starPointY(2, 17, 2);
      logInfo(`starPointY(index=2, aY=17, len=2): actual=${actual}`);
      expect(actual).assertClose(18.32063341648816, PRECISION);
      logInfo(`${BUNDLE}StarPointY_0075 end`);
    });
  });
}
