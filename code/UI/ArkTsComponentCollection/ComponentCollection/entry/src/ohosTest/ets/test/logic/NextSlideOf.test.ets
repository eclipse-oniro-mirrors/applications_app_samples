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
import { nextSlideOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextSlideOf (50 cases). */
export default function nextSlideOfTest(): void {
  describe('NextSlideOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0001
     * @tc.name      ComponentCollection_NextSlideOf_0001
     * @tc.desc      nextSlideOf(sx=0, offsetY=-100, lastOffsetY=-100, windowHeight=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_NextSlideOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextSlideOf_0001 begin`);
      const actual: number = nextSlideOf(0, -100, -100, 0);
      logInfo(`nextSlideOf(sx=0, offsetY=-100, lastOffse...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}NextSlideOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0002
     * @tc.name      ComponentCollection_NextSlideOf_0002
     * @tc.desc      nextSlideOf(sx=0, offsetY=-1, lastOffsetY=-100, windowHeight=0) returns Number.POSITIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_NextSlideOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextSlideOf_0002 begin`);
      const actual: number = nextSlideOf(0, -1, -100, 0);
      logInfo(`nextSlideOf(sx=0, offsetY=-1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}NextSlideOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0003
     * @tc.name      ComponentCollection_NextSlideOf_0003
     * @tc.desc      nextSlideOf(sx=0, offsetY=-100, lastOffsetY=-1, windowHeight=0) returns Number.NEGATIVE_INFINITY
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0003 begin`);
      const actual: number = nextSlideOf(0, -100, -1, 0);
      logInfo(`nextSlideOf(sx=0, offsetY=-100, lastOffse...: actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}NextSlideOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0004
     * @tc.name      ComponentCollection_NextSlideOf_0004
     * @tc.desc      nextSlideOf(sx=0, offsetY=-100, lastOffsetY=-100, windowHeight=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0004 begin`);
      const actual: number = nextSlideOf(0, -100, -100, 1);
      logInfo(`nextSlideOf(sx=0, offsetY=-100, lastOffse...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextSlideOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0005
     * @tc.name      ComponentCollection_NextSlideOf_0005
     * @tc.desc      nextSlideOf(sx=3, offsetY=-1, lastOffsetY=50, windowHeight=360) returns 2.8583333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0005 begin`);
      const actual: number = nextSlideOf(3, -1, 50, 360);
      logInfo(`nextSlideOf(sx=3, offsetY=-1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(2.8583333333333334, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0006
     * @tc.name      ComponentCollection_NextSlideOf_0006
     * @tc.desc      nextSlideOf(sx=1, offsetY=-1, lastOffsetY=100, windowHeight=100) returns -0.010000000000000009
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0006 begin`);
      const actual: number = nextSlideOf(1, -1, 100, 100);
      logInfo(`nextSlideOf(sx=1, offsetY=-1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(-0.010000000000000009, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0007
     * @tc.name      ComponentCollection_NextSlideOf_0007
     * @tc.desc      nextSlideOf(sx=100, offsetY=-1, lastOffsetY=100, windowHeight=1920) returns 99.94739583333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0007 begin`);
      const actual: number = nextSlideOf(100, -1, 100, 1920);
      logInfo(`nextSlideOf(sx=100, offsetY=-1, lastOffse...: actual=${actual}`);
      expect(actual).assertClose(99.94739583333333, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0008
     * @tc.name      ComponentCollection_NextSlideOf_0008
     * @tc.desc      nextSlideOf(sx=10, offsetY=-1, lastOffsetY=-1, windowHeight=-1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0008 begin`);
      const actual: number = nextSlideOf(10, -1, -1, -1);
      logInfo(`nextSlideOf(sx=10, offsetY=-1, lastOffset...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextSlideOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0009
     * @tc.name      ComponentCollection_NextSlideOf_0009
     * @tc.desc      nextSlideOf(sx=3, offsetY=50, lastOffsetY=50, windowHeight=-1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0009 begin`);
      const actual: number = nextSlideOf(3, 50, 50, -1);
      logInfo(`nextSlideOf(sx=3, offsetY=50, lastOffsetY...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextSlideOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0010
     * @tc.name      ComponentCollection_NextSlideOf_0010
     * @tc.desc      nextSlideOf(sx=5, offsetY=100, lastOffsetY=3, windowHeight=1920) returns 5.050520833333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_NextSlideOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextSlideOf_0010 begin`);
      const actual: number = nextSlideOf(5, 100, 3, 1920);
      logInfo(`nextSlideOf(sx=5, offsetY=100, lastOffset...: actual=${actual}`);
      expect(actual).assertClose(5.050520833333334, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0011
     * @tc.name      ComponentCollection_NextSlideOf_0011
     * @tc.desc      nextSlideOf(sx=10, offsetY=3, lastOffsetY=1, windowHeight=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0011 begin`);
      const actual: number = nextSlideOf(10, 3, 1, 1);
      logInfo(`nextSlideOf(sx=10, offsetY=3, lastOffsetY...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}NextSlideOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0012
     * @tc.name      ComponentCollection_NextSlideOf_0012
     * @tc.desc      nextSlideOf(sx=10, offsetY=100, lastOffsetY=50, windowHeight=360) returns 10.13888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_NextSlideOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextSlideOf_0012 begin`);
      const actual: number = nextSlideOf(10, 100, 50, 360);
      logInfo(`nextSlideOf(sx=10, offsetY=100, lastOffse...: actual=${actual}`);
      expect(actual).assertClose(10.13888888888889, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0013
     * @tc.name      ComponentCollection_NextSlideOf_0013
     * @tc.desc      nextSlideOf(sx=100, offsetY=1, lastOffsetY=50, windowHeight=100) returns 99.51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0013 begin`);
      const actual: number = nextSlideOf(100, 1, 50, 100);
      logInfo(`nextSlideOf(sx=100, offsetY=1, lastOffset...: actual=${actual}`);
      expect(actual).assertClose(99.51, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0014
     * @tc.name      ComponentCollection_NextSlideOf_0014
     * @tc.desc      nextSlideOf(sx=3, offsetY=1, lastOffsetY=50, windowHeight=720) returns 2.9319444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0014 begin`);
      const actual: number = nextSlideOf(3, 1, 50, 720);
      logInfo(`nextSlideOf(sx=3, offsetY=1, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(2.9319444444444445, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0015
     * @tc.name      ComponentCollection_NextSlideOf_0015
     * @tc.desc      nextSlideOf(sx=100, offsetY=3, lastOffsetY=1, windowHeight=360) returns 100.00555555555556
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0015 begin`);
      const actual: number = nextSlideOf(100, 3, 1, 360);
      logInfo(`nextSlideOf(sx=100, offsetY=3, lastOffset...: actual=${actual}`);
      expect(actual).assertClose(100.00555555555556, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0016
     * @tc.name      ComponentCollection_NextSlideOf_0016
     * @tc.desc      nextSlideOf(sx=3, offsetY=-100, lastOffsetY=2, windowHeight=1920) returns 2.946875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0016 begin`);
      const actual: number = nextSlideOf(3, -100, 2, 1920);
      logInfo(`nextSlideOf(sx=3, offsetY=-100, lastOffse...: actual=${actual}`);
      expect(actual).assertClose(2.946875, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0017
     * @tc.name      ComponentCollection_NextSlideOf_0017
     * @tc.desc      nextSlideOf(sx=0, offsetY=100, lastOffsetY=50, windowHeight=100) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0017 begin`);
      const actual: number = nextSlideOf(0, 100, 50, 100);
      logInfo(`nextSlideOf(sx=0, offsetY=100, lastOffset...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0018
     * @tc.name      ComponentCollection_NextSlideOf_0018
     * @tc.desc      nextSlideOf(sx=100, offsetY=-100, lastOffsetY=3, windowHeight=720) returns 99.85694444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0018 begin`);
      const actual: number = nextSlideOf(100, -100, 3, 720);
      logInfo(`nextSlideOf(sx=100, offsetY=-100, lastOff...: actual=${actual}`);
      expect(actual).assertClose(99.85694444444445, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0019
     * @tc.name      ComponentCollection_NextSlideOf_0019
     * @tc.desc      nextSlideOf(sx=10, offsetY=0, lastOffsetY=50, windowHeight=100) returns 9.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0019 begin`);
      const actual: number = nextSlideOf(10, 0, 50, 100);
      logInfo(`nextSlideOf(sx=10, offsetY=0, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(9.5, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0020
     * @tc.name      ComponentCollection_NextSlideOf_0020
     * @tc.desc      nextSlideOf(sx=5, offsetY=50, lastOffsetY=1, windowHeight=1920) returns 5.025520833333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0020 begin`);
      const actual: number = nextSlideOf(5, 50, 1, 1920);
      logInfo(`nextSlideOf(sx=5, offsetY=50, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(5.025520833333333, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0021
     * @tc.name      ComponentCollection_NextSlideOf_0021
     * @tc.desc      nextSlideOf(sx=100, offsetY=0, lastOffsetY=2, windowHeight=1080) returns 99.99814814814815
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0021 begin`);
      const actual: number = nextSlideOf(100, 0, 2, 1080);
      logInfo(`nextSlideOf(sx=100, offsetY=0, lastOffset...: actual=${actual}`);
      expect(actual).assertClose(99.99814814814815, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0022
     * @tc.name      ComponentCollection_NextSlideOf_0022
     * @tc.desc      nextSlideOf(sx=1, offsetY=-1, lastOffsetY=1, windowHeight=360) returns 0.9944444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0022 begin`);
      const actual: number = nextSlideOf(1, -1, 1, 360);
      logInfo(`nextSlideOf(sx=1, offsetY=-1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(0.9944444444444445, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0023
     * @tc.name      ComponentCollection_NextSlideOf_0023
     * @tc.desc      nextSlideOf(sx=0, offsetY=0, lastOffsetY=100, windowHeight=100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0023 begin`);
      const actual: number = nextSlideOf(0, 0, 100, 100);
      logInfo(`nextSlideOf(sx=0, offsetY=0, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextSlideOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0024
     * @tc.name      ComponentCollection_NextSlideOf_0024
     * @tc.desc      nextSlideOf(sx=1, offsetY=1, lastOffsetY=0, windowHeight=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0024 begin`);
      const actual: number = nextSlideOf(1, 1, 0, 1);
      logInfo(`nextSlideOf(sx=1, offsetY=1, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextSlideOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0025
     * @tc.name      ComponentCollection_NextSlideOf_0025
     * @tc.desc      nextSlideOf(sx=0, offsetY=1, lastOffsetY=50, windowHeight=360) returns -0.1361111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0025 begin`);
      const actual: number = nextSlideOf(0, 1, 50, 360);
      logInfo(`nextSlideOf(sx=0, offsetY=1, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(-0.1361111111111111, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0026
     * @tc.name      ComponentCollection_NextSlideOf_0026
     * @tc.desc      nextSlideOf(sx=5, offsetY=50, lastOffsetY=0, windowHeight=1920) returns 5.026041666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0026 begin`);
      const actual: number = nextSlideOf(5, 50, 0, 1920);
      logInfo(`nextSlideOf(sx=5, offsetY=50, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(5.026041666666667, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0027
     * @tc.name      ComponentCollection_NextSlideOf_0027
     * @tc.desc      nextSlideOf(sx=5, offsetY=50, lastOffsetY=3, windowHeight=720) returns 5.065277777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_NextSlideOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextSlideOf_0027 begin`);
      const actual: number = nextSlideOf(5, 50, 3, 720);
      logInfo(`nextSlideOf(sx=5, offsetY=50, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(5.065277777777778, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0028
     * @tc.name      ComponentCollection_NextSlideOf_0028
     * @tc.desc      nextSlideOf(sx=3, offsetY=-1, lastOffsetY=-100, windowHeight=1) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0028 begin`);
      const actual: number = nextSlideOf(3, -1, -100, 1);
      logInfo(`nextSlideOf(sx=3, offsetY=-1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}NextSlideOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0029
     * @tc.name      ComponentCollection_NextSlideOf_0029
     * @tc.desc      nextSlideOf(sx=3, offsetY=-100, lastOffsetY=100, windowHeight=1080) returns 2.814814814814815
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0029 begin`);
      const actual: number = nextSlideOf(3, -100, 100, 1080);
      logInfo(`nextSlideOf(sx=3, offsetY=-100, lastOffse...: actual=${actual}`);
      expect(actual).assertClose(2.814814814814815, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0030
     * @tc.name      ComponentCollection_NextSlideOf_0030
     * @tc.desc      nextSlideOf(sx=100, offsetY=50, lastOffsetY=3, windowHeight=100) returns 100.47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_NextSlideOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextSlideOf_0030 begin`);
      const actual: number = nextSlideOf(100, 50, 3, 100);
      logInfo(`nextSlideOf(sx=100, offsetY=50, lastOffse...: actual=${actual}`);
      expect(actual).assertClose(100.47, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0031
     * @tc.name      ComponentCollection_NextSlideOf_0031
     * @tc.desc      nextSlideOf(sx=0, offsetY=3, lastOffsetY=2, windowHeight=360) returns 0.002777777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0031 begin`);
      const actual: number = nextSlideOf(0, 3, 2, 360);
      logInfo(`nextSlideOf(sx=0, offsetY=3, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(0.002777777777777778, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0032
     * @tc.name      ComponentCollection_NextSlideOf_0032
     * @tc.desc      nextSlideOf(sx=1, offsetY=-1, lastOffsetY=0, windowHeight=1080) returns 0.9990740740740741
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0032 begin`);
      const actual: number = nextSlideOf(1, -1, 0, 1080);
      logInfo(`nextSlideOf(sx=1, offsetY=-1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(0.9990740740740741, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0033
     * @tc.name      ComponentCollection_NextSlideOf_0033
     * @tc.desc      nextSlideOf(sx=0, offsetY=0, lastOffsetY=3, windowHeight=360) returns -0.008333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0033 begin`);
      const actual: number = nextSlideOf(0, 0, 3, 360);
      logInfo(`nextSlideOf(sx=0, offsetY=0, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(-0.008333333333333333, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0034
     * @tc.name      ComponentCollection_NextSlideOf_0034
     * @tc.desc      nextSlideOf(sx=3, offsetY=3, lastOffsetY=-100, windowHeight=360) returns 3.286111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0034 begin`);
      const actual: number = nextSlideOf(3, 3, -100, 360);
      logInfo(`nextSlideOf(sx=3, offsetY=3, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(3.286111111111111, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0035
     * @tc.name      ComponentCollection_NextSlideOf_0035
     * @tc.desc      nextSlideOf(sx=5, offsetY=3, lastOffsetY=50, windowHeight=360) returns 4.8694444444444445
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_NextSlideOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextSlideOf_0035 begin`);
      const actual: number = nextSlideOf(5, 3, 50, 360);
      logInfo(`nextSlideOf(sx=5, offsetY=3, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(4.8694444444444445, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0036
     * @tc.name      ComponentCollection_NextSlideOf_0036
     * @tc.desc      nextSlideOf(sx=1, offsetY=1, lastOffsetY=1, windowHeight=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0036 begin`);
      const actual: number = nextSlideOf(1, 1, 1, 100);
      logInfo(`nextSlideOf(sx=1, offsetY=1, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextSlideOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0037
     * @tc.name      ComponentCollection_NextSlideOf_0037
     * @tc.desc      nextSlideOf(sx=100, offsetY=50, lastOffsetY=-100, windowHeight=360) returns 100.41666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0037 begin`);
      const actual: number = nextSlideOf(100, 50, -100, 360);
      logInfo(`nextSlideOf(sx=100, offsetY=50, lastOffse...: actual=${actual}`);
      expect(actual).assertClose(100.41666666666667, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0038
     * @tc.name      ComponentCollection_NextSlideOf_0038
     * @tc.desc      nextSlideOf(sx=10, offsetY=1, lastOffsetY=2, windowHeight=100) returns 9.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0038 begin`);
      const actual: number = nextSlideOf(10, 1, 2, 100);
      logInfo(`nextSlideOf(sx=10, offsetY=1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(9.99, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0039
     * @tc.name      ComponentCollection_NextSlideOf_0039
     * @tc.desc      nextSlideOf(sx=100, offsetY=3, lastOffsetY=50, windowHeight=100) returns 99.53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_NextSlideOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextSlideOf_0039 begin`);
      const actual: number = nextSlideOf(100, 3, 50, 100);
      logInfo(`nextSlideOf(sx=100, offsetY=3, lastOffset...: actual=${actual}`);
      expect(actual).assertClose(99.53, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0040
     * @tc.name      ComponentCollection_NextSlideOf_0040
     * @tc.desc      nextSlideOf(sx=5, offsetY=50, lastOffsetY=0, windowHeight=1) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0040 begin`);
      const actual: number = nextSlideOf(5, 50, 0, 1);
      logInfo(`nextSlideOf(sx=5, offsetY=50, lastOffsetY...: actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextSlideOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0041
     * @tc.name      ComponentCollection_NextSlideOf_0041
     * @tc.desc      nextSlideOf(sx=10, offsetY=1, lastOffsetY=0, windowHeight=-1) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0041 begin`);
      const actual: number = nextSlideOf(10, 1, 0, -1);
      logInfo(`nextSlideOf(sx=10, offsetY=1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}NextSlideOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0042
     * @tc.name      ComponentCollection_NextSlideOf_0042
     * @tc.desc      nextSlideOf(sx=5, offsetY=-1, lastOffsetY=50, windowHeight=-1) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0042 begin`);
      const actual: number = nextSlideOf(5, -1, 50, -1);
      logInfo(`nextSlideOf(sx=5, offsetY=-1, lastOffsetY...: actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}NextSlideOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0043
     * @tc.name      ComponentCollection_NextSlideOf_0043
     * @tc.desc      nextSlideOf(sx=2, offsetY=0, lastOffsetY=1, windowHeight=720) returns 1.9986111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0043 begin`);
      const actual: number = nextSlideOf(2, 0, 1, 720);
      logInfo(`nextSlideOf(sx=2, offsetY=0, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(1.9986111111111111, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0044
     * @tc.name      ComponentCollection_NextSlideOf_0044
     * @tc.desc      nextSlideOf(sx=5, offsetY=50, lastOffsetY=-100, windowHeight=1920) returns 5.078125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ComponentCollection_NextSlideOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextSlideOf_0044 begin`);
      const actual: number = nextSlideOf(5, 50, -100, 1920);
      logInfo(`nextSlideOf(sx=5, offsetY=50, lastOffsetY...: actual=${actual}`);
      expect(actual).assertClose(5.078125, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0045
     * @tc.name      ComponentCollection_NextSlideOf_0045
     * @tc.desc      nextSlideOf(sx=5, offsetY=1, lastOffsetY=1, windowHeight=1920) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0045 begin`);
      const actual: number = nextSlideOf(5, 1, 1, 1920);
      logInfo(`nextSlideOf(sx=5, offsetY=1, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextSlideOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0046
     * @tc.name      ComponentCollection_NextSlideOf_0046
     * @tc.desc      nextSlideOf(sx=2, offsetY=0, lastOffsetY=2, windowHeight=720) returns 1.9972222222222222
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0046 begin`);
      const actual: number = nextSlideOf(2, 0, 2, 720);
      logInfo(`nextSlideOf(sx=2, offsetY=0, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(1.9972222222222222, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0047
     * @tc.name      ComponentCollection_NextSlideOf_0047
     * @tc.desc      nextSlideOf(sx=3, offsetY=0, lastOffsetY=100, windowHeight=720) returns 2.861111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0047 begin`);
      const actual: number = nextSlideOf(3, 0, 100, 720);
      logInfo(`nextSlideOf(sx=3, offsetY=0, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(2.861111111111111, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0048
     * @tc.name      ComponentCollection_NextSlideOf_0048
     * @tc.desc      nextSlideOf(sx=5, offsetY=0, lastOffsetY=3, windowHeight=720) returns 4.995833333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0048 begin`);
      const actual: number = nextSlideOf(5, 0, 3, 720);
      logInfo(`nextSlideOf(sx=5, offsetY=0, lastOffsetY=...: actual=${actual}`);
      expect(actual).assertClose(4.995833333333334, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0049
     * @tc.name      ComponentCollection_NextSlideOf_0049
     * @tc.desc      nextSlideOf(sx=5, offsetY=100, lastOffsetY=3, windowHeight=-1) returns -92
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_NextSlideOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextSlideOf_0049 begin`);
      const actual: number = nextSlideOf(5, 100, 3, -1);
      logInfo(`nextSlideOf(sx=5, offsetY=100, lastOffset...: actual=${actual}`);
      expect(actual).assertEqual(-92);
      logInfo(`${BUNDLE}NextSlideOf_0049 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_NEXT_SLIDE_OF_0050
     * @tc.name      ComponentCollection_NextSlideOf_0050
     * @tc.desc      nextSlideOf(sx=100, offsetY=50, lastOffsetY=3, windowHeight=720) returns 100.06527777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_NextSlideOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextSlideOf_0050 begin`);
      const actual: number = nextSlideOf(100, 50, 3, 720);
      logInfo(`nextSlideOf(sx=100, offsetY=50, lastOffse...: actual=${actual}`);
      expect(actual).assertClose(100.06527777777778, PRECISION);
      logInfo(`${BUNDLE}NextSlideOf_0050 end`);
    });
  });
}
