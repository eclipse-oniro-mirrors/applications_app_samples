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
import { loadingValueAfter } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for loadingValueAfter (59 cases). */
export default function loadingValueAfterTest(): void {
  describe('LoadingValueAfterTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0001
     * @tc.name      PullToRefresh_LoadingValueAfter_0001
     * @tc.desc      loadingValueAfter(ticks=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_LoadingValueAfter_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0001 begin`);
      const actual: number = loadingValueAfter(0);
      logInfo(`loadingValueAfter(ticks=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingValueAfter_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0002
     * @tc.name      PullToRefresh_LoadingValueAfter_0002
     * @tc.desc      loadingValueAfter(ticks=1) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_LoadingValueAfter_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0002 begin`);
      const actual: number = loadingValueAfter(1);
      logInfo(`loadingValueAfter(ticks=1): actual=${actual}`);
      expect(actual).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0003
     * @tc.name      PullToRefresh_LoadingValueAfter_0003
     * @tc.desc      loadingValueAfter(ticks=2) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0003 begin`);
      const actual: number = loadingValueAfter(2);
      logInfo(`loadingValueAfter(ticks=2): actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0004
     * @tc.name      PullToRefresh_LoadingValueAfter_0004
     * @tc.desc      loadingValueAfter(ticks=3) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0004 begin`);
      const actual: number = loadingValueAfter(3);
      logInfo(`loadingValueAfter(ticks=3): actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0005
     * @tc.name      PullToRefresh_LoadingValueAfter_0005
     * @tc.desc      loadingValueAfter(ticks=10) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0005 begin`);
      const actual: number = loadingValueAfter(10);
      logInfo(`loadingValueAfter(ticks=10): actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0006
     * @tc.name      PullToRefresh_LoadingValueAfter_0006
     * @tc.desc      loadingValueAfter(ticks=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0006 begin`);
      const actual: number = loadingValueAfter(100);
      logInfo(`loadingValueAfter(ticks=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadingValueAfter_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0007
     * @tc.name      PullToRefresh_LoadingValueAfter_0007
     * @tc.desc      loadingValueAfter(ticks=5) returns 0.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0007 begin`);
      const actual: number = loadingValueAfter(5);
      logInfo(`loadingValueAfter(ticks=5): actual=${actual}`);
      expect(actual).assertClose(0.05, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0008
     * @tc.name      PullToRefresh_LoadingValueAfter_0008
     * @tc.desc      loadingValueAfter(ticks=15) returns 0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0008 begin`);
      const actual: number = loadingValueAfter(15);
      logInfo(`loadingValueAfter(ticks=15): actual=${actual}`);
      expect(actual).assertClose(0.15, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0009
     * @tc.name      PullToRefresh_LoadingValueAfter_0009
     * @tc.desc      loadingValueAfter(ticks=20) returns 0.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0009 begin`);
      const actual: number = loadingValueAfter(20);
      logInfo(`loadingValueAfter(ticks=20): actual=${actual}`);
      expect(actual).assertClose(0.2, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0010
     * @tc.name      PullToRefresh_LoadingValueAfter_0010
     * @tc.desc      loadingValueAfter(ticks=25) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0010 begin`);
      const actual: number = loadingValueAfter(25);
      logInfo(`loadingValueAfter(ticks=25): actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0011
     * @tc.name      PullToRefresh_LoadingValueAfter_0011
     * @tc.desc      loadingValueAfter(ticks=30) returns 0.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0011 begin`);
      const actual: number = loadingValueAfter(30);
      logInfo(`loadingValueAfter(ticks=30): actual=${actual}`);
      expect(actual).assertClose(0.3, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0012
     * @tc.name      PullToRefresh_LoadingValueAfter_0012
     * @tc.desc      loadingValueAfter(ticks=35) returns 0.35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0012 begin`);
      const actual: number = loadingValueAfter(35);
      logInfo(`loadingValueAfter(ticks=35): actual=${actual}`);
      expect(actual).assertClose(0.35, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0013
     * @tc.name      PullToRefresh_LoadingValueAfter_0013
     * @tc.desc      loadingValueAfter(ticks=40) returns 0.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0013 begin`);
      const actual: number = loadingValueAfter(40);
      logInfo(`loadingValueAfter(ticks=40): actual=${actual}`);
      expect(actual).assertClose(0.4, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0014
     * @tc.name      PullToRefresh_LoadingValueAfter_0014
     * @tc.desc      loadingValueAfter(ticks=45) returns 0.45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0014 begin`);
      const actual: number = loadingValueAfter(45);
      logInfo(`loadingValueAfter(ticks=45): actual=${actual}`);
      expect(actual).assertClose(0.45, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0015
     * @tc.name      PullToRefresh_LoadingValueAfter_0015
     * @tc.desc      loadingValueAfter(ticks=50) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0015 begin`);
      const actual: number = loadingValueAfter(50);
      logInfo(`loadingValueAfter(ticks=50): actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0016
     * @tc.name      PullToRefresh_LoadingValueAfter_0016
     * @tc.desc      loadingValueAfter(ticks=55) returns 0.55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0016 begin`);
      const actual: number = loadingValueAfter(55);
      logInfo(`loadingValueAfter(ticks=55): actual=${actual}`);
      expect(actual).assertClose(0.55, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0017
     * @tc.name      PullToRefresh_LoadingValueAfter_0017
     * @tc.desc      loadingValueAfter(ticks=60) returns 0.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0017 begin`);
      const actual: number = loadingValueAfter(60);
      logInfo(`loadingValueAfter(ticks=60): actual=${actual}`);
      expect(actual).assertClose(0.6, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0018
     * @tc.name      PullToRefresh_LoadingValueAfter_0018
     * @tc.desc      loadingValueAfter(ticks=65) returns 0.65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0018 begin`);
      const actual: number = loadingValueAfter(65);
      logInfo(`loadingValueAfter(ticks=65): actual=${actual}`);
      expect(actual).assertClose(0.65, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0019
     * @tc.name      PullToRefresh_LoadingValueAfter_0019
     * @tc.desc      loadingValueAfter(ticks=70) returns 0.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0019 begin`);
      const actual: number = loadingValueAfter(70);
      logInfo(`loadingValueAfter(ticks=70): actual=${actual}`);
      expect(actual).assertClose(0.7, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0020
     * @tc.name      PullToRefresh_LoadingValueAfter_0020
     * @tc.desc      loadingValueAfter(ticks=75) returns 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0020 begin`);
      const actual: number = loadingValueAfter(75);
      logInfo(`loadingValueAfter(ticks=75): actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0021
     * @tc.name      PullToRefresh_LoadingValueAfter_0021
     * @tc.desc      loadingValueAfter(ticks=80) returns 0.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0021 begin`);
      const actual: number = loadingValueAfter(80);
      logInfo(`loadingValueAfter(ticks=80): actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0022
     * @tc.name      PullToRefresh_LoadingValueAfter_0022
     * @tc.desc      loadingValueAfter(ticks=85) returns 0.85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0022 begin`);
      const actual: number = loadingValueAfter(85);
      logInfo(`loadingValueAfter(ticks=85): actual=${actual}`);
      expect(actual).assertClose(0.85, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0023
     * @tc.name      PullToRefresh_LoadingValueAfter_0023
     * @tc.desc      loadingValueAfter(ticks=90) returns 0.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0023 begin`);
      const actual: number = loadingValueAfter(90);
      logInfo(`loadingValueAfter(ticks=90): actual=${actual}`);
      expect(actual).assertClose(0.9, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0024
     * @tc.name      PullToRefresh_LoadingValueAfter_0024
     * @tc.desc      loadingValueAfter(ticks=95) returns 0.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0024 begin`);
      const actual: number = loadingValueAfter(95);
      logInfo(`loadingValueAfter(ticks=95): actual=${actual}`);
      expect(actual).assertClose(0.95, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0025
     * @tc.name      PullToRefresh_LoadingValueAfter_0025
     * @tc.desc      loadingValueAfter(ticks=105) returns 0.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0025 begin`);
      const actual: number = loadingValueAfter(105);
      logInfo(`loadingValueAfter(ticks=105): actual=${actual}`);
      expect(actual).assertClose(0.04, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0026
     * @tc.name      PullToRefresh_LoadingValueAfter_0026
     * @tc.desc      loadingValueAfter(ticks=110) returns 0.09
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0026 begin`);
      const actual: number = loadingValueAfter(110);
      logInfo(`loadingValueAfter(ticks=110): actual=${actual}`);
      expect(actual).assertClose(0.09, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0027
     * @tc.name      PullToRefresh_LoadingValueAfter_0027
     * @tc.desc      loadingValueAfter(ticks=115) returns 0.14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0027 begin`);
      const actual: number = loadingValueAfter(115);
      logInfo(`loadingValueAfter(ticks=115): actual=${actual}`);
      expect(actual).assertClose(0.14, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0028
     * @tc.name      PullToRefresh_LoadingValueAfter_0028
     * @tc.desc      loadingValueAfter(ticks=120) returns 0.19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0028 begin`);
      const actual: number = loadingValueAfter(120);
      logInfo(`loadingValueAfter(ticks=120): actual=${actual}`);
      expect(actual).assertClose(0.19, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0029
     * @tc.name      PullToRefresh_LoadingValueAfter_0029
     * @tc.desc      loadingValueAfter(ticks=125) returns 0.24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0029 begin`);
      const actual: number = loadingValueAfter(125);
      logInfo(`loadingValueAfter(ticks=125): actual=${actual}`);
      expect(actual).assertClose(0.24, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0030
     * @tc.name      PullToRefresh_LoadingValueAfter_0030
     * @tc.desc      loadingValueAfter(ticks=130) returns 0.29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0030 begin`);
      const actual: number = loadingValueAfter(130);
      logInfo(`loadingValueAfter(ticks=130): actual=${actual}`);
      expect(actual).assertClose(0.29, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0031
     * @tc.name      PullToRefresh_LoadingValueAfter_0031
     * @tc.desc      loadingValueAfter(ticks=135) returns 0.34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0031 begin`);
      const actual: number = loadingValueAfter(135);
      logInfo(`loadingValueAfter(ticks=135): actual=${actual}`);
      expect(actual).assertClose(0.34, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0032
     * @tc.name      PullToRefresh_LoadingValueAfter_0032
     * @tc.desc      loadingValueAfter(ticks=140) returns 0.39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0032 begin`);
      const actual: number = loadingValueAfter(140);
      logInfo(`loadingValueAfter(ticks=140): actual=${actual}`);
      expect(actual).assertClose(0.39, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0033
     * @tc.name      PullToRefresh_LoadingValueAfter_0033
     * @tc.desc      loadingValueAfter(ticks=145) returns 0.44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0033 begin`);
      const actual: number = loadingValueAfter(145);
      logInfo(`loadingValueAfter(ticks=145): actual=${actual}`);
      expect(actual).assertClose(0.44, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0034
     * @tc.name      PullToRefresh_LoadingValueAfter_0034
     * @tc.desc      loadingValueAfter(ticks=150) returns 0.49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0034 begin`);
      const actual: number = loadingValueAfter(150);
      logInfo(`loadingValueAfter(ticks=150): actual=${actual}`);
      expect(actual).assertClose(0.49, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0035
     * @tc.name      PullToRefresh_LoadingValueAfter_0035
     * @tc.desc      loadingValueAfter(ticks=155) returns 0.54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0035 begin`);
      const actual: number = loadingValueAfter(155);
      logInfo(`loadingValueAfter(ticks=155): actual=${actual}`);
      expect(actual).assertClose(0.54, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0036
     * @tc.name      PullToRefresh_LoadingValueAfter_0036
     * @tc.desc      loadingValueAfter(ticks=160) returns 0.59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0036 begin`);
      const actual: number = loadingValueAfter(160);
      logInfo(`loadingValueAfter(ticks=160): actual=${actual}`);
      expect(actual).assertClose(0.59, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0037
     * @tc.name      PullToRefresh_LoadingValueAfter_0037
     * @tc.desc      loadingValueAfter(ticks=165) returns 0.64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0037 begin`);
      const actual: number = loadingValueAfter(165);
      logInfo(`loadingValueAfter(ticks=165): actual=${actual}`);
      expect(actual).assertClose(0.64, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0038
     * @tc.name      PullToRefresh_LoadingValueAfter_0038
     * @tc.desc      loadingValueAfter(ticks=170) returns 0.69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0038 begin`);
      const actual: number = loadingValueAfter(170);
      logInfo(`loadingValueAfter(ticks=170): actual=${actual}`);
      expect(actual).assertClose(0.69, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0039
     * @tc.name      PullToRefresh_LoadingValueAfter_0039
     * @tc.desc      loadingValueAfter(ticks=175) returns 0.74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0039 begin`);
      const actual: number = loadingValueAfter(175);
      logInfo(`loadingValueAfter(ticks=175): actual=${actual}`);
      expect(actual).assertClose(0.74, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0040
     * @tc.name      PullToRefresh_LoadingValueAfter_0040
     * @tc.desc      loadingValueAfter(ticks=180) returns 0.79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0040 begin`);
      const actual: number = loadingValueAfter(180);
      logInfo(`loadingValueAfter(ticks=180): actual=${actual}`);
      expect(actual).assertClose(0.79, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0041
     * @tc.name      PullToRefresh_LoadingValueAfter_0041
     * @tc.desc      loadingValueAfter(ticks=185) returns 0.84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0041 begin`);
      const actual: number = loadingValueAfter(185);
      logInfo(`loadingValueAfter(ticks=185): actual=${actual}`);
      expect(actual).assertClose(0.84, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0042
     * @tc.name      PullToRefresh_LoadingValueAfter_0042
     * @tc.desc      loadingValueAfter(ticks=190) returns 0.89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0042 begin`);
      const actual: number = loadingValueAfter(190);
      logInfo(`loadingValueAfter(ticks=190): actual=${actual}`);
      expect(actual).assertClose(0.89, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0043
     * @tc.name      PullToRefresh_LoadingValueAfter_0043
     * @tc.desc      loadingValueAfter(ticks=195) returns 0.94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0043 begin`);
      const actual: number = loadingValueAfter(195);
      logInfo(`loadingValueAfter(ticks=195): actual=${actual}`);
      expect(actual).assertClose(0.94, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0044
     * @tc.name      PullToRefresh_LoadingValueAfter_0044
     * @tc.desc      loadingValueAfter(ticks=200) returns 0.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0044 begin`);
      const actual: number = loadingValueAfter(200);
      logInfo(`loadingValueAfter(ticks=200): actual=${actual}`);
      expect(actual).assertClose(0.99, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0045
     * @tc.name      PullToRefresh_LoadingValueAfter_0045
     * @tc.desc      loadingValueAfter(ticks=80.98) returns 0.81
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0045 begin`);
      const actual: number = loadingValueAfter(80.98);
      logInfo(`loadingValueAfter(ticks=80.98): actual=${actual}`);
      expect(actual).assertClose(0.81, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0046
     * @tc.name      PullToRefresh_LoadingValueAfter_0046
     * @tc.desc      loadingValueAfter(ticks=57.94) returns 0.58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0046 begin`);
      const actual: number = loadingValueAfter(57.94);
      logInfo(`loadingValueAfter(ticks=57.94): actual=${actual}`);
      expect(actual).assertClose(0.58, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0047
     * @tc.name      PullToRefresh_LoadingValueAfter_0047
     * @tc.desc      loadingValueAfter(ticks=72) returns 0.72
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0047 begin`);
      const actual: number = loadingValueAfter(72);
      logInfo(`loadingValueAfter(ticks=72): actual=${actual}`);
      expect(actual).assertClose(0.72, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0048
     * @tc.name      PullToRefresh_LoadingValueAfter_0048
     * @tc.desc      loadingValueAfter(ticks=138) returns 0.37
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0048 begin`);
      const actual: number = loadingValueAfter(138);
      logInfo(`loadingValueAfter(ticks=138): actual=${actual}`);
      expect(actual).assertClose(0.37, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0049
     * @tc.name      PullToRefresh_LoadingValueAfter_0049
     * @tc.desc      loadingValueAfter(ticks=6.32) returns 0.07
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0049 begin`);
      const actual: number = loadingValueAfter(6.32);
      logInfo(`loadingValueAfter(ticks=6.32): actual=${actual}`);
      expect(actual).assertClose(0.07, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0050
     * @tc.name      PullToRefresh_LoadingValueAfter_0050
     * @tc.desc      loadingValueAfter(ticks=11.91) returns 0.12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0050 begin`);
      const actual: number = loadingValueAfter(11.91);
      logInfo(`loadingValueAfter(ticks=11.91): actual=${actual}`);
      expect(actual).assertClose(0.12, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0051
     * @tc.name      PullToRefresh_LoadingValueAfter_0051
     * @tc.desc      loadingValueAfter(ticks=76) returns 0.76
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0051 begin`);
      const actual: number = loadingValueAfter(76);
      logInfo(`loadingValueAfter(ticks=76): actual=${actual}`);
      expect(actual).assertClose(0.76, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0052
     * @tc.name      PullToRefresh_LoadingValueAfter_0052
     * @tc.desc      loadingValueAfter(ticks=66.62) returns 0.67
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0052 begin`);
      const actual: number = loadingValueAfter(66.62);
      logInfo(`loadingValueAfter(ticks=66.62): actual=${actual}`);
      expect(actual).assertClose(0.67, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0053
     * @tc.name      PullToRefresh_LoadingValueAfter_0053
     * @tc.desc      loadingValueAfter(ticks=8) returns 0.08
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0053 begin`);
      const actual: number = loadingValueAfter(8);
      logInfo(`loadingValueAfter(ticks=8): actual=${actual}`);
      expect(actual).assertClose(0.08, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0054
     * @tc.name      PullToRefresh_LoadingValueAfter_0054
     * @tc.desc      loadingValueAfter(ticks=82.52) returns 0.83
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0054 begin`);
      const actual: number = loadingValueAfter(82.52);
      logInfo(`loadingValueAfter(ticks=82.52): actual=${actual}`);
      expect(actual).assertClose(0.83, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0055
     * @tc.name      PullToRefresh_LoadingValueAfter_0055
     * @tc.desc      loadingValueAfter(ticks=139) returns 0.38
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0055 begin`);
      const actual: number = loadingValueAfter(139);
      logInfo(`loadingValueAfter(ticks=139): actual=${actual}`);
      expect(actual).assertClose(0.38, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0056
     * @tc.name      PullToRefresh_LoadingValueAfter_0056
     * @tc.desc      loadingValueAfter(ticks=129) returns 0.28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0056 begin`);
      const actual: number = loadingValueAfter(129);
      logInfo(`loadingValueAfter(ticks=129): actual=${actual}`);
      expect(actual).assertClose(0.28, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0057
     * @tc.name      PullToRefresh_LoadingValueAfter_0057
     * @tc.desc      loadingValueAfter(ticks=119) returns 0.18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0057 begin`);
      const actual: number = loadingValueAfter(119);
      logInfo(`loadingValueAfter(ticks=119): actual=${actual}`);
      expect(actual).assertClose(0.18, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0058
     * @tc.name      PullToRefresh_LoadingValueAfter_0058
     * @tc.desc      loadingValueAfter(ticks=192) returns 0.91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0058 begin`);
      const actual: number = loadingValueAfter(192);
      logInfo(`loadingValueAfter(ticks=192): actual=${actual}`);
      expect(actual).assertClose(0.91, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_VALUE_AFTER_0059
     * @tc.name      PullToRefresh_LoadingValueAfter_0059
     * @tc.desc      loadingValueAfter(ticks=199) returns 0.98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingValueAfter_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingValueAfter_0059 begin`);
      const actual: number = loadingValueAfter(199);
      logInfo(`loadingValueAfter(ticks=199): actual=${actual}`);
      expect(actual).assertClose(0.98, PRECISION);
      logInfo(`${BUNDLE}LoadingValueAfter_0059 end`);
    });
  });
}
