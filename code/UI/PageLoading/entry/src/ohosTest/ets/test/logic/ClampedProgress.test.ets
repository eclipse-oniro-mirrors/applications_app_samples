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
import { clampedProgress } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for clampedProgress (96 cases). */
export default function clampedProgressTest(): void {
  describe('ClampedProgressTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0001
     * @tc.name      PageLoading_ClampedProgress_0001
     * @tc.desc      clampedProgress(progress=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ClampedProgress_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampedProgress_0001 begin`);
      const actual: number = clampedProgress(0);
      logInfo(`clampedProgress(progress=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0002
     * @tc.name      PageLoading_ClampedProgress_0002
     * @tc.desc      clampedProgress(progress=500) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ClampedProgress_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClampedProgress_0002 begin`);
      const actual: number = clampedProgress(500);
      logInfo(`clampedProgress(progress=500): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0003
     * @tc.name      PageLoading_ClampedProgress_0003
     * @tc.desc      clampedProgress(progress=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_ClampedProgress_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClampedProgress_0003 begin`);
      const actual: number = clampedProgress(1);
      logInfo(`clampedProgress(progress=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ClampedProgress_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0004
     * @tc.name      PageLoading_ClampedProgress_0004
     * @tc.desc      clampedProgress(progress=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0004 begin`);
      const actual: number = clampedProgress(2);
      logInfo(`clampedProgress(progress=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ClampedProgress_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0005
     * @tc.name      PageLoading_ClampedProgress_0005
     * @tc.desc      clampedProgress(progress=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0005 begin`);
      const actual: number = clampedProgress(3);
      logInfo(`clampedProgress(progress=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ClampedProgress_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0006
     * @tc.name      PageLoading_ClampedProgress_0006
     * @tc.desc      clampedProgress(progress=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0006 begin`);
      const actual: number = clampedProgress(10);
      logInfo(`clampedProgress(progress=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ClampedProgress_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0007
     * @tc.name      PageLoading_ClampedProgress_0007
     * @tc.desc      clampedProgress(progress=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_ClampedProgress_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClampedProgress_0007 begin`);
      const actual: number = clampedProgress(-1);
      logInfo(`clampedProgress(progress=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0008
     * @tc.name      PageLoading_ClampedProgress_0008
     * @tc.desc      clampedProgress(progress=999) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0008 begin`);
      const actual: number = clampedProgress(999);
      logInfo(`clampedProgress(progress=999): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0009
     * @tc.name      PageLoading_ClampedProgress_0009
     * @tc.desc      clampedProgress(progress=1000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0009 begin`);
      const actual: number = clampedProgress(1000);
      logInfo(`clampedProgress(progress=1000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0010
     * @tc.name      PageLoading_ClampedProgress_0010
     * @tc.desc      clampedProgress(progress=59999) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0010 begin`);
      const actual: number = clampedProgress(59999);
      logInfo(`clampedProgress(progress=59999): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0011
     * @tc.name      PageLoading_ClampedProgress_0011
     * @tc.desc      clampedProgress(progress=60000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0011 begin`);
      const actual: number = clampedProgress(60000);
      logInfo(`clampedProgress(progress=60000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0012
     * @tc.name      PageLoading_ClampedProgress_0012
     * @tc.desc      clampedProgress(progress=61000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0012 begin`);
      const actual: number = clampedProgress(61000);
      logInfo(`clampedProgress(progress=61000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0013
     * @tc.name      PageLoading_ClampedProgress_0013
     * @tc.desc      clampedProgress(progress=3599000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0013 begin`);
      const actual: number = clampedProgress(3599000);
      logInfo(`clampedProgress(progress=3599000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0014
     * @tc.name      PageLoading_ClampedProgress_0014
     * @tc.desc      clampedProgress(progress=3600000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0014 begin`);
      const actual: number = clampedProgress(3600000);
      logInfo(`clampedProgress(progress=3600000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0015
     * @tc.name      PageLoading_ClampedProgress_0015
     * @tc.desc      clampedProgress(progress=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0015 begin`);
      const actual: number = clampedProgress(100);
      logInfo(`clampedProgress(progress=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0016
     * @tc.name      PageLoading_ClampedProgress_0016
     * @tc.desc      clampedProgress(progress=180000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0016 begin`);
      const actual: number = clampedProgress(180000);
      logInfo(`clampedProgress(progress=180000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0017
     * @tc.name      PageLoading_ClampedProgress_0017
     * @tc.desc      clampedProgress(progress=360000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0017 begin`);
      const actual: number = clampedProgress(360000);
      logInfo(`clampedProgress(progress=360000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0018
     * @tc.name      PageLoading_ClampedProgress_0018
     * @tc.desc      clampedProgress(progress=540000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0018 begin`);
      const actual: number = clampedProgress(540000);
      logInfo(`clampedProgress(progress=540000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0019
     * @tc.name      PageLoading_ClampedProgress_0019
     * @tc.desc      clampedProgress(progress=720000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0019 begin`);
      const actual: number = clampedProgress(720000);
      logInfo(`clampedProgress(progress=720000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0020
     * @tc.name      PageLoading_ClampedProgress_0020
     * @tc.desc      clampedProgress(progress=900000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0020 begin`);
      const actual: number = clampedProgress(900000);
      logInfo(`clampedProgress(progress=900000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0021
     * @tc.name      PageLoading_ClampedProgress_0021
     * @tc.desc      clampedProgress(progress=1080000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0021 begin`);
      const actual: number = clampedProgress(1080000);
      logInfo(`clampedProgress(progress=1080000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0022
     * @tc.name      PageLoading_ClampedProgress_0022
     * @tc.desc      clampedProgress(progress=1260000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0022 begin`);
      const actual: number = clampedProgress(1260000);
      logInfo(`clampedProgress(progress=1260000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0023
     * @tc.name      PageLoading_ClampedProgress_0023
     * @tc.desc      clampedProgress(progress=1440000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0023 begin`);
      const actual: number = clampedProgress(1440000);
      logInfo(`clampedProgress(progress=1440000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0024
     * @tc.name      PageLoading_ClampedProgress_0024
     * @tc.desc      clampedProgress(progress=1620000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0024 begin`);
      const actual: number = clampedProgress(1620000);
      logInfo(`clampedProgress(progress=1620000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0025
     * @tc.name      PageLoading_ClampedProgress_0025
     * @tc.desc      clampedProgress(progress=1800000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0025 begin`);
      const actual: number = clampedProgress(1800000);
      logInfo(`clampedProgress(progress=1800000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0026
     * @tc.name      PageLoading_ClampedProgress_0026
     * @tc.desc      clampedProgress(progress=1980000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0026 begin`);
      const actual: number = clampedProgress(1980000);
      logInfo(`clampedProgress(progress=1980000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0027
     * @tc.name      PageLoading_ClampedProgress_0027
     * @tc.desc      clampedProgress(progress=2160000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0027 begin`);
      const actual: number = clampedProgress(2160000);
      logInfo(`clampedProgress(progress=2160000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0028
     * @tc.name      PageLoading_ClampedProgress_0028
     * @tc.desc      clampedProgress(progress=2340000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0028 begin`);
      const actual: number = clampedProgress(2340000);
      logInfo(`clampedProgress(progress=2340000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0029
     * @tc.name      PageLoading_ClampedProgress_0029
     * @tc.desc      clampedProgress(progress=2520000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0029 begin`);
      const actual: number = clampedProgress(2520000);
      logInfo(`clampedProgress(progress=2520000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0030
     * @tc.name      PageLoading_ClampedProgress_0030
     * @tc.desc      clampedProgress(progress=2700000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0030 begin`);
      const actual: number = clampedProgress(2700000);
      logInfo(`clampedProgress(progress=2700000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0031
     * @tc.name      PageLoading_ClampedProgress_0031
     * @tc.desc      clampedProgress(progress=2880000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0031 begin`);
      const actual: number = clampedProgress(2880000);
      logInfo(`clampedProgress(progress=2880000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0032
     * @tc.name      PageLoading_ClampedProgress_0032
     * @tc.desc      clampedProgress(progress=3060000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0032 begin`);
      const actual: number = clampedProgress(3060000);
      logInfo(`clampedProgress(progress=3060000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0033
     * @tc.name      PageLoading_ClampedProgress_0033
     * @tc.desc      clampedProgress(progress=3240000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0033 begin`);
      const actual: number = clampedProgress(3240000);
      logInfo(`clampedProgress(progress=3240000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0034
     * @tc.name      PageLoading_ClampedProgress_0034
     * @tc.desc      clampedProgress(progress=3420000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0034 begin`);
      const actual: number = clampedProgress(3420000);
      logInfo(`clampedProgress(progress=3420000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0035
     * @tc.name      PageLoading_ClampedProgress_0035
     * @tc.desc      clampedProgress(progress=3780000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0035 begin`);
      const actual: number = clampedProgress(3780000);
      logInfo(`clampedProgress(progress=3780000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0036
     * @tc.name      PageLoading_ClampedProgress_0036
     * @tc.desc      clampedProgress(progress=3960000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0036 begin`);
      const actual: number = clampedProgress(3960000);
      logInfo(`clampedProgress(progress=3960000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0037
     * @tc.name      PageLoading_ClampedProgress_0037
     * @tc.desc      clampedProgress(progress=4140000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0037 begin`);
      const actual: number = clampedProgress(4140000);
      logInfo(`clampedProgress(progress=4140000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0038
     * @tc.name      PageLoading_ClampedProgress_0038
     * @tc.desc      clampedProgress(progress=4320000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0038 begin`);
      const actual: number = clampedProgress(4320000);
      logInfo(`clampedProgress(progress=4320000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0039
     * @tc.name      PageLoading_ClampedProgress_0039
     * @tc.desc      clampedProgress(progress=4500000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0039 begin`);
      const actual: number = clampedProgress(4500000);
      logInfo(`clampedProgress(progress=4500000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0040
     * @tc.name      PageLoading_ClampedProgress_0040
     * @tc.desc      clampedProgress(progress=4680000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0040 begin`);
      const actual: number = clampedProgress(4680000);
      logInfo(`clampedProgress(progress=4680000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0041
     * @tc.name      PageLoading_ClampedProgress_0041
     * @tc.desc      clampedProgress(progress=4860000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0041 begin`);
      const actual: number = clampedProgress(4860000);
      logInfo(`clampedProgress(progress=4860000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0042
     * @tc.name      PageLoading_ClampedProgress_0042
     * @tc.desc      clampedProgress(progress=5040000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0042 begin`);
      const actual: number = clampedProgress(5040000);
      logInfo(`clampedProgress(progress=5040000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0043
     * @tc.name      PageLoading_ClampedProgress_0043
     * @tc.desc      clampedProgress(progress=5220000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0043 begin`);
      const actual: number = clampedProgress(5220000);
      logInfo(`clampedProgress(progress=5220000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0044
     * @tc.name      PageLoading_ClampedProgress_0044
     * @tc.desc      clampedProgress(progress=5400000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0044 begin`);
      const actual: number = clampedProgress(5400000);
      logInfo(`clampedProgress(progress=5400000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0045
     * @tc.name      PageLoading_ClampedProgress_0045
     * @tc.desc      clampedProgress(progress=5580000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0045 begin`);
      const actual: number = clampedProgress(5580000);
      logInfo(`clampedProgress(progress=5580000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0046
     * @tc.name      PageLoading_ClampedProgress_0046
     * @tc.desc      clampedProgress(progress=5760000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0046 begin`);
      const actual: number = clampedProgress(5760000);
      logInfo(`clampedProgress(progress=5760000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0047
     * @tc.name      PageLoading_ClampedProgress_0047
     * @tc.desc      clampedProgress(progress=5940000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0047 begin`);
      const actual: number = clampedProgress(5940000);
      logInfo(`clampedProgress(progress=5940000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0048
     * @tc.name      PageLoading_ClampedProgress_0048
     * @tc.desc      clampedProgress(progress=6120000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0048 begin`);
      const actual: number = clampedProgress(6120000);
      logInfo(`clampedProgress(progress=6120000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0049
     * @tc.name      PageLoading_ClampedProgress_0049
     * @tc.desc      clampedProgress(progress=6300000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0049 begin`);
      const actual: number = clampedProgress(6300000);
      logInfo(`clampedProgress(progress=6300000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0050
     * @tc.name      PageLoading_ClampedProgress_0050
     * @tc.desc      clampedProgress(progress=6480000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0050 begin`);
      const actual: number = clampedProgress(6480000);
      logInfo(`clampedProgress(progress=6480000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0051
     * @tc.name      PageLoading_ClampedProgress_0051
     * @tc.desc      clampedProgress(progress=6660000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0051 begin`);
      const actual: number = clampedProgress(6660000);
      logInfo(`clampedProgress(progress=6660000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0052
     * @tc.name      PageLoading_ClampedProgress_0052
     * @tc.desc      clampedProgress(progress=6840000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0052 begin`);
      const actual: number = clampedProgress(6840000);
      logInfo(`clampedProgress(progress=6840000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0053
     * @tc.name      PageLoading_ClampedProgress_0053
     * @tc.desc      clampedProgress(progress=7020000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0053 begin`);
      const actual: number = clampedProgress(7020000);
      logInfo(`clampedProgress(progress=7020000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0054
     * @tc.name      PageLoading_ClampedProgress_0054
     * @tc.desc      clampedProgress(progress=7200000) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0054 begin`);
      const actual: number = clampedProgress(7200000);
      logInfo(`clampedProgress(progress=7200000): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0055
     * @tc.name      PageLoading_ClampedProgress_0055
     * @tc.desc      clampedProgress(progress=5146369) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0055 begin`);
      const actual: number = clampedProgress(5146369);
      logInfo(`clampedProgress(progress=5146369): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0056
     * @tc.name      PageLoading_ClampedProgress_0056
     * @tc.desc      clampedProgress(progress=4957681) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0056 begin`);
      const actual: number = clampedProgress(4957681);
      logInfo(`clampedProgress(progress=4957681): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0057
     * @tc.name      PageLoading_ClampedProgress_0057
     * @tc.desc      clampedProgress(progress=97398) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0057 begin`);
      const actual: number = clampedProgress(97398);
      logInfo(`clampedProgress(progress=97398): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0058
     * @tc.name      PageLoading_ClampedProgress_0058
     * @tc.desc      clampedProgress(progress=-1915065) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0058 begin`);
      const actual: number = clampedProgress(-1915065);
      logInfo(`clampedProgress(progress=-1915065): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0059
     * @tc.name      PageLoading_ClampedProgress_0059
     * @tc.desc      clampedProgress(progress=-1295900) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0059 begin`);
      const actual: number = clampedProgress(-1295900);
      logInfo(`clampedProgress(progress=-1295900): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0060
     * @tc.name      PageLoading_ClampedProgress_0060
     * @tc.desc      clampedProgress(progress=-479958) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0060 begin`);
      const actual: number = clampedProgress(-479958);
      logInfo(`clampedProgress(progress=-479958): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0061
     * @tc.name      PageLoading_ClampedProgress_0061
     * @tc.desc      clampedProgress(progress=3531763.11) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0061 begin`);
      const actual: number = clampedProgress(3531763.11);
      logInfo(`clampedProgress(progress=3531763.11): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0062
     * @tc.name      PageLoading_ClampedProgress_0062
     * @tc.desc      clampedProgress(progress=5331703) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0062 begin`);
      const actual: number = clampedProgress(5331703);
      logInfo(`clampedProgress(progress=5331703): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0063
     * @tc.name      PageLoading_ClampedProgress_0063
     * @tc.desc      clampedProgress(progress=5340209) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0063 begin`);
      const actual: number = clampedProgress(5340209);
      logInfo(`clampedProgress(progress=5340209): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0064
     * @tc.name      PageLoading_ClampedProgress_0064
     * @tc.desc      clampedProgress(progress=2438543) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0064 begin`);
      const actual: number = clampedProgress(2438543);
      logInfo(`clampedProgress(progress=2438543): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0065
     * @tc.name      PageLoading_ClampedProgress_0065
     * @tc.desc      clampedProgress(progress=6312723) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0065 begin`);
      const actual: number = clampedProgress(6312723);
      logInfo(`clampedProgress(progress=6312723): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0066
     * @tc.name      PageLoading_ClampedProgress_0066
     * @tc.desc      clampedProgress(progress=-784475) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0066 begin`);
      const actual: number = clampedProgress(-784475);
      logInfo(`clampedProgress(progress=-784475): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0067
     * @tc.name      PageLoading_ClampedProgress_0067
     * @tc.desc      clampedProgress(progress=4618634) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0067 begin`);
      const actual: number = clampedProgress(4618634);
      logInfo(`clampedProgress(progress=4618634): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0068
     * @tc.name      PageLoading_ClampedProgress_0068
     * @tc.desc      clampedProgress(progress=2436210) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0068 begin`);
      const actual: number = clampedProgress(2436210);
      logInfo(`clampedProgress(progress=2436210): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0069
     * @tc.name      PageLoading_ClampedProgress_0069
     * @tc.desc      clampedProgress(progress=1821540) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0069 begin`);
      const actual: number = clampedProgress(1821540);
      logInfo(`clampedProgress(progress=1821540): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0070
     * @tc.name      PageLoading_ClampedProgress_0070
     * @tc.desc      clampedProgress(progress=-1716299) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0070 begin`);
      const actual: number = clampedProgress(-1716299);
      logInfo(`clampedProgress(progress=-1716299): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0071
     * @tc.name      PageLoading_ClampedProgress_0071
     * @tc.desc      clampedProgress(progress=6867696) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0071 begin`);
      const actual: number = clampedProgress(6867696);
      logInfo(`clampedProgress(progress=6867696): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0072
     * @tc.name      PageLoading_ClampedProgress_0072
     * @tc.desc      clampedProgress(progress=4373063) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0072 begin`);
      const actual: number = clampedProgress(4373063);
      logInfo(`clampedProgress(progress=4373063): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0073
     * @tc.name      PageLoading_ClampedProgress_0073
     * @tc.desc      clampedProgress(progress=756891) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0073 begin`);
      const actual: number = clampedProgress(756891);
      logInfo(`clampedProgress(progress=756891): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0074
     * @tc.name      PageLoading_ClampedProgress_0074
     * @tc.desc      clampedProgress(progress=6467124) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0074 begin`);
      const actual: number = clampedProgress(6467124);
      logInfo(`clampedProgress(progress=6467124): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0075
     * @tc.name      PageLoading_ClampedProgress_0075
     * @tc.desc      clampedProgress(progress=-2690314) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0075 begin`);
      const actual: number = clampedProgress(-2690314);
      logInfo(`clampedProgress(progress=-2690314): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0076
     * @tc.name      PageLoading_ClampedProgress_0076
     * @tc.desc      clampedProgress(progress=1330439.19) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0076 begin`);
      const actual: number = clampedProgress(1330439.19);
      logInfo(`clampedProgress(progress=1330439.19): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0077
     * @tc.name      PageLoading_ClampedProgress_0077
     * @tc.desc      clampedProgress(progress=4413090) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0077 begin`);
      const actual: number = clampedProgress(4413090);
      logInfo(`clampedProgress(progress=4413090): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0078
     * @tc.name      PageLoading_ClampedProgress_0078
     * @tc.desc      clampedProgress(progress=3768417) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0078 begin`);
      const actual: number = clampedProgress(3768417);
      logInfo(`clampedProgress(progress=3768417): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0079
     * @tc.name      PageLoading_ClampedProgress_0079
     * @tc.desc      clampedProgress(progress=1769069) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0079 begin`);
      const actual: number = clampedProgress(1769069);
      logInfo(`clampedProgress(progress=1769069): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0080
     * @tc.name      PageLoading_ClampedProgress_0080
     * @tc.desc      clampedProgress(progress=759614) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0080 begin`);
      const actual: number = clampedProgress(759614);
      logInfo(`clampedProgress(progress=759614): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0081
     * @tc.name      PageLoading_ClampedProgress_0081
     * @tc.desc      clampedProgress(progress=3453589) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0081 begin`);
      const actual: number = clampedProgress(3453589);
      logInfo(`clampedProgress(progress=3453589): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0082
     * @tc.name      PageLoading_ClampedProgress_0082
     * @tc.desc      clampedProgress(progress=6764291) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0082 begin`);
      const actual: number = clampedProgress(6764291);
      logInfo(`clampedProgress(progress=6764291): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0083
     * @tc.name      PageLoading_ClampedProgress_0083
     * @tc.desc      clampedProgress(progress=2819633) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0083 begin`);
      const actual: number = clampedProgress(2819633);
      logInfo(`clampedProgress(progress=2819633): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0084
     * @tc.name      PageLoading_ClampedProgress_0084
     * @tc.desc      clampedProgress(progress=-2209060) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0084 begin`);
      const actual: number = clampedProgress(-2209060);
      logInfo(`clampedProgress(progress=-2209060): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0085
     * @tc.name      PageLoading_ClampedProgress_0085
     * @tc.desc      clampedProgress(progress=2994649) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0085 begin`);
      const actual: number = clampedProgress(2994649);
      logInfo(`clampedProgress(progress=2994649): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0086
     * @tc.name      PageLoading_ClampedProgress_0086
     * @tc.desc      clampedProgress(progress=1808749) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0086 begin`);
      const actual: number = clampedProgress(1808749);
      logInfo(`clampedProgress(progress=1808749): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0087
     * @tc.name      PageLoading_ClampedProgress_0087
     * @tc.desc      clampedProgress(progress=2240114) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0087 begin`);
      const actual: number = clampedProgress(2240114);
      logInfo(`clampedProgress(progress=2240114): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0088
     * @tc.name      PageLoading_ClampedProgress_0088
     * @tc.desc      clampedProgress(progress=-1370809) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0088 begin`);
      const actual: number = clampedProgress(-1370809);
      logInfo(`clampedProgress(progress=-1370809): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0089
     * @tc.name      PageLoading_ClampedProgress_0089
     * @tc.desc      clampedProgress(progress=1733313) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0089 begin`);
      const actual: number = clampedProgress(1733313);
      logInfo(`clampedProgress(progress=1733313): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0090
     * @tc.name      PageLoading_ClampedProgress_0090
     * @tc.desc      clampedProgress(progress=4821265) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0090 begin`);
      const actual: number = clampedProgress(4821265);
      logInfo(`clampedProgress(progress=4821265): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0091
     * @tc.name      PageLoading_ClampedProgress_0091
     * @tc.desc      clampedProgress(progress=273409) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0091 begin`);
      const actual: number = clampedProgress(273409);
      logInfo(`clampedProgress(progress=273409): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0092
     * @tc.name      PageLoading_ClampedProgress_0092
     * @tc.desc      clampedProgress(progress=5050096) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0092 begin`);
      const actual: number = clampedProgress(5050096);
      logInfo(`clampedProgress(progress=5050096): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0093
     * @tc.name      PageLoading_ClampedProgress_0093
     * @tc.desc      clampedProgress(progress=-3456629) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0093 begin`);
      const actual: number = clampedProgress(-3456629);
      logInfo(`clampedProgress(progress=-3456629): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0094
     * @tc.name      PageLoading_ClampedProgress_0094
     * @tc.desc      clampedProgress(progress=-819695) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0094 begin`);
      const actual: number = clampedProgress(-819695);
      logInfo(`clampedProgress(progress=-819695): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0095
     * @tc.name      PageLoading_ClampedProgress_0095
     * @tc.desc      clampedProgress(progress=1264685) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0095 begin`);
      const actual: number = clampedProgress(1264685);
      logInfo(`clampedProgress(progress=1264685): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0096
     * @tc.name      PageLoading_ClampedProgress_0096
     * @tc.desc      clampedProgress(progress=-2819167) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0096 begin`);
      const actual: number = clampedProgress(-2819167);
      logInfo(`clampedProgress(progress=-2819167): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0096 end`);
    });
  });
}
