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
import { scaleRatioOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for scaleRatioOf (96 cases). */
export default function scaleRatioOf2Test(): void {
  describe('ScaleRatioOf2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0097
     * @tc.name      ExpandTitle_ScaleRatioOf_0097
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=0, normalTitleHeight=100, titleScale=1.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0097 begin`);
      const actual: number = scaleRatioOf(-1, 0, 100, 1.5, 1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=0,...: actual=${actual}`);
      expect(actual).assertClose(-49.5, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0098
     * @tc.name      ExpandTitle_ScaleRatioOf_0098
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=-1, normalTitleHeight=1080, titleScale=1.5, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0098 begin`);
      const actual: number = scaleRatioOf(720, -1, 1080, 1.5, 100);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=-...: actual=${actual}`);
      expect(actual).assertClose(-0.7949999999999999, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0099
     * @tc.name      ExpandTitle_ScaleRatioOf_0099
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=3, normalTitleHeight=720, titleScale=0, continuePullThresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0099 begin`);
      const actual: number = scaleRatioOf(1, 3, 720, 0, 100);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertClose(8.190000000000001, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0100
     * @tc.name      ExpandTitle_ScaleRatioOf_0100
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=3, normalTitleHeight=720, titleScale=-1, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0100 begin`);
      const actual: number = scaleRatioOf(0, 3, 720, -1, 5);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertEqual(289);
      logInfo(`${BUNDLE}ScaleRatioOf_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0101
     * @tc.name      ExpandTitle_ScaleRatioOf_0101
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=50, normalTitleHeight=100, titleScale=1.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0101 begin`);
      const actual: number = scaleRatioOf(-1, 50, 100, 1.5, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=50...: actual=${actual}`);
      expect(actual).assertClose(-4.05, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0102
     * @tc.name      ExpandTitle_ScaleRatioOf_0102
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=100, normalTitleHeight=2, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0102 begin`);
      const actual: number = scaleRatioOf(100, 100, 2, 0, -1);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}ScaleRatioOf_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0103
     * @tc.name      ExpandTitle_ScaleRatioOf_0103
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=2, normalTitleHeight=1080, titleScale=1.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0103 begin`);
      const actual: number = scaleRatioOf(1, 2, 1080, 1.5, 2);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=2, ...: actual=${actual}`);
      expect(actual).assertClose(-268.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0104
     * @tc.name      ExpandTitle_ScaleRatioOf_0104
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=2, normalTitleHeight=360, titleScale=1.5, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0104 begin`);
      const actual: number = scaleRatioOf(0, 2, 360, 1.5, 3);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=2, ...: actual=${actual}`);
      expect(actual).assertEqual(-59);
      logInfo(`${BUNDLE}ScaleRatioOf_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0105
     * @tc.name      ExpandTitle_ScaleRatioOf_0105
     * @tc.desc      scaleRatioOf(heightValue=360, curOffset=2, normalTitleHeight=1080, titleScale=-1, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0105 begin`);
      const actual: number = scaleRatioOf(360, 2, 1080, -1, 100);
      logInfo(`scaleRatioOf(heightValue=360, curOffset=2...: actual=${actual}`);
      expect(actual).assertClose(15.4, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0106
     * @tc.name      ExpandTitle_ScaleRatioOf_0106
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=1080, titleScale=0.25, continuePu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0106 begin`);
      const actual: number = scaleRatioOf(-1, -100, 1080, 0.25, 1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertClose(736.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0107
     * @tc.name      ExpandTitle_ScaleRatioOf_0107
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=3, normalTitleHeight=0, titleScale=0.5, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0107 begin`);
      const actual: number = scaleRatioOf(-1, 3, 0, 0.5, 100);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=3,...: actual=${actual}`);
      expect(actual).assertClose(1.005, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0108
     * @tc.name      ExpandTitle_ScaleRatioOf_0108
     * @tc.desc      scaleRatioOf(heightValue=1080, curOffset=0, normalTitleHeight=2, titleScale=-1, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0108 begin`);
      const actual: number = scaleRatioOf(1080, 0, 2, -1, -1);
      logInfo(`scaleRatioOf(heightValue=1080, curOffset=...: actual=${actual}`);
      expect(actual).assertEqual(2157);
      logInfo(`${BUNDLE}ScaleRatioOf_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0109
     * @tc.name      ExpandTitle_ScaleRatioOf_0109
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=2, normalTitleHeight=1, titleScale=3, continuePullThreshol...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0109 begin`);
      const actual: number = scaleRatioOf(2, 2, 1, 3, 100);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=2, ...: actual=${actual}`);
      expect(actual).assertClose(1.02, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0110
     * @tc.name      ExpandTitle_ScaleRatioOf_0110
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=100, normalTitleHeight=720, titleScale=0.25, continuePul...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0110 begin`);
      const actual: number = scaleRatioOf(100, 100, 720, 0.25, 2);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=1...: actual=${actual}`);
      expect(actual).assertClose(233.5, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0111
     * @tc.name      ExpandTitle_ScaleRatioOf_0111
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=-1, normalTitleHeight=720, titleScale=0.25, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0111 begin`);
      const actual: number = scaleRatioOf(1, -1, 720, 0.25, 5);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(108.69999999999999, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0112
     * @tc.name      ExpandTitle_ScaleRatioOf_0112
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=1, normalTitleHeight=1080, titleScale=0.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0112 begin`);
      const actual: number = scaleRatioOf(1, 1, 1080, 0.5, 10);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=1, ...: actual=${actual}`);
      expect(actual).assertClose(54.95, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0113
     * @tc.name      ExpandTitle_ScaleRatioOf_0113
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=2, normalTitleHeight=360, titleScale=3, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0113 begin`);
      const actual: number = scaleRatioOf(100, 2, 360, 3, 100);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=2...: actual=${actual}`);
      expect(actual).assertClose(-4.2, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0114
     * @tc.name      ExpandTitle_ScaleRatioOf_0114
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=50, normalTitleHeight=720, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0114 begin`);
      const actual: number = scaleRatioOf(-1, 50, 720, 0, 1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=50...: actual=${actual}`);
      expect(actual).assertEqual(722);
      logInfo(`${BUNDLE}ScaleRatioOf_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0115
     * @tc.name      ExpandTitle_ScaleRatioOf_0115
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=50, normalTitleHeight=2, titleScale=3, continuePullThresho...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0115 begin`);
      const actual: number = scaleRatioOf(1, 50, 2, 3, 3);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=50,...: actual=${actual}`);
      expect(actual).assertClose(0.33333333333333337, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0116
     * @tc.name      ExpandTitle_ScaleRatioOf_0116
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=3, normalTitleHeight=360, titleScale=-1, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0116 begin`);
      const actual: number = scaleRatioOf(-1, 3, 360, -1, 100);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=3,...: actual=${actual}`);
      expect(actual).assertClose(8.219999999999999, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0117
     * @tc.name      ExpandTitle_ScaleRatioOf_0117
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-1, normalTitleHeight=360, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0117 begin`);
      const actual: number = scaleRatioOf(-1, -1, 360, 0, 3);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(121);
      logInfo(`${BUNDLE}ScaleRatioOf_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0118
     * @tc.name      ExpandTitle_ScaleRatioOf_0118
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=50, normalTitleHeight=1080, titleScale=1.5, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0118 begin`);
      const actual: number = scaleRatioOf(720, 50, 1080, 1.5, 1);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=5...: actual=${actual}`);
      expect(actual).assertEqual(-179);
      logInfo(`${BUNDLE}ScaleRatioOf_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0119
     * @tc.name      ExpandTitle_ScaleRatioOf_0119
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=1, titleScale=-1, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0119 begin`);
      const actual: number = scaleRatioOf(-1, -100, 1, -1, -1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(197);
      logInfo(`${BUNDLE}ScaleRatioOf_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0120
     * @tc.name      ExpandTitle_ScaleRatioOf_0120
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-1, normalTitleHeight=100, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0120 begin`);
      const actual: number = scaleRatioOf(-1, -1, 100, 0, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}ScaleRatioOf_0120 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0121
     * @tc.name      ExpandTitle_ScaleRatioOf_0121
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=100, normalTitleHeight=100, titleScale=2, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0121 begin`);
      const actual: number = scaleRatioOf(2, 100, 100, 2, 100);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(0.020000000000000018, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0121 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0122
     * @tc.name      ExpandTitle_ScaleRatioOf_0122
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=50, normalTitleHeight=1080, titleScale=3, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0122 begin`);
      const actual: number = scaleRatioOf(-1, 50, 1080, 3, 3);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=50...: actual=${actual}`);
      expect(actual).assertClose(-719.6666666666666, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0122 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0123
     * @tc.name      ExpandTitle_ScaleRatioOf_0123
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=1, normalTitleHeight=2, titleScale=0.25, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0123 begin`);
      const actual: number = scaleRatioOf(1, 1, 2, 0.25, 10);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=1, ...: actual=${actual}`);
      expect(actual).assertClose(1.075, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0123 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0124
     * @tc.name      ExpandTitle_ScaleRatioOf_0124
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=1, normalTitleHeight=0, titleScale=0.25, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0124 begin`);
      const actual: number = scaleRatioOf(720, 1, 0, 0.25, -1);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(541);
      logInfo(`${BUNDLE}ScaleRatioOf_0124 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0125
     * @tc.name      ExpandTitle_ScaleRatioOf_0125
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=0, normalTitleHeight=720, titleScale=3, continuePullThresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0125 begin`);
      const actual: number = scaleRatioOf(0, 0, 720, 3, 5);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=0, ...: actual=${actual}`);
      expect(actual).assertEqual(-287);
      logInfo(`${BUNDLE}ScaleRatioOf_0125 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0126
     * @tc.name      ExpandTitle_ScaleRatioOf_0126
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-1, normalTitleHeight=360, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0126 begin`);
      const actual: number = scaleRatioOf(-1, -1, 360, 0, 2);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(181);
      logInfo(`${BUNDLE}ScaleRatioOf_0126 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0127
     * @tc.name      ExpandTitle_ScaleRatioOf_0127
     * @tc.desc      scaleRatioOf(heightValue=360, curOffset=50, normalTitleHeight=0, titleScale=3, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0127 begin`);
      const actual: number = scaleRatioOf(360, 50, 0, 3, -1);
      logInfo(`scaleRatioOf(heightValue=360, curOffset=5...: actual=${actual}`);
      expect(actual).assertEqual(-719);
      logInfo(`${BUNDLE}ScaleRatioOf_0127 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0128
     * @tc.name      ExpandTitle_ScaleRatioOf_0128
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=3, normalTitleHeight=720, titleScale=0.25, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0128 begin`);
      const actual: number = scaleRatioOf(100, 3, 720, 0.25, 3);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=3...: actual=${actual}`);
      expect(actual).assertEqual(156);
      logInfo(`${BUNDLE}ScaleRatioOf_0128 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0129
     * @tc.name      ExpandTitle_ScaleRatioOf_0129
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=3, normalTitleHeight=360, titleScale=0.5, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0129 begin`);
      const actual: number = scaleRatioOf(1, 3, 360, 0.5, 2);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertClose(90.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0129 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0130
     * @tc.name      ExpandTitle_ScaleRatioOf_0130
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-1, normalTitleHeight=360, titleScale=-1, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0130 begin`);
      const actual: number = scaleRatioOf(-1, -1, 360, -1, 3);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(241);
      logInfo(`${BUNDLE}ScaleRatioOf_0130 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0131
     * @tc.name      ExpandTitle_ScaleRatioOf_0131
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=100, normalTitleHeight=720, titleScale=0, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0131 begin`);
      const actual: number = scaleRatioOf(-1, 100, 720, 0, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=10...: actual=${actual}`);
      expect(actual).assertClose(73.1, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0131 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0132
     * @tc.name      ExpandTitle_ScaleRatioOf_0132
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-1, normalTitleHeight=1080, titleScale=2, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0132 begin`);
      const actual: number = scaleRatioOf(0, -1, 1080, 2, 100);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(-9.79, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0132 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0133
     * @tc.name      ExpandTitle_ScaleRatioOf_0133
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=-100, normalTitleHeight=1080, titleScale=3, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0133 begin`);
      const actual: number = scaleRatioOf(720, -100, 1080, 3, 10);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=-...: actual=${actual}`);
      expect(actual).assertEqual(-51);
      logInfo(`${BUNDLE}ScaleRatioOf_0133 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0134
     * @tc.name      ExpandTitle_ScaleRatioOf_0134
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=2, normalTitleHeight=1080, titleScale=0, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0134 begin`);
      const actual: number = scaleRatioOf(720, 2, 1080, 0, 1);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=2...: actual=${actual}`);
      expect(actual).assertEqual(361);
      logInfo(`${BUNDLE}ScaleRatioOf_0134 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0135
     * @tc.name      ExpandTitle_ScaleRatioOf_0135
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=720, titleScale=-1, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0135 begin`);
      const actual: number = scaleRatioOf(-1, -100, 720, -1, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertClose(125.2, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0135 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0136
     * @tc.name      ExpandTitle_ScaleRatioOf_0136
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=0, normalTitleHeight=2, titleScale=-1, continuePullThresho...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0136 begin`);
      const actual: number = scaleRatioOf(0, 0, 2, -1, 5);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=0, ...: actual=${actual}`);
      expect(actual).assertClose(1.8, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0136 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0137
     * @tc.name      ExpandTitle_ScaleRatioOf_0137
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=100, normalTitleHeight=0, titleScale=0.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0137 begin`);
      const actual: number = scaleRatioOf(100, 100, 0, 0.5, -1);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(51);
      logInfo(`${BUNDLE}ScaleRatioOf_0137 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0138
     * @tc.name      ExpandTitle_ScaleRatioOf_0138
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=50, normalTitleHeight=0, titleScale=1.5, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0138 begin`);
      const actual: number = scaleRatioOf(-1, 50, 0, 1.5, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=50...: actual=${actual}`);
      expect(actual).assertClose(0.95, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0138 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0139
     * @tc.name      ExpandTitle_ScaleRatioOf_0139
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=100, normalTitleHeight=360, titleScale=-1, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0139 begin`);
      const actual: number = scaleRatioOf(720, 100, 360, -1, -1);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(721);
      logInfo(`${BUNDLE}ScaleRatioOf_0139 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0140
     * @tc.name      ExpandTitle_ScaleRatioOf_0140
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=-1, normalTitleHeight=360, titleScale=2, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0140 begin`);
      const actual: number = scaleRatioOf(100, -1, 360, 2, 5);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=-...: actual=${actual}`);
      expect(actual).assertClose(-50.8, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0140 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0141
     * @tc.name      ExpandTitle_ScaleRatioOf_0141
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=1, normalTitleHeight=1080, titleScale=0.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0141 begin`);
      const actual: number = scaleRatioOf(2, 1, 1080, 0.5, 1);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=1, ...: actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}ScaleRatioOf_0141 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0142
     * @tc.name      ExpandTitle_ScaleRatioOf_0142
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=-1, normalTitleHeight=100, titleScale=1.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0142 begin`);
      const actual: number = scaleRatioOf(2, -1, 100, 1.5, 1);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(-47.5, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0142 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0143
     * @tc.name      ExpandTitle_ScaleRatioOf_0143
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=100, normalTitleHeight=0, titleScale=3, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0143 begin`);
      const actual: number = scaleRatioOf(-1, 100, 0, 3, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=10...: actual=${actual}`);
      expect(actual).assertClose(0.8, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0143 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0144
     * @tc.name      ExpandTitle_ScaleRatioOf_0144
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=-100, normalTitleHeight=360, titleScale=0.5, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0144 begin`);
      const actual: number = scaleRatioOf(2, -100, 360, 0.5, 1);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=-10...: actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}ScaleRatioOf_0144 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0145
     * @tc.name      ExpandTitle_ScaleRatioOf_0145
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-1, normalTitleHeight=100, titleScale=1.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0145 begin`);
      const actual: number = scaleRatioOf(0, -1, 100, 1.5, 10);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(-3.95, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0145 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0146
     * @tc.name      ExpandTitle_ScaleRatioOf_0146
     * @tc.desc      scaleRatioOf(heightValue=360, curOffset=1, normalTitleHeight=1080, titleScale=0.25, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0146 begin`);
      const actual: number = scaleRatioOf(360, 1, 1080, 0.25, 2);
      logInfo(`scaleRatioOf(heightValue=360, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(271);
      logInfo(`${BUNDLE}ScaleRatioOf_0146 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0147
     * @tc.name      ExpandTitle_ScaleRatioOf_0147
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=-1, normalTitleHeight=360, titleScale=1.5, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0147 begin`);
      const actual: number = scaleRatioOf(100, -1, 360, 1.5, 3);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=-...: actual=${actual}`);
      expect(actual).assertClose(-42.166666666666664, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0147 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0148
     * @tc.name      ExpandTitle_ScaleRatioOf_0148
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-1, normalTitleHeight=720, titleScale=0.25, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0148 begin`);
      const actual: number = scaleRatioOf(0, -1, 720, 0.25, 3);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(180.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0148 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0149
     * @tc.name      ExpandTitle_ScaleRatioOf_0149
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=0, normalTitleHeight=1, titleScale=2, continuePullThresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0149 begin`);
      const actual: number = scaleRatioOf(100, 0, 1, 2, 100);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=0...: actual=${actual}`);
      expect(actual).assertClose(1.99, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0149 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0150
     * @tc.name      ExpandTitle_ScaleRatioOf_0150
     * @tc.desc      scaleRatioOf(heightValue=360, curOffset=2, normalTitleHeight=1, titleScale=0, continuePullThresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0150 begin`);
      const actual: number = scaleRatioOf(360, 2, 1, 0, -1);
      logInfo(`scaleRatioOf(heightValue=360, curOffset=2...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}ScaleRatioOf_0150 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0151
     * @tc.name      ExpandTitle_ScaleRatioOf_0151
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=-1, normalTitleHeight=1080, titleScale=1.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0151 begin`);
      const actual: number = scaleRatioOf(1, -1, 1080, 1.5, 2);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(-268.5, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0151 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0152
     * @tc.name      ExpandTitle_ScaleRatioOf_0152
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=0, titleScale=2, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0152 begin`);
      const actual: number = scaleRatioOf(-1, -100, 0, 2, -1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(-98);
      logInfo(`${BUNDLE}ScaleRatioOf_0152 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0153
     * @tc.name      ExpandTitle_ScaleRatioOf_0153
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=0, normalTitleHeight=360, titleScale=0, continuePullThresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0153 begin`);
      const actual: number = scaleRatioOf(0, 0, 360, 0, 100);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=0, ...: actual=${actual}`);
      expect(actual).assertClose(4.6, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0153 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0154
     * @tc.name      ExpandTitle_ScaleRatioOf_0154
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=100, normalTitleHeight=1, titleScale=1.5, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0154 begin`);
      const actual: number = scaleRatioOf(0, 100, 1, 1.5, 2);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0154 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0155
     * @tc.name      ExpandTitle_ScaleRatioOf_0155
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-1, normalTitleHeight=360, titleScale=0.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0155 begin`);
      const actual: number = scaleRatioOf(-1, -1, 360, 0.5, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}ScaleRatioOf_0155 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0156
     * @tc.name      ExpandTitle_ScaleRatioOf_0156
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=-1, normalTitleHeight=100, titleScale=3, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0156 begin`);
      const actual: number = scaleRatioOf(2, -1, 100, 3, 10);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(-18.4, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0156 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0157
     * @tc.name      ExpandTitle_ScaleRatioOf_0157
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-1, normalTitleHeight=1080, titleScale=0.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0157 begin`);
      const actual: number = scaleRatioOf(0, -1, 1080, 0.5, 2);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(270.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0157 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0158
     * @tc.name      ExpandTitle_ScaleRatioOf_0158
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=2, normalTitleHeight=360, titleScale=0.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0158 begin`);
      const actual: number = scaleRatioOf(100, 2, 360, 0.5, 10);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=2...: actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}ScaleRatioOf_0158 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0159
     * @tc.name      ExpandTitle_ScaleRatioOf_0159
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=50, normalTitleHeight=720, titleScale=2, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0159 begin`);
      const actual: number = scaleRatioOf(100, 50, 720, 2, 2);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=5...: actual=${actual}`);
      expect(actual).assertEqual(-309);
      logInfo(`${BUNDLE}ScaleRatioOf_0159 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0160
     * @tc.name      ExpandTitle_ScaleRatioOf_0160
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=100, normalTitleHeight=1080, titleScale=-1, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0160 begin`);
      const actual: number = scaleRatioOf(2, 100, 1080, -1, 100);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(22.56, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0160 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0161
     * @tc.name      ExpandTitle_ScaleRatioOf_0161
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=3, normalTitleHeight=1080, titleScale=0.25, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0161 begin`);
      const actual: number = scaleRatioOf(2, 3, 1080, 0.25, 10);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertClose(81.85, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0161 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0162
     * @tc.name      ExpandTitle_ScaleRatioOf_0162
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=3, normalTitleHeight=360, titleScale=0.25, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0162 begin`);
      const actual: number = scaleRatioOf(1, 3, 360, 0.25, 1);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertClose(270.25, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0162 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0163
     * @tc.name      ExpandTitle_ScaleRatioOf_0163
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=100, normalTitleHeight=1080, titleScale=3, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0163 begin`);
      const actual: number = scaleRatioOf(100, 100, 1080, 3, 2);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(-979);
      logInfo(`${BUNDLE}ScaleRatioOf_0163 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0164
     * @tc.name      ExpandTitle_ScaleRatioOf_0164
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=1, normalTitleHeight=100, titleScale=0.25, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0164 begin`);
      const actual: number = scaleRatioOf(0, 1, 100, 0.25, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=1, ...: actual=${actual}`);
      expect(actual).assertEqual(76);
      logInfo(`${BUNDLE}ScaleRatioOf_0164 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0165
     * @tc.name      ExpandTitle_ScaleRatioOf_0165
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=-100, normalTitleHeight=720, titleScale=0.25, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0165 begin`);
      const actual: number = scaleRatioOf(1, -100, 720, 0.25, 100);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=-10...: actual=${actual}`);
      expect(actual).assertClose(5.6425, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0165 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0166
     * @tc.name      ExpandTitle_ScaleRatioOf_0166
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=50, normalTitleHeight=720, titleScale=1.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0166 begin`);
      const actual: number = scaleRatioOf(2, 50, 720, 1.5, 3);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=50,...: actual=${actual}`);
      expect(actual).assertClose(-118.66666666666667, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0166 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0167
     * @tc.name      ExpandTitle_ScaleRatioOf_0167
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=1, normalTitleHeight=1080, titleScale=1.5, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0167 begin`);
      const actual: number = scaleRatioOf(720, 1, 1080, 1.5, 10);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(-17);
      logInfo(`${BUNDLE}ScaleRatioOf_0167 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0168
     * @tc.name      ExpandTitle_ScaleRatioOf_0168
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=3, normalTitleHeight=720, titleScale=-1, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0168 begin`);
      const actual: number = scaleRatioOf(-1, 3, 720, -1, 5);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=3,...: actual=${actual}`);
      expect(actual).assertClose(289.4, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0168 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0169
     * @tc.name      ExpandTitle_ScaleRatioOf_0169
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=100, normalTitleHeight=360, titleScale=0.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0169 begin`);
      const actual: number = scaleRatioOf(2, 100, 360, 0.5, 10);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(18.9, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0169 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0170
     * @tc.name      ExpandTitle_ScaleRatioOf_0170
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=-100, normalTitleHeight=720, titleScale=3, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0170 begin`);
      const actual: number = scaleRatioOf(2, -100, 720, 3, 10);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=-10...: actual=${actual}`);
      expect(actual).assertClose(-122.6, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0170 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0171
     * @tc.name      ExpandTitle_ScaleRatioOf_0171
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=1, normalTitleHeight=2, titleScale=3, continuePullThreshol...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0171 begin`);
      const actual: number = scaleRatioOf(0, 1, 2, 3, 100);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=1, ...: actual=${actual}`);
      expect(actual).assertClose(0.96, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0171 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0172
     * @tc.name      ExpandTitle_ScaleRatioOf_0172
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=-100, normalTitleHeight=-1, titleScale=0.25, continuePul...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0172 begin`);
      const actual: number = scaleRatioOf(720, -100, -1, 0.25, -1);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=-...: actual=${actual}`);
      expect(actual).assertClose(616.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0172 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0173
     * @tc.name      ExpandTitle_ScaleRatioOf_0173
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=3, normalTitleHeight=720, titleScale=0.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0173 begin`);
      const actual: number = scaleRatioOf(-1, 3, 720, 0.5, 3);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=3,...: actual=${actual}`);
      expect(actual).assertClose(121.16666666666667, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0173 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0174
     * @tc.name      ExpandTitle_ScaleRatioOf_0174
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=50, normalTitleHeight=360, titleScale=0.25, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0174 begin`);
      const actual: number = scaleRatioOf(1, 50, 360, 0.25, 100);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=50,...: actual=${actual}`);
      expect(actual).assertClose(3.6925, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0174 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0175
     * @tc.name      ExpandTitle_ScaleRatioOf_0175
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=720, titleScale=0, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0175 begin`);
      const actual: number = scaleRatioOf(-1, -100, 720, 0, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertClose(63.1, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0175 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0176
     * @tc.name      ExpandTitle_ScaleRatioOf_0176
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=-100, normalTitleHeight=720, titleScale=3, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0176 begin`);
      const actual: number = scaleRatioOf(100, -100, 720, 3, 1);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=-...: actual=${actual}`);
      expect(actual).assertEqual(-1039);
      logInfo(`${BUNDLE}ScaleRatioOf_0176 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0177
     * @tc.name      ExpandTitle_ScaleRatioOf_0177
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=2, normalTitleHeight=360, titleScale=0.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0177 begin`);
      const actual: number = scaleRatioOf(100, 2, 360, 0.5, 1);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=2...: actual=${actual}`);
      expect(actual).assertEqual(131);
      logInfo(`${BUNDLE}ScaleRatioOf_0177 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0178
     * @tc.name      ExpandTitle_ScaleRatioOf_0178
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=3, normalTitleHeight=100, titleScale=0.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0178 begin`);
      const actual: number = scaleRatioOf(-1, 3, 100, 0.5, 1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=3,...: actual=${actual}`);
      expect(actual).assertClose(51.5, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0178 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0179
     * @tc.name      ExpandTitle_ScaleRatioOf_0179
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=-100, normalTitleHeight=360, titleScale=-1, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0179 begin`);
      const actual: number = scaleRatioOf(100, -100, 360, -1, 3);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=-...: actual=${actual}`);
      expect(actual).assertClose(107.66666666666667, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0179 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0180
     * @tc.name      ExpandTitle_ScaleRatioOf_0180
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=3, normalTitleHeight=360, titleScale=1.5, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0180 begin`);
      const actual: number = scaleRatioOf(0, 3, 360, 1.5, 5);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertEqual(-35);
      logInfo(`${BUNDLE}ScaleRatioOf_0180 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0181
     * @tc.name      ExpandTitle_ScaleRatioOf_0181
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=-1, normalTitleHeight=360, titleScale=0, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0181 begin`);
      const actual: number = scaleRatioOf(100, -1, 360, 0, 10);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=-...: actual=${actual}`);
      expect(actual).assertClose(26.9, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0181 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0182
     * @tc.name      ExpandTitle_ScaleRatioOf_0182
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=1, normalTitleHeight=100, titleScale=3, continuePullThresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0182 begin`);
      const actual: number = scaleRatioOf(2, 1, 100, 3, 2);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=1, ...: actual=${actual}`);
      expect(actual).assertEqual(-97);
      logInfo(`${BUNDLE}ScaleRatioOf_0182 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0183
     * @tc.name      ExpandTitle_ScaleRatioOf_0183
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=2, normalTitleHeight=360, titleScale=0.25, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0183 begin`);
      const actual: number = scaleRatioOf(1, 2, 360, 0.25, 2);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=2, ...: actual=${actual}`);
      expect(actual).assertClose(135.625, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0183 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0184
     * @tc.name      ExpandTitle_ScaleRatioOf_0184
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=100, normalTitleHeight=2, titleScale=3, continuePullThresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0184 begin`);
      const actual: number = scaleRatioOf(0, 100, 2, 3, 3);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(-0.33333333333333326, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0184 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0185
     * @tc.name      ExpandTitle_ScaleRatioOf_0185
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=100, normalTitleHeight=720, titleScale=2, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0185 begin`);
      const actual: number = scaleRatioOf(1, 100, 720, 2, 5);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(-142.8, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0185 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0186
     * @tc.name      ExpandTitle_ScaleRatioOf_0186
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=360, titleScale=-1, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0186 begin`);
      const actual: number = scaleRatioOf(-1, -100, 360, -1, 5);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertClose(105.4, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0186 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0187
     * @tc.name      ExpandTitle_ScaleRatioOf_0187
     * @tc.desc      scaleRatioOf(heightValue=360, curOffset=-1, normalTitleHeight=100, titleScale=2, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0187 begin`);
      const actual: number = scaleRatioOf(360, -1, 100, 2, -1);
      logInfo(`scaleRatioOf(heightValue=360, curOffset=-...: actual=${actual}`);
      expect(actual).assertEqual(-260);
      logInfo(`${BUNDLE}ScaleRatioOf_0187 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0188
     * @tc.name      ExpandTitle_ScaleRatioOf_0188
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=100, normalTitleHeight=100, titleScale=-1, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0188 begin`);
      const actual: number = scaleRatioOf(-1, 100, 100, -1, 10);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=10...: actual=${actual}`);
      expect(actual).assertClose(21.2, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0188 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0189
     * @tc.name      ExpandTitle_ScaleRatioOf_0189
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=3, normalTitleHeight=360, titleScale=3, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0189 begin`);
      const actual: number = scaleRatioOf(-1, 3, 360, 3, 1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=3,...: actual=${actual}`);
      expect(actual).assertEqual(-721);
      logInfo(`${BUNDLE}ScaleRatioOf_0189 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0190
     * @tc.name      ExpandTitle_ScaleRatioOf_0190
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=50, normalTitleHeight=1, titleScale=0, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0190 begin`);
      const actual: number = scaleRatioOf(720, 50, 1, 0, -1);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=5...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ScaleRatioOf_0190 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0191
     * @tc.name      ExpandTitle_ScaleRatioOf_0191
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=720, titleScale=-1, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0191 begin`);
      const actual: number = scaleRatioOf(-1, -100, 720, -1, 1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(1243);
      logInfo(`${BUNDLE}ScaleRatioOf_0191 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0192
     * @tc.name      ExpandTitle_ScaleRatioOf_0192
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=3, normalTitleHeight=1080, titleScale=2, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0192 begin`);
      const actual: number = scaleRatioOf(2, 3, 1080, 2, 3);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertClose(-358.3333333333333, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0192 end`);
    });
  });
}
