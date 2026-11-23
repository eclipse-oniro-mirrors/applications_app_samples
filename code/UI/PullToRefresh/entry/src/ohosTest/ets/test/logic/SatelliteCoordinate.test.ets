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
import { satelliteCoordinate } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for satelliteCoordinate (59 cases). */
export default function satelliteCoordinateTest(): void {
  describe('SatelliteCoordinateTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0001
     * @tc.name      PullToRefresh_SatelliteCoordinate_0001
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=0.75) returns 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_SatelliteCoordinate_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0001 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0002
     * @tc.name      PullToRefresh_SatelliteCoordinate_0002
     * @tc.desc      satelliteCoordinate(value=0.75, from=1.5, to=0.75) returns 0.9375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_SatelliteCoordinate_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0002 begin`);
      const actual: number = satelliteCoordinate(0.75, 1.5, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=1.5,...: actual=${actual}`);
      expect(actual).assertClose(0.9375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0003
     * @tc.name      PullToRefresh_SatelliteCoordinate_0003
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.375, to=0.75) returns 0.65625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0003 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.375, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=0.37...: actual=${actual}`);
      expect(actual).assertClose(0.65625, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0004
     * @tc.name      PullToRefresh_SatelliteCoordinate_0004
     * @tc.desc      satelliteCoordinate(value=0.75, from=0, to=0.75) returns 0.5625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0004 begin`);
      const actual: number = satelliteCoordinate(0.75, 0, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=0, t...: actual=${actual}`);
      expect(actual).assertClose(0.5625, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0005
     * @tc.name      PullToRefresh_SatelliteCoordinate_0005
     * @tc.desc      satelliteCoordinate(value=0.75, from=1, to=0.75) returns 0.8125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0005 begin`);
      const actual: number = satelliteCoordinate(0.75, 1, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=1, t...: actual=${actual}`);
      expect(actual).assertClose(0.8125, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0006
     * @tc.name      PullToRefresh_SatelliteCoordinate_0006
     * @tc.desc      satelliteCoordinate(value=0.75, from=-1, to=0.75) returns 0.3125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0006 begin`);
      const actual: number = satelliteCoordinate(0.75, -1, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=-1, ...: actual=${actual}`);
      expect(actual).assertClose(0.3125, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0007
     * @tc.name      PullToRefresh_SatelliteCoordinate_0007
     * @tc.desc      satelliteCoordinate(value=0.75, from=2, to=0.75) returns 1.0625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0007 begin`);
      const actual: number = satelliteCoordinate(0.75, 2, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=2, t...: actual=${actual}`);
      expect(actual).assertClose(1.0625, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0008
     * @tc.name      PullToRefresh_SatelliteCoordinate_0008
     * @tc.desc      satelliteCoordinate(value=0.75, from=3, to=0.75) returns 1.3125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0008 begin`);
      const actual: number = satelliteCoordinate(0.75, 3, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=3, t...: actual=${actual}`);
      expect(actual).assertClose(1.3125, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0009
     * @tc.name      PullToRefresh_SatelliteCoordinate_0009
     * @tc.desc      satelliteCoordinate(value=0.75, from=10, to=0.75) returns 3.0625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0009 begin`);
      const actual: number = satelliteCoordinate(0.75, 10, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=10, ...: actual=${actual}`);
      expect(actual).assertClose(3.0625, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0010
     * @tc.name      PullToRefresh_SatelliteCoordinate_0010
     * @tc.desc      satelliteCoordinate(value=0.75, from=100, to=0.75) returns 25.5625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0010 begin`);
      const actual: number = satelliteCoordinate(0.75, 100, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=100,...: actual=${actual}`);
      expect(actual).assertClose(25.5625, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0011
     * @tc.name      PullToRefresh_SatelliteCoordinate_0011
     * @tc.desc      satelliteCoordinate(value=0.75, from=5, to=0.75) returns 1.8125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0011 begin`);
      const actual: number = satelliteCoordinate(0.75, 5, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=5, t...: actual=${actual}`);
      expect(actual).assertClose(1.8125, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0012
     * @tc.name      PullToRefresh_SatelliteCoordinate_0012
     * @tc.desc      satelliteCoordinate(value=0.75, from=182, to=0.75) returns 46.0625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0012 begin`);
      const actual: number = satelliteCoordinate(0.75, 182, 0.75);
      logInfo(`satelliteCoordinate(value=0.75, from=182,...: actual=${actual}`);
      expect(actual).assertClose(46.0625, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0013
     * @tc.name      PullToRefresh_SatelliteCoordinate_0013
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=0.375) returns 0.46875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0013 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 0.375);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(0.46875, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0014
     * @tc.name      PullToRefresh_SatelliteCoordinate_0014
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=0) returns 0.1875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0014 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 0);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(0.1875, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0015
     * @tc.name      PullToRefresh_SatelliteCoordinate_0015
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=-1) returns -0.5625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0015 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, -1);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(-0.5625, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0016
     * @tc.name      PullToRefresh_SatelliteCoordinate_0016
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=2) returns 1.6875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0016 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 2);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(1.6875, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0017
     * @tc.name      PullToRefresh_SatelliteCoordinate_0017
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=3) returns 2.4375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0017 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 3);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(2.4375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0018
     * @tc.name      PullToRefresh_SatelliteCoordinate_0018
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=10) returns 7.6875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0018 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 10);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(7.6875, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0019
     * @tc.name      PullToRefresh_SatelliteCoordinate_0019
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=100) returns 75.1875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0019 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 100);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(75.1875, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0020
     * @tc.name      PullToRefresh_SatelliteCoordinate_0020
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=5) returns 3.9375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0020 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 5);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(3.9375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0021
     * @tc.name      PullToRefresh_SatelliteCoordinate_0021
     * @tc.desc      satelliteCoordinate(value=0.75, from=0.75, to=93) returns 69.9375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0021 begin`);
      const actual: number = satelliteCoordinate(0.75, 0.75, 93);
      logInfo(`satelliteCoordinate(value=0.75, from=0.75...: actual=${actual}`);
      expect(actual).assertClose(69.9375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0022
     * @tc.name      PullToRefresh_SatelliteCoordinate_0022
     * @tc.desc      satelliteCoordinate(value=-1, from=10, to=100) returns -80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0022 begin`);
      const actual: number = satelliteCoordinate(-1, 10, 100);
      logInfo(`satelliteCoordinate(value=-1, from=10, to...: actual=${actual}`);
      expect(actual).assertEqual(-80);
      logInfo(`${BUNDLE}SatelliteCoordinate_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0023
     * @tc.name      PullToRefresh_SatelliteCoordinate_0023
     * @tc.desc      satelliteCoordinate(value=100, from=5, to=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0023 begin`);
      const actual: number = satelliteCoordinate(100, 5, 1);
      logInfo(`satelliteCoordinate(value=100, from=5, to=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SatelliteCoordinate_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0024
     * @tc.name      PullToRefresh_SatelliteCoordinate_0024
     * @tc.desc      satelliteCoordinate(value=2, from=10, to=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0024 begin`);
      const actual: number = satelliteCoordinate(2, 10, 2);
      logInfo(`satelliteCoordinate(value=2, from=10, to=2): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}SatelliteCoordinate_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0025
     * @tc.name      PullToRefresh_SatelliteCoordinate_0025
     * @tc.desc      satelliteCoordinate(value=0, from=3, to=0.75) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0025 begin`);
      const actual: number = satelliteCoordinate(0, 3, 0.75);
      logInfo(`satelliteCoordinate(value=0, from=3, to=0...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SatelliteCoordinate_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0026
     * @tc.name      PullToRefresh_SatelliteCoordinate_0026
     * @tc.desc      satelliteCoordinate(value=5, from=182, to=100) returns 120.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0026 begin`);
      const actual: number = satelliteCoordinate(5, 182, 100);
      logInfo(`satelliteCoordinate(value=5, from=182, to...: actual=${actual}`);
      expect(actual).assertClose(120.5, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0027
     * @tc.name      PullToRefresh_SatelliteCoordinate_0027
     * @tc.desc      satelliteCoordinate(value=0.75, from=2, to=0.375) returns 0.78125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0027 begin`);
      const actual: number = satelliteCoordinate(0.75, 2, 0.375);
      logInfo(`satelliteCoordinate(value=0.75, from=2, t...: actual=${actual}`);
      expect(actual).assertClose(0.78125, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0028
     * @tc.name      PullToRefresh_SatelliteCoordinate_0028
     * @tc.desc      satelliteCoordinate(value=100, from=1, to=0.375) returns 0.53125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0028 begin`);
      const actual: number = satelliteCoordinate(100, 1, 0.375);
      logInfo(`satelliteCoordinate(value=100, from=1, to...: actual=${actual}`);
      expect(actual).assertClose(0.53125, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0029
     * @tc.name      PullToRefresh_SatelliteCoordinate_0029
     * @tc.desc      satelliteCoordinate(value=1, from=0, to=5) returns 3.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0029 begin`);
      const actual: number = satelliteCoordinate(1, 0, 5);
      logInfo(`satelliteCoordinate(value=1, from=0, to=5): actual=${actual}`);
      expect(actual).assertClose(3.75, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0030
     * @tc.name      PullToRefresh_SatelliteCoordinate_0030
     * @tc.desc      satelliteCoordinate(value=1.5, from=-1, to=0.375) returns 0.03125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0030 begin`);
      const actual: number = satelliteCoordinate(1.5, -1, 0.375);
      logInfo(`satelliteCoordinate(value=1.5, from=-1, t...: actual=${actual}`);
      expect(actual).assertClose(0.03125, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0031
     * @tc.name      PullToRefresh_SatelliteCoordinate_0031
     * @tc.desc      satelliteCoordinate(value=0.375, from=0.75, to=3) returns 1.59375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0031 begin`);
      const actual: number = satelliteCoordinate(0.375, 0.75, 3);
      logInfo(`satelliteCoordinate(value=0.375, from=0.7...: actual=${actual}`);
      expect(actual).assertClose(1.59375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0032
     * @tc.name      PullToRefresh_SatelliteCoordinate_0032
     * @tc.desc      satelliteCoordinate(value=3, from=3, to=1) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0032 begin`);
      const actual: number = satelliteCoordinate(3, 3, 1);
      logInfo(`satelliteCoordinate(value=3, from=3, to=1): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0033
     * @tc.name      PullToRefresh_SatelliteCoordinate_0033
     * @tc.desc      satelliteCoordinate(value=0, from=0, to=93) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0033 begin`);
      const actual: number = satelliteCoordinate(0, 0, 93);
      logInfo(`satelliteCoordinate(value=0, from=0, to=93): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SatelliteCoordinate_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0034
     * @tc.name      PullToRefresh_SatelliteCoordinate_0034
     * @tc.desc      satelliteCoordinate(value=-1, from=1.5, to=0.75) returns 2.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0034 begin`);
      const actual: number = satelliteCoordinate(-1, 1.5, 0.75);
      logInfo(`satelliteCoordinate(value=-1, from=1.5, t...: actual=${actual}`);
      expect(actual).assertClose(2.25, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0035
     * @tc.name      PullToRefresh_SatelliteCoordinate_0035
     * @tc.desc      satelliteCoordinate(value=1.5, from=0.375, to=-1) returns -0.65625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0035 begin`);
      const actual: number = satelliteCoordinate(1.5, 0.375, -1);
      logInfo(`satelliteCoordinate(value=1.5, from=0.375...: actual=${actual}`);
      expect(actual).assertClose(-0.65625, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0036
     * @tc.name      PullToRefresh_SatelliteCoordinate_0036
     * @tc.desc      satelliteCoordinate(value=10, from=0.375, to=0) returns 0.09375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0036 begin`);
      const actual: number = satelliteCoordinate(10, 0.375, 0);
      logInfo(`satelliteCoordinate(value=10, from=0.375,...: actual=${actual}`);
      expect(actual).assertClose(0.09375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0037
     * @tc.name      PullToRefresh_SatelliteCoordinate_0037
     * @tc.desc      satelliteCoordinate(value=188, from=182, to=1) returns 46.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0037 begin`);
      const actual: number = satelliteCoordinate(188, 182, 1);
      logInfo(`satelliteCoordinate(value=188, from=182, ...: actual=${actual}`);
      expect(actual).assertClose(46.25, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0038
     * @tc.name      PullToRefresh_SatelliteCoordinate_0038
     * @tc.desc      satelliteCoordinate(value=1, from=182, to=10) returns 53
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0038 begin`);
      const actual: number = satelliteCoordinate(1, 182, 10);
      logInfo(`satelliteCoordinate(value=1, from=182, to...: actual=${actual}`);
      expect(actual).assertEqual(53);
      logInfo(`${BUNDLE}SatelliteCoordinate_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0039
     * @tc.name      PullToRefresh_SatelliteCoordinate_0039
     * @tc.desc      satelliteCoordinate(value=1, from=2, to=3) returns 2.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0039 begin`);
      const actual: number = satelliteCoordinate(1, 2, 3);
      logInfo(`satelliteCoordinate(value=1, from=2, to=3): actual=${actual}`);
      expect(actual).assertClose(2.75, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0040
     * @tc.name      PullToRefresh_SatelliteCoordinate_0040
     * @tc.desc      satelliteCoordinate(value=2, from=10, to=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0040 begin`);
      const actual: number = satelliteCoordinate(2, 10, 10);
      logInfo(`satelliteCoordinate(value=2, from=10, to=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}SatelliteCoordinate_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0041
     * @tc.name      PullToRefresh_SatelliteCoordinate_0041
     * @tc.desc      satelliteCoordinate(value=188, from=182, to=0) returns 45.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0041 begin`);
      const actual: number = satelliteCoordinate(188, 182, 0);
      logInfo(`satelliteCoordinate(value=188, from=182, ...: actual=${actual}`);
      expect(actual).assertClose(45.5, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0042
     * @tc.name      PullToRefresh_SatelliteCoordinate_0042
     * @tc.desc      satelliteCoordinate(value=1, from=-1, to=1) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0042 begin`);
      const actual: number = satelliteCoordinate(1, -1, 1);
      logInfo(`satelliteCoordinate(value=1, from=-1, to=1): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0043
     * @tc.name      PullToRefresh_SatelliteCoordinate_0043
     * @tc.desc      satelliteCoordinate(value=-1, from=182, to=5) returns 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0043 begin`);
      const actual: number = satelliteCoordinate(-1, 182, 5);
      logInfo(`satelliteCoordinate(value=-1, from=182, t...: actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}SatelliteCoordinate_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0044
     * @tc.name      PullToRefresh_SatelliteCoordinate_0044
     * @tc.desc      satelliteCoordinate(value=1, from=-1, to=2) returns 1.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0044 begin`);
      const actual: number = satelliteCoordinate(1, -1, 2);
      logInfo(`satelliteCoordinate(value=1, from=-1, to=2): actual=${actual}`);
      expect(actual).assertClose(1.25, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0045
     * @tc.name      PullToRefresh_SatelliteCoordinate_0045
     * @tc.desc      satelliteCoordinate(value=0.75, from=1, to=100) returns 75.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteCoordinate_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0045 begin`);
      const actual: number = satelliteCoordinate(0.75, 1, 100);
      logInfo(`satelliteCoordinate(value=0.75, from=1, t...: actual=${actual}`);
      expect(actual).assertClose(75.25, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0046
     * @tc.name      PullToRefresh_SatelliteCoordinate_0046
     * @tc.desc      satelliteCoordinate(value=100, from=5, to=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0046 begin`);
      const actual: number = satelliteCoordinate(100, 5, 5);
      logInfo(`satelliteCoordinate(value=100, from=5, to=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}SatelliteCoordinate_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0047
     * @tc.name      PullToRefresh_SatelliteCoordinate_0047
     * @tc.desc      satelliteCoordinate(value=10, from=100, to=93) returns 94.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0047 begin`);
      const actual: number = satelliteCoordinate(10, 100, 93);
      logInfo(`satelliteCoordinate(value=10, from=100, t...: actual=${actual}`);
      expect(actual).assertClose(94.75, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0048
     * @tc.name      PullToRefresh_SatelliteCoordinate_0048
     * @tc.desc      satelliteCoordinate(value=5, from=1, to=93) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0048 begin`);
      const actual: number = satelliteCoordinate(5, 1, 93);
      logInfo(`satelliteCoordinate(value=5, from=1, to=93): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}SatelliteCoordinate_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0049
     * @tc.name      PullToRefresh_SatelliteCoordinate_0049
     * @tc.desc      satelliteCoordinate(value=1.5, from=1.5, to=93) returns 70.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0049 begin`);
      const actual: number = satelliteCoordinate(1.5, 1.5, 93);
      logInfo(`satelliteCoordinate(value=1.5, from=1.5, ...: actual=${actual}`);
      expect(actual).assertClose(70.125, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0050
     * @tc.name      PullToRefresh_SatelliteCoordinate_0050
     * @tc.desc      satelliteCoordinate(value=0.75, from=-1, to=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0050 begin`);
      const actual: number = satelliteCoordinate(0.75, -1, -1);
      logInfo(`satelliteCoordinate(value=0.75, from=-1, ...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SatelliteCoordinate_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0051
     * @tc.name      PullToRefresh_SatelliteCoordinate_0051
     * @tc.desc      satelliteCoordinate(value=2, from=10, to=3) returns 4.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0051 begin`);
      const actual: number = satelliteCoordinate(2, 10, 3);
      logInfo(`satelliteCoordinate(value=2, from=10, to=3): actual=${actual}`);
      expect(actual).assertClose(4.75, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0052
     * @tc.name      PullToRefresh_SatelliteCoordinate_0052
     * @tc.desc      satelliteCoordinate(value=3, from=182, to=-1) returns 44.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0052 begin`);
      const actual: number = satelliteCoordinate(3, 182, -1);
      logInfo(`satelliteCoordinate(value=3, from=182, to...: actual=${actual}`);
      expect(actual).assertClose(44.75, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0053
     * @tc.name      PullToRefresh_SatelliteCoordinate_0053
     * @tc.desc      satelliteCoordinate(value=5, from=1.5, to=0) returns 0.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0053 begin`);
      const actual: number = satelliteCoordinate(5, 1.5, 0);
      logInfo(`satelliteCoordinate(value=5, from=1.5, to=0): actual=${actual}`);
      expect(actual).assertClose(0.375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0054
     * @tc.name      PullToRefresh_SatelliteCoordinate_0054
     * @tc.desc      satelliteCoordinate(value=10, from=100, to=3) returns 27.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0054 begin`);
      const actual: number = satelliteCoordinate(10, 100, 3);
      logInfo(`satelliteCoordinate(value=10, from=100, t...: actual=${actual}`);
      expect(actual).assertClose(27.25, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0055
     * @tc.name      PullToRefresh_SatelliteCoordinate_0055
     * @tc.desc      satelliteCoordinate(value=1, from=0.375, to=10) returns 7.59375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0055 begin`);
      const actual: number = satelliteCoordinate(1, 0.375, 10);
      logInfo(`satelliteCoordinate(value=1, from=0.375, ...: actual=${actual}`);
      expect(actual).assertClose(7.59375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0056
     * @tc.name      PullToRefresh_SatelliteCoordinate_0056
     * @tc.desc      satelliteCoordinate(value=188, from=3, to=93) returns 70.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0056 begin`);
      const actual: number = satelliteCoordinate(188, 3, 93);
      logInfo(`satelliteCoordinate(value=188, from=3, to...: actual=${actual}`);
      expect(actual).assertClose(70.5, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0057
     * @tc.name      PullToRefresh_SatelliteCoordinate_0057
     * @tc.desc      satelliteCoordinate(value=0.375, from=-1, to=1) returns -0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0057 begin`);
      const actual: number = satelliteCoordinate(0.375, -1, 1);
      logInfo(`satelliteCoordinate(value=0.375, from=-1,...: actual=${actual}`);
      expect(actual).assertClose(-0.25, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0058
     * @tc.name      PullToRefresh_SatelliteCoordinate_0058
     * @tc.desc      satelliteCoordinate(value=100, from=0.375, to=1) returns 0.84375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteCoordinate_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0058 begin`);
      const actual: number = satelliteCoordinate(100, 0.375, 1);
      logInfo(`satelliteCoordinate(value=100, from=0.375...: actual=${actual}`);
      expect(actual).assertClose(0.84375, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_COORDINATE_0059
     * @tc.name      PullToRefresh_SatelliteCoordinate_0059
     * @tc.desc      satelliteCoordinate(value=-1, from=0.375, to=10) returns -9.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteCoordinate_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteCoordinate_0059 begin`);
      const actual: number = satelliteCoordinate(-1, 0.375, 10);
      logInfo(`satelliteCoordinate(value=-1, from=0.375,...: actual=${actual}`);
      expect(actual).assertClose(-9.25, PRECISION);
      logInfo(`${BUNDLE}SatelliteCoordinate_0059 end`);
    });
  });
}
