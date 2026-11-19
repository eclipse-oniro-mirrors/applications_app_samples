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
export default function titleOpacityOfTest(): void {
  describe('TitleOpacityOfTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0001
     * @tc.name      ExpandTitle_TitleOpacityOf_0001
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=0, expandTitleHeight=0) returns NaN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleOpacityOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0001 begin`);
      const actual: number = titleOpacityOf(0, 0, 0);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertNaN();
      logInfo(`${BUNDLE}TitleOpacityOf_0001 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0002
     * @tc.name      ExpandTitle_TitleOpacityOf_0002
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=0, expandTitleHeight=0) returns Number.POSITIVE_...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleOpacityOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0002 begin`);
      const actual: number = titleOpacityOf(1, 0, 0);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertEqual(Number.POSITIVE_INFINITY);
      logInfo(`${BUNDLE}TitleOpacityOf_0002 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0003
     * @tc.name      ExpandTitle_TitleOpacityOf_0003
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=0, expandTitleHeight=0) returns Number.NEGATIVE...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0003 begin`);
      const actual: number = titleOpacityOf(-1, 0, 0);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(Number.NEGATIVE_INFINITY);
      logInfo(`${BUNDLE}TitleOpacityOf_0003 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0004
     * @tc.name      ExpandTitle_TitleOpacityOf_0004
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=1, expandTitleHeight=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0004 begin`);
      const actual: number = titleOpacityOf(0, 1, 0);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TitleOpacityOf_0004 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0005
     * @tc.name      ExpandTitle_TitleOpacityOf_0005
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=0, expandTitleHeight=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0005 begin`);
      const actual: number = titleOpacityOf(0, 0, 1);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TitleOpacityOf_0005 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0006
     * @tc.name      ExpandTitle_TitleOpacityOf_0006
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=360, expandTitleHeight=100) returns 1.3769230769...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0006 begin`);
      const actual: number = titleOpacityOf(2, 360, 100);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.376923076923077, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0006 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0007
     * @tc.name      ExpandTitle_TitleOpacityOf_0007
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=1920, expandTitleHeight=1) returns 1.00052110474...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0007 begin`);
      const actual: number = titleOpacityOf(0, 1920, 1);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.0005211047420532, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0007 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0008
     * @tc.name      ExpandTitle_TitleOpacityOf_0008
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=1920, expandTitleHeight=10) returns 1.0052356020...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0008 begin`);
      const actual: number = titleOpacityOf(0, 1920, 10);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.0052356020942408, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0008 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0009
     * @tc.name      ExpandTitle_TitleOpacityOf_0009
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=3, expandTitleHeight=720) returns 0.00976290097...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0009 begin`);
      const actual: number = titleOpacityOf(10, 3, 720);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.009762900976290097, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0009 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0010
     * @tc.name      ExpandTitle_TitleOpacityOf_0010
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=10, expandTitleHeight=3) returns -272.8571428...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0010 begin`);
      const actual: number = titleOpacityOf(1920, 10, 3);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-272.85714285714283, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0010 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0011
     * @tc.name      ExpandTitle_TitleOpacityOf_0011
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=1080, expandTitleHeight=1920) returns -1.273809...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0011 begin`);
      const actual: number = titleOpacityOf(10, 1080, 1920);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-1.2738095238095237, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0011 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0012
     * @tc.name      ExpandTitle_TitleOpacityOf_0012
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=1080, expandTitleHeight=0) returns 0.99814814814...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0012 begin`);
      const actual: number = titleOpacityOf(2, 1080, 0);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.9981481481481481, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0012 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0013
     * @tc.name      ExpandTitle_TitleOpacityOf_0013
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=720, expandTitleHeight=10) returns -1.6901408...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0013 begin`);
      const actual: number = titleOpacityOf(1920, 720, 10);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-1.6901408450704225, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0013 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0014
     * @tc.name      ExpandTitle_TitleOpacityOf_0014
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=1920, expandTitleHeight=2) returns 0.813347236...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0014 begin`);
      const actual: number = titleOpacityOf(360, 1920, 2);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.8133472367049009, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0014 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0015
     * @tc.name      ExpandTitle_TitleOpacityOf_0015
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=720, expandTitleHeight=1) returns 0.98748261474...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0015 begin`);
      const actual: number = titleOpacityOf(10, 720, 1);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.9874826147426982, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0015 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0016
     * @tc.name      ExpandTitle_TitleOpacityOf_0016
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=1080, expandTitleHeight=10) returns 0.33644859...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0016 begin`);
      const actual: number = titleOpacityOf(720, 1080, 10);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.3364485981308411, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0016 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0017
     * @tc.name      ExpandTitle_TitleOpacityOf_0017
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=10, expandTitleHeight=1) returns -10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0017 begin`);
      const actual: number = titleOpacityOf(100, 10, 1);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}TitleOpacityOf_0017 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0018
     * @tc.name      ExpandTitle_TitleOpacityOf_0018
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=720, expandTitleHeight=10) returns 1.0154929577...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0018 begin`);
      const actual: number = titleOpacityOf(-1, 720, 10);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.0154929577464789, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0018 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0019
     * @tc.name      ExpandTitle_TitleOpacityOf_0019
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=10, expandTitleHeight=3) returns -12.2857142857...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0019 begin`);
      const actual: number = titleOpacityOf(96, 10, 3);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-12.285714285714286, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0019 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0020
     * @tc.name      ExpandTitle_TitleOpacityOf_0020
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=2, expandTitleHeight=720) returns 2.671309192...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0020 begin`);
      const actual: number = titleOpacityOf(1920, 2, 720);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(2.671309192200557, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0020 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0021
     * @tc.name      ExpandTitle_TitleOpacityOf_0021
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=1, expandTitleHeight=0) returns -719
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0021 begin`);
      const actual: number = titleOpacityOf(720, 1, 0);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertEqual(-719);
      logInfo(`${BUNDLE}TitleOpacityOf_0021 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0022
     * @tc.name      ExpandTitle_TitleOpacityOf_0022
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=1, expandTitleHeight=360) returns 0.02506963788...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0022 begin`);
      const actual: number = titleOpacityOf(10, 1, 360);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.025069637883008356, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0022 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0023
     * @tc.name      ExpandTitle_TitleOpacityOf_0023
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=96, expandTitleHeight=720) returns 1.57692307...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0023 begin`);
      const actual: number = titleOpacityOf(1080, 96, 720);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(1.5769230769230769, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0023 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0024
     * @tc.name      ExpandTitle_TitleOpacityOf_0024
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=3, expandTitleHeight=0) returns -239
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0024 begin`);
      const actual: number = titleOpacityOf(720, 3, 0);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertEqual(-239);
      logInfo(`${BUNDLE}TitleOpacityOf_0024 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0025
     * @tc.name      ExpandTitle_TitleOpacityOf_0025
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=1080, expandTitleHeight=1) returns 1.0018535681...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0025 begin`);
      const actual: number = titleOpacityOf(-1, 1080, 1);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.0018535681186285, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0025 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0026
     * @tc.name      ExpandTitle_TitleOpacityOf_0026
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=720, expandTitleHeight=1) returns 0.997218358831...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0026 begin`);
      const actual: number = titleOpacityOf(3, 720, 1);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.9972183588317107, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0026 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0027
     * @tc.name      ExpandTitle_TitleOpacityOf_0027
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=100, expandTitleHeight=-1) returns -9.7029702...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0027 begin`);
      const actual: number = titleOpacityOf(1080, 100, -1);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-9.702970297029703, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0027 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0028
     * @tc.name      ExpandTitle_TitleOpacityOf_0028
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=10, expandTitleHeight=100) returns 21.2222222...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0028 begin`);
      const actual: number = titleOpacityOf(1920, 10, 100);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(21.22222222222222, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0028 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0029
     * @tc.name      ExpandTitle_TitleOpacityOf_0029
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=2, expandTitleHeight=3) returns 94
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0029 begin`);
      const actual: number = titleOpacityOf(96, 2, 3);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(94);
      logInfo(`${BUNDLE}TitleOpacityOf_0029 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0030
     * @tc.name      ExpandTitle_TitleOpacityOf_0030
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=3, expandTitleHeight=1920) returns -0.002086593...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0030 begin`);
      const actual: number = titleOpacityOf(-1, 3, 1920);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.0020865936358894104, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0030 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0031
     * @tc.name      ExpandTitle_TitleOpacityOf_0031
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=3, expandTitleHeight=96) returns -0.021505376344...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0031 begin`);
      const actual: number = titleOpacityOf(1, 3, 96);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.021505376344086023, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0031 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0032
     * @tc.name      ExpandTitle_TitleOpacityOf_0032
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=1, expandTitleHeight=96) returns 3.77894736842...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0032 begin`);
      const actual: number = titleOpacityOf(360, 1, 96);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(3.778947368421053, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0032 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0033
     * @tc.name      ExpandTitle_TitleOpacityOf_0033
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=-1, expandTitleHeight=3) returns 0.25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0033 begin`);
      const actual: number = titleOpacityOf(0, -1, 3);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.25, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0033 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0034
     * @tc.name      ExpandTitle_TitleOpacityOf_0034
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=2, expandTitleHeight=1920) returns 0.051094890...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0034 begin`);
      const actual: number = titleOpacityOf(100, 2, 1920);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.051094890510948905, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0034 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0035
     * @tc.name      ExpandTitle_TitleOpacityOf_0035
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=96, expandTitleHeight=3) returns -2.8387096774...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0035 begin`);
      const actual: number = titleOpacityOf(360, 96, 3);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-2.838709677419355, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0035 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0036
     * @tc.name      ExpandTitle_TitleOpacityOf_0036
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=720, expandTitleHeight=0) returns 1.00138888888...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0036 begin`);
      const actual: number = titleOpacityOf(-1, 720, 0);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.0013888888888889, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0036 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0037
     * @tc.name      ExpandTitle_TitleOpacityOf_0037
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=720, expandTitleHeight=96) returns 1.1378205128...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0037 begin`);
      const actual: number = titleOpacityOf(10, 720, 96);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.1378205128205128, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0037 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0038
     * @tc.name      ExpandTitle_TitleOpacityOf_0038
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=100, expandTitleHeight=1080) returns -0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0038 begin`);
      const actual: number = titleOpacityOf(2, 100, 1080);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.1, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0038 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0039
     * @tc.name      ExpandTitle_TitleOpacityOf_0039
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=360, expandTitleHeight=100) returns 1.3846153846...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0039 begin`);
      const actual: number = titleOpacityOf(0, 360, 100);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.3846153846153846, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0039 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0040
     * @tc.name      ExpandTitle_TitleOpacityOf_0040
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=2, expandTitleHeight=0) returns -47
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0040 begin`);
      const actual: number = titleOpacityOf(96, 2, 0);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(-47);
      logInfo(`${BUNDLE}TitleOpacityOf_0040 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0041
     * @tc.name      ExpandTitle_TitleOpacityOf_0041
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=-1, expandTitleHeight=100) returns 0.1089108910...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0041 begin`);
      const actual: number = titleOpacityOf(10, -1, 100);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.10891089108910891, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0041 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0042
     * @tc.name      ExpandTitle_TitleOpacityOf_0042
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=1, expandTitleHeight=3) returns 359.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0042 begin`);
      const actual: number = titleOpacityOf(720, 1, 3);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(359.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0042 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0043
     * @tc.name      ExpandTitle_TitleOpacityOf_0043
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=2, expandTitleHeight=3) returns 718
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0043 begin`);
      const actual: number = titleOpacityOf(720, 2, 3);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertEqual(718);
      logInfo(`${BUNDLE}TitleOpacityOf_0043 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0044
     * @tc.name      ExpandTitle_TitleOpacityOf_0044
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=720, expandTitleHeight=3) returns 1.00139470013947
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0044 begin`);
      const actual: number = titleOpacityOf(2, 720, 3);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.00139470013947, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0044 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0045
     * @tc.name      ExpandTitle_TitleOpacityOf_0045
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=96, expandTitleHeight=1) returns 1.0105263157894737
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0045 begin`);
      const actual: number = titleOpacityOf(0, 96, 1);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.0105263157894737, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0045 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0046
     * @tc.name      ExpandTitle_TitleOpacityOf_0046
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=1080, expandTitleHeight=720) returns 2.997222222...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0046 begin`);
      const actual: number = titleOpacityOf(1, 1080, 720);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(2.9972222222222222, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0046 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0047
     * @tc.name      ExpandTitle_TitleOpacityOf_0047
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=10, expandTitleHeight=-1) returns -64.54545454...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0047 begin`);
      const actual: number = titleOpacityOf(720, 10, -1);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-64.54545454545455, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0047 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0048
     * @tc.name      ExpandTitle_TitleOpacityOf_0048
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=1, expandTitleHeight=720) returns -0.0027816411...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0048 begin`);
      const actual: number = titleOpacityOf(-1, 1, 720);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.0027816411682892906, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0048 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0049
     * @tc.name      ExpandTitle_TitleOpacityOf_0049
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=0, expandTitleHeight=1080) returns 0.666666666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0049 begin`);
      const actual: number = titleOpacityOf(720, 0, 1080);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.6666666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0049 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0050
     * @tc.name      ExpandTitle_TitleOpacityOf_0050
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=10, expandTitleHeight=96) returns 12.44186046...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0050 begin`);
      const actual: number = titleOpacityOf(1080, 10, 96);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(12.44186046511628, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0050 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0051
     * @tc.name      ExpandTitle_TitleOpacityOf_0051
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=100, expandTitleHeight=10) returns 1.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0051 begin`);
      const actual: number = titleOpacityOf(1, 100, 10);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.1, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0051 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0052
     * @tc.name      ExpandTitle_TitleOpacityOf_0052
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=10, expandTitleHeight=100) returns -0.122222222...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0052 begin`);
      const actual: number = titleOpacityOf(-1, 10, 100);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.12222222222222222, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0052 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0053
     * @tc.name      ExpandTitle_TitleOpacityOf_0053
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=-1, expandTitleHeight=0) returns 97
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0053 begin`);
      const actual: number = titleOpacityOf(96, -1, 0);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(97);
      logInfo(`${BUNDLE}TitleOpacityOf_0053 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0054
     * @tc.name      ExpandTitle_TitleOpacityOf_0054
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=0, expandTitleHeight=720) returns 0.13333333333...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0054 begin`);
      const actual: number = titleOpacityOf(96, 0, 720);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.13333333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0054 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0055
     * @tc.name      ExpandTitle_TitleOpacityOf_0055
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=1920, expandTitleHeight=96) returns 1.0509868421...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0055 begin`);
      const actual: number = titleOpacityOf(3, 1920, 96);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.050986842105263, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0055 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0056
     * @tc.name      ExpandTitle_TitleOpacityOf_0056
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=1, expandTitleHeight=3) returns 49.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0056 begin`);
      const actual: number = titleOpacityOf(100, 1, 3);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(49.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0056 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0057
     * @tc.name      ExpandTitle_TitleOpacityOf_0057
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=2, expandTitleHeight=1920) returns 0.56204379...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0057 begin`);
      const actual: number = titleOpacityOf(1080, 2, 1920);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(0.5620437956204379, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0057 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0058
     * @tc.name      ExpandTitle_TitleOpacityOf_0058
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=10, expandTitleHeight=1920) returns -0.004712041...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0058 begin`);
      const actual: number = titleOpacityOf(1, 10, 1920);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.004712041884816754, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0058 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0059
     * @tc.name      ExpandTitle_TitleOpacityOf_0059
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=720, expandTitleHeight=1) returns 1.00278164116...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0059 begin`);
      const actual: number = titleOpacityOf(-1, 720, 1);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.0027816411682893, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0059 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0060
     * @tc.name      ExpandTitle_TitleOpacityOf_0060
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=0, expandTitleHeight=96) returns 1.04166666666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0060 begin`);
      const actual: number = titleOpacityOf(100, 0, 96);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(1.0416666666666667, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0060 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0061
     * @tc.name      ExpandTitle_TitleOpacityOf_0061
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=360, expandTitleHeight=96) returns 1.3674242424...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0061 begin`);
      const actual: number = titleOpacityOf(-1, 360, 96);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.3674242424242424, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0061 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0062
     * @tc.name      ExpandTitle_TitleOpacityOf_0062
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=720, expandTitleHeight=3) returns 0.5020920502...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0062 begin`);
      const actual: number = titleOpacityOf(360, 720, 3);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.502092050209205, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0062 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0063
     * @tc.name      ExpandTitle_TitleOpacityOf_0063
     * @tc.desc      titleOpacityOf(heightValue=3, normalTitleHeight=-1, expandTitleHeight=2) returns 1.3333333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0063 begin`);
      const actual: number = titleOpacityOf(3, -1, 2);
      logInfo(`titleOpacityOf(heightValue=3, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(1.3333333333333333, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0063 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0064
     * @tc.name      ExpandTitle_TitleOpacityOf_0064
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=2, expandTitleHeight=1080) returns -0.0009276437...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0064 begin`);
      const actual: number = titleOpacityOf(1, 2, 1080);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.0009276437847866419, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0064 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0065
     * @tc.name      ExpandTitle_TitleOpacityOf_0065
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=0, expandTitleHeight=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0065 begin`);
      const actual: number = titleOpacityOf(10, 0, 1);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TitleOpacityOf_0065 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0066
     * @tc.name      ExpandTitle_TitleOpacityOf_0066
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=100, expandTitleHeight=2) returns -6.326530612...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0066 begin`);
      const actual: number = titleOpacityOf(720, 100, 2);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-6.326530612244898, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0066 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0067
     * @tc.name      ExpandTitle_TitleOpacityOf_0067
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=1920, expandTitleHeight=100) returns 1.00219780...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0067 begin`);
      const actual: number = titleOpacityOf(96, 1920, 100);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.0021978021978022, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0067 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0068
     * @tc.name      ExpandTitle_TitleOpacityOf_0068
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=0, expandTitleHeight=96) returns 7.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0068 begin`);
      const actual: number = titleOpacityOf(720, 0, 96);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(7.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0068 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0069
     * @tc.name      ExpandTitle_TitleOpacityOf_0069
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=2, expandTitleHeight=3) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0069 begin`);
      const actual: number = titleOpacityOf(1, 2, 3);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}TitleOpacityOf_0069 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0070
     * @tc.name      ExpandTitle_TitleOpacityOf_0070
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=2, expandTitleHeight=10) returns -0.125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0070 begin`);
      const actual: number = titleOpacityOf(1, 2, 10);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.125, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0070 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0071
     * @tc.name      ExpandTitle_TitleOpacityOf_0071
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=360, expandTitleHeight=1) returns -1.002785515...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0071 begin`);
      const actual: number = titleOpacityOf(720, 360, 1);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(-1.0027855153203342, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0071 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0072
     * @tc.name      ExpandTitle_TitleOpacityOf_0072
     * @tc.desc      titleOpacityOf(heightValue=1080, normalTitleHeight=10, expandTitleHeight=3) returns -152.8571428...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0072 begin`);
      const actual: number = titleOpacityOf(1080, 10, 3);
      logInfo(`titleOpacityOf(heightValue=1080, normalTi...: actual=${actual}`);
      expect(actual).assertClose(-152.85714285714286, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0072 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0073
     * @tc.name      ExpandTitle_TitleOpacityOf_0073
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=1, expandTitleHeight=360) returns 2.0027855153...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0073 begin`);
      const actual: number = titleOpacityOf(720, 1, 360);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(2.002785515320334, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0073 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0074
     * @tc.name      ExpandTitle_TitleOpacityOf_0074
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=0, expandTitleHeight=96) returns -0.01041666666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0074 begin`);
      const actual: number = titleOpacityOf(-1, 0, 96);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.010416666666666666, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0074 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0075
     * @tc.name      ExpandTitle_TitleOpacityOf_0075
     * @tc.desc      titleOpacityOf(heightValue=0, normalTitleHeight=360, expandTitleHeight=1080) returns -0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0075 begin`);
      const actual: number = titleOpacityOf(0, 360, 1080);
      logInfo(`titleOpacityOf(heightValue=0, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(-0.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0075 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0076
     * @tc.name      ExpandTitle_TitleOpacityOf_0076
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=10, expandTitleHeight=720) returns 2.69014084...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0076 begin`);
      const actual: number = titleOpacityOf(1920, 10, 720);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(2.6901408450704225, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0076 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0077
     * @tc.name      ExpandTitle_TitleOpacityOf_0077
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=2, expandTitleHeight=3) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0077 begin`);
      const actual: number = titleOpacityOf(-1, 2, 3);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}TitleOpacityOf_0077 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0078
     * @tc.name      ExpandTitle_TitleOpacityOf_0078
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=2, expandTitleHeight=0) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0078 begin`);
      const actual: number = titleOpacityOf(10, 2, 0);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}TitleOpacityOf_0078 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0079
     * @tc.name      ExpandTitle_TitleOpacityOf_0079
     * @tc.desc      titleOpacityOf(heightValue=100, normalTitleHeight=2, expandTitleHeight=96) returns 1.04255319148...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0079 begin`);
      const actual: number = titleOpacityOf(100, 2, 96);
      logInfo(`titleOpacityOf(heightValue=100, normalTit...: actual=${actual}`);
      expect(actual).assertClose(1.0425531914893618, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0079 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0080
     * @tc.name      ExpandTitle_TitleOpacityOf_0080
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=1920, expandTitleHeight=360) returns 0.7692307...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0080 begin`);
      const actual: number = titleOpacityOf(720, 1920, 360);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.7692307692307693, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0080 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0081
     * @tc.name      ExpandTitle_TitleOpacityOf_0081
     * @tc.desc      titleOpacityOf(heightValue=1, normalTitleHeight=0, expandTitleHeight=2) returns 0.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0081 begin`);
      const actual: number = titleOpacityOf(1, 0, 2);
      logInfo(`titleOpacityOf(heightValue=1, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.5, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0081 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0082
     * @tc.name      ExpandTitle_TitleOpacityOf_0082
     * @tc.desc      titleOpacityOf(heightValue=720, normalTitleHeight=2, expandTitleHeight=1080) returns 0.666048237...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0082 begin`);
      const actual: number = titleOpacityOf(720, 2, 1080);
      logInfo(`titleOpacityOf(heightValue=720, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.6660482374768089, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0082 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0083
     * @tc.name      ExpandTitle_TitleOpacityOf_0083
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=0, expandTitleHeight=360) returns 0.02777777777...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0083 begin`);
      const actual: number = titleOpacityOf(10, 0, 360);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.027777777777777776, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0083 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0084
     * @tc.name      ExpandTitle_TitleOpacityOf_0084
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=-1, expandTitleHeight=1080) returns 0.0027752081...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0084 begin`);
      const actual: number = titleOpacityOf(2, -1, 1080);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertClose(0.0027752081406105457, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0084 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0085
     * @tc.name      ExpandTitle_TitleOpacityOf_0085
     * @tc.desc      titleOpacityOf(heightValue=96, normalTitleHeight=3, expandTitleHeight=720) returns 0.12970711297...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0085 begin`);
      const actual: number = titleOpacityOf(96, 3, 720);
      logInfo(`titleOpacityOf(heightValue=96, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(0.1297071129707113, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0085 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0086
     * @tc.name      ExpandTitle_TitleOpacityOf_0086
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=-1, expandTitleHeight=2) returns 3.666666666666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0086 begin`);
      const actual: number = titleOpacityOf(10, -1, 2);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(3.6666666666666665, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0086 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0087
     * @tc.name      ExpandTitle_TitleOpacityOf_0087
     * @tc.desc      titleOpacityOf(heightValue=2, normalTitleHeight=0, expandTitleHeight=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0087 begin`);
      const actual: number = titleOpacityOf(2, 0, 1);
      logInfo(`titleOpacityOf(heightValue=2, normalTitle...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TitleOpacityOf_0087 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0088
     * @tc.name      ExpandTitle_TitleOpacityOf_0088
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=1080, expandTitleHeight=100) returns 1.09183673...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0088 begin`);
      const actual: number = titleOpacityOf(10, 1080, 100);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.0918367346938775, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0088 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0089
     * @tc.name      ExpandTitle_TitleOpacityOf_0089
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=2, expandTitleHeight=-1) returns -2.66666666666...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0089 begin`);
      const actual: number = titleOpacityOf(10, 2, -1);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-2.6666666666666665, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0089 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0090
     * @tc.name      ExpandTitle_TitleOpacityOf_0090
     * @tc.desc      titleOpacityOf(heightValue=1920, normalTitleHeight=-1, expandTitleHeight=720) returns 2.66435506...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0090 begin`);
      const actual: number = titleOpacityOf(1920, -1, 720);
      logInfo(`titleOpacityOf(heightValue=1920, normalTi...: actual=${actual}`);
      expect(actual).assertClose(2.664355062413315, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0090 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0091
     * @tc.name      ExpandTitle_TitleOpacityOf_0091
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=100, expandTitleHeight=96) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0091 begin`);
      const actual: number = titleOpacityOf(360, 100, 96);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}TitleOpacityOf_0091 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0092
     * @tc.name      ExpandTitle_TitleOpacityOf_0092
     * @tc.desc      titleOpacityOf(heightValue=360, normalTitleHeight=1920, expandTitleHeight=1) returns 0.812923397...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0092 begin`);
      const actual: number = titleOpacityOf(360, 1920, 1);
      logInfo(`titleOpacityOf(heightValue=360, normalTit...: actual=${actual}`);
      expect(actual).assertClose(0.8129233976029182, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0092 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0093
     * @tc.name      ExpandTitle_TitleOpacityOf_0093
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=1920, expandTitleHeight=10) returns 1.005759162...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0093 begin`);
      const actual: number = titleOpacityOf(-1, 1920, 10);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.005759162303665, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0093 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0094
     * @tc.name      ExpandTitle_TitleOpacityOf_0094
     * @tc.desc      titleOpacityOf(heightValue=-1, normalTitleHeight=96, expandTitleHeight=1) returns 1.021052631578...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_TitleOpacityOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0094 begin`);
      const actual: number = titleOpacityOf(-1, 96, 1);
      logInfo(`titleOpacityOf(heightValue=-1, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(1.0210526315789474, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0094 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0095
     * @tc.name      ExpandTitle_TitleOpacityOf_0095
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=100, expandTitleHeight=1080) returns -0.0918367...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0095 begin`);
      const actual: number = titleOpacityOf(10, 100, 1080);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.09183673469387756, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0095 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_OPACITY_OF_0096
     * @tc.name      ExpandTitle_TitleOpacityOf_0096
     * @tc.desc      titleOpacityOf(heightValue=10, normalTitleHeight=360, expandTitleHeight=1920) returns -0.2243589...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_TitleOpacityOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TitleOpacityOf_0096 begin`);
      const actual: number = titleOpacityOf(10, 360, 1920);
      logInfo(`titleOpacityOf(heightValue=10, normalTitl...: actual=${actual}`);
      expect(actual).assertClose(-0.22435897435897437, PRECISION);
      logInfo(`${BUNDLE}TitleOpacityOf_0096 end`);
    });
  });
}
