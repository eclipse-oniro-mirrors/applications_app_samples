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
import { loadingTick } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for loadingTick (59 cases). */
export default function loadingTickTest(): void {
  describe('LoadingTickTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0001
     * @tc.name      PullToRefresh_LoadingTick_0001
     * @tc.desc      loadingTick(value=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_LoadingTick_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingTick_0001 begin`);
      const actual: number = loadingTick(1);
      logInfo(`loadingTick(value=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTick_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0002
     * @tc.name      PullToRefresh_LoadingTick_0002
     * @tc.desc      loadingTick(value=0) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_LoadingTick_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingTick_0002 begin`);
      const actual: number = loadingTick(0);
      logInfo(`loadingTick(value=0): actual=${actual}`);
      expect(actual).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}LoadingTick_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0003
     * @tc.name      PullToRefresh_LoadingTick_0003
     * @tc.desc      loadingTick(value=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_LoadingTick_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LoadingTick_0003 begin`);
      const actual: number = loadingTick(2);
      logInfo(`loadingTick(value=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}LoadingTick_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0004
     * @tc.name      PullToRefresh_LoadingTick_0004
     * @tc.desc      loadingTick(value=0.01) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_LoadingTick_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LoadingTick_0004 begin`);
      const actual: number = loadingTick(0.01);
      logInfo(`loadingTick(value=0.01): actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}LoadingTick_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0005
     * @tc.name      PullToRefresh_LoadingTick_0005
     * @tc.desc      loadingTick(value=0.02) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0005 begin`);
      const actual: number = loadingTick(0.02);
      logInfo(`loadingTick(value=0.02): actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}LoadingTick_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0006
     * @tc.name      PullToRefresh_LoadingTick_0006
     * @tc.desc      loadingTick(value=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_LoadingTick_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LoadingTick_0006 begin`);
      const actual: number = loadingTick(100);
      logInfo(`loadingTick(value=100): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}LoadingTick_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0007
     * @tc.name      PullToRefresh_LoadingTick_0007
     * @tc.desc      loadingTick(value=99) returns 98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_LoadingTick_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LoadingTick_0007 begin`);
      const actual: number = loadingTick(99);
      logInfo(`loadingTick(value=99): actual=${actual}`);
      expect(actual).assertEqual(98);
      logInfo(`${BUNDLE}LoadingTick_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0008
     * @tc.name      PullToRefresh_LoadingTick_0008
     * @tc.desc      loadingTick(value=101) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_LoadingTick_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LoadingTick_0008 begin`);
      const actual: number = loadingTick(101);
      logInfo(`loadingTick(value=101): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}LoadingTick_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0009
     * @tc.name      PullToRefresh_LoadingTick_0009
     * @tc.desc      loadingTick(value=200) returns 199
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0009 begin`);
      const actual: number = loadingTick(200);
      logInfo(`loadingTick(value=200): actual=${actual}`);
      expect(actual).assertEqual(199);
      logInfo(`${BUNDLE}LoadingTick_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0010
     * @tc.name      PullToRefresh_LoadingTick_0010
     * @tc.desc      loadingTick(value=50) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0010 begin`);
      const actual: number = loadingTick(50);
      logInfo(`loadingTick(value=50): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}LoadingTick_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0011
     * @tc.name      PullToRefresh_LoadingTick_0011
     * @tc.desc      loadingTick(value=-1) returns -0.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadingTick_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTick_0011 begin`);
      const actual: number = loadingTick(-1);
      logInfo(`loadingTick(value=-1): actual=${actual}`);
      expect(actual).assertClose(-0.99, PRECISION);
      logInfo(`${BUNDLE}LoadingTick_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0012
     * @tc.name      PullToRefresh_LoadingTick_0012
     * @tc.desc      loadingTick(value=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0012 begin`);
      const actual: number = loadingTick(3);
      logInfo(`loadingTick(value=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}LoadingTick_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0013
     * @tc.name      PullToRefresh_LoadingTick_0013
     * @tc.desc      loadingTick(value=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0013 begin`);
      const actual: number = loadingTick(10);
      logInfo(`loadingTick(value=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}LoadingTick_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0014
     * @tc.name      PullToRefresh_LoadingTick_0014
     * @tc.desc      loadingTick(value=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0014 begin`);
      const actual: number = loadingTick(20);
      logInfo(`loadingTick(value=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}LoadingTick_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0015
     * @tc.name      PullToRefresh_LoadingTick_0015
     * @tc.desc      loadingTick(value=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0015 begin`);
      const actual: number = loadingTick(30);
      logInfo(`loadingTick(value=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}LoadingTick_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0016
     * @tc.name      PullToRefresh_LoadingTick_0016
     * @tc.desc      loadingTick(value=40) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0016 begin`);
      const actual: number = loadingTick(40);
      logInfo(`loadingTick(value=40): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}LoadingTick_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0017
     * @tc.name      PullToRefresh_LoadingTick_0017
     * @tc.desc      loadingTick(value=60) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0017 begin`);
      const actual: number = loadingTick(60);
      logInfo(`loadingTick(value=60): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}LoadingTick_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0018
     * @tc.name      PullToRefresh_LoadingTick_0018
     * @tc.desc      loadingTick(value=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0018 begin`);
      const actual: number = loadingTick(70);
      logInfo(`loadingTick(value=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}LoadingTick_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0019
     * @tc.name      PullToRefresh_LoadingTick_0019
     * @tc.desc      loadingTick(value=80) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0019 begin`);
      const actual: number = loadingTick(80);
      logInfo(`loadingTick(value=80): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}LoadingTick_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0020
     * @tc.name      PullToRefresh_LoadingTick_0020
     * @tc.desc      loadingTick(value=90) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0020 begin`);
      const actual: number = loadingTick(90);
      logInfo(`loadingTick(value=90): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}LoadingTick_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0021
     * @tc.name      PullToRefresh_LoadingTick_0021
     * @tc.desc      loadingTick(value=110) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0021 begin`);
      const actual: number = loadingTick(110);
      logInfo(`loadingTick(value=110): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}LoadingTick_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0022
     * @tc.name      PullToRefresh_LoadingTick_0022
     * @tc.desc      loadingTick(value=120) returns 119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0022 begin`);
      const actual: number = loadingTick(120);
      logInfo(`loadingTick(value=120): actual=${actual}`);
      expect(actual).assertEqual(119);
      logInfo(`${BUNDLE}LoadingTick_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0023
     * @tc.name      PullToRefresh_LoadingTick_0023
     * @tc.desc      loadingTick(value=130) returns 129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0023 begin`);
      const actual: number = loadingTick(130);
      logInfo(`loadingTick(value=130): actual=${actual}`);
      expect(actual).assertEqual(129);
      logInfo(`${BUNDLE}LoadingTick_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0024
     * @tc.name      PullToRefresh_LoadingTick_0024
     * @tc.desc      loadingTick(value=140) returns 139
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0024 begin`);
      const actual: number = loadingTick(140);
      logInfo(`loadingTick(value=140): actual=${actual}`);
      expect(actual).assertEqual(139);
      logInfo(`${BUNDLE}LoadingTick_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0025
     * @tc.name      PullToRefresh_LoadingTick_0025
     * @tc.desc      loadingTick(value=150) returns 149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0025 begin`);
      const actual: number = loadingTick(150);
      logInfo(`loadingTick(value=150): actual=${actual}`);
      expect(actual).assertEqual(149);
      logInfo(`${BUNDLE}LoadingTick_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0026
     * @tc.name      PullToRefresh_LoadingTick_0026
     * @tc.desc      loadingTick(value=160) returns 159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0026 begin`);
      const actual: number = loadingTick(160);
      logInfo(`loadingTick(value=160): actual=${actual}`);
      expect(actual).assertEqual(159);
      logInfo(`${BUNDLE}LoadingTick_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0027
     * @tc.name      PullToRefresh_LoadingTick_0027
     * @tc.desc      loadingTick(value=170) returns 169
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0027 begin`);
      const actual: number = loadingTick(170);
      logInfo(`loadingTick(value=170): actual=${actual}`);
      expect(actual).assertEqual(169);
      logInfo(`${BUNDLE}LoadingTick_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0028
     * @tc.name      PullToRefresh_LoadingTick_0028
     * @tc.desc      loadingTick(value=180) returns 179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0028 begin`);
      const actual: number = loadingTick(180);
      logInfo(`loadingTick(value=180): actual=${actual}`);
      expect(actual).assertEqual(179);
      logInfo(`${BUNDLE}LoadingTick_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0029
     * @tc.name      PullToRefresh_LoadingTick_0029
     * @tc.desc      loadingTick(value=190) returns 189
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0029 begin`);
      const actual: number = loadingTick(190);
      logInfo(`loadingTick(value=190): actual=${actual}`);
      expect(actual).assertEqual(189);
      logInfo(`${BUNDLE}LoadingTick_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0030
     * @tc.name      PullToRefresh_LoadingTick_0030
     * @tc.desc      loadingTick(value=210) returns 209
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0030 begin`);
      const actual: number = loadingTick(210);
      logInfo(`loadingTick(value=210): actual=${actual}`);
      expect(actual).assertEqual(209);
      logInfo(`${BUNDLE}LoadingTick_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0031
     * @tc.name      PullToRefresh_LoadingTick_0031
     * @tc.desc      loadingTick(value=220) returns 219
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0031 begin`);
      const actual: number = loadingTick(220);
      logInfo(`loadingTick(value=220): actual=${actual}`);
      expect(actual).assertEqual(219);
      logInfo(`${BUNDLE}LoadingTick_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0032
     * @tc.name      PullToRefresh_LoadingTick_0032
     * @tc.desc      loadingTick(value=230) returns 229
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0032 begin`);
      const actual: number = loadingTick(230);
      logInfo(`loadingTick(value=230): actual=${actual}`);
      expect(actual).assertEqual(229);
      logInfo(`${BUNDLE}LoadingTick_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0033
     * @tc.name      PullToRefresh_LoadingTick_0033
     * @tc.desc      loadingTick(value=240) returns 239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0033 begin`);
      const actual: number = loadingTick(240);
      logInfo(`loadingTick(value=240): actual=${actual}`);
      expect(actual).assertEqual(239);
      logInfo(`${BUNDLE}LoadingTick_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0034
     * @tc.name      PullToRefresh_LoadingTick_0034
     * @tc.desc      loadingTick(value=250) returns 249
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0034 begin`);
      const actual: number = loadingTick(250);
      logInfo(`loadingTick(value=250): actual=${actual}`);
      expect(actual).assertEqual(249);
      logInfo(`${BUNDLE}LoadingTick_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0035
     * @tc.name      PullToRefresh_LoadingTick_0035
     * @tc.desc      loadingTick(value=260) returns 259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0035 begin`);
      const actual: number = loadingTick(260);
      logInfo(`loadingTick(value=260): actual=${actual}`);
      expect(actual).assertEqual(259);
      logInfo(`${BUNDLE}LoadingTick_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0036
     * @tc.name      PullToRefresh_LoadingTick_0036
     * @tc.desc      loadingTick(value=270) returns 269
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0036 begin`);
      const actual: number = loadingTick(270);
      logInfo(`loadingTick(value=270): actual=${actual}`);
      expect(actual).assertEqual(269);
      logInfo(`${BUNDLE}LoadingTick_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0037
     * @tc.name      PullToRefresh_LoadingTick_0037
     * @tc.desc      loadingTick(value=280) returns 279
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0037 begin`);
      const actual: number = loadingTick(280);
      logInfo(`loadingTick(value=280): actual=${actual}`);
      expect(actual).assertEqual(279);
      logInfo(`${BUNDLE}LoadingTick_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0038
     * @tc.name      PullToRefresh_LoadingTick_0038
     * @tc.desc      loadingTick(value=290) returns 289
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0038 begin`);
      const actual: number = loadingTick(290);
      logInfo(`loadingTick(value=290): actual=${actual}`);
      expect(actual).assertEqual(289);
      logInfo(`${BUNDLE}LoadingTick_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0039
     * @tc.name      PullToRefresh_LoadingTick_0039
     * @tc.desc      loadingTick(value=300) returns 299
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0039 begin`);
      const actual: number = loadingTick(300);
      logInfo(`loadingTick(value=300): actual=${actual}`);
      expect(actual).assertEqual(299);
      logInfo(`${BUNDLE}LoadingTick_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0040
     * @tc.name      PullToRefresh_LoadingTick_0040
     * @tc.desc      loadingTick(value=310) returns 309
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0040 begin`);
      const actual: number = loadingTick(310);
      logInfo(`loadingTick(value=310): actual=${actual}`);
      expect(actual).assertEqual(309);
      logInfo(`${BUNDLE}LoadingTick_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0041
     * @tc.name      PullToRefresh_LoadingTick_0041
     * @tc.desc      loadingTick(value=320) returns 319
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0041 begin`);
      const actual: number = loadingTick(320);
      logInfo(`loadingTick(value=320): actual=${actual}`);
      expect(actual).assertEqual(319);
      logInfo(`${BUNDLE}LoadingTick_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0042
     * @tc.name      PullToRefresh_LoadingTick_0042
     * @tc.desc      loadingTick(value=330) returns 329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0042 begin`);
      const actual: number = loadingTick(330);
      logInfo(`loadingTick(value=330): actual=${actual}`);
      expect(actual).assertEqual(329);
      logInfo(`${BUNDLE}LoadingTick_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0043
     * @tc.name      PullToRefresh_LoadingTick_0043
     * @tc.desc      loadingTick(value=340) returns 339
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0043 begin`);
      const actual: number = loadingTick(340);
      logInfo(`loadingTick(value=340): actual=${actual}`);
      expect(actual).assertEqual(339);
      logInfo(`${BUNDLE}LoadingTick_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0044
     * @tc.name      PullToRefresh_LoadingTick_0044
     * @tc.desc      loadingTick(value=350) returns 349
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0044 begin`);
      const actual: number = loadingTick(350);
      logInfo(`loadingTick(value=350): actual=${actual}`);
      expect(actual).assertEqual(349);
      logInfo(`${BUNDLE}LoadingTick_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0045
     * @tc.name      PullToRefresh_LoadingTick_0045
     * @tc.desc      loadingTick(value=360) returns 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0045 begin`);
      const actual: number = loadingTick(360);
      logInfo(`loadingTick(value=360): actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}LoadingTick_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0046
     * @tc.name      PullToRefresh_LoadingTick_0046
     * @tc.desc      loadingTick(value=370) returns 369
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0046 begin`);
      const actual: number = loadingTick(370);
      logInfo(`loadingTick(value=370): actual=${actual}`);
      expect(actual).assertEqual(369);
      logInfo(`${BUNDLE}LoadingTick_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0047
     * @tc.name      PullToRefresh_LoadingTick_0047
     * @tc.desc      loadingTick(value=380) returns 379
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0047 begin`);
      const actual: number = loadingTick(380);
      logInfo(`loadingTick(value=380): actual=${actual}`);
      expect(actual).assertEqual(379);
      logInfo(`${BUNDLE}LoadingTick_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0048
     * @tc.name      PullToRefresh_LoadingTick_0048
     * @tc.desc      loadingTick(value=390) returns 389
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0048 begin`);
      const actual: number = loadingTick(390);
      logInfo(`loadingTick(value=390): actual=${actual}`);
      expect(actual).assertEqual(389);
      logInfo(`${BUNDLE}LoadingTick_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0049
     * @tc.name      PullToRefresh_LoadingTick_0049
     * @tc.desc      loadingTick(value=400) returns 399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0049 begin`);
      const actual: number = loadingTick(400);
      logInfo(`loadingTick(value=400): actual=${actual}`);
      expect(actual).assertEqual(399);
      logInfo(`${BUNDLE}LoadingTick_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0050
     * @tc.name      PullToRefresh_LoadingTick_0050
     * @tc.desc      loadingTick(value=233) returns 232
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0050 begin`);
      const actual: number = loadingTick(233);
      logInfo(`loadingTick(value=233): actual=${actual}`);
      expect(actual).assertEqual(232);
      logInfo(`${BUNDLE}LoadingTick_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0051
     * @tc.name      PullToRefresh_LoadingTick_0051
     * @tc.desc      loadingTick(value=17) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0051 begin`);
      const actual: number = loadingTick(17);
      logInfo(`loadingTick(value=17): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}LoadingTick_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0052
     * @tc.name      PullToRefresh_LoadingTick_0052
     * @tc.desc      loadingTick(value=-126) returns -125.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadingTick_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTick_0052 begin`);
      const actual: number = loadingTick(-126);
      logInfo(`loadingTick(value=-126): actual=${actual}`);
      expect(actual).assertClose(-125.99, PRECISION);
      logInfo(`${BUNDLE}LoadingTick_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0053
     * @tc.name      PullToRefresh_LoadingTick_0053
     * @tc.desc      loadingTick(value=96) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0053 begin`);
      const actual: number = loadingTick(96);
      logInfo(`loadingTick(value=96): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}LoadingTick_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0054
     * @tc.name      PullToRefresh_LoadingTick_0054
     * @tc.desc      loadingTick(value=59) returns 58
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0054 begin`);
      const actual: number = loadingTick(59);
      logInfo(`loadingTick(value=59): actual=${actual}`);
      expect(actual).assertEqual(58);
      logInfo(`${BUNDLE}LoadingTick_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0055
     * @tc.name      PullToRefresh_LoadingTick_0055
     * @tc.desc      loadingTick(value=183.7) returns 182.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0055 begin`);
      const actual: number = loadingTick(183.7);
      logInfo(`loadingTick(value=183.7): actual=${actual}`);
      expect(actual).assertClose(182.7, PRECISION);
      logInfo(`${BUNDLE}LoadingTick_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0056
     * @tc.name      PullToRefresh_LoadingTick_0056
     * @tc.desc      loadingTick(value=-188) returns -187.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadingTick_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTick_0056 begin`);
      const actual: number = loadingTick(-188);
      logInfo(`loadingTick(value=-188): actual=${actual}`);
      expect(actual).assertClose(-187.99, PRECISION);
      logInfo(`${BUNDLE}LoadingTick_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0057
     * @tc.name      PullToRefresh_LoadingTick_0057
     * @tc.desc      loadingTick(value=162) returns 161
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0057 begin`);
      const actual: number = loadingTick(162);
      logInfo(`loadingTick(value=162): actual=${actual}`);
      expect(actual).assertEqual(161);
      logInfo(`${BUNDLE}LoadingTick_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0058
     * @tc.name      PullToRefresh_LoadingTick_0058
     * @tc.desc      loadingTick(value=-8) returns -7.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadingTick_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTick_0058 begin`);
      const actual: number = loadingTick(-8);
      logInfo(`loadingTick(value=-8): actual=${actual}`);
      expect(actual).assertClose(-7.99, PRECISION);
      logInfo(`${BUNDLE}LoadingTick_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_TICK_0059
     * @tc.name      PullToRefresh_LoadingTick_0059
     * @tc.desc      loadingTick(value=332) returns 331
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingTick_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTick_0059 begin`);
      const actual: number = loadingTick(332);
      logInfo(`loadingTick(value=332): actual=${actual}`);
      expect(actual).assertEqual(331);
      logInfo(`${BUNDLE}LoadingTick_0059 end`);
    });
  });
}
