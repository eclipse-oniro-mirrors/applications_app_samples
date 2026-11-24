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
import { loadingAngle } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for loadingAngle (59 cases). */
export default function loadingAngleTest(): void {
  describe('LoadingAngleTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0001
     * @tc.name      PullToRefresh_LoadingAngle_0001
     * @tc.desc      loadingAngle(value=360) returns 129600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_LoadingAngle_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingAngle_0001 begin`);
      const actual: number = loadingAngle(360);
      logInfo(`loadingAngle(value=360): actual=${actual}`);
      expect(actual).assertEqual(129600);
      logInfo(`${BUNDLE}LoadingAngle_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0002
     * @tc.name      PullToRefresh_LoadingAngle_0002
     * @tc.desc      loadingAngle(value=359) returns 129240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_LoadingAngle_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingAngle_0002 begin`);
      const actual: number = loadingAngle(359);
      logInfo(`loadingAngle(value=359): actual=${actual}`);
      expect(actual).assertEqual(129240);
      logInfo(`${BUNDLE}LoadingAngle_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0003
     * @tc.name      PullToRefresh_LoadingAngle_0003
     * @tc.desc      loadingAngle(value=361) returns 129960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_LoadingAngle_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LoadingAngle_0003 begin`);
      const actual: number = loadingAngle(361);
      logInfo(`loadingAngle(value=361): actual=${actual}`);
      expect(actual).assertEqual(129960);
      logInfo(`${BUNDLE}LoadingAngle_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0004
     * @tc.name      PullToRefresh_LoadingAngle_0004
     * @tc.desc      loadingAngle(value=720) returns 259200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0004 begin`);
      const actual: number = loadingAngle(720);
      logInfo(`loadingAngle(value=720): actual=${actual}`);
      expect(actual).assertEqual(259200);
      logInfo(`${BUNDLE}LoadingAngle_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0005
     * @tc.name      PullToRefresh_LoadingAngle_0005
     * @tc.desc      loadingAngle(value=180) returns 64800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0005 begin`);
      const actual: number = loadingAngle(180);
      logInfo(`loadingAngle(value=180): actual=${actual}`);
      expect(actual).assertEqual(64800);
      logInfo(`${BUNDLE}LoadingAngle_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0006
     * @tc.name      PullToRefresh_LoadingAngle_0006
     * @tc.desc      loadingAngle(value=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0006 begin`);
      const actual: number = loadingAngle(0);
      logInfo(`loadingAngle(value=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingAngle_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0007
     * @tc.name      PullToRefresh_LoadingAngle_0007
     * @tc.desc      loadingAngle(value=1) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0007 begin`);
      const actual: number = loadingAngle(1);
      logInfo(`loadingAngle(value=1): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}LoadingAngle_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0008
     * @tc.name      PullToRefresh_LoadingAngle_0008
     * @tc.desc      loadingAngle(value=-1) returns -360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadingAngle_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingAngle_0008 begin`);
      const actual: number = loadingAngle(-1);
      logInfo(`loadingAngle(value=-1): actual=${actual}`);
      expect(actual).assertEqual(-360);
      logInfo(`${BUNDLE}LoadingAngle_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0009
     * @tc.name      PullToRefresh_LoadingAngle_0009
     * @tc.desc      loadingAngle(value=2) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0009 begin`);
      const actual: number = loadingAngle(2);
      logInfo(`loadingAngle(value=2): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}LoadingAngle_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0010
     * @tc.name      PullToRefresh_LoadingAngle_0010
     * @tc.desc      loadingAngle(value=3) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0010 begin`);
      const actual: number = loadingAngle(3);
      logInfo(`loadingAngle(value=3): actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}LoadingAngle_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0011
     * @tc.name      PullToRefresh_LoadingAngle_0011
     * @tc.desc      loadingAngle(value=10) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0011 begin`);
      const actual: number = loadingAngle(10);
      logInfo(`loadingAngle(value=10): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}LoadingAngle_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0012
     * @tc.name      PullToRefresh_LoadingAngle_0012
     * @tc.desc      loadingAngle(value=100) returns 36000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0012 begin`);
      const actual: number = loadingAngle(100);
      logInfo(`loadingAngle(value=100): actual=${actual}`);
      expect(actual).assertEqual(36000);
      logInfo(`${BUNDLE}LoadingAngle_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0013
     * @tc.name      PullToRefresh_LoadingAngle_0013
     * @tc.desc      loadingAngle(value=36) returns 12960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0013 begin`);
      const actual: number = loadingAngle(36);
      logInfo(`loadingAngle(value=36): actual=${actual}`);
      expect(actual).assertEqual(12960);
      logInfo(`${BUNDLE}LoadingAngle_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0014
     * @tc.name      PullToRefresh_LoadingAngle_0014
     * @tc.desc      loadingAngle(value=72) returns 25920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0014 begin`);
      const actual: number = loadingAngle(72);
      logInfo(`loadingAngle(value=72): actual=${actual}`);
      expect(actual).assertEqual(25920);
      logInfo(`${BUNDLE}LoadingAngle_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0015
     * @tc.name      PullToRefresh_LoadingAngle_0015
     * @tc.desc      loadingAngle(value=108) returns 38880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0015 begin`);
      const actual: number = loadingAngle(108);
      logInfo(`loadingAngle(value=108): actual=${actual}`);
      expect(actual).assertEqual(38880);
      logInfo(`${BUNDLE}LoadingAngle_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0016
     * @tc.name      PullToRefresh_LoadingAngle_0016
     * @tc.desc      loadingAngle(value=144) returns 51840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0016 begin`);
      const actual: number = loadingAngle(144);
      logInfo(`loadingAngle(value=144): actual=${actual}`);
      expect(actual).assertEqual(51840);
      logInfo(`${BUNDLE}LoadingAngle_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0017
     * @tc.name      PullToRefresh_LoadingAngle_0017
     * @tc.desc      loadingAngle(value=216) returns 77760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0017 begin`);
      const actual: number = loadingAngle(216);
      logInfo(`loadingAngle(value=216): actual=${actual}`);
      expect(actual).assertEqual(77760);
      logInfo(`${BUNDLE}LoadingAngle_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0018
     * @tc.name      PullToRefresh_LoadingAngle_0018
     * @tc.desc      loadingAngle(value=252) returns 90720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0018 begin`);
      const actual: number = loadingAngle(252);
      logInfo(`loadingAngle(value=252): actual=${actual}`);
      expect(actual).assertEqual(90720);
      logInfo(`${BUNDLE}LoadingAngle_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0019
     * @tc.name      PullToRefresh_LoadingAngle_0019
     * @tc.desc      loadingAngle(value=288) returns 103680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0019 begin`);
      const actual: number = loadingAngle(288);
      logInfo(`loadingAngle(value=288): actual=${actual}`);
      expect(actual).assertEqual(103680);
      logInfo(`${BUNDLE}LoadingAngle_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0020
     * @tc.name      PullToRefresh_LoadingAngle_0020
     * @tc.desc      loadingAngle(value=324) returns 116640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0020 begin`);
      const actual: number = loadingAngle(324);
      logInfo(`loadingAngle(value=324): actual=${actual}`);
      expect(actual).assertEqual(116640);
      logInfo(`${BUNDLE}LoadingAngle_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0021
     * @tc.name      PullToRefresh_LoadingAngle_0021
     * @tc.desc      loadingAngle(value=396) returns 142560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0021 begin`);
      const actual: number = loadingAngle(396);
      logInfo(`loadingAngle(value=396): actual=${actual}`);
      expect(actual).assertEqual(142560);
      logInfo(`${BUNDLE}LoadingAngle_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0022
     * @tc.name      PullToRefresh_LoadingAngle_0022
     * @tc.desc      loadingAngle(value=432) returns 155520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0022 begin`);
      const actual: number = loadingAngle(432);
      logInfo(`loadingAngle(value=432): actual=${actual}`);
      expect(actual).assertEqual(155520);
      logInfo(`${BUNDLE}LoadingAngle_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0023
     * @tc.name      PullToRefresh_LoadingAngle_0023
     * @tc.desc      loadingAngle(value=468) returns 168480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0023 begin`);
      const actual: number = loadingAngle(468);
      logInfo(`loadingAngle(value=468): actual=${actual}`);
      expect(actual).assertEqual(168480);
      logInfo(`${BUNDLE}LoadingAngle_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0024
     * @tc.name      PullToRefresh_LoadingAngle_0024
     * @tc.desc      loadingAngle(value=504) returns 181440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0024 begin`);
      const actual: number = loadingAngle(504);
      logInfo(`loadingAngle(value=504): actual=${actual}`);
      expect(actual).assertEqual(181440);
      logInfo(`${BUNDLE}LoadingAngle_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0025
     * @tc.name      PullToRefresh_LoadingAngle_0025
     * @tc.desc      loadingAngle(value=540) returns 194400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0025 begin`);
      const actual: number = loadingAngle(540);
      logInfo(`loadingAngle(value=540): actual=${actual}`);
      expect(actual).assertEqual(194400);
      logInfo(`${BUNDLE}LoadingAngle_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0026
     * @tc.name      PullToRefresh_LoadingAngle_0026
     * @tc.desc      loadingAngle(value=576) returns 207360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0026 begin`);
      const actual: number = loadingAngle(576);
      logInfo(`loadingAngle(value=576): actual=${actual}`);
      expect(actual).assertEqual(207360);
      logInfo(`${BUNDLE}LoadingAngle_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0027
     * @tc.name      PullToRefresh_LoadingAngle_0027
     * @tc.desc      loadingAngle(value=612) returns 220320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0027 begin`);
      const actual: number = loadingAngle(612);
      logInfo(`loadingAngle(value=612): actual=${actual}`);
      expect(actual).assertEqual(220320);
      logInfo(`${BUNDLE}LoadingAngle_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0028
     * @tc.name      PullToRefresh_LoadingAngle_0028
     * @tc.desc      loadingAngle(value=648) returns 233280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0028 begin`);
      const actual: number = loadingAngle(648);
      logInfo(`loadingAngle(value=648): actual=${actual}`);
      expect(actual).assertEqual(233280);
      logInfo(`${BUNDLE}LoadingAngle_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0029
     * @tc.name      PullToRefresh_LoadingAngle_0029
     * @tc.desc      loadingAngle(value=684) returns 246240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0029 begin`);
      const actual: number = loadingAngle(684);
      logInfo(`loadingAngle(value=684): actual=${actual}`);
      expect(actual).assertEqual(246240);
      logInfo(`${BUNDLE}LoadingAngle_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0030
     * @tc.name      PullToRefresh_LoadingAngle_0030
     * @tc.desc      loadingAngle(value=756) returns 272160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0030 begin`);
      const actual: number = loadingAngle(756);
      logInfo(`loadingAngle(value=756): actual=${actual}`);
      expect(actual).assertEqual(272160);
      logInfo(`${BUNDLE}LoadingAngle_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0031
     * @tc.name      PullToRefresh_LoadingAngle_0031
     * @tc.desc      loadingAngle(value=792) returns 285120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0031 begin`);
      const actual: number = loadingAngle(792);
      logInfo(`loadingAngle(value=792): actual=${actual}`);
      expect(actual).assertEqual(285120);
      logInfo(`${BUNDLE}LoadingAngle_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0032
     * @tc.name      PullToRefresh_LoadingAngle_0032
     * @tc.desc      loadingAngle(value=828) returns 298080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0032 begin`);
      const actual: number = loadingAngle(828);
      logInfo(`loadingAngle(value=828): actual=${actual}`);
      expect(actual).assertEqual(298080);
      logInfo(`${BUNDLE}LoadingAngle_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0033
     * @tc.name      PullToRefresh_LoadingAngle_0033
     * @tc.desc      loadingAngle(value=864) returns 311040
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0033 begin`);
      const actual: number = loadingAngle(864);
      logInfo(`loadingAngle(value=864): actual=${actual}`);
      expect(actual).assertEqual(311040);
      logInfo(`${BUNDLE}LoadingAngle_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0034
     * @tc.name      PullToRefresh_LoadingAngle_0034
     * @tc.desc      loadingAngle(value=900) returns 324000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0034 begin`);
      const actual: number = loadingAngle(900);
      logInfo(`loadingAngle(value=900): actual=${actual}`);
      expect(actual).assertEqual(324000);
      logInfo(`${BUNDLE}LoadingAngle_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0035
     * @tc.name      PullToRefresh_LoadingAngle_0035
     * @tc.desc      loadingAngle(value=936) returns 336960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0035 begin`);
      const actual: number = loadingAngle(936);
      logInfo(`loadingAngle(value=936): actual=${actual}`);
      expect(actual).assertEqual(336960);
      logInfo(`${BUNDLE}LoadingAngle_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0036
     * @tc.name      PullToRefresh_LoadingAngle_0036
     * @tc.desc      loadingAngle(value=972) returns 349920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0036 begin`);
      const actual: number = loadingAngle(972);
      logInfo(`loadingAngle(value=972): actual=${actual}`);
      expect(actual).assertEqual(349920);
      logInfo(`${BUNDLE}LoadingAngle_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0037
     * @tc.name      PullToRefresh_LoadingAngle_0037
     * @tc.desc      loadingAngle(value=1008) returns 362880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0037 begin`);
      const actual: number = loadingAngle(1008);
      logInfo(`loadingAngle(value=1008): actual=${actual}`);
      expect(actual).assertEqual(362880);
      logInfo(`${BUNDLE}LoadingAngle_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0038
     * @tc.name      PullToRefresh_LoadingAngle_0038
     * @tc.desc      loadingAngle(value=1044) returns 375840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0038 begin`);
      const actual: number = loadingAngle(1044);
      logInfo(`loadingAngle(value=1044): actual=${actual}`);
      expect(actual).assertEqual(375840);
      logInfo(`${BUNDLE}LoadingAngle_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0039
     * @tc.name      PullToRefresh_LoadingAngle_0039
     * @tc.desc      loadingAngle(value=1080) returns 388800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0039 begin`);
      const actual: number = loadingAngle(1080);
      logInfo(`loadingAngle(value=1080): actual=${actual}`);
      expect(actual).assertEqual(388800);
      logInfo(`${BUNDLE}LoadingAngle_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0040
     * @tc.name      PullToRefresh_LoadingAngle_0040
     * @tc.desc      loadingAngle(value=1116) returns 401760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0040 begin`);
      const actual: number = loadingAngle(1116);
      logInfo(`loadingAngle(value=1116): actual=${actual}`);
      expect(actual).assertEqual(401760);
      logInfo(`${BUNDLE}LoadingAngle_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0041
     * @tc.name      PullToRefresh_LoadingAngle_0041
     * @tc.desc      loadingAngle(value=1152) returns 414720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0041 begin`);
      const actual: number = loadingAngle(1152);
      logInfo(`loadingAngle(value=1152): actual=${actual}`);
      expect(actual).assertEqual(414720);
      logInfo(`${BUNDLE}LoadingAngle_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0042
     * @tc.name      PullToRefresh_LoadingAngle_0042
     * @tc.desc      loadingAngle(value=1188) returns 427680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0042 begin`);
      const actual: number = loadingAngle(1188);
      logInfo(`loadingAngle(value=1188): actual=${actual}`);
      expect(actual).assertEqual(427680);
      logInfo(`${BUNDLE}LoadingAngle_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0043
     * @tc.name      PullToRefresh_LoadingAngle_0043
     * @tc.desc      loadingAngle(value=1224) returns 440640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0043 begin`);
      const actual: number = loadingAngle(1224);
      logInfo(`loadingAngle(value=1224): actual=${actual}`);
      expect(actual).assertEqual(440640);
      logInfo(`${BUNDLE}LoadingAngle_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0044
     * @tc.name      PullToRefresh_LoadingAngle_0044
     * @tc.desc      loadingAngle(value=1260) returns 453600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0044 begin`);
      const actual: number = loadingAngle(1260);
      logInfo(`loadingAngle(value=1260): actual=${actual}`);
      expect(actual).assertEqual(453600);
      logInfo(`${BUNDLE}LoadingAngle_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0045
     * @tc.name      PullToRefresh_LoadingAngle_0045
     * @tc.desc      loadingAngle(value=1296) returns 466560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0045 begin`);
      const actual: number = loadingAngle(1296);
      logInfo(`loadingAngle(value=1296): actual=${actual}`);
      expect(actual).assertEqual(466560);
      logInfo(`${BUNDLE}LoadingAngle_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0046
     * @tc.name      PullToRefresh_LoadingAngle_0046
     * @tc.desc      loadingAngle(value=1332) returns 479520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0046 begin`);
      const actual: number = loadingAngle(1332);
      logInfo(`loadingAngle(value=1332): actual=${actual}`);
      expect(actual).assertEqual(479520);
      logInfo(`${BUNDLE}LoadingAngle_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0047
     * @tc.name      PullToRefresh_LoadingAngle_0047
     * @tc.desc      loadingAngle(value=1368) returns 492480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0047 begin`);
      const actual: number = loadingAngle(1368);
      logInfo(`loadingAngle(value=1368): actual=${actual}`);
      expect(actual).assertEqual(492480);
      logInfo(`${BUNDLE}LoadingAngle_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0048
     * @tc.name      PullToRefresh_LoadingAngle_0048
     * @tc.desc      loadingAngle(value=1404) returns 505440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0048 begin`);
      const actual: number = loadingAngle(1404);
      logInfo(`loadingAngle(value=1404): actual=${actual}`);
      expect(actual).assertEqual(505440);
      logInfo(`${BUNDLE}LoadingAngle_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0049
     * @tc.name      PullToRefresh_LoadingAngle_0049
     * @tc.desc      loadingAngle(value=1440) returns 518400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0049 begin`);
      const actual: number = loadingAngle(1440);
      logInfo(`loadingAngle(value=1440): actual=${actual}`);
      expect(actual).assertEqual(518400);
      logInfo(`${BUNDLE}LoadingAngle_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0050
     * @tc.name      PullToRefresh_LoadingAngle_0050
     * @tc.desc      loadingAngle(value=573) returns 206280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0050 begin`);
      const actual: number = loadingAngle(573);
      logInfo(`loadingAngle(value=573): actual=${actual}`);
      expect(actual).assertEqual(206280);
      logInfo(`${BUNDLE}LoadingAngle_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0051
     * @tc.name      PullToRefresh_LoadingAngle_0051
     * @tc.desc      loadingAngle(value=14.36) returns 5169.599999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0051 begin`);
      const actual: number = loadingAngle(14.36);
      logInfo(`loadingAngle(value=14.36): actual=${actual}`);
      expect(actual).assertClose(5169.599999999999, PRECISION);
      logInfo(`${BUNDLE}LoadingAngle_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0052
     * @tc.name      PullToRefresh_LoadingAngle_0052
     * @tc.desc      loadingAngle(value=1344) returns 483840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0052 begin`);
      const actual: number = loadingAngle(1344);
      logInfo(`loadingAngle(value=1344): actual=${actual}`);
      expect(actual).assertEqual(483840);
      logInfo(`${BUNDLE}LoadingAngle_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0053
     * @tc.name      PullToRefresh_LoadingAngle_0053
     * @tc.desc      loadingAngle(value=711.21) returns 256035.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0053 begin`);
      const actual: number = loadingAngle(711.21);
      logInfo(`loadingAngle(value=711.21): actual=${actual}`);
      expect(actual).assertClose(256035.6, PRECISION);
      logInfo(`${BUNDLE}LoadingAngle_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0054
     * @tc.name      PullToRefresh_LoadingAngle_0054
     * @tc.desc      loadingAngle(value=1409) returns 507240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0054 begin`);
      const actual: number = loadingAngle(1409);
      logInfo(`loadingAngle(value=1409): actual=${actual}`);
      expect(actual).assertEqual(507240);
      logInfo(`${BUNDLE}LoadingAngle_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0055
     * @tc.name      PullToRefresh_LoadingAngle_0055
     * @tc.desc      loadingAngle(value=-703) returns -253080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadingAngle_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingAngle_0055 begin`);
      const actual: number = loadingAngle(-703);
      logInfo(`loadingAngle(value=-703): actual=${actual}`);
      expect(actual).assertEqual(-253080);
      logInfo(`${BUNDLE}LoadingAngle_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0056
     * @tc.name      PullToRefresh_LoadingAngle_0056
     * @tc.desc      loadingAngle(value=-358) returns -128880
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_LoadingAngle_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingAngle_0056 begin`);
      const actual: number = loadingAngle(-358);
      logInfo(`loadingAngle(value=-358): actual=${actual}`);
      expect(actual).assertEqual(-128880);
      logInfo(`${BUNDLE}LoadingAngle_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0057
     * @tc.name      PullToRefresh_LoadingAngle_0057
     * @tc.desc      loadingAngle(value=866) returns 311760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0057 begin`);
      const actual: number = loadingAngle(866);
      logInfo(`loadingAngle(value=866): actual=${actual}`);
      expect(actual).assertEqual(311760);
      logInfo(`${BUNDLE}LoadingAngle_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0058
     * @tc.name      PullToRefresh_LoadingAngle_0058
     * @tc.desc      loadingAngle(value=1429) returns 514440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0058 begin`);
      const actual: number = loadingAngle(1429);
      logInfo(`loadingAngle(value=1429): actual=${actual}`);
      expect(actual).assertEqual(514440);
      logInfo(`${BUNDLE}LoadingAngle_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LOADING_ANGLE_0059
     * @tc.name      PullToRefresh_LoadingAngle_0059
     * @tc.desc      loadingAngle(value=712) returns 256320
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_LoadingAngle_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingAngle_0059 begin`);
      const actual: number = loadingAngle(712);
      logInfo(`loadingAngle(value=712): actual=${actual}`);
      expect(actual).assertEqual(256320);
      logInfo(`${BUNDLE}LoadingAngle_0059 end`);
    });
  });
}
