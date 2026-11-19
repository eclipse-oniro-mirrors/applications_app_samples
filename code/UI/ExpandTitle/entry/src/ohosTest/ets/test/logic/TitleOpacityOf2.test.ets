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
import { titleOpacityOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for titleOpacityOf (96 cases). */
export default function titleOpacityOf2Test(): void {
  describe('TitleOpacityOf2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0097
     * @tc.name      ExpandTitle_TitleOpacityOf_0097
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=3, expandTitleHeight=0) returns -32.3333333333...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0097 begin`);
      const actual: number = titleOpacityOf(100, 3, 0);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-32.333333333333336, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0098
     * @tc.name      ExpandTitle_TitleOpacityOf_0098
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=100, expandTitleHeight=-1) returns 0.96039603960...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0098 begin`);
      const actual: number = titleOpacityOf(3, 100, -1);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.9603960396039604, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0099
     * @tc.name      ExpandTitle_TitleOpacityOf_0099
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=3, expandTitleHeight=10) returns 102.428571428...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0099 begin`);
      const actual: number = titleOpacityOf(720, 3, 10);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(102.42857142857143, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0100
     * @tc.name      ExpandTitle_TitleOpacityOf_0100
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=10, expandTitleHeight=2) returns 1.375
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0100 begin`);
      const actual: number = titleOpacityOf(-1, 10, 2);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.375, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0101
     * @tc.name      ExpandTitle_TitleOpacityOf_0101
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=2, expandTitleHeight=0) returns -179
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0101 begin`);
      const actual: number = titleOpacityOf(360, 2, 0);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertEqual(-179);
      logInfo(`${BUNDLE}TitleOpacityOf_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0102
     * @tc.name      ExpandTitle_TitleOpacityOf_0102
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=10, expandTitleHeight=2) returns -238.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0102 begin`);
      const actual: number = titleOpacityOf(1920, 10, 2);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-238.75, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0103
     * @tc.name      ExpandTitle_TitleOpacityOf_0103
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=1080, expandTitleHeight=-1) returns -0.777058...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0103 begin`);
      const actual: number = titleOpacityOf(1920, 1080, -1);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-0.7770582793709528, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0104
     * @tc.name      ExpandTitle_TitleOpacityOf_0104
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=360, expandTitleHeight=2) returns 0.73743016759...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0104 begin`);
      const actual: number = titleOpacityOf(96, 360, 2);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.7374301675977654, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0105
     * @tc.name      ExpandTitle_TitleOpacityOf_0105
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=100, expandTitleHeight=2) returns 0.989795918367...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0105 begin`);
      const actual: number = titleOpacityOf(3, 100, 2);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.9897959183673469, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0106
     * @tc.name      ExpandTitle_TitleOpacityOf_0106
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=720, expandTitleHeight=100) returns 1.1596774193...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0106 begin`);
      const actual: number = titleOpacityOf(1, 720, 100);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.1596774193548387, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0107
     * @tc.name      ExpandTitle_TitleOpacityOf_0107
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=720, expandTitleHeight=-1) returns 0.8654646324...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0107 begin`);
      const actual: number = titleOpacityOf(96, 720, -1);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.8654646324549237, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0108
     * @tc.name      ExpandTitle_TitleOpacityOf_0108
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=-1, expandTitleHeight=3) returns 180.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0108 begin`);
      const actual: number = titleOpacityOf(720, -1, 3);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(180.25, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0109
     * @tc.name      ExpandTitle_TitleOpacityOf_0109
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=96, expandTitleHeight=10) returns -11.4418604...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0109 begin`);
      const actual: number = titleOpacityOf(1080, 96, 10);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-11.44186046511628, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0110
     * @tc.name      ExpandTitle_TitleOpacityOf_0110
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=2, expandTitleHeight=1080) returns 1.77922077...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0110 begin`);
      const actual: number = titleOpacityOf(1920, 2, 1080);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(1.7792207792207793, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0111
     * @tc.name      ExpandTitle_TitleOpacityOf_0111
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=-1, expandTitleHeight=1) returns 5.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0111 begin`);
      const actual: number = titleOpacityOf(10, -1, 1);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(5.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0112
     * @tc.name      ExpandTitle_TitleOpacityOf_0112
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=100, expandTitleHeight=1080) returns -0.10204081...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0112 begin`);
      const actual: number = titleOpacityOf(0, 100, 1080);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.10204081632653061, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0113
     * @tc.name      ExpandTitle_TitleOpacityOf_0113
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=1, expandTitleHeight=10) returns 119.88888888...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0113 begin`);
      const actual: number = titleOpacityOf(1080, 1, 10);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(119.88888888888889, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0114
     * @tc.name      ExpandTitle_TitleOpacityOf_0114
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=96, expandTitleHeight=720) returns -0.1522435897...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0114 begin`);
      const actual: number = titleOpacityOf(1, 96, 720);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.15224358974358973, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0115
     * @tc.name      ExpandTitle_TitleOpacityOf_0115
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=1920, expandTitleHeight=0) returns 0.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0115 begin`);
      const actual: number = titleOpacityOf(96, 1920, 0);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.95, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0116
     * @tc.name      ExpandTitle_TitleOpacityOf_0116
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=1080, expandTitleHeight=360) returns 1.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0116 begin`);
      const actual: number = titleOpacityOf(0, 1080, 360);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0117
     * @tc.name      ExpandTitle_TitleOpacityOf_0117
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=3, expandTitleHeight=1) returns -538.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0117 begin`);
      const actual: number = titleOpacityOf(1080, 3, 1);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-538.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0118
     * @tc.name      ExpandTitle_TitleOpacityOf_0118
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=100, expandTitleHeight=96) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0118 begin`);
      const actual: number = titleOpacityOf(0, 100, 96);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}TitleOpacityOf_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0119
     * @tc.name      ExpandTitle_TitleOpacityOf_0119
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=96, expandTitleHeight=1920) returns -0.05317982...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0119 begin`);
      const actual: number = titleOpacityOf(-1, 96, 1920);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.05317982456140351, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0120
     * @tc.name      ExpandTitle_TitleOpacityOf_0120
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=3, expandTitleHeight=-1) returns -269.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0120 begin`);
      const actual: number = titleOpacityOf(1080, 3, -1);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-269.25, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0120 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0121
     * @tc.name      ExpandTitle_TitleOpacityOf_0121
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=10, expandTitleHeight=3) returns -12.857142857...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0121 begin`);
      const actual: number = titleOpacityOf(100, 10, 3);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-12.857142857142858, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0121 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0122
     * @tc.name      ExpandTitle_TitleOpacityOf_0122
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=1920, expandTitleHeight=10) returns 1.0036649214...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0122 begin`);
      const actual: number = titleOpacityOf(3, 1920, 10);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.0036649214659685, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0122 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0123
     * @tc.name      ExpandTitle_TitleOpacityOf_0123
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=-1, expandTitleHeight=96) returns 1.0412371134...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0123 begin`);
      const actual: number = titleOpacityOf(100, -1, 96);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(1.041237113402062, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0123 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0124
     * @tc.name      ExpandTitle_TitleOpacityOf_0124
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=0, expandTitleHeight=720) returns 0.002777777777...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0124 begin`);
      const actual: number = titleOpacityOf(2, 0, 720);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.002777777777777778, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0124 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0125
     * @tc.name      ExpandTitle_TitleOpacityOf_0125
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=3, expandTitleHeight=720) returns 0.4979079497...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0125 begin`);
      const actual: number = titleOpacityOf(360, 3, 720);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.497907949790795, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0125 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0126
     * @tc.name      ExpandTitle_TitleOpacityOf_0126
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=100, expandTitleHeight=1920) returns -0.0021978...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0126 begin`);
      const actual: number = titleOpacityOf(96, 100, 1920);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.002197802197802198, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0126 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0127
     * @tc.name      ExpandTitle_TitleOpacityOf_0127
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=2, expandTitleHeight=100) returns -0.0306122448...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0127 begin`);
      const actual: number = titleOpacityOf(-1, 2, 100);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.030612244897959183, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0127 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0128
     * @tc.name      ExpandTitle_TitleOpacityOf_0128
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=3, expandTitleHeight=96) returns 3.83870967741...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0128 begin`);
      const actual: number = titleOpacityOf(360, 3, 96);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(3.838709677419355, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0128 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0129
     * @tc.name      ExpandTitle_TitleOpacityOf_0129
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=0, expandTitleHeight=100) returns 7.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0129 begin`);
      const actual: number = titleOpacityOf(720, 0, 100);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(7.2, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0129 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0130
     * @tc.name      ExpandTitle_TitleOpacityOf_0130
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=10, expandTitleHeight=360) returns 3.05714285...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0130 begin`);
      const actual: number = titleOpacityOf(1080, 10, 360);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(3.057142857142857, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0130 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0131
     * @tc.name      ExpandTitle_TitleOpacityOf_0131
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=3, expandTitleHeight=100) returns -0.01030927835...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0131 begin`);
      const actual: number = titleOpacityOf(2, 3, 100);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.010309278350515464, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0131 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0132
     * @tc.name      ExpandTitle_TitleOpacityOf_0132
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=3, expandTitleHeight=0) returns 0.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0132 begin`);
      const actual: number = titleOpacityOf(2, 3, 0);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0132 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0133
     * @tc.name      ExpandTitle_TitleOpacityOf_0133
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=96, expandTitleHeight=-1) returns 0.989690721649...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0133 begin`);
      const actual: number = titleOpacityOf(0, 96, -1);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.9896907216494846, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0133 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0134
     * @tc.name      ExpandTitle_TitleOpacityOf_0134
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=2, expandTitleHeight=3) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0134 begin`);
      const actual: number = titleOpacityOf(0, 2, 3);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}TitleOpacityOf_0134 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0135
     * @tc.name      ExpandTitle_TitleOpacityOf_0135
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=360, expandTitleHeight=100) returns 1.3807692307...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0135 begin`);
      const actual: number = titleOpacityOf(1, 360, 100);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.3807692307692307, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0135 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0136
     * @tc.name      ExpandTitle_TitleOpacityOf_0136
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=0, expandTitleHeight=-1) returns -96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0136 begin`);
      const actual: number = titleOpacityOf(96, 0, -1);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(-96);
      logInfo(`${BUNDLE}TitleOpacityOf_0136 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0137
     * @tc.name      ExpandTitle_TitleOpacityOf_0137
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=720, expandTitleHeight=10) returns 1.01267605633...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0137 begin`);
      const actual: number = titleOpacityOf(1, 720, 10);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.0126760563380282, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0137 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0138
     * @tc.name      ExpandTitle_TitleOpacityOf_0138
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=720, expandTitleHeight=2) returns 1.001392757660167
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0138 begin`);
      const actual: number = titleOpacityOf(1, 720, 2);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.001392757660167, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0138 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0139
     * @tc.name      ExpandTitle_TitleOpacityOf_0139
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=3, expandTitleHeight=360) returns 5.369747899...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0139 begin`);
      const actual: number = titleOpacityOf(1920, 3, 360);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(5.369747899159663, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0139 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0140
     * @tc.name      ExpandTitle_TitleOpacityOf_0140
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=100, expandTitleHeight=360) returns 3.7692307...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0140 begin`);
      const actual: number = titleOpacityOf(1080, 100, 360);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(3.769230769230769, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0140 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0141
     * @tc.name      ExpandTitle_TitleOpacityOf_0141
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=3, expandTitleHeight=1080) returns 0.331476323...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0141 begin`);
      const actual: number = titleOpacityOf(360, 3, 1080);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.33147632311977715, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0141 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0142
     * @tc.name      ExpandTitle_TitleOpacityOf_0142
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=100, expandTitleHeight=3) returns 1.030927835051...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0142 begin`);
      const actual: number = titleOpacityOf(0, 100, 3);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.0309278350515463, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0142 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0143
     * @tc.name      ExpandTitle_TitleOpacityOf_0143
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=3, expandTitleHeight=10) returns -0.285714285714...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0143 begin`);
      const actual: number = titleOpacityOf(1, 3, 10);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.2857142857142857, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0143 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0144
     * @tc.name      ExpandTitle_TitleOpacityOf_0144
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=96, expandTitleHeight=0) returns 0.9791666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0144 begin`);
      const actual: number = titleOpacityOf(2, 96, 0);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.9791666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0144 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0145
     * @tc.name      ExpandTitle_TitleOpacityOf_0145
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=1920, expandTitleHeight=2) returns 0.625651720...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0145 begin`);
      const actual: number = titleOpacityOf(720, 1920, 2);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.6256517205422315, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0145 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0146
     * @tc.name      ExpandTitle_TitleOpacityOf_0146
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=2, expandTitleHeight=-1) returns -239.33333333...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0146 begin`);
      const actual: number = titleOpacityOf(720, 2, -1);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-239.33333333333334, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0146 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0147
     * @tc.name      ExpandTitle_TitleOpacityOf_0147
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=720, expandTitleHeight=0) returns 0.86666666666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0147 begin`);
      const actual: number = titleOpacityOf(96, 720, 0);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.8666666666666667, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0147 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0148
     * @tc.name      ExpandTitle_TitleOpacityOf_0148
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=360, expandTitleHeight=96) returns -1.36363636...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0148 begin`);
      const actual: number = titleOpacityOf(720, 360, 96);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-1.3636363636363635, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0148 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0149
     * @tc.name      ExpandTitle_TitleOpacityOf_0149
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=1, expandTitleHeight=96) returns -0.02105263157...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0149 begin`);
      const actual: number = titleOpacityOf(-1, 1, 96);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.021052631578947368, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0149 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0150
     * @tc.name      ExpandTitle_TitleOpacityOf_0150
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=1080, expandTitleHeight=720) returns 3.00277777...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0150 begin`);
      const actual: number = titleOpacityOf(-1, 1080, 720);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(3.0027777777777778, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0150 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0151
     * @tc.name      ExpandTitle_TitleOpacityOf_0151
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=720, expandTitleHeight=10) returns 0.507042253...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0151 begin`);
      const actual: number = titleOpacityOf(360, 720, 10);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.5070422535211268, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0151 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0152
     * @tc.name      ExpandTitle_TitleOpacityOf_0152
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=1, expandTitleHeight=96) returns 20.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0152 begin`);
      const actual: number = titleOpacityOf(1920, 1, 96);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(20.2, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0152 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0153
     * @tc.name      ExpandTitle_TitleOpacityOf_0153
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=720, expandTitleHeight=1920) returns -0.6008333...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0153 begin`);
      const actual: number = titleOpacityOf(-1, 720, 1920);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.6008333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0153 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0154
     * @tc.name      ExpandTitle_TitleOpacityOf_0154
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=1920, expandTitleHeight=1) returns 0.9953100573...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0154 begin`);
      const actual: number = titleOpacityOf(10, 1920, 1);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.9953100573215217, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0154 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0155
     * @tc.name      ExpandTitle_TitleOpacityOf_0155
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=0, expandTitleHeight=96) returns 0.03125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0155 begin`);
      const actual: number = titleOpacityOf(3, 0, 96);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.03125, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0155 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0156
     * @tc.name      ExpandTitle_TitleOpacityOf_0156
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=96, expandTitleHeight=1) returns 0.9789473684210527
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0156 begin`);
      const actual: number = titleOpacityOf(3, 96, 1);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.9789473684210527, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0156 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0157
     * @tc.name      ExpandTitle_TitleOpacityOf_0157
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=10, expandTitleHeight=1080) returns 0.66355140...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0157 begin`);
      const actual: number = titleOpacityOf(720, 10, 1080);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.6635514018691588, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0157 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0158
     * @tc.name      ExpandTitle_TitleOpacityOf_0158
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=1920, expandTitleHeight=1080) returns 2.166666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0158 begin`);
      const actual: number = titleOpacityOf(100, 1920, 1080);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(2.1666666666666665, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0158 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0159
     * @tc.name      ExpandTitle_TitleOpacityOf_0159
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=96, expandTitleHeight=1) returns -2.7789473684...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0159 begin`);
      const actual: number = titleOpacityOf(360, 96, 1);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-2.778947368421053, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0159 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0160
     * @tc.name      ExpandTitle_TitleOpacityOf_0160
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=-1, expandTitleHeight=100) returns 0.00990099009...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0160 begin`);
      const actual: number = titleOpacityOf(0, -1, 100);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.009900990099009901, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0160 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0161
     * @tc.name      ExpandTitle_TitleOpacityOf_0161
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=1, expandTitleHeight=360) returns -0.00278551532...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0161 begin`);
      const actual: number = titleOpacityOf(0, 1, 360);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.002785515320334262, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0161 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0162
     * @tc.name      ExpandTitle_TitleOpacityOf_0162
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=1, expandTitleHeight=1920) returns 0.0495049504...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0162 begin`);
      const actual: number = titleOpacityOf(96, 1, 1920);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.04950495049504951, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0162 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0163
     * @tc.name      ExpandTitle_TitleOpacityOf_0163
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=10, expandTitleHeight=2) returns -88.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0163 begin`);
      const actual: number = titleOpacityOf(720, 10, 2);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-88.75, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0163 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0164
     * @tc.name      ExpandTitle_TitleOpacityOf_0164
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=10, expandTitleHeight=3) returns 1.2857142857142858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0164 begin`);
      const actual: number = titleOpacityOf(1, 10, 3);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.2857142857142858, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0164 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0165
     * @tc.name      ExpandTitle_TitleOpacityOf_0165
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=10, expandTitleHeight=720) returns 0.126760563...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0165 begin`);
      const actual: number = titleOpacityOf(100, 10, 720);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.1267605633802817, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0165 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0166
     * @tc.name      ExpandTitle_TitleOpacityOf_0166
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=100, expandTitleHeight=10) returns 1.11111111111...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0166 begin`);
      const actual: number = titleOpacityOf(0, 100, 10);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.1111111111111112, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0166 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0167
     * @tc.name      ExpandTitle_TitleOpacityOf_0167
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=1, expandTitleHeight=720) returns 0.01251738525...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0167 begin`);
      const actual: number = titleOpacityOf(10, 1, 720);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.012517385257301807, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0167 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0168
     * @tc.name      ExpandTitle_TitleOpacityOf_0168
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=1, expandTitleHeight=1080) returns -0.0009267840...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0168 begin`);
      const actual: number = titleOpacityOf(0, 1, 1080);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.0009267840593141798, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0168 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0169
     * @tc.name      ExpandTitle_TitleOpacityOf_0169
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=1, expandTitleHeight=100) returns 19.38383838...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0169 begin`);
      const actual: number = titleOpacityOf(1920, 1, 100);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(19.383838383838384, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0169 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0170
     * @tc.name      ExpandTitle_TitleOpacityOf_0170
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=2, expandTitleHeight=1920) returns -0.0010427528...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0170 begin`);
      const actual: number = titleOpacityOf(0, 2, 1920);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.0010427528675703858, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0170 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0171
     * @tc.name      ExpandTitle_TitleOpacityOf_0171
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=100, expandTitleHeight=1920) returns -0.05384615...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0171 begin`);
      const actual: number = titleOpacityOf(2, 100, 1920);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.05384615384615385, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0171 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0172
     * @tc.name      ExpandTitle_TitleOpacityOf_0172
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=720, expandTitleHeight=100) returns -1.935483...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0172 begin`);
      const actual: number = titleOpacityOf(1920, 720, 100);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-1.935483870967742, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0172 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0173
     * @tc.name      ExpandTitle_TitleOpacityOf_0173
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=1, expandTitleHeight=720) returns 0.4993045897...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0173 begin`);
      const actual: number = titleOpacityOf(360, 1, 720);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.4993045897079277, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0173 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0174
     * @tc.name      ExpandTitle_TitleOpacityOf_0174
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=-1, expandTitleHeight=10) returns 174.6363636...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0174 begin`);
      const actual: number = titleOpacityOf(1920, -1, 10);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(174.63636363636363, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0174 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0175
     * @tc.name      ExpandTitle_TitleOpacityOf_0175
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=1920, expandTitleHeight=1080) returns 2.28571428...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0175 begin`);
      const actual: number = titleOpacityOf(0, 1920, 1080);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(2.2857142857142856, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0175 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0176
     * @tc.name      ExpandTitle_TitleOpacityOf_0176
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=10, expandTitleHeight=1920) returns -0.004188481...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0176 begin`);
      const actual: number = titleOpacityOf(2, 10, 1920);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.004188481675392671, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0176 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0177
     * @tc.name      ExpandTitle_TitleOpacityOf_0177
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=0, expandTitleHeight=1080) returns 0.00092592592...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0177 begin`);
      const actual: number = titleOpacityOf(1, 0, 1080);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.000925925925925926, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0177 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0178
     * @tc.name      ExpandTitle_TitleOpacityOf_0178
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=96, expandTitleHeight=3) returns 1.032258064516129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0178 begin`);
      const actual: number = titleOpacityOf(0, 96, 3);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.032258064516129, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0178 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0179
     * @tc.name      ExpandTitle_TitleOpacityOf_0179
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=96, expandTitleHeight=720) returns -0.1538461538...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0179 begin`);
      const actual: number = titleOpacityOf(0, 96, 720);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.15384615384615385, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0179 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0180
     * @tc.name      ExpandTitle_TitleOpacityOf_0180
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=1080, expandTitleHeight=2) returns 0.9925788497...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0180 begin`);
      const actual: number = titleOpacityOf(10, 1080, 2);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.9925788497217068, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0180 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0181
     * @tc.name      ExpandTitle_TitleOpacityOf_0181
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=-1, expandTitleHeight=360) returns 5.32132963...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0181 begin`);
      const actual: number = titleOpacityOf(1920, -1, 360);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(5.321329639889196, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0181 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0182
     * @tc.name      ExpandTitle_TitleOpacityOf_0182
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=-1, expandTitleHeight=96) returns 19.80412371...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0182 begin`);
      const actual: number = titleOpacityOf(1920, -1, 96);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(19.804123711340207, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0182 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0183
     * @tc.name      ExpandTitle_TitleOpacityOf_0183
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=1080, expandTitleHeight=100) returns 0.7346938...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0183 begin`);
      const actual: number = titleOpacityOf(360, 1080, 100);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.7346938775510204, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0183 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0184
     * @tc.name      ExpandTitle_TitleOpacityOf_0184
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=96, expandTitleHeight=1) returns -0.0421052631...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0184 begin`);
      const actual: number = titleOpacityOf(100, 96, 1);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-0.042105263157894736, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0184 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0185
     * @tc.name      ExpandTitle_TitleOpacityOf_0185
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=1, expandTitleHeight=1920) returns -0.0005211047...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0185 begin`);
      const actual: number = titleOpacityOf(0, 1, 1920);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.0005211047420531526, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0185 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0186
     * @tc.name      ExpandTitle_TitleOpacityOf_0186
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=100, expandTitleHeight=96) returns 24.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0186 begin`);
      const actual: number = titleOpacityOf(1, 100, 96);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(24.75, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0186 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0187
     * @tc.name      ExpandTitle_TitleOpacityOf_0187
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=-1, expandTitleHeight=10) returns 32.818181818...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0187 begin`);
      const actual: number = titleOpacityOf(360, -1, 10);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(32.81818181818182, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0187 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0188
     * @tc.name      ExpandTitle_TitleOpacityOf_0188
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=3, expandTitleHeight=0) returns -119
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0188 begin`);
      const actual: number = titleOpacityOf(360, 3, 0);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertEqual(-119);
      logInfo(`${BUNDLE}TitleOpacityOf_0188 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0189
     * @tc.name      ExpandTitle_TitleOpacityOf_0189
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=3, expandTitleHeight=1080) returns 0.0863509749...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0189 begin`);
      const actual: number = titleOpacityOf(96, 3, 1080);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.08635097493036212, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0189 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0190
     * @tc.name      ExpandTitle_TitleOpacityOf_0190
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=0, expandTitleHeight=96) returns 0.0104166666666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0190 begin`);
      const actual: number = titleOpacityOf(1, 0, 96);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.010416666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0190 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0191
     * @tc.name      ExpandTitle_TitleOpacityOf_0191
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=-1, expandTitleHeight=0) returns 1081
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0191 begin`);
      const actual: number = titleOpacityOf(1080, -1, 0);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertEqual(1081);
      logInfo(`${BUNDLE}TitleOpacityOf_0191 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0192
     * @tc.name      ExpandTitle_TitleOpacityOf_0192
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=360, expandTitleHeight=1) returns 0.73537604456...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0192 begin`);
      const actual: number = titleOpacityOf(96, 360, 1);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.7353760445682451, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0192 end`);
    });
  });
}
