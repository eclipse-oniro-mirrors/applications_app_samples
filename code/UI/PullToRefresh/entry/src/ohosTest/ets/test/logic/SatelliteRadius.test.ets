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
import { satelliteRadius } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for satelliteRadius (59 cases). */
export default function satelliteRadiusTest(): void {
  describe('SatelliteRadiusTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0001
     * @tc.name      PullToRefresh_SatelliteRadius_0001
     * @tc.desc      satelliteRadius(refreshHeight=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_SatelliteRadius_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0001 begin`);
      const actual: number = satelliteRadius(0);
      logInfo(`satelliteRadius(refreshHeight=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SatelliteRadius_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0002
     * @tc.name      PullToRefresh_SatelliteRadius_0002
     * @tc.desc      satelliteRadius(refreshHeight=1) returns 1.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_SatelliteRadius_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0002 begin`);
      const actual: number = satelliteRadius(1);
      logInfo(`satelliteRadius(refreshHeight=1): actual=${actual}`);
      expect(actual).assertClose(1.05, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0003
     * @tc.name      PullToRefresh_SatelliteRadius_0003
     * @tc.desc      satelliteRadius(refreshHeight=20) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteRadius_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0003 begin`);
      const actual: number = satelliteRadius(20);
      logInfo(`satelliteRadius(refreshHeight=20): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SatelliteRadius_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0004
     * @tc.name      PullToRefresh_SatelliteRadius_0004
     * @tc.desc      satelliteRadius(refreshHeight=19) returns 1.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteRadius_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0004 begin`);
      const actual: number = satelliteRadius(19);
      logInfo(`satelliteRadius(refreshHeight=19): actual=${actual}`);
      expect(actual).assertClose(1.95, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0005
     * @tc.name      PullToRefresh_SatelliteRadius_0005
     * @tc.desc      satelliteRadius(refreshHeight=21) returns 2.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteRadius_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0005 begin`);
      const actual: number = satelliteRadius(21);
      logInfo(`satelliteRadius(refreshHeight=21): actual=${actual}`);
      expect(actual).assertClose(2.05, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0006
     * @tc.name      PullToRefresh_SatelliteRadius_0006
     * @tc.desc      satelliteRadius(refreshHeight=40) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0006 begin`);
      const actual: number = satelliteRadius(40);
      logInfo(`satelliteRadius(refreshHeight=40): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}SatelliteRadius_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0007
     * @tc.name      PullToRefresh_SatelliteRadius_0007
     * @tc.desc      satelliteRadius(refreshHeight=10) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0007 begin`);
      const actual: number = satelliteRadius(10);
      logInfo(`satelliteRadius(refreshHeight=10): actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0008
     * @tc.name      PullToRefresh_SatelliteRadius_0008
     * @tc.desc      satelliteRadius(refreshHeight=2) returns 1.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_SatelliteRadius_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0008 begin`);
      const actual: number = satelliteRadius(2);
      logInfo(`satelliteRadius(refreshHeight=2): actual=${actual}`);
      expect(actual).assertClose(1.1, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0009
     * @tc.name      PullToRefresh_SatelliteRadius_0009
     * @tc.desc      satelliteRadius(refreshHeight=100) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0009 begin`);
      const actual: number = satelliteRadius(100);
      logInfo(`satelliteRadius(refreshHeight=100): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}SatelliteRadius_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0010
     * @tc.name      PullToRefresh_SatelliteRadius_0010
     * @tc.desc      satelliteRadius(refreshHeight=360) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0010 begin`);
      const actual: number = satelliteRadius(360);
      logInfo(`satelliteRadius(refreshHeight=360): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}SatelliteRadius_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0011
     * @tc.name      PullToRefresh_SatelliteRadius_0011
     * @tc.desc      satelliteRadius(refreshHeight=720) returns 37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0011 begin`);
      const actual: number = satelliteRadius(720);
      logInfo(`satelliteRadius(refreshHeight=720): actual=${actual}`);
      expect(actual).assertEqual(37);
      logInfo(`${BUNDLE}SatelliteRadius_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0012
     * @tc.name      PullToRefresh_SatelliteRadius_0012
     * @tc.desc      satelliteRadius(refreshHeight=1080) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0012 begin`);
      const actual: number = satelliteRadius(1080);
      logInfo(`satelliteRadius(refreshHeight=1080): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}SatelliteRadius_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0013
     * @tc.name      PullToRefresh_SatelliteRadius_0013
     * @tc.desc      satelliteRadius(refreshHeight=1920) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0013 begin`);
      const actual: number = satelliteRadius(1920);
      logInfo(`satelliteRadius(refreshHeight=1920): actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}SatelliteRadius_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0014
     * @tc.name      PullToRefresh_SatelliteRadius_0014
     * @tc.desc      satelliteRadius(refreshHeight=-1) returns 0.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteRadius_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0014 begin`);
      const actual: number = satelliteRadius(-1);
      logInfo(`satelliteRadius(refreshHeight=-1): actual=${actual}`);
      expect(actual).assertClose(0.95, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0015
     * @tc.name      PullToRefresh_SatelliteRadius_0015
     * @tc.desc      satelliteRadius(refreshHeight=3) returns 1.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0015 begin`);
      const actual: number = satelliteRadius(3);
      logInfo(`satelliteRadius(refreshHeight=3): actual=${actual}`);
      expect(actual).assertClose(1.15, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0016
     * @tc.name      PullToRefresh_SatelliteRadius_0016
     * @tc.desc      satelliteRadius(refreshHeight=96) returns 5.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0016 begin`);
      const actual: number = satelliteRadius(96);
      logInfo(`satelliteRadius(refreshHeight=96): actual=${actual}`);
      expect(actual).assertClose(5.8, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0017
     * @tc.name      PullToRefresh_SatelliteRadius_0017
     * @tc.desc      satelliteRadius(refreshHeight=192) returns 10.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0017 begin`);
      const actual: number = satelliteRadius(192);
      logInfo(`satelliteRadius(refreshHeight=192): actual=${actual}`);
      expect(actual).assertClose(10.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0018
     * @tc.name      PullToRefresh_SatelliteRadius_0018
     * @tc.desc      satelliteRadius(refreshHeight=288) returns 15.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0018 begin`);
      const actual: number = satelliteRadius(288);
      logInfo(`satelliteRadius(refreshHeight=288): actual=${actual}`);
      expect(actual).assertClose(15.4, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0019
     * @tc.name      PullToRefresh_SatelliteRadius_0019
     * @tc.desc      satelliteRadius(refreshHeight=384) returns 20.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0019 begin`);
      const actual: number = satelliteRadius(384);
      logInfo(`satelliteRadius(refreshHeight=384): actual=${actual}`);
      expect(actual).assertClose(20.2, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0020
     * @tc.name      PullToRefresh_SatelliteRadius_0020
     * @tc.desc      satelliteRadius(refreshHeight=480) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0020 begin`);
      const actual: number = satelliteRadius(480);
      logInfo(`satelliteRadius(refreshHeight=480): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}SatelliteRadius_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0021
     * @tc.name      PullToRefresh_SatelliteRadius_0021
     * @tc.desc      satelliteRadius(refreshHeight=576) returns 29.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0021 begin`);
      const actual: number = satelliteRadius(576);
      logInfo(`satelliteRadius(refreshHeight=576): actual=${actual}`);
      expect(actual).assertClose(29.8, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0022
     * @tc.name      PullToRefresh_SatelliteRadius_0022
     * @tc.desc      satelliteRadius(refreshHeight=672) returns 34.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0022 begin`);
      const actual: number = satelliteRadius(672);
      logInfo(`satelliteRadius(refreshHeight=672): actual=${actual}`);
      expect(actual).assertClose(34.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0023
     * @tc.name      PullToRefresh_SatelliteRadius_0023
     * @tc.desc      satelliteRadius(refreshHeight=768) returns 39.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0023 begin`);
      const actual: number = satelliteRadius(768);
      logInfo(`satelliteRadius(refreshHeight=768): actual=${actual}`);
      expect(actual).assertClose(39.4, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0024
     * @tc.name      PullToRefresh_SatelliteRadius_0024
     * @tc.desc      satelliteRadius(refreshHeight=864) returns 44.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0024 begin`);
      const actual: number = satelliteRadius(864);
      logInfo(`satelliteRadius(refreshHeight=864): actual=${actual}`);
      expect(actual).assertClose(44.2, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0025
     * @tc.name      PullToRefresh_SatelliteRadius_0025
     * @tc.desc      satelliteRadius(refreshHeight=960) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0025 begin`);
      const actual: number = satelliteRadius(960);
      logInfo(`satelliteRadius(refreshHeight=960): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}SatelliteRadius_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0026
     * @tc.name      PullToRefresh_SatelliteRadius_0026
     * @tc.desc      satelliteRadius(refreshHeight=1056) returns 53.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0026 begin`);
      const actual: number = satelliteRadius(1056);
      logInfo(`satelliteRadius(refreshHeight=1056): actual=${actual}`);
      expect(actual).assertClose(53.8, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0027
     * @tc.name      PullToRefresh_SatelliteRadius_0027
     * @tc.desc      satelliteRadius(refreshHeight=1152) returns 58.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0027 begin`);
      const actual: number = satelliteRadius(1152);
      logInfo(`satelliteRadius(refreshHeight=1152): actual=${actual}`);
      expect(actual).assertClose(58.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0028
     * @tc.name      PullToRefresh_SatelliteRadius_0028
     * @tc.desc      satelliteRadius(refreshHeight=1248) returns 63.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0028 begin`);
      const actual: number = satelliteRadius(1248);
      logInfo(`satelliteRadius(refreshHeight=1248): actual=${actual}`);
      expect(actual).assertClose(63.4, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0029
     * @tc.name      PullToRefresh_SatelliteRadius_0029
     * @tc.desc      satelliteRadius(refreshHeight=1344) returns 68.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0029 begin`);
      const actual: number = satelliteRadius(1344);
      logInfo(`satelliteRadius(refreshHeight=1344): actual=${actual}`);
      expect(actual).assertClose(68.2, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0030
     * @tc.name      PullToRefresh_SatelliteRadius_0030
     * @tc.desc      satelliteRadius(refreshHeight=1440) returns 73
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0030 begin`);
      const actual: number = satelliteRadius(1440);
      logInfo(`satelliteRadius(refreshHeight=1440): actual=${actual}`);
      expect(actual).assertEqual(73);
      logInfo(`${BUNDLE}SatelliteRadius_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0031
     * @tc.name      PullToRefresh_SatelliteRadius_0031
     * @tc.desc      satelliteRadius(refreshHeight=1536) returns 77.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0031 begin`);
      const actual: number = satelliteRadius(1536);
      logInfo(`satelliteRadius(refreshHeight=1536): actual=${actual}`);
      expect(actual).assertClose(77.8, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0032
     * @tc.name      PullToRefresh_SatelliteRadius_0032
     * @tc.desc      satelliteRadius(refreshHeight=1632) returns 82.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0032 begin`);
      const actual: number = satelliteRadius(1632);
      logInfo(`satelliteRadius(refreshHeight=1632): actual=${actual}`);
      expect(actual).assertClose(82.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0033
     * @tc.name      PullToRefresh_SatelliteRadius_0033
     * @tc.desc      satelliteRadius(refreshHeight=1728) returns 87.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0033 begin`);
      const actual: number = satelliteRadius(1728);
      logInfo(`satelliteRadius(refreshHeight=1728): actual=${actual}`);
      expect(actual).assertClose(87.4, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0034
     * @tc.name      PullToRefresh_SatelliteRadius_0034
     * @tc.desc      satelliteRadius(refreshHeight=1824) returns 92.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0034 begin`);
      const actual: number = satelliteRadius(1824);
      logInfo(`satelliteRadius(refreshHeight=1824): actual=${actual}`);
      expect(actual).assertClose(92.2, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0035
     * @tc.name      PullToRefresh_SatelliteRadius_0035
     * @tc.desc      satelliteRadius(refreshHeight=2016) returns 101.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0035 begin`);
      const actual: number = satelliteRadius(2016);
      logInfo(`satelliteRadius(refreshHeight=2016): actual=${actual}`);
      expect(actual).assertClose(101.8, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0036
     * @tc.name      PullToRefresh_SatelliteRadius_0036
     * @tc.desc      satelliteRadius(refreshHeight=2112) returns 106.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0036 begin`);
      const actual: number = satelliteRadius(2112);
      logInfo(`satelliteRadius(refreshHeight=2112): actual=${actual}`);
      expect(actual).assertClose(106.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0037
     * @tc.name      PullToRefresh_SatelliteRadius_0037
     * @tc.desc      satelliteRadius(refreshHeight=2208) returns 111.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0037 begin`);
      const actual: number = satelliteRadius(2208);
      logInfo(`satelliteRadius(refreshHeight=2208): actual=${actual}`);
      expect(actual).assertClose(111.4, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0038
     * @tc.name      PullToRefresh_SatelliteRadius_0038
     * @tc.desc      satelliteRadius(refreshHeight=2304) returns 116.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0038 begin`);
      const actual: number = satelliteRadius(2304);
      logInfo(`satelliteRadius(refreshHeight=2304): actual=${actual}`);
      expect(actual).assertClose(116.2, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0039
     * @tc.name      PullToRefresh_SatelliteRadius_0039
     * @tc.desc      satelliteRadius(refreshHeight=2400) returns 121
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0039 begin`);
      const actual: number = satelliteRadius(2400);
      logInfo(`satelliteRadius(refreshHeight=2400): actual=${actual}`);
      expect(actual).assertEqual(121);
      logInfo(`${BUNDLE}SatelliteRadius_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0040
     * @tc.name      PullToRefresh_SatelliteRadius_0040
     * @tc.desc      satelliteRadius(refreshHeight=2496) returns 125.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0040 begin`);
      const actual: number = satelliteRadius(2496);
      logInfo(`satelliteRadius(refreshHeight=2496): actual=${actual}`);
      expect(actual).assertClose(125.8, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0041
     * @tc.name      PullToRefresh_SatelliteRadius_0041
     * @tc.desc      satelliteRadius(refreshHeight=2592) returns 130.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0041 begin`);
      const actual: number = satelliteRadius(2592);
      logInfo(`satelliteRadius(refreshHeight=2592): actual=${actual}`);
      expect(actual).assertClose(130.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0042
     * @tc.name      PullToRefresh_SatelliteRadius_0042
     * @tc.desc      satelliteRadius(refreshHeight=2688) returns 135.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0042 begin`);
      const actual: number = satelliteRadius(2688);
      logInfo(`satelliteRadius(refreshHeight=2688): actual=${actual}`);
      expect(actual).assertClose(135.4, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0043
     * @tc.name      PullToRefresh_SatelliteRadius_0043
     * @tc.desc      satelliteRadius(refreshHeight=2784) returns 140.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0043 begin`);
      const actual: number = satelliteRadius(2784);
      logInfo(`satelliteRadius(refreshHeight=2784): actual=${actual}`);
      expect(actual).assertClose(140.2, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0044
     * @tc.name      PullToRefresh_SatelliteRadius_0044
     * @tc.desc      satelliteRadius(refreshHeight=2880) returns 145
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0044 begin`);
      const actual: number = satelliteRadius(2880);
      logInfo(`satelliteRadius(refreshHeight=2880): actual=${actual}`);
      expect(actual).assertEqual(145);
      logInfo(`${BUNDLE}SatelliteRadius_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0045
     * @tc.name      PullToRefresh_SatelliteRadius_0045
     * @tc.desc      satelliteRadius(refreshHeight=2976) returns 149.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0045 begin`);
      const actual: number = satelliteRadius(2976);
      logInfo(`satelliteRadius(refreshHeight=2976): actual=${actual}`);
      expect(actual).assertClose(149.8, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0046
     * @tc.name      PullToRefresh_SatelliteRadius_0046
     * @tc.desc      satelliteRadius(refreshHeight=3072) returns 154.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0046 begin`);
      const actual: number = satelliteRadius(3072);
      logInfo(`satelliteRadius(refreshHeight=3072): actual=${actual}`);
      expect(actual).assertClose(154.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0047
     * @tc.name      PullToRefresh_SatelliteRadius_0047
     * @tc.desc      satelliteRadius(refreshHeight=3168) returns 159.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0047 begin`);
      const actual: number = satelliteRadius(3168);
      logInfo(`satelliteRadius(refreshHeight=3168): actual=${actual}`);
      expect(actual).assertClose(159.4, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0048
     * @tc.name      PullToRefresh_SatelliteRadius_0048
     * @tc.desc      satelliteRadius(refreshHeight=3264) returns 164.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0048 begin`);
      const actual: number = satelliteRadius(3264);
      logInfo(`satelliteRadius(refreshHeight=3264): actual=${actual}`);
      expect(actual).assertClose(164.2, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0049
     * @tc.name      PullToRefresh_SatelliteRadius_0049
     * @tc.desc      satelliteRadius(refreshHeight=3360) returns 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0049 begin`);
      const actual: number = satelliteRadius(3360);
      logInfo(`satelliteRadius(refreshHeight=3360): actual=${actual}`);
      expect(actual).assertEqual(169);
      logInfo(`${BUNDLE}SatelliteRadius_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0050
     * @tc.name      PullToRefresh_SatelliteRadius_0050
     * @tc.desc      satelliteRadius(refreshHeight=3456) returns 173.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0050 begin`);
      const actual: number = satelliteRadius(3456);
      logInfo(`satelliteRadius(refreshHeight=3456): actual=${actual}`);
      expect(actual).assertClose(173.8, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0051
     * @tc.name      PullToRefresh_SatelliteRadius_0051
     * @tc.desc      satelliteRadius(refreshHeight=3552) returns 178.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0051 begin`);
      const actual: number = satelliteRadius(3552);
      logInfo(`satelliteRadius(refreshHeight=3552): actual=${actual}`);
      expect(actual).assertClose(178.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0052
     * @tc.name      PullToRefresh_SatelliteRadius_0052
     * @tc.desc      satelliteRadius(refreshHeight=3648) returns 183.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0052 begin`);
      const actual: number = satelliteRadius(3648);
      logInfo(`satelliteRadius(refreshHeight=3648): actual=${actual}`);
      expect(actual).assertClose(183.4, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0053
     * @tc.name      PullToRefresh_SatelliteRadius_0053
     * @tc.desc      satelliteRadius(refreshHeight=3744) returns 188.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0053 begin`);
      const actual: number = satelliteRadius(3744);
      logInfo(`satelliteRadius(refreshHeight=3744): actual=${actual}`);
      expect(actual).assertClose(188.2, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0054
     * @tc.name      PullToRefresh_SatelliteRadius_0054
     * @tc.desc      satelliteRadius(refreshHeight=3840) returns 193
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0054 begin`);
      const actual: number = satelliteRadius(3840);
      logInfo(`satelliteRadius(refreshHeight=3840): actual=${actual}`);
      expect(actual).assertEqual(193);
      logInfo(`${BUNDLE}SatelliteRadius_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0055
     * @tc.name      PullToRefresh_SatelliteRadius_0055
     * @tc.desc      satelliteRadius(refreshHeight=999) returns 50.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0055 begin`);
      const actual: number = satelliteRadius(999);
      logInfo(`satelliteRadius(refreshHeight=999): actual=${actual}`);
      expect(actual).assertClose(50.95, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0056
     * @tc.name      PullToRefresh_SatelliteRadius_0056
     * @tc.desc      satelliteRadius(refreshHeight=1737.01) returns 87.8505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0056 begin`);
      const actual: number = satelliteRadius(1737.01);
      logInfo(`satelliteRadius(refreshHeight=1737.01): actual=${actual}`);
      expect(actual).assertClose(87.8505, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0057
     * @tc.name      PullToRefresh_SatelliteRadius_0057
     * @tc.desc      satelliteRadius(refreshHeight=2852) returns 143.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0057 begin`);
      const actual: number = satelliteRadius(2852);
      logInfo(`satelliteRadius(refreshHeight=2852): actual=${actual}`);
      expect(actual).assertClose(143.6, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0058
     * @tc.name      PullToRefresh_SatelliteRadius_0058
     * @tc.desc      satelliteRadius(refreshHeight=1789) returns 90.45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_SatelliteRadius_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0058 begin`);
      const actual: number = satelliteRadius(1789);
      logInfo(`satelliteRadius(refreshHeight=1789): actual=${actual}`);
      expect(actual).assertClose(90.45, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_SATELLITE_RADIUS_0059
     * @tc.name      PullToRefresh_SatelliteRadius_0059
     * @tc.desc      satelliteRadius(refreshHeight=-1153) returns -56.65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_SatelliteRadius_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SatelliteRadius_0059 begin`);
      const actual: number = satelliteRadius(-1153);
      logInfo(`satelliteRadius(refreshHeight=-1153): actual=${actual}`);
      expect(actual).assertClose(-56.65, PRECISION);
      logInfo(`${BUNDLE}SatelliteRadius_0059 end`);
    });
  });
}
