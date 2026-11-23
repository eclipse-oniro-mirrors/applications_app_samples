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
import { refreshTick } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for refreshTick (59 cases). */
export default function refreshTickTest(): void {
  describe('RefreshTickTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0001
     * @tc.name      PullToRefresh_RefreshTick_0001
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_RefreshTick_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshTick_0001 begin`);
      const actual: number = refreshTick(1, 0);
      logInfo(`refreshTick(value=1, refreshAnimDuration=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0002
     * @tc.name      PullToRefresh_RefreshTick_0002
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=500) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_RefreshTick_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshTick_0002 begin`);
      const actual: number = refreshTick(0, 500);
      logInfo(`refreshTick(value=0, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0003
     * @tc.name      PullToRefresh_RefreshTick_0003
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0003 begin`);
      const actual: number = refreshTick(0, 1);
      logInfo(`refreshTick(value=0, refreshAnimDuration=1): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RefreshTick_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0004
     * @tc.name      PullToRefresh_RefreshTick_0004
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0004 begin`);
      const actual: number = refreshTick(0, 2);
      logInfo(`refreshTick(value=0, refreshAnimDuration=2): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RefreshTick_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0005
     * @tc.name      PullToRefresh_RefreshTick_0005
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=-1) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0005 begin`);
      const actual: number = refreshTick(0, -1);
      logInfo(`refreshTick(value=0, refreshAnimDuration=-1): actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}RefreshTick_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0006
     * @tc.name      PullToRefresh_RefreshTick_0006
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0006 begin`);
      const actual: number = refreshTick(0, 10);
      logInfo(`refreshTick(value=0, refreshAnimDuration=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RefreshTick_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0007
     * @tc.name      PullToRefresh_RefreshTick_0007
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=9) returns 1.111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0007 begin`);
      const actual: number = refreshTick(0, 9);
      logInfo(`refreshTick(value=0, refreshAnimDuration=9): actual=${actual}`);
      expect(actual).assertClose(1.111, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0008
     * @tc.name      PullToRefresh_RefreshTick_0008
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=11) returns 0.909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0008 begin`);
      const actual: number = refreshTick(0, 11);
      logInfo(`refreshTick(value=0, refreshAnimDuration=11): actual=${actual}`);
      expect(actual).assertClose(0.909, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0009
     * @tc.name      PullToRefresh_RefreshTick_0009
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=20) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0009 begin`);
      const actual: number = refreshTick(0, 20);
      logInfo(`refreshTick(value=0, refreshAnimDuration=20): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0010
     * @tc.name      PullToRefresh_RefreshTick_0010
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0010 begin`);
      const actual: number = refreshTick(0, 5);
      logInfo(`refreshTick(value=0, refreshAnimDuration=5): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RefreshTick_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0011
     * @tc.name      PullToRefresh_RefreshTick_0011
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=1000) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0011 begin`);
      const actual: number = refreshTick(0, 1000);
      logInfo(`refreshTick(value=0, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0012
     * @tc.name      PullToRefresh_RefreshTick_0012
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=2000) returns 0.005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0012 begin`);
      const actual: number = refreshTick(0, 2000);
      logInfo(`refreshTick(value=0, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertClose(0.005, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0013
     * @tc.name      PullToRefresh_RefreshTick_0013
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=3) returns 3.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0013 begin`);
      const actual: number = refreshTick(0, 3);
      logInfo(`refreshTick(value=0, refreshAnimDuration=3): actual=${actual}`);
      expect(actual).assertClose(3.333, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0014
     * @tc.name      PullToRefresh_RefreshTick_0014
     * @tc.desc      refreshTick(value=0, refreshAnimDuration=100) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0014 begin`);
      const actual: number = refreshTick(0, 100);
      logInfo(`refreshTick(value=0, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0015
     * @tc.name      PullToRefresh_RefreshTick_0015
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=0) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0015 begin`);
      const actual: number = refreshTick(-1, 0);
      logInfo(`refreshTick(value=-1, refreshAnimDuration=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}RefreshTick_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0016
     * @tc.name      PullToRefresh_RefreshTick_0016
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=500) returns -0.98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0016 begin`);
      const actual: number = refreshTick(-1, 500);
      logInfo(`refreshTick(value=-1, refreshAnimDuration...: actual=${actual}`);
      expect(actual).assertClose(-0.98, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0017
     * @tc.name      PullToRefresh_RefreshTick_0017
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=1) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0017 begin`);
      const actual: number = refreshTick(-1, 1);
      logInfo(`refreshTick(value=-1, refreshAnimDuration=1): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}RefreshTick_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0018
     * @tc.name      PullToRefresh_RefreshTick_0018
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0018 begin`);
      const actual: number = refreshTick(-1, 2);
      logInfo(`refreshTick(value=-1, refreshAnimDuration=2): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RefreshTick_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0019
     * @tc.name      PullToRefresh_RefreshTick_0019
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=-1) returns -11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0019 begin`);
      const actual: number = refreshTick(-1, -1);
      logInfo(`refreshTick(value=-1, refreshAnimDuration...: actual=${actual}`);
      expect(actual).assertEqual(-11);
      logInfo(`${BUNDLE}RefreshTick_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0020
     * @tc.name      PullToRefresh_RefreshTick_0020
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=9) returns 0.111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0020 begin`);
      const actual: number = refreshTick(-1, 9);
      logInfo(`refreshTick(value=-1, refreshAnimDuration=9): actual=${actual}`);
      expect(actual).assertClose(0.111, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0021
     * @tc.name      PullToRefresh_RefreshTick_0021
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=11) returns -0.091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0021 begin`);
      const actual: number = refreshTick(-1, 11);
      logInfo(`refreshTick(value=-1, refreshAnimDuration...: actual=${actual}`);
      expect(actual).assertClose(-0.091, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0022
     * @tc.name      PullToRefresh_RefreshTick_0022
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=20) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0022 begin`);
      const actual: number = refreshTick(-1, 20);
      logInfo(`refreshTick(value=-1, refreshAnimDuration...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0023
     * @tc.name      PullToRefresh_RefreshTick_0023
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=1000) returns -0.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0023 begin`);
      const actual: number = refreshTick(-1, 1000);
      logInfo(`refreshTick(value=-1, refreshAnimDuration...: actual=${actual}`);
      expect(actual).assertClose(-0.99, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0024
     * @tc.name      PullToRefresh_RefreshTick_0024
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=2000) returns -0.995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0024 begin`);
      const actual: number = refreshTick(-1, 2000);
      logInfo(`refreshTick(value=-1, refreshAnimDuration...: actual=${actual}`);
      expect(actual).assertClose(-0.995, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0025
     * @tc.name      PullToRefresh_RefreshTick_0025
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=3) returns 2.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0025 begin`);
      const actual: number = refreshTick(-1, 3);
      logInfo(`refreshTick(value=-1, refreshAnimDuration=3): actual=${actual}`);
      expect(actual).assertClose(2.333, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0026
     * @tc.name      PullToRefresh_RefreshTick_0026
     * @tc.desc      refreshTick(value=-1, refreshAnimDuration=100) returns -0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0026 begin`);
      const actual: number = refreshTick(-1, 100);
      logInfo(`refreshTick(value=-1, refreshAnimDuration...: actual=${actual}`);
      expect(actual).assertClose(-0.9, PRECISION);
      logInfo(`${BUNDLE}RefreshTick_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0027
     * @tc.name      PullToRefresh_RefreshTick_0027
     * @tc.desc      refreshTick(value=9, refreshAnimDuration=0) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0027 begin`);
      const actual: number = refreshTick(9, 0);
      logInfo(`refreshTick(value=9, refreshAnimDuration=0): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RefreshTick_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0028
     * @tc.name      PullToRefresh_RefreshTick_0028
     * @tc.desc      refreshTick(value=20, refreshAnimDuration=0) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0028 begin`);
      const actual: number = refreshTick(20, 0);
      logInfo(`refreshTick(value=20, refreshAnimDuration=0): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}RefreshTick_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0029
     * @tc.name      PullToRefresh_RefreshTick_0029
     * @tc.desc      refreshTick(value=1000, refreshAnimDuration=0) returns 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0029 begin`);
      const actual: number = refreshTick(1000, 0);
      logInfo(`refreshTick(value=1000, refreshAnimDurati...: actual=${actual}`);
      expect(actual).assertEqual(999);
      logInfo(`${BUNDLE}RefreshTick_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0030
     * @tc.name      PullToRefresh_RefreshTick_0030
     * @tc.desc      refreshTick(value=999, refreshAnimDuration=0) returns 998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0030 begin`);
      const actual: number = refreshTick(999, 0);
      logInfo(`refreshTick(value=999, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(998);
      logInfo(`${BUNDLE}RefreshTick_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0031
     * @tc.name      PullToRefresh_RefreshTick_0031
     * @tc.desc      refreshTick(value=1001, refreshAnimDuration=0) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0031 begin`);
      const actual: number = refreshTick(1001, 0);
      logInfo(`refreshTick(value=1001, refreshAnimDurati...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}RefreshTick_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0032
     * @tc.name      PullToRefresh_RefreshTick_0032
     * @tc.desc      refreshTick(value=2000, refreshAnimDuration=0) returns 1999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0032 begin`);
      const actual: number = refreshTick(2000, 0);
      logInfo(`refreshTick(value=2000, refreshAnimDurati...: actual=${actual}`);
      expect(actual).assertEqual(1999);
      logInfo(`${BUNDLE}RefreshTick_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0033
     * @tc.name      PullToRefresh_RefreshTick_0033
     * @tc.desc      refreshTick(value=500, refreshAnimDuration=0) returns 499
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0033 begin`);
      const actual: number = refreshTick(500, 0);
      logInfo(`refreshTick(value=500, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(499);
      logInfo(`${BUNDLE}RefreshTick_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0034
     * @tc.name      PullToRefresh_RefreshTick_0034
     * @tc.desc      refreshTick(value=100, refreshAnimDuration=0) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0034 begin`);
      const actual: number = refreshTick(100, 0);
      logInfo(`refreshTick(value=100, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}RefreshTick_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0035
     * @tc.name      PullToRefresh_RefreshTick_0035
     * @tc.desc      refreshTick(value=200, refreshAnimDuration=0) returns 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0035 begin`);
      const actual: number = refreshTick(200, 0);
      logInfo(`refreshTick(value=200, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(199);
      logInfo(`${BUNDLE}RefreshTick_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0036
     * @tc.name      PullToRefresh_RefreshTick_0036
     * @tc.desc      refreshTick(value=300, refreshAnimDuration=0) returns 299
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0036 begin`);
      const actual: number = refreshTick(300, 0);
      logInfo(`refreshTick(value=300, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(299);
      logInfo(`${BUNDLE}RefreshTick_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0037
     * @tc.name      PullToRefresh_RefreshTick_0037
     * @tc.desc      refreshTick(value=400, refreshAnimDuration=0) returns 399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0037 begin`);
      const actual: number = refreshTick(400, 0);
      logInfo(`refreshTick(value=400, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(399);
      logInfo(`${BUNDLE}RefreshTick_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0038
     * @tc.name      PullToRefresh_RefreshTick_0038
     * @tc.desc      refreshTick(value=600, refreshAnimDuration=0) returns 599
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0038 begin`);
      const actual: number = refreshTick(600, 0);
      logInfo(`refreshTick(value=600, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(599);
      logInfo(`${BUNDLE}RefreshTick_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0039
     * @tc.name      PullToRefresh_RefreshTick_0039
     * @tc.desc      refreshTick(value=700, refreshAnimDuration=0) returns 699
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0039 begin`);
      const actual: number = refreshTick(700, 0);
      logInfo(`refreshTick(value=700, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(699);
      logInfo(`${BUNDLE}RefreshTick_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0040
     * @tc.name      PullToRefresh_RefreshTick_0040
     * @tc.desc      refreshTick(value=800, refreshAnimDuration=0) returns 799
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0040 begin`);
      const actual: number = refreshTick(800, 0);
      logInfo(`refreshTick(value=800, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(799);
      logInfo(`${BUNDLE}RefreshTick_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0041
     * @tc.name      PullToRefresh_RefreshTick_0041
     * @tc.desc      refreshTick(value=900, refreshAnimDuration=0) returns 899
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0041 begin`);
      const actual: number = refreshTick(900, 0);
      logInfo(`refreshTick(value=900, refreshAnimDuratio...: actual=${actual}`);
      expect(actual).assertEqual(899);
      logInfo(`${BUNDLE}RefreshTick_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0042
     * @tc.name      PullToRefresh_RefreshTick_0042
     * @tc.desc      refreshTick(value=1100, refreshAnimDuration=0) returns 1099
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0042 begin`);
      const actual: number = refreshTick(1100, 0);
      logInfo(`refreshTick(value=1100, refreshAnimDurati...: actual=${actual}`);
      expect(actual).assertEqual(1099);
      logInfo(`${BUNDLE}RefreshTick_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0043
     * @tc.name      PullToRefresh_RefreshTick_0043
     * @tc.desc      refreshTick(value=1200, refreshAnimDuration=0) returns 1199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0043 begin`);
      const actual: number = refreshTick(1200, 0);
      logInfo(`refreshTick(value=1200, refreshAnimDurati...: actual=${actual}`);
      expect(actual).assertEqual(1199);
      logInfo(`${BUNDLE}RefreshTick_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0044
     * @tc.name      PullToRefresh_RefreshTick_0044
     * @tc.desc      refreshTick(value=1300, refreshAnimDuration=0) returns 1299
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0044 begin`);
      const actual: number = refreshTick(1300, 0);
      logInfo(`refreshTick(value=1300, refreshAnimDurati...: actual=${actual}`);
      expect(actual).assertEqual(1299);
      logInfo(`${BUNDLE}RefreshTick_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0045
     * @tc.name      PullToRefresh_RefreshTick_0045
     * @tc.desc      refreshTick(value=1400, refreshAnimDuration=0) returns 1399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTick_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTick_0045 begin`);
      const actual: number = refreshTick(1400, 0);
      logInfo(`refreshTick(value=1400, refreshAnimDurati...: actual=${actual}`);
      expect(actual).assertEqual(1399);
      logInfo(`${BUNDLE}RefreshTick_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0046
     * @tc.name      PullToRefresh_RefreshTick_0046
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=500) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0046 begin`);
      const actual: number = refreshTick(1, 500);
      logInfo(`refreshTick(value=1, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0047
     * @tc.name      PullToRefresh_RefreshTick_0047
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0047 begin`);
      const actual: number = refreshTick(1, 1);
      logInfo(`refreshTick(value=1, refreshAnimDuration=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0048
     * @tc.name      PullToRefresh_RefreshTick_0048
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0048 begin`);
      const actual: number = refreshTick(1, 2);
      logInfo(`refreshTick(value=1, refreshAnimDuration=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0049
     * @tc.name      PullToRefresh_RefreshTick_0049
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0049 begin`);
      const actual: number = refreshTick(1, -1);
      logInfo(`refreshTick(value=1, refreshAnimDuration=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0050
     * @tc.name      PullToRefresh_RefreshTick_0050
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0050 begin`);
      const actual: number = refreshTick(1, 10);
      logInfo(`refreshTick(value=1, refreshAnimDuration=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0051
     * @tc.name      PullToRefresh_RefreshTick_0051
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=9) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0051 begin`);
      const actual: number = refreshTick(1, 9);
      logInfo(`refreshTick(value=1, refreshAnimDuration=9): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0052
     * @tc.name      PullToRefresh_RefreshTick_0052
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0052 begin`);
      const actual: number = refreshTick(1, 11);
      logInfo(`refreshTick(value=1, refreshAnimDuration=11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0053
     * @tc.name      PullToRefresh_RefreshTick_0053
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0053 begin`);
      const actual: number = refreshTick(1, 20);
      logInfo(`refreshTick(value=1, refreshAnimDuration=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0054
     * @tc.name      PullToRefresh_RefreshTick_0054
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0054 begin`);
      const actual: number = refreshTick(1, 5);
      logInfo(`refreshTick(value=1, refreshAnimDuration=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0055
     * @tc.name      PullToRefresh_RefreshTick_0055
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=1000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0055 begin`);
      const actual: number = refreshTick(1, 1000);
      logInfo(`refreshTick(value=1, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0056
     * @tc.name      PullToRefresh_RefreshTick_0056
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=999) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0056 begin`);
      const actual: number = refreshTick(1, 999);
      logInfo(`refreshTick(value=1, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0057
     * @tc.name      PullToRefresh_RefreshTick_0057
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=1001) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0057 begin`);
      const actual: number = refreshTick(1, 1001);
      logInfo(`refreshTick(value=1, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0058
     * @tc.name      PullToRefresh_RefreshTick_0058
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=2000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0058 begin`);
      const actual: number = refreshTick(1, 2000);
      logInfo(`refreshTick(value=1, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TICK_0059
     * @tc.name      PullToRefresh_RefreshTick_0059
     * @tc.desc      refreshTick(value=1, refreshAnimDuration=59999) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshTick_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshTick_0059 begin`);
      const actual: number = refreshTick(1, 59999);
      logInfo(`refreshTick(value=1, refreshAnimDuration=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshTick_0059 end`);
    });
  });
}
