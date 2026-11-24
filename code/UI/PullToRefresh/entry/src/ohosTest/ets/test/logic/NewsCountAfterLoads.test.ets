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
import { newsCountAfterLoads } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for newsCountAfterLoads (59 cases). */
export default function newsCountAfterLoadsTest(): void {
  describe('NewsCountAfterLoadsTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0001
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0001
     * @tc.desc      newsCountAfterLoads(loads=1) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsCountAfterLoads_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0001 begin`);
      const actual: number = newsCountAfterLoads(1);
      logInfo(`newsCountAfterLoads(loads=1): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0002
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0002
     * @tc.desc      newsCountAfterLoads(loads=0) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NewsCountAfterLoads_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0002 begin`);
      const actual: number = newsCountAfterLoads(0);
      logInfo(`newsCountAfterLoads(loads=0): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0003
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0003
     * @tc.desc      newsCountAfterLoads(loads=2) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsCountAfterLoads_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0003 begin`);
      const actual: number = newsCountAfterLoads(2);
      logInfo(`newsCountAfterLoads(loads=2): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0004
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0004
     * @tc.desc      newsCountAfterLoads(loads=3) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0004 begin`);
      const actual: number = newsCountAfterLoads(3);
      logInfo(`newsCountAfterLoads(loads=3): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0005
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0005
     * @tc.desc      newsCountAfterLoads(loads=-1) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NewsCountAfterLoads_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0005 begin`);
      const actual: number = newsCountAfterLoads(-1);
      logInfo(`newsCountAfterLoads(loads=-1): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0006
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0006
     * @tc.desc      newsCountAfterLoads(loads=10) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0006 begin`);
      const actual: number = newsCountAfterLoads(10);
      logInfo(`newsCountAfterLoads(loads=10): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0007
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0007
     * @tc.desc      newsCountAfterLoads(loads=100) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0007 begin`);
      const actual: number = newsCountAfterLoads(100);
      logInfo(`newsCountAfterLoads(loads=100): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0008
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0008
     * @tc.desc      newsCountAfterLoads(loads=5) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0008 begin`);
      const actual: number = newsCountAfterLoads(5);
      logInfo(`newsCountAfterLoads(loads=5): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0009
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0009
     * @tc.desc      newsCountAfterLoads(loads=15) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0009 begin`);
      const actual: number = newsCountAfterLoads(15);
      logInfo(`newsCountAfterLoads(loads=15): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0010
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0010
     * @tc.desc      newsCountAfterLoads(loads=20) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0010 begin`);
      const actual: number = newsCountAfterLoads(20);
      logInfo(`newsCountAfterLoads(loads=20): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0011
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0011
     * @tc.desc      newsCountAfterLoads(loads=25) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0011 begin`);
      const actual: number = newsCountAfterLoads(25);
      logInfo(`newsCountAfterLoads(loads=25): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0012
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0012
     * @tc.desc      newsCountAfterLoads(loads=30) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0012 begin`);
      const actual: number = newsCountAfterLoads(30);
      logInfo(`newsCountAfterLoads(loads=30): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0013
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0013
     * @tc.desc      newsCountAfterLoads(loads=35) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0013 begin`);
      const actual: number = newsCountAfterLoads(35);
      logInfo(`newsCountAfterLoads(loads=35): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0014
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0014
     * @tc.desc      newsCountAfterLoads(loads=40) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0014 begin`);
      const actual: number = newsCountAfterLoads(40);
      logInfo(`newsCountAfterLoads(loads=40): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0015
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0015
     * @tc.desc      newsCountAfterLoads(loads=45) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0015 begin`);
      const actual: number = newsCountAfterLoads(45);
      logInfo(`newsCountAfterLoads(loads=45): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0016
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0016
     * @tc.desc      newsCountAfterLoads(loads=50) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0016 begin`);
      const actual: number = newsCountAfterLoads(50);
      logInfo(`newsCountAfterLoads(loads=50): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0017
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0017
     * @tc.desc      newsCountAfterLoads(loads=55) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0017 begin`);
      const actual: number = newsCountAfterLoads(55);
      logInfo(`newsCountAfterLoads(loads=55): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0018
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0018
     * @tc.desc      newsCountAfterLoads(loads=60) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0018 begin`);
      const actual: number = newsCountAfterLoads(60);
      logInfo(`newsCountAfterLoads(loads=60): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0019
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0019
     * @tc.desc      newsCountAfterLoads(loads=65) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0019 begin`);
      const actual: number = newsCountAfterLoads(65);
      logInfo(`newsCountAfterLoads(loads=65): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0020
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0020
     * @tc.desc      newsCountAfterLoads(loads=70) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0020 begin`);
      const actual: number = newsCountAfterLoads(70);
      logInfo(`newsCountAfterLoads(loads=70): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0021
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0021
     * @tc.desc      newsCountAfterLoads(loads=75) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0021 begin`);
      const actual: number = newsCountAfterLoads(75);
      logInfo(`newsCountAfterLoads(loads=75): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0022
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0022
     * @tc.desc      newsCountAfterLoads(loads=80) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0022 begin`);
      const actual: number = newsCountAfterLoads(80);
      logInfo(`newsCountAfterLoads(loads=80): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0023
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0023
     * @tc.desc      newsCountAfterLoads(loads=85) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0023 begin`);
      const actual: number = newsCountAfterLoads(85);
      logInfo(`newsCountAfterLoads(loads=85): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0024
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0024
     * @tc.desc      newsCountAfterLoads(loads=90) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0024 begin`);
      const actual: number = newsCountAfterLoads(90);
      logInfo(`newsCountAfterLoads(loads=90): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0025
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0025
     * @tc.desc      newsCountAfterLoads(loads=95) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0025 begin`);
      const actual: number = newsCountAfterLoads(95);
      logInfo(`newsCountAfterLoads(loads=95): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0026
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0026
     * @tc.desc      newsCountAfterLoads(loads=105) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0026 begin`);
      const actual: number = newsCountAfterLoads(105);
      logInfo(`newsCountAfterLoads(loads=105): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0027
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0027
     * @tc.desc      newsCountAfterLoads(loads=110) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0027 begin`);
      const actual: number = newsCountAfterLoads(110);
      logInfo(`newsCountAfterLoads(loads=110): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0028
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0028
     * @tc.desc      newsCountAfterLoads(loads=115) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0028 begin`);
      const actual: number = newsCountAfterLoads(115);
      logInfo(`newsCountAfterLoads(loads=115): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0029
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0029
     * @tc.desc      newsCountAfterLoads(loads=120) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0029 begin`);
      const actual: number = newsCountAfterLoads(120);
      logInfo(`newsCountAfterLoads(loads=120): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0030
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0030
     * @tc.desc      newsCountAfterLoads(loads=125) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0030 begin`);
      const actual: number = newsCountAfterLoads(125);
      logInfo(`newsCountAfterLoads(loads=125): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0031
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0031
     * @tc.desc      newsCountAfterLoads(loads=130) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0031 begin`);
      const actual: number = newsCountAfterLoads(130);
      logInfo(`newsCountAfterLoads(loads=130): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0032
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0032
     * @tc.desc      newsCountAfterLoads(loads=135) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0032 begin`);
      const actual: number = newsCountAfterLoads(135);
      logInfo(`newsCountAfterLoads(loads=135): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0033
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0033
     * @tc.desc      newsCountAfterLoads(loads=140) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0033 begin`);
      const actual: number = newsCountAfterLoads(140);
      logInfo(`newsCountAfterLoads(loads=140): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0034
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0034
     * @tc.desc      newsCountAfterLoads(loads=145) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0034 begin`);
      const actual: number = newsCountAfterLoads(145);
      logInfo(`newsCountAfterLoads(loads=145): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0035
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0035
     * @tc.desc      newsCountAfterLoads(loads=150) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0035 begin`);
      const actual: number = newsCountAfterLoads(150);
      logInfo(`newsCountAfterLoads(loads=150): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0036
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0036
     * @tc.desc      newsCountAfterLoads(loads=155) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0036 begin`);
      const actual: number = newsCountAfterLoads(155);
      logInfo(`newsCountAfterLoads(loads=155): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0037
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0037
     * @tc.desc      newsCountAfterLoads(loads=160) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0037 begin`);
      const actual: number = newsCountAfterLoads(160);
      logInfo(`newsCountAfterLoads(loads=160): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0038
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0038
     * @tc.desc      newsCountAfterLoads(loads=165) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0038 begin`);
      const actual: number = newsCountAfterLoads(165);
      logInfo(`newsCountAfterLoads(loads=165): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0039
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0039
     * @tc.desc      newsCountAfterLoads(loads=170) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0039 begin`);
      const actual: number = newsCountAfterLoads(170);
      logInfo(`newsCountAfterLoads(loads=170): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0040
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0040
     * @tc.desc      newsCountAfterLoads(loads=175) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0040 begin`);
      const actual: number = newsCountAfterLoads(175);
      logInfo(`newsCountAfterLoads(loads=175): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0041
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0041
     * @tc.desc      newsCountAfterLoads(loads=180) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0041 begin`);
      const actual: number = newsCountAfterLoads(180);
      logInfo(`newsCountAfterLoads(loads=180): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0042
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0042
     * @tc.desc      newsCountAfterLoads(loads=185) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0042 begin`);
      const actual: number = newsCountAfterLoads(185);
      logInfo(`newsCountAfterLoads(loads=185): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0043
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0043
     * @tc.desc      newsCountAfterLoads(loads=190) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0043 begin`);
      const actual: number = newsCountAfterLoads(190);
      logInfo(`newsCountAfterLoads(loads=190): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0044
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0044
     * @tc.desc      newsCountAfterLoads(loads=195) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0044 begin`);
      const actual: number = newsCountAfterLoads(195);
      logInfo(`newsCountAfterLoads(loads=195): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0045
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0045
     * @tc.desc      newsCountAfterLoads(loads=200) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0045 begin`);
      const actual: number = newsCountAfterLoads(200);
      logInfo(`newsCountAfterLoads(loads=200): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0046
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0046
     * @tc.desc      newsCountAfterLoads(loads=-37) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NewsCountAfterLoads_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0046 begin`);
      const actual: number = newsCountAfterLoads(-37);
      logInfo(`newsCountAfterLoads(loads=-37): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0047
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0047
     * @tc.desc      newsCountAfterLoads(loads=151) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0047 begin`);
      const actual: number = newsCountAfterLoads(151);
      logInfo(`newsCountAfterLoads(loads=151): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0048
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0048
     * @tc.desc      newsCountAfterLoads(loads=80.63) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0048 begin`);
      const actual: number = newsCountAfterLoads(80.63);
      logInfo(`newsCountAfterLoads(loads=80.63): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0049
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0049
     * @tc.desc      newsCountAfterLoads(loads=-40) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NewsCountAfterLoads_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0049 begin`);
      const actual: number = newsCountAfterLoads(-40);
      logInfo(`newsCountAfterLoads(loads=-40): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0050
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0050
     * @tc.desc      newsCountAfterLoads(loads=139) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0050 begin`);
      const actual: number = newsCountAfterLoads(139);
      logInfo(`newsCountAfterLoads(loads=139): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0051
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0051
     * @tc.desc      newsCountAfterLoads(loads=22.74) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0051 begin`);
      const actual: number = newsCountAfterLoads(22.74);
      logInfo(`newsCountAfterLoads(loads=22.74): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0052
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0052
     * @tc.desc      newsCountAfterLoads(loads=162) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0052 begin`);
      const actual: number = newsCountAfterLoads(162);
      logInfo(`newsCountAfterLoads(loads=162): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0053
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0053
     * @tc.desc      newsCountAfterLoads(loads=71) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0053 begin`);
      const actual: number = newsCountAfterLoads(71);
      logInfo(`newsCountAfterLoads(loads=71): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0054
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0054
     * @tc.desc      newsCountAfterLoads(loads=16) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0054 begin`);
      const actual: number = newsCountAfterLoads(16);
      logInfo(`newsCountAfterLoads(loads=16): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0055
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0055
     * @tc.desc      newsCountAfterLoads(loads=-15) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NewsCountAfterLoads_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0055 begin`);
      const actual: number = newsCountAfterLoads(-15);
      logInfo(`newsCountAfterLoads(loads=-15): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0056
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0056
     * @tc.desc      newsCountAfterLoads(loads=74.17) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0056 begin`);
      const actual: number = newsCountAfterLoads(74.17);
      logInfo(`newsCountAfterLoads(loads=74.17): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0057
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0057
     * @tc.desc      newsCountAfterLoads(loads=35.33) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0057 begin`);
      const actual: number = newsCountAfterLoads(35.33);
      logInfo(`newsCountAfterLoads(loads=35.33): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0058
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0058
     * @tc.desc      newsCountAfterLoads(loads=-35) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NewsCountAfterLoads_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0058 begin`);
      const actual: number = newsCountAfterLoads(-35);
      logInfo(`newsCountAfterLoads(loads=-35): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEWS_COUNT_AFTER_LOADS_0059
     * @tc.name      PullToRefresh_NewsCountAfterLoads_0059
     * @tc.desc      newsCountAfterLoads(loads=96.61) returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NewsCountAfterLoads_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NewsCountAfterLoads_0059 begin`);
      const actual: number = newsCountAfterLoads(96.61);
      logInfo(`newsCountAfterLoads(loads=96.61): actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}NewsCountAfterLoads_0059 end`);
    });
  });
}
