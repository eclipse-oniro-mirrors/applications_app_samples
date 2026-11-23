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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { progressRatio } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for progressRatio (96 cases). */
export default function progressRatioTest(): void {
  describe('ProgressRatioTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0001
     * @tc.name      PageLoading_ProgressRatio_0001
     * @tc.desc      progressRatio(progress=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProgressRatio_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProgressRatio_0001 begin`);
      const actual: number = progressRatio(0);
      logInfo(`progressRatio(progress=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0002
     * @tc.name      PageLoading_ProgressRatio_0002
     * @tc.desc      progressRatio(progress=500) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProgressRatio_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProgressRatio_0002 begin`);
      const actual: number = progressRatio(500);
      logInfo(`progressRatio(progress=500): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0003
     * @tc.name      PageLoading_ProgressRatio_0003
     * @tc.desc      progressRatio(progress=1) returns 0.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0003 begin`);
      const actual: number = progressRatio(1);
      logInfo(`progressRatio(progress=1): actual=${actual}`);
      expect(actual).assertClose(0.01, PRECISION);
      logInfo(`${BUNDLE}ProgressRatio_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0004
     * @tc.name      PageLoading_ProgressRatio_0004
     * @tc.desc      progressRatio(progress=2) returns 0.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0004 begin`);
      const actual: number = progressRatio(2);
      logInfo(`progressRatio(progress=2): actual=${actual}`);
      expect(actual).assertClose(0.02, PRECISION);
      logInfo(`${BUNDLE}ProgressRatio_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0005
     * @tc.name      PageLoading_ProgressRatio_0005
     * @tc.desc      progressRatio(progress=3) returns 0.03
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0005 begin`);
      const actual: number = progressRatio(3);
      logInfo(`progressRatio(progress=3): actual=${actual}`);
      expect(actual).assertClose(0.03, PRECISION);
      logInfo(`${BUNDLE}ProgressRatio_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0006
     * @tc.name      PageLoading_ProgressRatio_0006
     * @tc.desc      progressRatio(progress=10) returns 0.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0006 begin`);
      const actual: number = progressRatio(10);
      logInfo(`progressRatio(progress=10): actual=${actual}`);
      expect(actual).assertClose(0.1, PRECISION);
      logInfo(`${BUNDLE}ProgressRatio_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0007
     * @tc.name      PageLoading_ProgressRatio_0007
     * @tc.desc      progressRatio(progress=999) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0007 begin`);
      const actual: number = progressRatio(999);
      logInfo(`progressRatio(progress=999): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0008
     * @tc.name      PageLoading_ProgressRatio_0008
     * @tc.desc      progressRatio(progress=1000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0008 begin`);
      const actual: number = progressRatio(1000);
      logInfo(`progressRatio(progress=1000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0009
     * @tc.name      PageLoading_ProgressRatio_0009
     * @tc.desc      progressRatio(progress=59999) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0009 begin`);
      const actual: number = progressRatio(59999);
      logInfo(`progressRatio(progress=59999): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0010
     * @tc.name      PageLoading_ProgressRatio_0010
     * @tc.desc      progressRatio(progress=60000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0010 begin`);
      const actual: number = progressRatio(60000);
      logInfo(`progressRatio(progress=60000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0011
     * @tc.name      PageLoading_ProgressRatio_0011
     * @tc.desc      progressRatio(progress=61000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0011 begin`);
      const actual: number = progressRatio(61000);
      logInfo(`progressRatio(progress=61000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0012
     * @tc.name      PageLoading_ProgressRatio_0012
     * @tc.desc      progressRatio(progress=3599000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0012 begin`);
      const actual: number = progressRatio(3599000);
      logInfo(`progressRatio(progress=3599000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0013
     * @tc.name      PageLoading_ProgressRatio_0013
     * @tc.desc      progressRatio(progress=3600000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0013 begin`);
      const actual: number = progressRatio(3600000);
      logInfo(`progressRatio(progress=3600000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0014
     * @tc.name      PageLoading_ProgressRatio_0014
     * @tc.desc      progressRatio(progress=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0014 begin`);
      const actual: number = progressRatio(-1);
      logInfo(`progressRatio(progress=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0015
     * @tc.name      PageLoading_ProgressRatio_0015
     * @tc.desc      progressRatio(progress=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0015 begin`);
      const actual: number = progressRatio(100);
      logInfo(`progressRatio(progress=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0016
     * @tc.name      PageLoading_ProgressRatio_0016
     * @tc.desc      progressRatio(progress=180000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0016 begin`);
      const actual: number = progressRatio(180000);
      logInfo(`progressRatio(progress=180000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0017
     * @tc.name      PageLoading_ProgressRatio_0017
     * @tc.desc      progressRatio(progress=360000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0017 begin`);
      const actual: number = progressRatio(360000);
      logInfo(`progressRatio(progress=360000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0018
     * @tc.name      PageLoading_ProgressRatio_0018
     * @tc.desc      progressRatio(progress=540000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0018 begin`);
      const actual: number = progressRatio(540000);
      logInfo(`progressRatio(progress=540000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0019
     * @tc.name      PageLoading_ProgressRatio_0019
     * @tc.desc      progressRatio(progress=720000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0019 begin`);
      const actual: number = progressRatio(720000);
      logInfo(`progressRatio(progress=720000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0020
     * @tc.name      PageLoading_ProgressRatio_0020
     * @tc.desc      progressRatio(progress=900000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0020 begin`);
      const actual: number = progressRatio(900000);
      logInfo(`progressRatio(progress=900000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0021
     * @tc.name      PageLoading_ProgressRatio_0021
     * @tc.desc      progressRatio(progress=1080000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0021 begin`);
      const actual: number = progressRatio(1080000);
      logInfo(`progressRatio(progress=1080000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0022
     * @tc.name      PageLoading_ProgressRatio_0022
     * @tc.desc      progressRatio(progress=1260000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0022 begin`);
      const actual: number = progressRatio(1260000);
      logInfo(`progressRatio(progress=1260000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0023
     * @tc.name      PageLoading_ProgressRatio_0023
     * @tc.desc      progressRatio(progress=1440000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0023 begin`);
      const actual: number = progressRatio(1440000);
      logInfo(`progressRatio(progress=1440000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0024
     * @tc.name      PageLoading_ProgressRatio_0024
     * @tc.desc      progressRatio(progress=1620000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0024 begin`);
      const actual: number = progressRatio(1620000);
      logInfo(`progressRatio(progress=1620000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0025
     * @tc.name      PageLoading_ProgressRatio_0025
     * @tc.desc      progressRatio(progress=1800000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0025 begin`);
      const actual: number = progressRatio(1800000);
      logInfo(`progressRatio(progress=1800000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0026
     * @tc.name      PageLoading_ProgressRatio_0026
     * @tc.desc      progressRatio(progress=1980000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0026 begin`);
      const actual: number = progressRatio(1980000);
      logInfo(`progressRatio(progress=1980000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0027
     * @tc.name      PageLoading_ProgressRatio_0027
     * @tc.desc      progressRatio(progress=2160000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0027 begin`);
      const actual: number = progressRatio(2160000);
      logInfo(`progressRatio(progress=2160000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0028
     * @tc.name      PageLoading_ProgressRatio_0028
     * @tc.desc      progressRatio(progress=2340000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0028 begin`);
      const actual: number = progressRatio(2340000);
      logInfo(`progressRatio(progress=2340000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0029
     * @tc.name      PageLoading_ProgressRatio_0029
     * @tc.desc      progressRatio(progress=2520000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0029 begin`);
      const actual: number = progressRatio(2520000);
      logInfo(`progressRatio(progress=2520000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0030
     * @tc.name      PageLoading_ProgressRatio_0030
     * @tc.desc      progressRatio(progress=2700000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0030 begin`);
      const actual: number = progressRatio(2700000);
      logInfo(`progressRatio(progress=2700000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0031
     * @tc.name      PageLoading_ProgressRatio_0031
     * @tc.desc      progressRatio(progress=2880000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0031 begin`);
      const actual: number = progressRatio(2880000);
      logInfo(`progressRatio(progress=2880000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0032
     * @tc.name      PageLoading_ProgressRatio_0032
     * @tc.desc      progressRatio(progress=3060000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0032 begin`);
      const actual: number = progressRatio(3060000);
      logInfo(`progressRatio(progress=3060000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0033
     * @tc.name      PageLoading_ProgressRatio_0033
     * @tc.desc      progressRatio(progress=3240000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0033 begin`);
      const actual: number = progressRatio(3240000);
      logInfo(`progressRatio(progress=3240000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0034
     * @tc.name      PageLoading_ProgressRatio_0034
     * @tc.desc      progressRatio(progress=3420000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0034 begin`);
      const actual: number = progressRatio(3420000);
      logInfo(`progressRatio(progress=3420000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0035
     * @tc.name      PageLoading_ProgressRatio_0035
     * @tc.desc      progressRatio(progress=3780000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0035 begin`);
      const actual: number = progressRatio(3780000);
      logInfo(`progressRatio(progress=3780000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0036
     * @tc.name      PageLoading_ProgressRatio_0036
     * @tc.desc      progressRatio(progress=3960000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0036 begin`);
      const actual: number = progressRatio(3960000);
      logInfo(`progressRatio(progress=3960000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0037
     * @tc.name      PageLoading_ProgressRatio_0037
     * @tc.desc      progressRatio(progress=4140000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0037 begin`);
      const actual: number = progressRatio(4140000);
      logInfo(`progressRatio(progress=4140000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0038
     * @tc.name      PageLoading_ProgressRatio_0038
     * @tc.desc      progressRatio(progress=4320000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0038 begin`);
      const actual: number = progressRatio(4320000);
      logInfo(`progressRatio(progress=4320000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0039
     * @tc.name      PageLoading_ProgressRatio_0039
     * @tc.desc      progressRatio(progress=4500000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0039 begin`);
      const actual: number = progressRatio(4500000);
      logInfo(`progressRatio(progress=4500000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0040
     * @tc.name      PageLoading_ProgressRatio_0040
     * @tc.desc      progressRatio(progress=4680000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0040 begin`);
      const actual: number = progressRatio(4680000);
      logInfo(`progressRatio(progress=4680000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0041
     * @tc.name      PageLoading_ProgressRatio_0041
     * @tc.desc      progressRatio(progress=4860000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0041 begin`);
      const actual: number = progressRatio(4860000);
      logInfo(`progressRatio(progress=4860000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0042
     * @tc.name      PageLoading_ProgressRatio_0042
     * @tc.desc      progressRatio(progress=5040000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0042 begin`);
      const actual: number = progressRatio(5040000);
      logInfo(`progressRatio(progress=5040000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0043
     * @tc.name      PageLoading_ProgressRatio_0043
     * @tc.desc      progressRatio(progress=5220000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0043 begin`);
      const actual: number = progressRatio(5220000);
      logInfo(`progressRatio(progress=5220000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0044
     * @tc.name      PageLoading_ProgressRatio_0044
     * @tc.desc      progressRatio(progress=5400000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0044 begin`);
      const actual: number = progressRatio(5400000);
      logInfo(`progressRatio(progress=5400000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0045
     * @tc.name      PageLoading_ProgressRatio_0045
     * @tc.desc      progressRatio(progress=5580000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0045 begin`);
      const actual: number = progressRatio(5580000);
      logInfo(`progressRatio(progress=5580000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0046
     * @tc.name      PageLoading_ProgressRatio_0046
     * @tc.desc      progressRatio(progress=5760000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0046 begin`);
      const actual: number = progressRatio(5760000);
      logInfo(`progressRatio(progress=5760000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0047
     * @tc.name      PageLoading_ProgressRatio_0047
     * @tc.desc      progressRatio(progress=5940000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0047 begin`);
      const actual: number = progressRatio(5940000);
      logInfo(`progressRatio(progress=5940000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0048
     * @tc.name      PageLoading_ProgressRatio_0048
     * @tc.desc      progressRatio(progress=6120000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0048 begin`);
      const actual: number = progressRatio(6120000);
      logInfo(`progressRatio(progress=6120000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0049
     * @tc.name      PageLoading_ProgressRatio_0049
     * @tc.desc      progressRatio(progress=6300000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0049 begin`);
      const actual: number = progressRatio(6300000);
      logInfo(`progressRatio(progress=6300000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0050
     * @tc.name      PageLoading_ProgressRatio_0050
     * @tc.desc      progressRatio(progress=6480000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0050 begin`);
      const actual: number = progressRatio(6480000);
      logInfo(`progressRatio(progress=6480000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0051
     * @tc.name      PageLoading_ProgressRatio_0051
     * @tc.desc      progressRatio(progress=6660000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0051 begin`);
      const actual: number = progressRatio(6660000);
      logInfo(`progressRatio(progress=6660000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0052
     * @tc.name      PageLoading_ProgressRatio_0052
     * @tc.desc      progressRatio(progress=6840000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0052 begin`);
      const actual: number = progressRatio(6840000);
      logInfo(`progressRatio(progress=6840000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0053
     * @tc.name      PageLoading_ProgressRatio_0053
     * @tc.desc      progressRatio(progress=7020000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0053 begin`);
      const actual: number = progressRatio(7020000);
      logInfo(`progressRatio(progress=7020000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0054
     * @tc.name      PageLoading_ProgressRatio_0054
     * @tc.desc      progressRatio(progress=7200000) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0054 begin`);
      const actual: number = progressRatio(7200000);
      logInfo(`progressRatio(progress=7200000): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0055
     * @tc.name      PageLoading_ProgressRatio_0055
     * @tc.desc      progressRatio(progress=-3559134) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0055 begin`);
      const actual: number = progressRatio(-3559134);
      logInfo(`progressRatio(progress=-3559134): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0056
     * @tc.name      PageLoading_ProgressRatio_0056
     * @tc.desc      progressRatio(progress=2860901.81) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0056 begin`);
      const actual: number = progressRatio(2860901.81);
      logInfo(`progressRatio(progress=2860901.81): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0057
     * @tc.name      PageLoading_ProgressRatio_0057
     * @tc.desc      progressRatio(progress=-2584837) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0057 begin`);
      const actual: number = progressRatio(-2584837);
      logInfo(`progressRatio(progress=-2584837): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0058
     * @tc.name      PageLoading_ProgressRatio_0058
     * @tc.desc      progressRatio(progress=564683) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0058 begin`);
      const actual: number = progressRatio(564683);
      logInfo(`progressRatio(progress=564683): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0059
     * @tc.name      PageLoading_ProgressRatio_0059
     * @tc.desc      progressRatio(progress=2105772.14) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0059 begin`);
      const actual: number = progressRatio(2105772.14);
      logInfo(`progressRatio(progress=2105772.14): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0060
     * @tc.name      PageLoading_ProgressRatio_0060
     * @tc.desc      progressRatio(progress=-572048) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0060 begin`);
      const actual: number = progressRatio(-572048);
      logInfo(`progressRatio(progress=-572048): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0061
     * @tc.name      PageLoading_ProgressRatio_0061
     * @tc.desc      progressRatio(progress=5332360) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0061 begin`);
      const actual: number = progressRatio(5332360);
      logInfo(`progressRatio(progress=5332360): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0062
     * @tc.name      PageLoading_ProgressRatio_0062
     * @tc.desc      progressRatio(progress=3539550.56) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0062 begin`);
      const actual: number = progressRatio(3539550.56);
      logInfo(`progressRatio(progress=3539550.56): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0063
     * @tc.name      PageLoading_ProgressRatio_0063
     * @tc.desc      progressRatio(progress=3086736) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0063 begin`);
      const actual: number = progressRatio(3086736);
      logInfo(`progressRatio(progress=3086736): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0064
     * @tc.name      PageLoading_ProgressRatio_0064
     * @tc.desc      progressRatio(progress=3577310.94) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0064 begin`);
      const actual: number = progressRatio(3577310.94);
      logInfo(`progressRatio(progress=3577310.94): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0065
     * @tc.name      PageLoading_ProgressRatio_0065
     * @tc.desc      progressRatio(progress=6134152) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0065 begin`);
      const actual: number = progressRatio(6134152);
      logInfo(`progressRatio(progress=6134152): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0066
     * @tc.name      PageLoading_ProgressRatio_0066
     * @tc.desc      progressRatio(progress=2666035.96) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0066 begin`);
      const actual: number = progressRatio(2666035.96);
      logInfo(`progressRatio(progress=2666035.96): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0067
     * @tc.name      PageLoading_ProgressRatio_0067
     * @tc.desc      progressRatio(progress=4503507) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0067 begin`);
      const actual: number = progressRatio(4503507);
      logInfo(`progressRatio(progress=4503507): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0068
     * @tc.name      PageLoading_ProgressRatio_0068
     * @tc.desc      progressRatio(progress=5114027) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0068 begin`);
      const actual: number = progressRatio(5114027);
      logInfo(`progressRatio(progress=5114027): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0069
     * @tc.name      PageLoading_ProgressRatio_0069
     * @tc.desc      progressRatio(progress=2352450) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0069 begin`);
      const actual: number = progressRatio(2352450);
      logInfo(`progressRatio(progress=2352450): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0070
     * @tc.name      PageLoading_ProgressRatio_0070
     * @tc.desc      progressRatio(progress=1434184.85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0070 begin`);
      const actual: number = progressRatio(1434184.85);
      logInfo(`progressRatio(progress=1434184.85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0071
     * @tc.name      PageLoading_ProgressRatio_0071
     * @tc.desc      progressRatio(progress=928806.74) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0071 begin`);
      const actual: number = progressRatio(928806.74);
      logInfo(`progressRatio(progress=928806.74): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0072
     * @tc.name      PageLoading_ProgressRatio_0072
     * @tc.desc      progressRatio(progress=7166051) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0072 begin`);
      const actual: number = progressRatio(7166051);
      logInfo(`progressRatio(progress=7166051): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0073
     * @tc.name      PageLoading_ProgressRatio_0073
     * @tc.desc      progressRatio(progress=2612775) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0073 begin`);
      const actual: number = progressRatio(2612775);
      logInfo(`progressRatio(progress=2612775): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0074
     * @tc.name      PageLoading_ProgressRatio_0074
     * @tc.desc      progressRatio(progress=1953870) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0074 begin`);
      const actual: number = progressRatio(1953870);
      logInfo(`progressRatio(progress=1953870): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0075
     * @tc.name      PageLoading_ProgressRatio_0075
     * @tc.desc      progressRatio(progress=4540679) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0075 begin`);
      const actual: number = progressRatio(4540679);
      logInfo(`progressRatio(progress=4540679): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0076
     * @tc.name      PageLoading_ProgressRatio_0076
     * @tc.desc      progressRatio(progress=5668434) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0076 begin`);
      const actual: number = progressRatio(5668434);
      logInfo(`progressRatio(progress=5668434): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0077
     * @tc.name      PageLoading_ProgressRatio_0077
     * @tc.desc      progressRatio(progress=5237541) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0077 begin`);
      const actual: number = progressRatio(5237541);
      logInfo(`progressRatio(progress=5237541): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0078
     * @tc.name      PageLoading_ProgressRatio_0078
     * @tc.desc      progressRatio(progress=1069977.05) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0078 begin`);
      const actual: number = progressRatio(1069977.05);
      logInfo(`progressRatio(progress=1069977.05): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0079
     * @tc.name      PageLoading_ProgressRatio_0079
     * @tc.desc      progressRatio(progress=946730) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0079 begin`);
      const actual: number = progressRatio(946730);
      logInfo(`progressRatio(progress=946730): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0080
     * @tc.name      PageLoading_ProgressRatio_0080
     * @tc.desc      progressRatio(progress=7039256) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0080 begin`);
      const actual: number = progressRatio(7039256);
      logInfo(`progressRatio(progress=7039256): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0081
     * @tc.name      PageLoading_ProgressRatio_0081
     * @tc.desc      progressRatio(progress=1983674) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0081 begin`);
      const actual: number = progressRatio(1983674);
      logInfo(`progressRatio(progress=1983674): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0082
     * @tc.name      PageLoading_ProgressRatio_0082
     * @tc.desc      progressRatio(progress=-346924) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0082 begin`);
      const actual: number = progressRatio(-346924);
      logInfo(`progressRatio(progress=-346924): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0083
     * @tc.name      PageLoading_ProgressRatio_0083
     * @tc.desc      progressRatio(progress=-2634871) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0083 begin`);
      const actual: number = progressRatio(-2634871);
      logInfo(`progressRatio(progress=-2634871): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0084
     * @tc.name      PageLoading_ProgressRatio_0084
     * @tc.desc      progressRatio(progress=6521642) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0084 begin`);
      const actual: number = progressRatio(6521642);
      logInfo(`progressRatio(progress=6521642): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0085
     * @tc.name      PageLoading_ProgressRatio_0085
     * @tc.desc      progressRatio(progress=-1214284) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0085 begin`);
      const actual: number = progressRatio(-1214284);
      logInfo(`progressRatio(progress=-1214284): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0086
     * @tc.name      PageLoading_ProgressRatio_0086
     * @tc.desc      progressRatio(progress=3968108) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0086 begin`);
      const actual: number = progressRatio(3968108);
      logInfo(`progressRatio(progress=3968108): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0087
     * @tc.name      PageLoading_ProgressRatio_0087
     * @tc.desc      progressRatio(progress=3633207) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0087 begin`);
      const actual: number = progressRatio(3633207);
      logInfo(`progressRatio(progress=3633207): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0088
     * @tc.name      PageLoading_ProgressRatio_0088
     * @tc.desc      progressRatio(progress=3669228) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0088 begin`);
      const actual: number = progressRatio(3669228);
      logInfo(`progressRatio(progress=3669228): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0089
     * @tc.name      PageLoading_ProgressRatio_0089
     * @tc.desc      progressRatio(progress=-2241335) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0089 begin`);
      const actual: number = progressRatio(-2241335);
      logInfo(`progressRatio(progress=-2241335): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0090
     * @tc.name      PageLoading_ProgressRatio_0090
     * @tc.desc      progressRatio(progress=2144643) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0090 begin`);
      const actual: number = progressRatio(2144643);
      logInfo(`progressRatio(progress=2144643): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0091
     * @tc.name      PageLoading_ProgressRatio_0091
     * @tc.desc      progressRatio(progress=-280936) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0091 begin`);
      const actual: number = progressRatio(-280936);
      logInfo(`progressRatio(progress=-280936): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0092
     * @tc.name      PageLoading_ProgressRatio_0092
     * @tc.desc      progressRatio(progress=4832839) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0092 begin`);
      const actual: number = progressRatio(4832839);
      logInfo(`progressRatio(progress=4832839): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0093
     * @tc.name      PageLoading_ProgressRatio_0093
     * @tc.desc      progressRatio(progress=3068189.89) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0093 begin`);
      const actual: number = progressRatio(3068189.89);
      logInfo(`progressRatio(progress=3068189.89): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0094
     * @tc.name      PageLoading_ProgressRatio_0094
     * @tc.desc      progressRatio(progress=5072123) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0094 begin`);
      const actual: number = progressRatio(5072123);
      logInfo(`progressRatio(progress=5072123): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0095
     * @tc.name      PageLoading_ProgressRatio_0095
     * @tc.desc      progressRatio(progress=4867227) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0095 begin`);
      const actual: number = progressRatio(4867227);
      logInfo(`progressRatio(progress=4867227): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0096
     * @tc.name      PageLoading_ProgressRatio_0096
     * @tc.desc      progressRatio(progress=1834186) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0096 begin`);
      const actual: number = progressRatio(1834186);
      logInfo(`progressRatio(progress=1834186): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0096 end`);
    });
  });
}
