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
import { refreshValueAfter } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for refreshValueAfter (59 cases). */
export default function refreshValueAfterTest(): void {
  describe('RefreshValueAfterTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0001
     * @tc.name      PullToRefresh_RefreshValueAfter_0001
     * @tc.desc      refreshValueAfter(ticks=0, refreshAnimDuration=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_RefreshValueAfter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0001 begin`);
      const actual: number = refreshValueAfter(0, 0);
      logInfo(`refreshValueAfter(ticks=0, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}RefreshValueAfter_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0002
     * @tc.name      PullToRefresh_RefreshValueAfter_0002
     * @tc.desc      refreshValueAfter(ticks=1, refreshAnimDuration=500) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_RefreshValueAfter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0002 begin`);
      const actual: number = refreshValueAfter(1, 500);
      logInfo(`refreshValueAfter(ticks=1, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0003
     * @tc.name      PullToRefresh_RefreshValueAfter_0003
     * @tc.desc      refreshValueAfter(ticks=1, refreshAnimDuration=-1) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0003 begin`);
      const actual: number = refreshValueAfter(1, -1);
      logInfo(`refreshValueAfter(ticks=1, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}RefreshValueAfter_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0004
     * @tc.name      PullToRefresh_RefreshValueAfter_0004
     * @tc.desc      refreshValueAfter(ticks=1, refreshAnimDuration=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0004 begin`);
      const actual: number = refreshValueAfter(1, 1);
      logInfo(`refreshValueAfter(ticks=1, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}RefreshValueAfter_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0005
     * @tc.name      PullToRefresh_RefreshValueAfter_0005
     * @tc.desc      refreshValueAfter(ticks=1, refreshAnimDuration=999) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0005 begin`);
      const actual: number = refreshValueAfter(1, 999);
      logInfo(`refreshValueAfter(ticks=1, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0006
     * @tc.name      PullToRefresh_RefreshValueAfter_0006
     * @tc.desc      refreshValueAfter(ticks=1, refreshAnimDuration=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0006 begin`);
      const actual: number = refreshValueAfter(1, 2);
      logInfo(`refreshValueAfter(ticks=1, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}RefreshValueAfter_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0007
     * @tc.name      PullToRefresh_RefreshValueAfter_0007
     * @tc.desc      refreshValueAfter(ticks=1, refreshAnimDuration=3) returns 3.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0007 begin`);
      const actual: number = refreshValueAfter(1, 3);
      logInfo(`refreshValueAfter(ticks=1, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(3.333, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0008
     * @tc.name      PullToRefresh_RefreshValueAfter_0008
     * @tc.desc      refreshValueAfter(ticks=1, refreshAnimDuration=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0008 begin`);
      const actual: number = refreshValueAfter(1, 10);
      logInfo(`refreshValueAfter(ticks=1, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}RefreshValueAfter_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0009
     * @tc.name      PullToRefresh_RefreshValueAfter_0009
     * @tc.desc      refreshValueAfter(ticks=1, refreshAnimDuration=100) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0009 begin`);
      const actual: number = refreshValueAfter(1, 100);
      logInfo(`refreshValueAfter(ticks=1, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0010
     * @tc.name      PullToRefresh_RefreshValueAfter_0010
     * @tc.desc      refreshValueAfter(ticks=2, refreshAnimDuration=500) returns 0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0010 begin`);
      const actual: number = refreshValueAfter(2, 500);
      logInfo(`refreshValueAfter(ticks=2, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.04, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0011
     * @tc.name      PullToRefresh_RefreshValueAfter_0011
     * @tc.desc      refreshValueAfter(ticks=2, refreshAnimDuration=-1) returns -20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0011 begin`);
      const actual: number = refreshValueAfter(2, -1);
      logInfo(`refreshValueAfter(ticks=2, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(-20);
      logInfo(`${BUNDLE}RefreshValueAfter_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0012
     * @tc.name      PullToRefresh_RefreshValueAfter_0012
     * @tc.desc      refreshValueAfter(ticks=2, refreshAnimDuration=1) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0012 begin`);
      const actual: number = refreshValueAfter(2, 1);
      logInfo(`refreshValueAfter(ticks=2, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}RefreshValueAfter_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0013
     * @tc.name      PullToRefresh_RefreshValueAfter_0013
     * @tc.desc      refreshValueAfter(ticks=2, refreshAnimDuration=2) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0013 begin`);
      const actual: number = refreshValueAfter(2, 2);
      logInfo(`refreshValueAfter(ticks=2, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}RefreshValueAfter_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0014
     * @tc.name      PullToRefresh_RefreshValueAfter_0014
     * @tc.desc      refreshValueAfter(ticks=2, refreshAnimDuration=3) returns 2.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0014 begin`);
      const actual: number = refreshValueAfter(2, 3);
      logInfo(`refreshValueAfter(ticks=2, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(2.333, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0015
     * @tc.name      PullToRefresh_RefreshValueAfter_0015
     * @tc.desc      refreshValueAfter(ticks=2, refreshAnimDuration=100) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0015 begin`);
      const actual: number = refreshValueAfter(2, 100);
      logInfo(`refreshValueAfter(ticks=2, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0016
     * @tc.name      PullToRefresh_RefreshValueAfter_0016
     * @tc.desc      refreshValueAfter(ticks=3, refreshAnimDuration=500) returns 0.06
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0016 begin`);
      const actual: number = refreshValueAfter(3, 500);
      logInfo(`refreshValueAfter(ticks=3, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.06, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0017
     * @tc.name      PullToRefresh_RefreshValueAfter_0017
     * @tc.desc      refreshValueAfter(ticks=3, refreshAnimDuration=-1) returns -30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0017 begin`);
      const actual: number = refreshValueAfter(3, -1);
      logInfo(`refreshValueAfter(ticks=3, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(-30);
      logInfo(`${BUNDLE}RefreshValueAfter_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0018
     * @tc.name      PullToRefresh_RefreshValueAfter_0018
     * @tc.desc      refreshValueAfter(ticks=3, refreshAnimDuration=1) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0018 begin`);
      const actual: number = refreshValueAfter(3, 1);
      logInfo(`refreshValueAfter(ticks=3, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}RefreshValueAfter_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0019
     * @tc.name      PullToRefresh_RefreshValueAfter_0019
     * @tc.desc      refreshValueAfter(ticks=3, refreshAnimDuration=999) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0019 begin`);
      const actual: number = refreshValueAfter(3, 999);
      logInfo(`refreshValueAfter(ticks=3, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0020
     * @tc.name      PullToRefresh_RefreshValueAfter_0020
     * @tc.desc      refreshValueAfter(ticks=3, refreshAnimDuration=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0020 begin`);
      const actual: number = refreshValueAfter(3, 2);
      logInfo(`refreshValueAfter(ticks=3, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}RefreshValueAfter_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0021
     * @tc.name      PullToRefresh_RefreshValueAfter_0021
     * @tc.desc      refreshValueAfter(ticks=3, refreshAnimDuration=3) returns 1.333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0021 begin`);
      const actual: number = refreshValueAfter(3, 3);
      logInfo(`refreshValueAfter(ticks=3, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(1.333, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0022
     * @tc.name      PullToRefresh_RefreshValueAfter_0022
     * @tc.desc      refreshValueAfter(ticks=3, refreshAnimDuration=100) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0022 begin`);
      const actual: number = refreshValueAfter(3, 100);
      logInfo(`refreshValueAfter(ticks=3, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0023
     * @tc.name      PullToRefresh_RefreshValueAfter_0023
     * @tc.desc      refreshValueAfter(ticks=10, refreshAnimDuration=-1) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0023 begin`);
      const actual: number = refreshValueAfter(10, -1);
      logInfo(`refreshValueAfter(ticks=10, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}RefreshValueAfter_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0024
     * @tc.name      PullToRefresh_RefreshValueAfter_0024
     * @tc.desc      refreshValueAfter(ticks=10, refreshAnimDuration=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0024 begin`);
      const actual: number = refreshValueAfter(10, 2);
      logInfo(`refreshValueAfter(ticks=10, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}RefreshValueAfter_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0025
     * @tc.name      PullToRefresh_RefreshValueAfter_0025
     * @tc.desc      refreshValueAfter(ticks=10, refreshAnimDuration=3) returns 2.999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0025 begin`);
      const actual: number = refreshValueAfter(10, 3);
      logInfo(`refreshValueAfter(ticks=10, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(2.999, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0026
     * @tc.name      PullToRefresh_RefreshValueAfter_0026
     * @tc.desc      refreshValueAfter(ticks=100, refreshAnimDuration=500) returns 0.98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0026 begin`);
      const actual: number = refreshValueAfter(100, 500);
      logInfo(`refreshValueAfter(ticks=100, refreshAnimD...: actual=${actual}`);
      expect(actual).assertClose(0.98, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0027
     * @tc.name      PullToRefresh_RefreshValueAfter_0027
     * @tc.desc      refreshValueAfter(ticks=100, refreshAnimDuration=-1) returns -1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0027 begin`);
      const actual: number = refreshValueAfter(100, -1);
      logInfo(`refreshValueAfter(ticks=100, refreshAnimD...: actual=${actual}`);
      expect(actual).assertEqual(-1000);
      logInfo(`${BUNDLE}RefreshValueAfter_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0028
     * @tc.name      PullToRefresh_RefreshValueAfter_0028
     * @tc.desc      refreshValueAfter(ticks=100, refreshAnimDuration=3) returns 3.992
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0028 begin`);
      const actual: number = refreshValueAfter(100, 3);
      logInfo(`refreshValueAfter(ticks=100, refreshAnimD...: actual=${actual}`);
      expect(actual).assertClose(3.992, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0029
     * @tc.name      PullToRefresh_RefreshValueAfter_0029
     * @tc.desc      refreshValueAfter(ticks=5, refreshAnimDuration=-1) returns -50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0029 begin`);
      const actual: number = refreshValueAfter(5, -1);
      logInfo(`refreshValueAfter(ticks=5, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(-50);
      logInfo(`${BUNDLE}RefreshValueAfter_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0030
     * @tc.name      PullToRefresh_RefreshValueAfter_0030
     * @tc.desc      refreshValueAfter(ticks=5, refreshAnimDuration=1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0030 begin`);
      const actual: number = refreshValueAfter(5, 1);
      logInfo(`refreshValueAfter(ticks=5, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}RefreshValueAfter_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0031
     * @tc.name      PullToRefresh_RefreshValueAfter_0031
     * @tc.desc      refreshValueAfter(ticks=5, refreshAnimDuration=999) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0031 begin`);
      const actual: number = refreshValueAfter(5, 999);
      logInfo(`refreshValueAfter(ticks=5, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0032
     * @tc.name      PullToRefresh_RefreshValueAfter_0032
     * @tc.desc      refreshValueAfter(ticks=5, refreshAnimDuration=3) returns 3.666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0032 begin`);
      const actual: number = refreshValueAfter(5, 3);
      logInfo(`refreshValueAfter(ticks=5, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(3.666, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0033
     * @tc.name      PullToRefresh_RefreshValueAfter_0033
     * @tc.desc      refreshValueAfter(ticks=5, refreshAnimDuration=100) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0033 begin`);
      const actual: number = refreshValueAfter(5, 100);
      logInfo(`refreshValueAfter(ticks=5, refreshAnimDur...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0034
     * @tc.name      PullToRefresh_RefreshValueAfter_0034
     * @tc.desc      refreshValueAfter(ticks=15, refreshAnimDuration=-1) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0034 begin`);
      const actual: number = refreshValueAfter(15, -1);
      logInfo(`refreshValueAfter(ticks=15, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-150);
      logInfo(`${BUNDLE}RefreshValueAfter_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0035
     * @tc.name      PullToRefresh_RefreshValueAfter_0035
     * @tc.desc      refreshValueAfter(ticks=15, refreshAnimDuration=1) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0035 begin`);
      const actual: number = refreshValueAfter(15, 1);
      logInfo(`refreshValueAfter(ticks=15, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}RefreshValueAfter_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0036
     * @tc.name      PullToRefresh_RefreshValueAfter_0036
     * @tc.desc      refreshValueAfter(ticks=15, refreshAnimDuration=999) returns 0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0036 begin`);
      const actual: number = refreshValueAfter(15, 999);
      logInfo(`refreshValueAfter(ticks=15, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.15, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0037
     * @tc.name      PullToRefresh_RefreshValueAfter_0037
     * @tc.desc      refreshValueAfter(ticks=15, refreshAnimDuration=3) returns 2.332
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0037 begin`);
      const actual: number = refreshValueAfter(15, 3);
      logInfo(`refreshValueAfter(ticks=15, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(2.332, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0038
     * @tc.name      PullToRefresh_RefreshValueAfter_0038
     * @tc.desc      refreshValueAfter(ticks=15, refreshAnimDuration=100) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0038 begin`);
      const actual: number = refreshValueAfter(15, 100);
      logInfo(`refreshValueAfter(ticks=15, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0039
     * @tc.name      PullToRefresh_RefreshValueAfter_0039
     * @tc.desc      refreshValueAfter(ticks=20, refreshAnimDuration=-1) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0039 begin`);
      const actual: number = refreshValueAfter(20, -1);
      logInfo(`refreshValueAfter(ticks=20, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-200);
      logInfo(`${BUNDLE}RefreshValueAfter_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0040
     * @tc.name      PullToRefresh_RefreshValueAfter_0040
     * @tc.desc      refreshValueAfter(ticks=20, refreshAnimDuration=3) returns 1.665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0040 begin`);
      const actual: number = refreshValueAfter(20, 3);
      logInfo(`refreshValueAfter(ticks=20, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(1.665, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0041
     * @tc.name      PullToRefresh_RefreshValueAfter_0041
     * @tc.desc      refreshValueAfter(ticks=20, refreshAnimDuration=100) returns 0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0041 begin`);
      const actual: number = refreshValueAfter(20, 100);
      logInfo(`refreshValueAfter(ticks=20, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.9, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0042
     * @tc.name      PullToRefresh_RefreshValueAfter_0042
     * @tc.desc      refreshValueAfter(ticks=25, refreshAnimDuration=-1) returns -250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0042 begin`);
      const actual: number = refreshValueAfter(25, -1);
      logInfo(`refreshValueAfter(ticks=25, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-250);
      logInfo(`${BUNDLE}RefreshValueAfter_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0043
     * @tc.name      PullToRefresh_RefreshValueAfter_0043
     * @tc.desc      refreshValueAfter(ticks=25, refreshAnimDuration=999) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0043 begin`);
      const actual: number = refreshValueAfter(25, 999);
      logInfo(`refreshValueAfter(ticks=25, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0044
     * @tc.name      PullToRefresh_RefreshValueAfter_0044
     * @tc.desc      refreshValueAfter(ticks=25, refreshAnimDuration=3) returns 0.998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0044 begin`);
      const actual: number = refreshValueAfter(25, 3);
      logInfo(`refreshValueAfter(ticks=25, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.998, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0045
     * @tc.name      PullToRefresh_RefreshValueAfter_0045
     * @tc.desc      refreshValueAfter(ticks=30, refreshAnimDuration=500) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0045 begin`);
      const actual: number = refreshValueAfter(30, 500);
      logInfo(`refreshValueAfter(ticks=30, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0046
     * @tc.name      PullToRefresh_RefreshValueAfter_0046
     * @tc.desc      refreshValueAfter(ticks=30, refreshAnimDuration=-1) returns -300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0046 begin`);
      const actual: number = refreshValueAfter(30, -1);
      logInfo(`refreshValueAfter(ticks=30, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-300);
      logInfo(`${BUNDLE}RefreshValueAfter_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0047
     * @tc.name      PullToRefresh_RefreshValueAfter_0047
     * @tc.desc      refreshValueAfter(ticks=30, refreshAnimDuration=3) returns 0.331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0047 begin`);
      const actual: number = refreshValueAfter(30, 3);
      logInfo(`refreshValueAfter(ticks=30, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.331, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0048
     * @tc.name      PullToRefresh_RefreshValueAfter_0048
     * @tc.desc      refreshValueAfter(ticks=30, refreshAnimDuration=100) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0048 begin`);
      const actual: number = refreshValueAfter(30, 100);
      logInfo(`refreshValueAfter(ticks=30, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0049
     * @tc.name      PullToRefresh_RefreshValueAfter_0049
     * @tc.desc      refreshValueAfter(ticks=35, refreshAnimDuration=500) returns 0.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0049 begin`);
      const actual: number = refreshValueAfter(35, 500);
      logInfo(`refreshValueAfter(ticks=35, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.7, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0050
     * @tc.name      PullToRefresh_RefreshValueAfter_0050
     * @tc.desc      refreshValueAfter(ticks=35, refreshAnimDuration=-1) returns -350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0050 begin`);
      const actual: number = refreshValueAfter(35, -1);
      logInfo(`refreshValueAfter(ticks=35, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-350);
      logInfo(`${BUNDLE}RefreshValueAfter_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0051
     * @tc.name      PullToRefresh_RefreshValueAfter_0051
     * @tc.desc      refreshValueAfter(ticks=35, refreshAnimDuration=999) returns 0.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0051 begin`);
      const actual: number = refreshValueAfter(35, 999);
      logInfo(`refreshValueAfter(ticks=35, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.35, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0052
     * @tc.name      PullToRefresh_RefreshValueAfter_0052
     * @tc.desc      refreshValueAfter(ticks=35, refreshAnimDuration=3) returns 3.997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0052 begin`);
      const actual: number = refreshValueAfter(35, 3);
      logInfo(`refreshValueAfter(ticks=35, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(3.997, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0053
     * @tc.name      PullToRefresh_RefreshValueAfter_0053
     * @tc.desc      refreshValueAfter(ticks=40, refreshAnimDuration=-1) returns -400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0053 begin`);
      const actual: number = refreshValueAfter(40, -1);
      logInfo(`refreshValueAfter(ticks=40, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-400);
      logInfo(`${BUNDLE}RefreshValueAfter_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0054
     * @tc.name      PullToRefresh_RefreshValueAfter_0054
     * @tc.desc      refreshValueAfter(ticks=40, refreshAnimDuration=3) returns 3.33
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0054 begin`);
      const actual: number = refreshValueAfter(40, 3);
      logInfo(`refreshValueAfter(ticks=40, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(3.33, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0055
     * @tc.name      PullToRefresh_RefreshValueAfter_0055
     * @tc.desc      refreshValueAfter(ticks=45, refreshAnimDuration=-1) returns -450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0055 begin`);
      const actual: number = refreshValueAfter(45, -1);
      logInfo(`refreshValueAfter(ticks=45, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-450);
      logInfo(`${BUNDLE}RefreshValueAfter_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0056
     * @tc.name      PullToRefresh_RefreshValueAfter_0056
     * @tc.desc      refreshValueAfter(ticks=45, refreshAnimDuration=999) returns 0.45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0056 begin`);
      const actual: number = refreshValueAfter(45, 999);
      logInfo(`refreshValueAfter(ticks=45, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(0.45, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0057
     * @tc.name      PullToRefresh_RefreshValueAfter_0057
     * @tc.desc      refreshValueAfter(ticks=45, refreshAnimDuration=3) returns 2.663
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0057 begin`);
      const actual: number = refreshValueAfter(45, 3);
      logInfo(`refreshValueAfter(ticks=45, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(2.663, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0058
     * @tc.name      PullToRefresh_RefreshValueAfter_0058
     * @tc.desc      refreshValueAfter(ticks=50, refreshAnimDuration=-1) returns -500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_RefreshValueAfter_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0058 begin`);
      const actual: number = refreshValueAfter(50, -1);
      logInfo(`refreshValueAfter(ticks=50, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertEqual(-500);
      logInfo(`${BUNDLE}RefreshValueAfter_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_VALUE_AFTER_0059
     * @tc.name      PullToRefresh_RefreshValueAfter_0059
     * @tc.desc      refreshValueAfter(ticks=50, refreshAnimDuration=3) returns 1.996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshValueAfter_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshValueAfter_0059 begin`);
      const actual: number = refreshValueAfter(50, 3);
      logInfo(`refreshValueAfter(ticks=50, refreshAnimDu...: actual=${actual}`);
      expect(actual).assertClose(1.996, PRECISION);
      logInfo(`${BUNDLE}RefreshValueAfter_0059 end`);
    });
  });
}
