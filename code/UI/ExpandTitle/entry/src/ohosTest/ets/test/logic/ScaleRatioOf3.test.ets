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

/** Logic checks for scaleRatioOf (50 cases). */
export default function scaleRatioOf3Test(): void {
  describe('ScaleRatioOf3Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0193
     * @tc.name      ExpandTitle_ScaleRatioOf_0193
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=100, normalTitleHeight=360, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0193 begin`);
      const actual: number = scaleRatioOf(1, 100, 360, 0, 5);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(72.8, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0193 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0194
     * @tc.name      ExpandTitle_ScaleRatioOf_0194
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-100, normalTitleHeight=1080, titleScale=1.5, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0194 begin`);
      const actual: number = scaleRatioOf(0, -100, 1080, 1.5, 100);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-10...: actual=${actual}`);
      expect(actual).assertClose(-3.9000000000000004, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0194 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0195
     * @tc.name      ExpandTitle_ScaleRatioOf_0195
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=360, titleScale=1.5, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0195 begin`);
      const actual: number = scaleRatioOf(-1, -100, 360, 1.5, 5);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertClose(-25.1, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0195 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0196
     * @tc.name      ExpandTitle_ScaleRatioOf_0196
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=100, normalTitleHeight=1080, titleScale=3, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0196 begin`);
      const actual: number = scaleRatioOf(2, 100, 1080, 3, 5);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(-430.2, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0196 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0197
     * @tc.name      ExpandTitle_ScaleRatioOf_0197
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=1, normalTitleHeight=100, titleScale=1.5, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0197 begin`);
      const actual: number = scaleRatioOf(1, 1, 100, 1.5, 2);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=1, ...: actual=${actual}`);
      expect(actual).assertClose(-23.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0197 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0198
     * @tc.name      ExpandTitle_ScaleRatioOf_0198
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=-1, normalTitleHeight=720, titleScale=0.5, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0198 begin`);
      const actual: number = scaleRatioOf(100, -1, 720, 0.5, 2);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=-...: actual=${actual}`);
      expect(actual).assertClose(155.75, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0198 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0199
     * @tc.name      ExpandTitle_ScaleRatioOf_0199
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=2, normalTitleHeight=360, titleScale=0.25, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0199 begin`);
      const actual: number = scaleRatioOf(100, 2, 360, 0.25, 1);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=2...: actual=${actual}`);
      expect(actual).assertEqual(196);
      logInfo(`${BUNDLE}ScaleRatioOf_0199 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0200
     * @tc.name      ExpandTitle_ScaleRatioOf_0200
     * @tc.desc      scaleRatioOf(heightValue=360, curOffset=3, normalTitleHeight=1080, titleScale=3, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0200 begin`);
      const actual: number = scaleRatioOf(360, 3, 1080, 3, 100);
      logInfo(`scaleRatioOf(heightValue=360, curOffset=3...: actual=${actual}`);
      expect(actual).assertClose(-13.4, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0200 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0201
     * @tc.name      ExpandTitle_ScaleRatioOf_0201
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-1, normalTitleHeight=360, titleScale=0, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0201 begin`);
      const actual: number = scaleRatioOf(0, -1, 360, 0, 2);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(180.5, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0201 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0202
     * @tc.name      ExpandTitle_ScaleRatioOf_0202
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=0, normalTitleHeight=1080, titleScale=3, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0202 begin`);
      const actual: number = scaleRatioOf(720, 0, 1080, 3, 10);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=0...: actual=${actual}`);
      expect(actual).assertEqual(-71);
      logInfo(`${BUNDLE}ScaleRatioOf_0202 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0203
     * @tc.name      ExpandTitle_ScaleRatioOf_0203
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=100, normalTitleHeight=1080, titleScale=3, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0203 begin`);
      const actual: number = scaleRatioOf(100, 100, 1080, 3, 5);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(-391);
      logInfo(`${BUNDLE}ScaleRatioOf_0203 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0204
     * @tc.name      ExpandTitle_ScaleRatioOf_0204
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=50, normalTitleHeight=100, titleScale=2, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0204 begin`);
      const actual: number = scaleRatioOf(1, 50, 100, 2, 100);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=50,...: actual=${actual}`);
      expect(actual).assertClose(0.010000000000000009, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0204 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0205
     * @tc.name      ExpandTitle_ScaleRatioOf_0205
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=50, normalTitleHeight=360, titleScale=0.25, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0205 begin`);
      const actual: number = scaleRatioOf(-1, 50, 360, 0.25, 3);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=50...: actual=${actual}`);
      expect(actual).assertClose(91.25, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0205 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0206
     * @tc.name      ExpandTitle_ScaleRatioOf_0206
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=0, normalTitleHeight=720, titleScale=0.25, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0206 begin`);
      const actual: number = scaleRatioOf(1, 0, 720, 0.25, 2);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=0, ...: actual=${actual}`);
      expect(actual).assertClose(270.625, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0206 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0207
     * @tc.name      ExpandTitle_ScaleRatioOf_0207
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=-100, normalTitleHeight=720, titleScale=-1, continuePull...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0207 begin`);
      const actual: number = scaleRatioOf(720, -100, 720, -1, -1);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=-...: actual=${actual}`);
      expect(actual).assertEqual(201);
      logInfo(`${BUNDLE}ScaleRatioOf_0207 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0208
     * @tc.name      ExpandTitle_ScaleRatioOf_0208
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=2, normalTitleHeight=1, titleScale=0, continuePullThreshol...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0208 begin`);
      const actual: number = scaleRatioOf(0, 2, 1, 0, 100);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=2, ...: actual=${actual}`);
      expect(actual).assertClose(1.01, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0208 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0209
     * @tc.name      ExpandTitle_ScaleRatioOf_0209
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=2, normalTitleHeight=360, titleScale=-1, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0209 begin`);
      const actual: number = scaleRatioOf(2, 2, 360, -1, 3);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=2, ...: actual=${actual}`);
      expect(actual).assertClose(239.66666666666666, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0209 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0210
     * @tc.name      ExpandTitle_ScaleRatioOf_0210
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=50, normalTitleHeight=720, titleScale=-1, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0210 begin`);
      const actual: number = scaleRatioOf(1, 50, 720, -1, 5);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=50,...: actual=${actual}`);
      expect(actual).assertClose(288.6, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0210 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0211
     * @tc.name      ExpandTitle_ScaleRatioOf_0211
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=50, normalTitleHeight=1080, titleScale=0.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0211 begin`);
      const actual: number = scaleRatioOf(2, 50, 1080, 0.5, 3);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=50,...: actual=${actual}`);
      expect(actual).assertClose(180.66666666666666, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0211 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0212
     * @tc.name      ExpandTitle_ScaleRatioOf_0212
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=100, normalTitleHeight=1, titleScale=-1, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0212 begin`);
      const actual: number = scaleRatioOf(100, 100, 1, -1, -1);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=1...: actual=${actual}`);
      expect(actual).assertEqual(199);
      logInfo(`${BUNDLE}ScaleRatioOf_0212 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0213
     * @tc.name      ExpandTitle_ScaleRatioOf_0213
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=2, normalTitleHeight=-1, titleScale=3, continuePullThresho...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0213 begin`);
      const actual: number = scaleRatioOf(2, 2, -1, 3, 100);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=2, ...: actual=${actual}`);
      expect(actual).assertClose(1.06, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0213 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0214
     * @tc.name      ExpandTitle_ScaleRatioOf_0214
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=100, normalTitleHeight=720, titleScale=1.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0214 begin`);
      const actual: number = scaleRatioOf(2, 100, 720, 1.5, 5);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(-70.8, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0214 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0215
     * @tc.name      ExpandTitle_ScaleRatioOf_0215
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=100, normalTitleHeight=1080, titleScale=0.5, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0215 begin`);
      const actual: number = scaleRatioOf(1, 100, 1080, 0.5, 100);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=100...: actual=${actual}`);
      expect(actual).assertClose(6.395, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0215 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0216
     * @tc.name      ExpandTitle_ScaleRatioOf_0216
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=50, normalTitleHeight=1080, titleScale=0.5, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0216 begin`);
      const actual: number = scaleRatioOf(1, 50, 1080, 0.5, 1);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=50,...: actual=${actual}`);
      expect(actual).assertClose(540.5, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0216 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0217
     * @tc.name      ExpandTitle_ScaleRatioOf_0217
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=3, normalTitleHeight=360, titleScale=0.25, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0217 begin`);
      const actual: number = scaleRatioOf(100, 3, 360, 0.25, 2);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=3...: actual=${actual}`);
      expect(actual).assertClose(98.5, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0217 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0218
     * @tc.name      ExpandTitle_ScaleRatioOf_0218
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=-1, normalTitleHeight=360, titleScale=0.25, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0218 begin`);
      const actual: number = scaleRatioOf(1, -1, 360, 0.25, 2);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertClose(135.25, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0218 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0219
     * @tc.name      ExpandTitle_ScaleRatioOf_0219
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=1, normalTitleHeight=100, titleScale=-1, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0219 begin`);
      const actual: number = scaleRatioOf(0, 1, 100, -1, 10);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=1, ...: actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}ScaleRatioOf_0219 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0220
     * @tc.name      ExpandTitle_ScaleRatioOf_0220
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=0, normalTitleHeight=100, titleScale=2, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0220 begin`);
      const actual: number = scaleRatioOf(-1, 0, 100, 2, 100);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=0,...: actual=${actual}`);
      expect(actual).assertClose(-0.010000000000000009, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0220 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0221
     * @tc.name      ExpandTitle_ScaleRatioOf_0221
     * @tc.desc      scaleRatioOf(heightValue=1080, curOffset=0, normalTitleHeight=1, titleScale=3, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0221 begin`);
      const actual: number = scaleRatioOf(1080, 0, 1, 3, -1);
      logInfo(`scaleRatioOf(heightValue=1080, curOffset=...: actual=${actual}`);
      expect(actual).assertEqual(-2157);
      logInfo(`${BUNDLE}ScaleRatioOf_0221 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0222
     * @tc.name      ExpandTitle_ScaleRatioOf_0222
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=-100, normalTitleHeight=360, titleScale=2, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0222 begin`);
      const actual: number = scaleRatioOf(2, -100, 360, 2, 1);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=-10...: actual=${actual}`);
      expect(actual).assertEqual(-257);
      logInfo(`${BUNDLE}ScaleRatioOf_0222 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0223
     * @tc.name      ExpandTitle_ScaleRatioOf_0223
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=3, normalTitleHeight=720, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0223 begin`);
      const actual: number = scaleRatioOf(100, 3, 720, 0, 5);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=3...: actual=${actual}`);
      expect(actual).assertEqual(125);
      logInfo(`${BUNDLE}ScaleRatioOf_0223 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0224
     * @tc.name      ExpandTitle_ScaleRatioOf_0224
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=-1, normalTitleHeight=1080, titleScale=-1, continuePullT...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0224 begin`);
      const actual: number = scaleRatioOf(100, -1, 1080, -1, 2);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=-...: actual=${actual}`);
      expect(actual).assertEqual(980);
      logInfo(`${BUNDLE}ScaleRatioOf_0224 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0225
     * @tc.name      ExpandTitle_ScaleRatioOf_0225
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=50, normalTitleHeight=720, titleScale=1.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0225 begin`);
      const actual: number = scaleRatioOf(1, 50, 720, 1.5, 3);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=50,...: actual=${actual}`);
      expect(actual).assertClose(-118.83333333333333, PRECISION);
      logInfo(`${BUNDLE}ScaleRatioOf_0225 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0226
     * @tc.name      ExpandTitle_ScaleRatioOf_0226
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=3, normalTitleHeight=1080, titleScale=1.5, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ScaleRatioOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0226 begin`);
      const actual: number = scaleRatioOf(0, 3, 1080, 1.5, 10);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertEqual(-53);
      logInfo(`${BUNDLE}ScaleRatioOf_0226 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0227
     * @tc.name      ExpandTitle_ScaleRatioOf_0227
     * @tc.desc      scaleRatioOf(heightValue=1, curOffset=-100, normalTitleHeight=0, titleScale=0, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0227 begin`);
      const actual: number = scaleRatioOf(1, -100, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=1, curOffset=-10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0227 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0228
     * @tc.name      ExpandTitle_ScaleRatioOf_0228
     * @tc.desc      scaleRatioOf(heightValue=2, curOffset=-100, normalTitleHeight=0, titleScale=0, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0228 begin`);
      const actual: number = scaleRatioOf(2, -100, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=2, curOffset=-10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0228 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0229
     * @tc.name      ExpandTitle_ScaleRatioOf_0229
     * @tc.desc      scaleRatioOf(heightValue=-1, curOffset=-100, normalTitleHeight=0, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0229 begin`);
      const actual: number = scaleRatioOf(-1, -100, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=-1, curOffset=-1...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0229 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0230
     * @tc.name      ExpandTitle_ScaleRatioOf_0230
     * @tc.desc      scaleRatioOf(heightValue=100, curOffset=-100, normalTitleHeight=0, titleScale=0, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0230 begin`);
      const actual: number = scaleRatioOf(100, -100, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=100, curOffset=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0230 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0231
     * @tc.name      ExpandTitle_ScaleRatioOf_0231
     * @tc.desc      scaleRatioOf(heightValue=360, curOffset=-100, normalTitleHeight=0, titleScale=0, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0231 begin`);
      const actual: number = scaleRatioOf(360, -100, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=360, curOffset=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0231 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0232
     * @tc.name      ExpandTitle_ScaleRatioOf_0232
     * @tc.desc      scaleRatioOf(heightValue=720, curOffset=-100, normalTitleHeight=0, titleScale=0, continuePullThr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0232 begin`);
      const actual: number = scaleRatioOf(720, -100, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=720, curOffset=-...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0232 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0233
     * @tc.name      ExpandTitle_ScaleRatioOf_0233
     * @tc.desc      scaleRatioOf(heightValue=1080, curOffset=-100, normalTitleHeight=0, titleScale=0, continuePullTh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0233 begin`);
      const actual: number = scaleRatioOf(1080, -100, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=1080, curOffset=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0233 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0234
     * @tc.name      ExpandTitle_ScaleRatioOf_0234
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-1, normalTitleHeight=0, titleScale=0, continuePullThresho...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0234 begin`);
      const actual: number = scaleRatioOf(0, -1, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-1,...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0234 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0235
     * @tc.name      ExpandTitle_ScaleRatioOf_0235
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=0, normalTitleHeight=0, titleScale=0, continuePullThreshol...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0235 begin`);
      const actual: number = scaleRatioOf(0, 0, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=0, ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ScaleRatioOf_0235 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0236
     * @tc.name      ExpandTitle_ScaleRatioOf_0236
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=2, normalTitleHeight=0, titleScale=0, continuePullThreshol...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0236 begin`);
      const actual: number = scaleRatioOf(0, 2, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=2, ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ScaleRatioOf_0236 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0237
     * @tc.name      ExpandTitle_ScaleRatioOf_0237
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=50, normalTitleHeight=0, titleScale=0, continuePullThresho...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0237 begin`);
      const actual: number = scaleRatioOf(0, 50, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=50,...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ScaleRatioOf_0237 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0238
     * @tc.name      ExpandTitle_ScaleRatioOf_0238
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=100, normalTitleHeight=0, titleScale=0, continuePullThresh...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0238 begin`);
      const actual: number = scaleRatioOf(0, 100, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=100...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ScaleRatioOf_0238 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0239
     * @tc.name      ExpandTitle_ScaleRatioOf_0239
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=3, normalTitleHeight=0, titleScale=0, continuePullThreshol...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ScaleRatioOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0239 begin`);
      const actual: number = scaleRatioOf(0, 3, 0, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=3, ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ScaleRatioOf_0239 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0240
     * @tc.name      ExpandTitle_ScaleRatioOf_0240
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-100, normalTitleHeight=1, titleScale=0, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0240 begin`);
      const actual: number = scaleRatioOf(0, -100, 1, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0240 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0241
     * @tc.name      ExpandTitle_ScaleRatioOf_0241
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-100, normalTitleHeight=2, titleScale=0, continuePullThres...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0241 begin`);
      const actual: number = scaleRatioOf(0, -100, 2, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0241 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_SCALE_RATIO_OF_0242
     * @tc.name      ExpandTitle_ScaleRatioOf_0242
     * @tc.desc      scaleRatioOf(heightValue=0, curOffset=-100, normalTitleHeight=-1, titleScale=0, continuePullThre...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ScaleRatioOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ScaleRatioOf_0242 begin`);
      const actual: number = scaleRatioOf(0, -100, -1, 0, 1);
      logInfo(`scaleRatioOf(heightValue=0, curOffset=-10...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleRatioOf_0242 end`);
    });
  });
}
