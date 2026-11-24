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
import { starPointX } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for starPointX (75 cases). */
export default function starPointXTest(): void {
  describe('StarPointXTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0001
     * @tc.name      TsDrawingSample_StarPointX_0001
     * @tc.desc      starPointX(index=0, aX=18, len=0) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_StarPointX_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StarPointX_0001 begin`);
      const actual: number = starPointX(0, 18, 0);
      logInfo(`starPointX(index=0, aX=18, len=0): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}StarPointX_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0002
     * @tc.name      TsDrawingSample_StarPointX_0002
     * @tc.desc      starPointX(index=18, aX=18, len=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_StarPointX_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StarPointX_0002 begin`);
      const actual: number = starPointX(18, 18, 0);
      logInfo(`starPointX(index=18, aX=18, len=0): actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}StarPointX_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0003
     * @tc.name      TsDrawingSample_StarPointX_0003
     * @tc.desc      starPointX(index=0, aX=17, len=0) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0003 begin`);
      const actual: number = starPointX(0, 17, 0);
      logInfo(`starPointX(index=0, aX=17, len=0): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}StarPointX_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0004
     * @tc.name      TsDrawingSample_StarPointX_0004
     * @tc.desc      starPointX(index=0, aX=19, len=0) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0004 begin`);
      const actual: number = starPointX(0, 19, 0);
      logInfo(`starPointX(index=0, aX=19, len=0): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}StarPointX_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0005
     * @tc.name      TsDrawingSample_StarPointX_0005
     * @tc.desc      starPointX(index=0, aX=36, len=0) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_StarPointX_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StarPointX_0005 begin`);
      const actual: number = starPointX(0, 36, 0);
      logInfo(`starPointX(index=0, aX=36, len=0): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}StarPointX_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0006
     * @tc.name      TsDrawingSample_StarPointX_0006
     * @tc.desc      starPointX(index=0, aX=9, len=0) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_StarPointX_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StarPointX_0006 begin`);
      const actual: number = starPointX(0, 9, 0);
      logInfo(`starPointX(index=0, aX=9, len=0): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}StarPointX_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0007
     * @tc.name      TsDrawingSample_StarPointX_0007
     * @tc.desc      starPointX(index=0, aX=0, len=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0007 begin`);
      const actual: number = starPointX(0, 0, 0);
      logInfo(`starPointX(index=0, aX=0, len=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StarPointX_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0008
     * @tc.name      TsDrawingSample_StarPointX_0008
     * @tc.desc      starPointX(index=0, aX=-1, len=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0008 begin`);
      const actual: number = starPointX(0, -1, 0);
      logInfo(`starPointX(index=0, aX=-1, len=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StarPointX_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0009
     * @tc.name      TsDrawingSample_StarPointX_0009
     * @tc.desc      starPointX(index=0, aX=1, len=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0009 begin`);
      const actual: number = starPointX(0, 1, 0);
      logInfo(`starPointX(index=0, aX=1, len=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}StarPointX_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0010
     * @tc.name      TsDrawingSample_StarPointX_0010
     * @tc.desc      starPointX(index=0, aX=2, len=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0010 begin`);
      const actual: number = starPointX(0, 2, 0);
      logInfo(`starPointX(index=0, aX=2, len=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}StarPointX_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0011
     * @tc.name      TsDrawingSample_StarPointX_0011
     * @tc.desc      starPointX(index=0, aX=3, len=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0011 begin`);
      const actual: number = starPointX(0, 3, 0);
      logInfo(`starPointX(index=0, aX=3, len=0): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StarPointX_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0012
     * @tc.name      TsDrawingSample_StarPointX_0012
     * @tc.desc      starPointX(index=0, aX=4, len=0) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0012 begin`);
      const actual: number = starPointX(0, 4, 0);
      logInfo(`starPointX(index=0, aX=4, len=0): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}StarPointX_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0013
     * @tc.name      TsDrawingSample_StarPointX_0013
     * @tc.desc      starPointX(index=0, aX=5, len=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0013 begin`);
      const actual: number = starPointX(0, 5, 0);
      logInfo(`starPointX(index=0, aX=5, len=0): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}StarPointX_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0014
     * @tc.name      TsDrawingSample_StarPointX_0014
     * @tc.desc      starPointX(index=1, aX=18, len=18) returns 27
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0014 begin`);
      const actual: number = starPointX(1, 18, 18);
      logInfo(`starPointX(index=1, aX=18, len=18): actual=${actual}`);
      expect(actual).assertEqual(27);
      logInfo(`${BUNDLE}StarPointX_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0015
     * @tc.name      TsDrawingSample_StarPointX_0015
     * @tc.desc      starPointX(index=3, aX=4, len=1) returns 4.750987246771676
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0015 begin`);
      const actual: number = starPointX(3, 4, 1);
      logInfo(`starPointX(index=3, aX=4, len=1): actual=${actual}`);
      expect(actual).assertClose(4.750987246771676, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0016
     * @tc.name      TsDrawingSample_StarPointX_0016
     * @tc.desc      starPointX(index=3, aX=36, len=18) returns 49.51777044189017
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0016 begin`);
      const actual: number = starPointX(3, 36, 18);
      logInfo(`starPointX(index=3, aX=36, len=18): actual=${actual}`);
      expect(actual).assertClose(49.51777044189017, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0017
     * @tc.name      TsDrawingSample_StarPointX_0017
     * @tc.desc      starPointX(index=2, aX=17, len=9) returns 10.241114779054914
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0017 begin`);
      const actual: number = starPointX(2, 17, 9);
      logInfo(`starPointX(index=2, aX=17, len=9): actual=${actual}`);
      expect(actual).assertClose(10.241114779054914, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0018
     * @tc.name      TsDrawingSample_StarPointX_0018
     * @tc.desc      starPointX(index=4, aX=1, len=1) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0018 begin`);
      const actual: number = starPointX(4, 1, 1);
      logInfo(`starPointX(index=4, aX=1, len=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0019
     * @tc.name      TsDrawingSample_StarPointX_0019
     * @tc.desc      starPointX(index=4, aX=19, len=18) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0019 begin`);
      const actual: number = starPointX(4, 19, 18);
      logInfo(`starPointX(index=4, aX=19, len=18): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}StarPointX_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0020
     * @tc.name      TsDrawingSample_StarPointX_0020
     * @tc.desc      starPointX(index=3, aX=1, len=3) returns 3.2529617403150284
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0020 begin`);
      const actual: number = starPointX(3, 1, 3);
      logInfo(`starPointX(index=3, aX=1, len=3): actual=${actual}`);
      expect(actual).assertClose(3.2529617403150284, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0021
     * @tc.name      TsDrawingSample_StarPointX_0021
     * @tc.desc      starPointX(index=1, aX=3, len=-1) returns 2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0021 begin`);
      const actual: number = starPointX(1, 3, -1);
      logInfo(`starPointX(index=1, aX=3, len=-1): actual=${actual}`);
      expect(actual).assertClose(2.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0022
     * @tc.name      TsDrawingSample_StarPointX_0022
     * @tc.desc      starPointX(index=2, aX=5, len=17) returns -7.766783195118494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0022 begin`);
      const actual: number = starPointX(2, 5, 17);
      logInfo(`starPointX(index=2, aX=5, len=17): actual=${actual}`);
      expect(actual).assertClose(-7.766783195118494, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0023
     * @tc.name      TsDrawingSample_StarPointX_0023
     * @tc.desc      starPointX(index=1, aX=4, len=19) returns 13.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0023 begin`);
      const actual: number = starPointX(1, 4, 19);
      logInfo(`starPointX(index=1, aX=4, len=19): actual=${actual}`);
      expect(actual).assertClose(13.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0024
     * @tc.name      TsDrawingSample_StarPointX_0024
     * @tc.desc      starPointX(index=4, aX=19, len=5) returns 16.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0024 begin`);
      const actual: number = starPointX(4, 19, 5);
      logInfo(`starPointX(index=4, aX=19, len=5): actual=${actual}`);
      expect(actual).assertClose(16.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0025
     * @tc.name      TsDrawingSample_StarPointX_0025
     * @tc.desc      starPointX(index=3, aX=19, len=2) returns 20.50197449354335
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0025 begin`);
      const actual: number = starPointX(3, 19, 2);
      logInfo(`starPointX(index=3, aX=19, len=2): actual=${actual}`);
      expect(actual).assertClose(20.50197449354335, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0026
     * @tc.name      TsDrawingSample_StarPointX_0026
     * @tc.desc      starPointX(index=4, aX=2, len=1) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0026 begin`);
      const actual: number = starPointX(4, 2, 1);
      logInfo(`starPointX(index=4, aX=2, len=1): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0027
     * @tc.name      TsDrawingSample_StarPointX_0027
     * @tc.desc      starPointX(index=1, aX=5, len=36) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0027 begin`);
      const actual: number = starPointX(1, 5, 36);
      logInfo(`starPointX(index=1, aX=5, len=36): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}StarPointX_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0028
     * @tc.name      TsDrawingSample_StarPointX_0028
     * @tc.desc      starPointX(index=3, aX=19, len=36) returns 46.03554088378034
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0028 begin`);
      const actual: number = starPointX(3, 19, 36);
      logInfo(`starPointX(index=3, aX=19, len=36): actual=${actual}`);
      expect(actual).assertClose(46.03554088378034, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0029
     * @tc.name      TsDrawingSample_StarPointX_0029
     * @tc.desc      starPointX(index=3, aX=-1, len=17) returns 11.766783195118494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0029 begin`);
      const actual: number = starPointX(3, -1, 17);
      logInfo(`starPointX(index=3, aX=-1, len=17): actual=${actual}`);
      expect(actual).assertClose(11.766783195118494, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0030
     * @tc.name      TsDrawingSample_StarPointX_0030
     * @tc.desc      starPointX(index=4, aX=1, len=18) returns -8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0030 begin`);
      const actual: number = starPointX(4, 1, 18);
      logInfo(`starPointX(index=4, aX=1, len=18): actual=${actual}`);
      expect(actual).assertEqual(-8);
      logInfo(`${BUNDLE}StarPointX_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0031
     * @tc.name      TsDrawingSample_StarPointX_0031
     * @tc.desc      starPointX(index=3, aX=5, len=1) returns 5.750987246771676
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0031 begin`);
      const actual: number = starPointX(3, 5, 1);
      logInfo(`starPointX(index=3, aX=5, len=1): actual=${actual}`);
      expect(actual).assertClose(5.750987246771676, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0032
     * @tc.name      TsDrawingSample_StarPointX_0032
     * @tc.desc      starPointX(index=2, aX=-1, len=17) returns -13.766783195118494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0032 begin`);
      const actual: number = starPointX(2, -1, 17);
      logInfo(`starPointX(index=2, aX=-1, len=17): actual=${actual}`);
      expect(actual).assertClose(-13.766783195118494, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0033
     * @tc.name      TsDrawingSample_StarPointX_0033
     * @tc.desc      starPointX(index=2, aX=3, len=1) returns 2.2490127532283237
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0033 begin`);
      const actual: number = starPointX(2, 3, 1);
      logInfo(`starPointX(index=2, aX=3, len=1): actual=${actual}`);
      expect(actual).assertClose(2.2490127532283237, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0034
     * @tc.name      TsDrawingSample_StarPointX_0034
     * @tc.desc      starPointX(index=2, aX=0, len=5) returns -3.754936233858381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0034 begin`);
      const actual: number = starPointX(2, 0, 5);
      logInfo(`starPointX(index=2, aX=0, len=5): actual=${actual}`);
      expect(actual).assertClose(-3.754936233858381, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0035
     * @tc.name      TsDrawingSample_StarPointX_0035
     * @tc.desc      starPointX(index=2, aX=5, len=18) returns -8.517770441890171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0035 begin`);
      const actual: number = starPointX(2, 5, 18);
      logInfo(`starPointX(index=2, aX=5, len=18): actual=${actual}`);
      expect(actual).assertClose(-8.517770441890171, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0036
     * @tc.name      TsDrawingSample_StarPointX_0036
     * @tc.desc      starPointX(index=2, aX=18, len=17) returns 5.233216804881506
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0036 begin`);
      const actual: number = starPointX(2, 18, 17);
      logInfo(`starPointX(index=2, aX=18, len=17): actual=${actual}`);
      expect(actual).assertClose(5.233216804881506, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0037
     * @tc.name      TsDrawingSample_StarPointX_0037
     * @tc.desc      starPointX(index=3, aX=-1, len=4) returns 2.0039489870867047
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0037 begin`);
      const actual: number = starPointX(3, -1, 4);
      logInfo(`starPointX(index=3, aX=-1, len=4): actual=${actual}`);
      expect(actual).assertClose(2.0039489870867047, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0038
     * @tc.name      TsDrawingSample_StarPointX_0038
     * @tc.desc      starPointX(index=3, aX=2, len=18) returns 15.517770441890171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0038 begin`);
      const actual: number = starPointX(3, 2, 18);
      logInfo(`starPointX(index=3, aX=2, len=18): actual=${actual}`);
      expect(actual).assertClose(15.517770441890171, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0039
     * @tc.name      TsDrawingSample_StarPointX_0039
     * @tc.desc      starPointX(index=3, aX=19, len=19) returns 33.26875768866185
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0039 begin`);
      const actual: number = starPointX(3, 19, 19);
      logInfo(`starPointX(index=3, aX=19, len=19): actual=${actual}`);
      expect(actual).assertClose(33.26875768866185, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0040
     * @tc.name      TsDrawingSample_StarPointX_0040
     * @tc.desc      starPointX(index=2, aX=36, len=3) returns 33.74703825968497
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0040 begin`);
      const actual: number = starPointX(2, 36, 3);
      logInfo(`starPointX(index=2, aX=36, len=3): actual=${actual}`);
      expect(actual).assertClose(33.74703825968497, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0041
     * @tc.name      TsDrawingSample_StarPointX_0041
     * @tc.desc      starPointX(index=4, aX=36, len=3) returns 34.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0041 begin`);
      const actual: number = starPointX(4, 36, 3);
      logInfo(`starPointX(index=4, aX=36, len=3): actual=${actual}`);
      expect(actual).assertClose(34.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0042
     * @tc.name      TsDrawingSample_StarPointX_0042
     * @tc.desc      starPointX(index=2, aX=18, len=9) returns 11.241114779054914
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0042 begin`);
      const actual: number = starPointX(2, 18, 9);
      logInfo(`starPointX(index=2, aX=18, len=9): actual=${actual}`);
      expect(actual).assertClose(11.241114779054914, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0043
     * @tc.name      TsDrawingSample_StarPointX_0043
     * @tc.desc      starPointX(index=1, aX=36, len=1) returns 36.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_StarPointX_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StarPointX_0043 begin`);
      const actual: number = starPointX(1, 36, 1);
      logInfo(`starPointX(index=1, aX=36, len=1): actual=${actual}`);
      expect(actual).assertClose(36.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0044
     * @tc.name      TsDrawingSample_StarPointX_0044
     * @tc.desc      starPointX(index=2, aX=3, len=9) returns -3.7588852209450856
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0044 begin`);
      const actual: number = starPointX(2, 3, 9);
      logInfo(`starPointX(index=2, aX=3, len=9): actual=${actual}`);
      expect(actual).assertClose(-3.7588852209450856, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0045
     * @tc.name      TsDrawingSample_StarPointX_0045
     * @tc.desc      starPointX(index=1, aX=0, len=17) returns 8.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0045 begin`);
      const actual: number = starPointX(1, 0, 17);
      logInfo(`starPointX(index=1, aX=0, len=17): actual=${actual}`);
      expect(actual).assertClose(8.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0046
     * @tc.name      TsDrawingSample_StarPointX_0046
     * @tc.desc      starPointX(index=2, aX=-1, len=9) returns -7.758885220945086
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0046 begin`);
      const actual: number = starPointX(2, -1, 9);
      logInfo(`starPointX(index=2, aX=-1, len=9): actual=${actual}`);
      expect(actual).assertClose(-7.758885220945086, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0047
     * @tc.name      TsDrawingSample_StarPointX_0047
     * @tc.desc      starPointX(index=2, aX=5, len=4) returns 1.9960510129132953
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0047 begin`);
      const actual: number = starPointX(2, 5, 4);
      logInfo(`starPointX(index=2, aX=5, len=4): actual=${actual}`);
      expect(actual).assertClose(1.9960510129132953, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0048
     * @tc.name      TsDrawingSample_StarPointX_0048
     * @tc.desc      starPointX(index=3, aX=2, len=5) returns 5.7549362338583805
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0048 begin`);
      const actual: number = starPointX(3, 2, 5);
      logInfo(`starPointX(index=3, aX=2, len=5): actual=${actual}`);
      expect(actual).assertClose(5.7549362338583805, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0049
     * @tc.name      TsDrawingSample_StarPointX_0049
     * @tc.desc      starPointX(index=2, aX=19, len=17) returns 6.233216804881506
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0049 begin`);
      const actual: number = starPointX(2, 19, 17);
      logInfo(`starPointX(index=2, aX=19, len=17): actual=${actual}`);
      expect(actual).assertClose(6.233216804881506, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0050
     * @tc.name      TsDrawingSample_StarPointX_0050
     * @tc.desc      starPointX(index=2, aX=1, len=4) returns -2.0039489870867047
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0050 begin`);
      const actual: number = starPointX(2, 1, 4);
      logInfo(`starPointX(index=2, aX=1, len=4): actual=${actual}`);
      expect(actual).assertClose(-2.0039489870867047, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0051
     * @tc.name      TsDrawingSample_StarPointX_0051
     * @tc.desc      starPointX(index=2, aX=3, len=17) returns -9.766783195118494
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0051 begin`);
      const actual: number = starPointX(2, 3, 17);
      logInfo(`starPointX(index=2, aX=3, len=17): actual=${actual}`);
      expect(actual).assertClose(-9.766783195118494, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0052
     * @tc.name      TsDrawingSample_StarPointX_0052
     * @tc.desc      starPointX(index=3, aX=2, len=3) returns 4.252961740315028
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0052 begin`);
      const actual: number = starPointX(3, 2, 3);
      logInfo(`starPointX(index=3, aX=2, len=3): actual=${actual}`);
      expect(actual).assertClose(4.252961740315028, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0053
     * @tc.name      TsDrawingSample_StarPointX_0053
     * @tc.desc      starPointX(index=3, aX=17, len=17) returns 29.766783195118492
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0053 begin`);
      const actual: number = starPointX(3, 17, 17);
      logInfo(`starPointX(index=3, aX=17, len=17): actual=${actual}`);
      expect(actual).assertClose(29.766783195118492, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0054
     * @tc.name      TsDrawingSample_StarPointX_0054
     * @tc.desc      starPointX(index=4, aX=19, len=1) returns 18.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0054 begin`);
      const actual: number = starPointX(4, 19, 1);
      logInfo(`starPointX(index=4, aX=19, len=1): actual=${actual}`);
      expect(actual).assertClose(18.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0055
     * @tc.name      TsDrawingSample_StarPointX_0055
     * @tc.desc      starPointX(index=3, aX=3, len=1) returns 3.7509872467716763
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0055 begin`);
      const actual: number = starPointX(3, 3, 1);
      logInfo(`starPointX(index=3, aX=3, len=1): actual=${actual}`);
      expect(actual).assertClose(3.7509872467716763, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0056
     * @tc.name      TsDrawingSample_StarPointX_0056
     * @tc.desc      starPointX(index=4, aX=3, len=18) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0056 begin`);
      const actual: number = starPointX(4, 3, 18);
      logInfo(`starPointX(index=4, aX=3, len=18): actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}StarPointX_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0057
     * @tc.name      TsDrawingSample_StarPointX_0057
     * @tc.desc      starPointX(index=2, aX=9, len=2) returns 7.4980255064566474
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0057 begin`);
      const actual: number = starPointX(2, 9, 2);
      logInfo(`starPointX(index=2, aX=9, len=2): actual=${actual}`);
      expect(actual).assertClose(7.4980255064566474, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0058
     * @tc.name      TsDrawingSample_StarPointX_0058
     * @tc.desc      starPointX(index=4, aX=4, len=36) returns -14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0058 begin`);
      const actual: number = starPointX(4, 4, 36);
      logInfo(`starPointX(index=4, aX=4, len=36): actual=${actual}`);
      expect(actual).assertEqual(-14);
      logInfo(`${BUNDLE}StarPointX_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0059
     * @tc.name      TsDrawingSample_StarPointX_0059
     * @tc.desc      starPointX(index=1, aX=9, len=4) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0059 begin`);
      const actual: number = starPointX(1, 9, 4);
      logInfo(`starPointX(index=1, aX=9, len=4): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}StarPointX_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0060
     * @tc.name      TsDrawingSample_StarPointX_0060
     * @tc.desc      starPointX(index=3, aX=5, len=19) returns 19.268757688661847
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0060 begin`);
      const actual: number = starPointX(3, 5, 19);
      logInfo(`starPointX(index=3, aX=5, len=19): actual=${actual}`);
      expect(actual).assertClose(19.268757688661847, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0061
     * @tc.name      TsDrawingSample_StarPointX_0061
     * @tc.desc      starPointX(index=2, aX=-1, len=19) returns -15.268757688661847
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0061 begin`);
      const actual: number = starPointX(2, -1, 19);
      logInfo(`starPointX(index=2, aX=-1, len=19): actual=${actual}`);
      expect(actual).assertClose(-15.268757688661847, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0062
     * @tc.name      TsDrawingSample_StarPointX_0062
     * @tc.desc      starPointX(index=1, aX=18, len=4) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0062 begin`);
      const actual: number = starPointX(1, 18, 4);
      logInfo(`starPointX(index=1, aX=18, len=4): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}StarPointX_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0063
     * @tc.name      TsDrawingSample_StarPointX_0063
     * @tc.desc      starPointX(index=2, aX=0, len=-1) returns 0.7509872467716762
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0063 begin`);
      const actual: number = starPointX(2, 0, -1);
      logInfo(`starPointX(index=2, aX=0, len=-1): actual=${actual}`);
      expect(actual).assertClose(0.7509872467716762, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0064
     * @tc.name      TsDrawingSample_StarPointX_0064
     * @tc.desc      starPointX(index=3, aX=5, len=4) returns 8.003948987086705
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0064 begin`);
      const actual: number = starPointX(3, 5, 4);
      logInfo(`starPointX(index=3, aX=5, len=4): actual=${actual}`);
      expect(actual).assertClose(8.003948987086705, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0065
     * @tc.name      TsDrawingSample_StarPointX_0065
     * @tc.desc      starPointX(index=4, aX=1, len=19) returns -8.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0065 begin`);
      const actual: number = starPointX(4, 1, 19);
      logInfo(`starPointX(index=4, aX=1, len=19): actual=${actual}`);
      expect(actual).assertClose(-8.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0066
     * @tc.name      TsDrawingSample_StarPointX_0066
     * @tc.desc      starPointX(index=2, aX=-1, len=18) returns -14.517770441890171
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0066 begin`);
      const actual: number = starPointX(2, -1, 18);
      logInfo(`starPointX(index=2, aX=-1, len=18): actual=${actual}`);
      expect(actual).assertClose(-14.517770441890171, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0067
     * @tc.name      TsDrawingSample_StarPointX_0067
     * @tc.desc      starPointX(index=1, aX=17, len=1) returns 17.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0067 begin`);
      const actual: number = starPointX(1, 17, 1);
      logInfo(`starPointX(index=1, aX=17, len=1): actual=${actual}`);
      expect(actual).assertClose(17.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0068
     * @tc.name      TsDrawingSample_StarPointX_0068
     * @tc.desc      starPointX(index=1, aX=4, len=3) returns 5.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0068 begin`);
      const actual: number = starPointX(1, 4, 3);
      logInfo(`starPointX(index=1, aX=4, len=3): actual=${actual}`);
      expect(actual).assertClose(5.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0069
     * @tc.name      TsDrawingSample_StarPointX_0069
     * @tc.desc      starPointX(index=2, aX=2, len=-1) returns 2.7509872467716763
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0069 begin`);
      const actual: number = starPointX(2, 2, -1);
      logInfo(`starPointX(index=2, aX=2, len=-1): actual=${actual}`);
      expect(actual).assertClose(2.7509872467716763, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0070
     * @tc.name      TsDrawingSample_StarPointX_0070
     * @tc.desc      starPointX(index=4, aX=-1, len=3) returns -2.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0070 begin`);
      const actual: number = starPointX(4, -1, 3);
      logInfo(`starPointX(index=4, aX=-1, len=3): actual=${actual}`);
      expect(actual).assertClose(-2.5, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0070 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0071
     * @tc.name      TsDrawingSample_StarPointX_0071
     * @tc.desc      starPointX(index=1, aX=3, len=36) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0071 begin`);
      const actual: number = starPointX(1, 3, 36);
      logInfo(`starPointX(index=1, aX=3, len=36): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}StarPointX_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0072
     * @tc.name      TsDrawingSample_StarPointX_0072
     * @tc.desc      starPointX(index=1, aX=3, len=18) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0072 begin`);
      const actual: number = starPointX(1, 3, 18);
      logInfo(`starPointX(index=1, aX=3, len=18): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StarPointX_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0073
     * @tc.name      TsDrawingSample_StarPointX_0073
     * @tc.desc      starPointX(index=2, aX=5, len=1) returns 4.249012753228324
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0073 begin`);
      const actual: number = starPointX(2, 5, 1);
      logInfo(`starPointX(index=2, aX=5, len=1): actual=${actual}`);
      expect(actual).assertClose(4.249012753228324, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0074
     * @tc.name      TsDrawingSample_StarPointX_0074
     * @tc.desc      starPointX(index=4, aX=9, len=36) returns -9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0074 begin`);
      const actual: number = starPointX(4, 9, 36);
      logInfo(`starPointX(index=4, aX=9, len=36): actual=${actual}`);
      expect(actual).assertEqual(-9);
      logInfo(`${BUNDLE}StarPointX_0074 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_STAR_POINT_X_0075
     * @tc.name      TsDrawingSample_StarPointX_0075
     * @tc.desc      starPointX(index=3, aX=0, len=5) returns 3.754936233858381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('TsDrawingSample_StarPointX_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StarPointX_0075 begin`);
      const actual: number = starPointX(3, 0, 5);
      logInfo(`starPointX(index=3, aX=0, len=5): actual=${actual}`);
      expect(actual).assertClose(3.754936233858381, PRECISION);
      logInfo(`${BUNDLE}StarPointX_0075 end`);
    });
  });
}
