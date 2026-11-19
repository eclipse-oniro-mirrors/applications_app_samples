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
import { progressAt } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for progressAt (96 cases). */
export default function progressAtTest(): void {
  describe('ProgressAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0001
     * @tc.name      PageLoading_ProgressAt_0001
     * @tc.desc      progressAt(elapsedMs=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProgressAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProgressAt_0001 begin`);
      const actual: number = progressAt(0);
      logInfo(`progressAt(elapsedMs=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0002
     * @tc.name      PageLoading_ProgressAt_0002
     * @tc.desc      progressAt(elapsedMs=500) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_ProgressAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ProgressAt_0002 begin`);
      const actual: number = progressAt(500);
      logInfo(`progressAt(elapsedMs=500): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ProgressAt_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0003
     * @tc.name      PageLoading_ProgressAt_0003
     * @tc.desc      progressAt(elapsedMs=1000) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0003 begin`);
      const actual: number = progressAt(1000);
      logInfo(`progressAt(elapsedMs=1000): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}ProgressAt_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0004
     * @tc.name      PageLoading_ProgressAt_0004
     * @tc.desc      progressAt(elapsedMs=59999) returns 1190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0004 begin`);
      const actual: number = progressAt(59999);
      logInfo(`progressAt(elapsedMs=59999): actual=${actual}`);
      expect(actual).assertEqual(1190);
      logInfo(`${BUNDLE}ProgressAt_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0005
     * @tc.name      PageLoading_ProgressAt_0005
     * @tc.desc      progressAt(elapsedMs=60000) returns 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0005 begin`);
      const actual: number = progressAt(60000);
      logInfo(`progressAt(elapsedMs=60000): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}ProgressAt_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0006
     * @tc.name      PageLoading_ProgressAt_0006
     * @tc.desc      progressAt(elapsedMs=61000) returns 1220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0006 begin`);
      const actual: number = progressAt(61000);
      logInfo(`progressAt(elapsedMs=61000): actual=${actual}`);
      expect(actual).assertEqual(1220);
      logInfo(`${BUNDLE}ProgressAt_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0007
     * @tc.name      PageLoading_ProgressAt_0007
     * @tc.desc      progressAt(elapsedMs=3599000) returns 71980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0007 begin`);
      const actual: number = progressAt(3599000);
      logInfo(`progressAt(elapsedMs=3599000): actual=${actual}`);
      expect(actual).assertEqual(71980);
      logInfo(`${BUNDLE}ProgressAt_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0008
     * @tc.name      PageLoading_ProgressAt_0008
     * @tc.desc      progressAt(elapsedMs=3600000) returns 72000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0008 begin`);
      const actual: number = progressAt(3600000);
      logInfo(`progressAt(elapsedMs=3600000): actual=${actual}`);
      expect(actual).assertEqual(72000);
      logInfo(`${BUNDLE}ProgressAt_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0009
     * @tc.name      PageLoading_ProgressAt_0009
     * @tc.desc      progressAt(elapsedMs=180000) returns 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0009 begin`);
      const actual: number = progressAt(180000);
      logInfo(`progressAt(elapsedMs=180000): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}ProgressAt_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0010
     * @tc.name      PageLoading_ProgressAt_0010
     * @tc.desc      progressAt(elapsedMs=360000) returns 7200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0010 begin`);
      const actual: number = progressAt(360000);
      logInfo(`progressAt(elapsedMs=360000): actual=${actual}`);
      expect(actual).assertEqual(7200);
      logInfo(`${BUNDLE}ProgressAt_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0011
     * @tc.name      PageLoading_ProgressAt_0011
     * @tc.desc      progressAt(elapsedMs=540000) returns 10800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0011 begin`);
      const actual: number = progressAt(540000);
      logInfo(`progressAt(elapsedMs=540000): actual=${actual}`);
      expect(actual).assertEqual(10800);
      logInfo(`${BUNDLE}ProgressAt_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0012
     * @tc.name      PageLoading_ProgressAt_0012
     * @tc.desc      progressAt(elapsedMs=720000) returns 14400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0012 begin`);
      const actual: number = progressAt(720000);
      logInfo(`progressAt(elapsedMs=720000): actual=${actual}`);
      expect(actual).assertEqual(14400);
      logInfo(`${BUNDLE}ProgressAt_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0013
     * @tc.name      PageLoading_ProgressAt_0013
     * @tc.desc      progressAt(elapsedMs=900000) returns 18000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0013 begin`);
      const actual: number = progressAt(900000);
      logInfo(`progressAt(elapsedMs=900000): actual=${actual}`);
      expect(actual).assertEqual(18000);
      logInfo(`${BUNDLE}ProgressAt_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0014
     * @tc.name      PageLoading_ProgressAt_0014
     * @tc.desc      progressAt(elapsedMs=1080000) returns 21600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0014 begin`);
      const actual: number = progressAt(1080000);
      logInfo(`progressAt(elapsedMs=1080000): actual=${actual}`);
      expect(actual).assertEqual(21600);
      logInfo(`${BUNDLE}ProgressAt_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0015
     * @tc.name      PageLoading_ProgressAt_0015
     * @tc.desc      progressAt(elapsedMs=1260000) returns 25200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0015 begin`);
      const actual: number = progressAt(1260000);
      logInfo(`progressAt(elapsedMs=1260000): actual=${actual}`);
      expect(actual).assertEqual(25200);
      logInfo(`${BUNDLE}ProgressAt_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0016
     * @tc.name      PageLoading_ProgressAt_0016
     * @tc.desc      progressAt(elapsedMs=1440000) returns 28800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0016 begin`);
      const actual: number = progressAt(1440000);
      logInfo(`progressAt(elapsedMs=1440000): actual=${actual}`);
      expect(actual).assertEqual(28800);
      logInfo(`${BUNDLE}ProgressAt_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0017
     * @tc.name      PageLoading_ProgressAt_0017
     * @tc.desc      progressAt(elapsedMs=1620000) returns 32400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0017 begin`);
      const actual: number = progressAt(1620000);
      logInfo(`progressAt(elapsedMs=1620000): actual=${actual}`);
      expect(actual).assertEqual(32400);
      logInfo(`${BUNDLE}ProgressAt_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0018
     * @tc.name      PageLoading_ProgressAt_0018
     * @tc.desc      progressAt(elapsedMs=1800000) returns 36000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0018 begin`);
      const actual: number = progressAt(1800000);
      logInfo(`progressAt(elapsedMs=1800000): actual=${actual}`);
      expect(actual).assertEqual(36000);
      logInfo(`${BUNDLE}ProgressAt_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0019
     * @tc.name      PageLoading_ProgressAt_0019
     * @tc.desc      progressAt(elapsedMs=1980000) returns 39600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0019 begin`);
      const actual: number = progressAt(1980000);
      logInfo(`progressAt(elapsedMs=1980000): actual=${actual}`);
      expect(actual).assertEqual(39600);
      logInfo(`${BUNDLE}ProgressAt_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0020
     * @tc.name      PageLoading_ProgressAt_0020
     * @tc.desc      progressAt(elapsedMs=2160000) returns 43200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0020 begin`);
      const actual: number = progressAt(2160000);
      logInfo(`progressAt(elapsedMs=2160000): actual=${actual}`);
      expect(actual).assertEqual(43200);
      logInfo(`${BUNDLE}ProgressAt_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0021
     * @tc.name      PageLoading_ProgressAt_0021
     * @tc.desc      progressAt(elapsedMs=2340000) returns 46800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0021 begin`);
      const actual: number = progressAt(2340000);
      logInfo(`progressAt(elapsedMs=2340000): actual=${actual}`);
      expect(actual).assertEqual(46800);
      logInfo(`${BUNDLE}ProgressAt_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0022
     * @tc.name      PageLoading_ProgressAt_0022
     * @tc.desc      progressAt(elapsedMs=2520000) returns 50400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0022 begin`);
      const actual: number = progressAt(2520000);
      logInfo(`progressAt(elapsedMs=2520000): actual=${actual}`);
      expect(actual).assertEqual(50400);
      logInfo(`${BUNDLE}ProgressAt_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0023
     * @tc.name      PageLoading_ProgressAt_0023
     * @tc.desc      progressAt(elapsedMs=2700000) returns 54000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0023 begin`);
      const actual: number = progressAt(2700000);
      logInfo(`progressAt(elapsedMs=2700000): actual=${actual}`);
      expect(actual).assertEqual(54000);
      logInfo(`${BUNDLE}ProgressAt_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0024
     * @tc.name      PageLoading_ProgressAt_0024
     * @tc.desc      progressAt(elapsedMs=2880000) returns 57600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0024 begin`);
      const actual: number = progressAt(2880000);
      logInfo(`progressAt(elapsedMs=2880000): actual=${actual}`);
      expect(actual).assertEqual(57600);
      logInfo(`${BUNDLE}ProgressAt_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0025
     * @tc.name      PageLoading_ProgressAt_0025
     * @tc.desc      progressAt(elapsedMs=3060000) returns 61200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0025 begin`);
      const actual: number = progressAt(3060000);
      logInfo(`progressAt(elapsedMs=3060000): actual=${actual}`);
      expect(actual).assertEqual(61200);
      logInfo(`${BUNDLE}ProgressAt_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0026
     * @tc.name      PageLoading_ProgressAt_0026
     * @tc.desc      progressAt(elapsedMs=3240000) returns 64800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0026 begin`);
      const actual: number = progressAt(3240000);
      logInfo(`progressAt(elapsedMs=3240000): actual=${actual}`);
      expect(actual).assertEqual(64800);
      logInfo(`${BUNDLE}ProgressAt_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0027
     * @tc.name      PageLoading_ProgressAt_0027
     * @tc.desc      progressAt(elapsedMs=3420000) returns 68400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0027 begin`);
      const actual: number = progressAt(3420000);
      logInfo(`progressAt(elapsedMs=3420000): actual=${actual}`);
      expect(actual).assertEqual(68400);
      logInfo(`${BUNDLE}ProgressAt_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0028
     * @tc.name      PageLoading_ProgressAt_0028
     * @tc.desc      progressAt(elapsedMs=3780000) returns 75600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0028 begin`);
      const actual: number = progressAt(3780000);
      logInfo(`progressAt(elapsedMs=3780000): actual=${actual}`);
      expect(actual).assertEqual(75600);
      logInfo(`${BUNDLE}ProgressAt_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0029
     * @tc.name      PageLoading_ProgressAt_0029
     * @tc.desc      progressAt(elapsedMs=3960000) returns 79200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0029 begin`);
      const actual: number = progressAt(3960000);
      logInfo(`progressAt(elapsedMs=3960000): actual=${actual}`);
      expect(actual).assertEqual(79200);
      logInfo(`${BUNDLE}ProgressAt_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0030
     * @tc.name      PageLoading_ProgressAt_0030
     * @tc.desc      progressAt(elapsedMs=4140000) returns 82800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0030 begin`);
      const actual: number = progressAt(4140000);
      logInfo(`progressAt(elapsedMs=4140000): actual=${actual}`);
      expect(actual).assertEqual(82800);
      logInfo(`${BUNDLE}ProgressAt_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0031
     * @tc.name      PageLoading_ProgressAt_0031
     * @tc.desc      progressAt(elapsedMs=4320000) returns 86400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0031 begin`);
      const actual: number = progressAt(4320000);
      logInfo(`progressAt(elapsedMs=4320000): actual=${actual}`);
      expect(actual).assertEqual(86400);
      logInfo(`${BUNDLE}ProgressAt_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0032
     * @tc.name      PageLoading_ProgressAt_0032
     * @tc.desc      progressAt(elapsedMs=4500000) returns 90000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0032 begin`);
      const actual: number = progressAt(4500000);
      logInfo(`progressAt(elapsedMs=4500000): actual=${actual}`);
      expect(actual).assertEqual(90000);
      logInfo(`${BUNDLE}ProgressAt_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0033
     * @tc.name      PageLoading_ProgressAt_0033
     * @tc.desc      progressAt(elapsedMs=4680000) returns 93600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0033 begin`);
      const actual: number = progressAt(4680000);
      logInfo(`progressAt(elapsedMs=4680000): actual=${actual}`);
      expect(actual).assertEqual(93600);
      logInfo(`${BUNDLE}ProgressAt_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0034
     * @tc.name      PageLoading_ProgressAt_0034
     * @tc.desc      progressAt(elapsedMs=4860000) returns 97200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0034 begin`);
      const actual: number = progressAt(4860000);
      logInfo(`progressAt(elapsedMs=4860000): actual=${actual}`);
      expect(actual).assertEqual(97200);
      logInfo(`${BUNDLE}ProgressAt_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0035
     * @tc.name      PageLoading_ProgressAt_0035
     * @tc.desc      progressAt(elapsedMs=5040000) returns 100800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0035 begin`);
      const actual: number = progressAt(5040000);
      logInfo(`progressAt(elapsedMs=5040000): actual=${actual}`);
      expect(actual).assertEqual(100800);
      logInfo(`${BUNDLE}ProgressAt_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0036
     * @tc.name      PageLoading_ProgressAt_0036
     * @tc.desc      progressAt(elapsedMs=5220000) returns 104400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0036 begin`);
      const actual: number = progressAt(5220000);
      logInfo(`progressAt(elapsedMs=5220000): actual=${actual}`);
      expect(actual).assertEqual(104400);
      logInfo(`${BUNDLE}ProgressAt_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0037
     * @tc.name      PageLoading_ProgressAt_0037
     * @tc.desc      progressAt(elapsedMs=5400000) returns 108000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0037 begin`);
      const actual: number = progressAt(5400000);
      logInfo(`progressAt(elapsedMs=5400000): actual=${actual}`);
      expect(actual).assertEqual(108000);
      logInfo(`${BUNDLE}ProgressAt_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0038
     * @tc.name      PageLoading_ProgressAt_0038
     * @tc.desc      progressAt(elapsedMs=5580000) returns 111600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0038 begin`);
      const actual: number = progressAt(5580000);
      logInfo(`progressAt(elapsedMs=5580000): actual=${actual}`);
      expect(actual).assertEqual(111600);
      logInfo(`${BUNDLE}ProgressAt_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0039
     * @tc.name      PageLoading_ProgressAt_0039
     * @tc.desc      progressAt(elapsedMs=5760000) returns 115200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0039 begin`);
      const actual: number = progressAt(5760000);
      logInfo(`progressAt(elapsedMs=5760000): actual=${actual}`);
      expect(actual).assertEqual(115200);
      logInfo(`${BUNDLE}ProgressAt_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0040
     * @tc.name      PageLoading_ProgressAt_0040
     * @tc.desc      progressAt(elapsedMs=5940000) returns 118800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0040 begin`);
      const actual: number = progressAt(5940000);
      logInfo(`progressAt(elapsedMs=5940000): actual=${actual}`);
      expect(actual).assertEqual(118800);
      logInfo(`${BUNDLE}ProgressAt_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0041
     * @tc.name      PageLoading_ProgressAt_0041
     * @tc.desc      progressAt(elapsedMs=6120000) returns 122400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0041 begin`);
      const actual: number = progressAt(6120000);
      logInfo(`progressAt(elapsedMs=6120000): actual=${actual}`);
      expect(actual).assertEqual(122400);
      logInfo(`${BUNDLE}ProgressAt_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0042
     * @tc.name      PageLoading_ProgressAt_0042
     * @tc.desc      progressAt(elapsedMs=6300000) returns 126000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0042 begin`);
      const actual: number = progressAt(6300000);
      logInfo(`progressAt(elapsedMs=6300000): actual=${actual}`);
      expect(actual).assertEqual(126000);
      logInfo(`${BUNDLE}ProgressAt_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0043
     * @tc.name      PageLoading_ProgressAt_0043
     * @tc.desc      progressAt(elapsedMs=6480000) returns 129600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0043 begin`);
      const actual: number = progressAt(6480000);
      logInfo(`progressAt(elapsedMs=6480000): actual=${actual}`);
      expect(actual).assertEqual(129600);
      logInfo(`${BUNDLE}ProgressAt_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0044
     * @tc.name      PageLoading_ProgressAt_0044
     * @tc.desc      progressAt(elapsedMs=6660000) returns 133200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0044 begin`);
      const actual: number = progressAt(6660000);
      logInfo(`progressAt(elapsedMs=6660000): actual=${actual}`);
      expect(actual).assertEqual(133200);
      logInfo(`${BUNDLE}ProgressAt_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0045
     * @tc.name      PageLoading_ProgressAt_0045
     * @tc.desc      progressAt(elapsedMs=6840000) returns 136800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0045 begin`);
      const actual: number = progressAt(6840000);
      logInfo(`progressAt(elapsedMs=6840000): actual=${actual}`);
      expect(actual).assertEqual(136800);
      logInfo(`${BUNDLE}ProgressAt_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0046
     * @tc.name      PageLoading_ProgressAt_0046
     * @tc.desc      progressAt(elapsedMs=7020000) returns 140400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0046 begin`);
      const actual: number = progressAt(7020000);
      logInfo(`progressAt(elapsedMs=7020000): actual=${actual}`);
      expect(actual).assertEqual(140400);
      logInfo(`${BUNDLE}ProgressAt_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0047
     * @tc.name      PageLoading_ProgressAt_0047
     * @tc.desc      progressAt(elapsedMs=7200000) returns 144000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0047 begin`);
      const actual: number = progressAt(7200000);
      logInfo(`progressAt(elapsedMs=7200000): actual=${actual}`);
      expect(actual).assertEqual(144000);
      logInfo(`${BUNDLE}ProgressAt_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0048
     * @tc.name      PageLoading_ProgressAt_0048
     * @tc.desc      progressAt(elapsedMs=1301305) returns 26020
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0048 begin`);
      const actual: number = progressAt(1301305);
      logInfo(`progressAt(elapsedMs=1301305): actual=${actual}`);
      expect(actual).assertEqual(26020);
      logInfo(`${BUNDLE}ProgressAt_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0049
     * @tc.name      PageLoading_ProgressAt_0049
     * @tc.desc      progressAt(elapsedMs=2608435.55) returns 52160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0049 begin`);
      const actual: number = progressAt(2608435.55);
      logInfo(`progressAt(elapsedMs=2608435.55): actual=${actual}`);
      expect(actual).assertEqual(52160);
      logInfo(`${BUNDLE}ProgressAt_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0050
     * @tc.name      PageLoading_ProgressAt_0050
     * @tc.desc      progressAt(elapsedMs=910288.43) returns 18200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0050 begin`);
      const actual: number = progressAt(910288.43);
      logInfo(`progressAt(elapsedMs=910288.43): actual=${actual}`);
      expect(actual).assertEqual(18200);
      logInfo(`${BUNDLE}ProgressAt_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0051
     * @tc.name      PageLoading_ProgressAt_0051
     * @tc.desc      progressAt(elapsedMs=311381) returns 6220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0051 begin`);
      const actual: number = progressAt(311381);
      logInfo(`progressAt(elapsedMs=311381): actual=${actual}`);
      expect(actual).assertEqual(6220);
      logInfo(`${BUNDLE}ProgressAt_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0052
     * @tc.name      PageLoading_ProgressAt_0052
     * @tc.desc      progressAt(elapsedMs=6690077) returns 133800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0052 begin`);
      const actual: number = progressAt(6690077);
      logInfo(`progressAt(elapsedMs=6690077): actual=${actual}`);
      expect(actual).assertEqual(133800);
      logInfo(`${BUNDLE}ProgressAt_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0053
     * @tc.name      PageLoading_ProgressAt_0053
     * @tc.desc      progressAt(elapsedMs=5840539) returns 116810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0053 begin`);
      const actual: number = progressAt(5840539);
      logInfo(`progressAt(elapsedMs=5840539): actual=${actual}`);
      expect(actual).assertEqual(116810);
      logInfo(`${BUNDLE}ProgressAt_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0054
     * @tc.name      PageLoading_ProgressAt_0054
     * @tc.desc      progressAt(elapsedMs=666579) returns 13330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0054 begin`);
      const actual: number = progressAt(666579);
      logInfo(`progressAt(elapsedMs=666579): actual=${actual}`);
      expect(actual).assertEqual(13330);
      logInfo(`${BUNDLE}ProgressAt_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0055
     * @tc.name      PageLoading_ProgressAt_0055
     * @tc.desc      progressAt(elapsedMs=2960486) returns 59200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0055 begin`);
      const actual: number = progressAt(2960486);
      logInfo(`progressAt(elapsedMs=2960486): actual=${actual}`);
      expect(actual).assertEqual(59200);
      logInfo(`${BUNDLE}ProgressAt_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0056
     * @tc.name      PageLoading_ProgressAt_0056
     * @tc.desc      progressAt(elapsedMs=5389514) returns 107790
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0056 begin`);
      const actual: number = progressAt(5389514);
      logInfo(`progressAt(elapsedMs=5389514): actual=${actual}`);
      expect(actual).assertEqual(107790);
      logInfo(`${BUNDLE}ProgressAt_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0057
     * @tc.name      PageLoading_ProgressAt_0057
     * @tc.desc      progressAt(elapsedMs=1131665.09) returns 22630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0057 begin`);
      const actual: number = progressAt(1131665.09);
      logInfo(`progressAt(elapsedMs=1131665.09): actual=${actual}`);
      expect(actual).assertEqual(22630);
      logInfo(`${BUNDLE}ProgressAt_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0058
     * @tc.name      PageLoading_ProgressAt_0058
     * @tc.desc      progressAt(elapsedMs=5840123) returns 116800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0058 begin`);
      const actual: number = progressAt(5840123);
      logInfo(`progressAt(elapsedMs=5840123): actual=${actual}`);
      expect(actual).assertEqual(116800);
      logInfo(`${BUNDLE}ProgressAt_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0059
     * @tc.name      PageLoading_ProgressAt_0059
     * @tc.desc      progressAt(elapsedMs=3467559) returns 69350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0059 begin`);
      const actual: number = progressAt(3467559);
      logInfo(`progressAt(elapsedMs=3467559): actual=${actual}`);
      expect(actual).assertEqual(69350);
      logInfo(`${BUNDLE}ProgressAt_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0060
     * @tc.name      PageLoading_ProgressAt_0060
     * @tc.desc      progressAt(elapsedMs=3579414.49) returns 71580
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0060 begin`);
      const actual: number = progressAt(3579414.49);
      logInfo(`progressAt(elapsedMs=3579414.49): actual=${actual}`);
      expect(actual).assertEqual(71580);
      logInfo(`${BUNDLE}ProgressAt_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0061
     * @tc.name      PageLoading_ProgressAt_0061
     * @tc.desc      progressAt(elapsedMs=1930372) returns 38600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0061 begin`);
      const actual: number = progressAt(1930372);
      logInfo(`progressAt(elapsedMs=1930372): actual=${actual}`);
      expect(actual).assertEqual(38600);
      logInfo(`${BUNDLE}ProgressAt_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0062
     * @tc.name      PageLoading_ProgressAt_0062
     * @tc.desc      progressAt(elapsedMs=3078863) returns 61570
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0062 begin`);
      const actual: number = progressAt(3078863);
      logInfo(`progressAt(elapsedMs=3078863): actual=${actual}`);
      expect(actual).assertEqual(61570);
      logInfo(`${BUNDLE}ProgressAt_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0063
     * @tc.name      PageLoading_ProgressAt_0063
     * @tc.desc      progressAt(elapsedMs=655995) returns 13110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0063 begin`);
      const actual: number = progressAt(655995);
      logInfo(`progressAt(elapsedMs=655995): actual=${actual}`);
      expect(actual).assertEqual(13110);
      logInfo(`${BUNDLE}ProgressAt_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0064
     * @tc.name      PageLoading_ProgressAt_0064
     * @tc.desc      progressAt(elapsedMs=532858.41) returns 10650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0064 begin`);
      const actual: number = progressAt(532858.41);
      logInfo(`progressAt(elapsedMs=532858.41): actual=${actual}`);
      expect(actual).assertEqual(10650);
      logInfo(`${BUNDLE}ProgressAt_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0065
     * @tc.name      PageLoading_ProgressAt_0065
     * @tc.desc      progressAt(elapsedMs=1550288.41) returns 31000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0065 begin`);
      const actual: number = progressAt(1550288.41);
      logInfo(`progressAt(elapsedMs=1550288.41): actual=${actual}`);
      expect(actual).assertEqual(31000);
      logInfo(`${BUNDLE}ProgressAt_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0066
     * @tc.name      PageLoading_ProgressAt_0066
     * @tc.desc      progressAt(elapsedMs=653527.23) returns 13070
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0066 begin`);
      const actual: number = progressAt(653527.23);
      logInfo(`progressAt(elapsedMs=653527.23): actual=${actual}`);
      expect(actual).assertEqual(13070);
      logInfo(`${BUNDLE}ProgressAt_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0067
     * @tc.name      PageLoading_ProgressAt_0067
     * @tc.desc      progressAt(elapsedMs=5941204) returns 118820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0067 begin`);
      const actual: number = progressAt(5941204);
      logInfo(`progressAt(elapsedMs=5941204): actual=${actual}`);
      expect(actual).assertEqual(118820);
      logInfo(`${BUNDLE}ProgressAt_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0068
     * @tc.name      PageLoading_ProgressAt_0068
     * @tc.desc      progressAt(elapsedMs=4700367) returns 94000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0068 begin`);
      const actual: number = progressAt(4700367);
      logInfo(`progressAt(elapsedMs=4700367): actual=${actual}`);
      expect(actual).assertEqual(94000);
      logInfo(`${BUNDLE}ProgressAt_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0069
     * @tc.name      PageLoading_ProgressAt_0069
     * @tc.desc      progressAt(elapsedMs=1974651.65) returns 39490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0069 begin`);
      const actual: number = progressAt(1974651.65);
      logInfo(`progressAt(elapsedMs=1974651.65): actual=${actual}`);
      expect(actual).assertEqual(39490);
      logInfo(`${BUNDLE}ProgressAt_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0070
     * @tc.name      PageLoading_ProgressAt_0070
     * @tc.desc      progressAt(elapsedMs=2722740) returns 54450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0070 begin`);
      const actual: number = progressAt(2722740);
      logInfo(`progressAt(elapsedMs=2722740): actual=${actual}`);
      expect(actual).assertEqual(54450);
      logInfo(`${BUNDLE}ProgressAt_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0071
     * @tc.name      PageLoading_ProgressAt_0071
     * @tc.desc      progressAt(elapsedMs=6593013) returns 131860
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0071 begin`);
      const actual: number = progressAt(6593013);
      logInfo(`progressAt(elapsedMs=6593013): actual=${actual}`);
      expect(actual).assertEqual(131860);
      logInfo(`${BUNDLE}ProgressAt_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0072
     * @tc.name      PageLoading_ProgressAt_0072
     * @tc.desc      progressAt(elapsedMs=6175436) returns 123500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0072 begin`);
      const actual: number = progressAt(6175436);
      logInfo(`progressAt(elapsedMs=6175436): actual=${actual}`);
      expect(actual).assertEqual(123500);
      logInfo(`${BUNDLE}ProgressAt_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0073
     * @tc.name      PageLoading_ProgressAt_0073
     * @tc.desc      progressAt(elapsedMs=1637024) returns 32740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0073 begin`);
      const actual: number = progressAt(1637024);
      logInfo(`progressAt(elapsedMs=1637024): actual=${actual}`);
      expect(actual).assertEqual(32740);
      logInfo(`${BUNDLE}ProgressAt_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0074
     * @tc.name      PageLoading_ProgressAt_0074
     * @tc.desc      progressAt(elapsedMs=1495851) returns 29910
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0074 begin`);
      const actual: number = progressAt(1495851);
      logInfo(`progressAt(elapsedMs=1495851): actual=${actual}`);
      expect(actual).assertEqual(29910);
      logInfo(`${BUNDLE}ProgressAt_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0075
     * @tc.name      PageLoading_ProgressAt_0075
     * @tc.desc      progressAt(elapsedMs=1415019.92) returns 28300
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0075 begin`);
      const actual: number = progressAt(1415019.92);
      logInfo(`progressAt(elapsedMs=1415019.92): actual=${actual}`);
      expect(actual).assertEqual(28300);
      logInfo(`${BUNDLE}ProgressAt_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0076
     * @tc.name      PageLoading_ProgressAt_0076
     * @tc.desc      progressAt(elapsedMs=4338301) returns 86760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0076 begin`);
      const actual: number = progressAt(4338301);
      logInfo(`progressAt(elapsedMs=4338301): actual=${actual}`);
      expect(actual).assertEqual(86760);
      logInfo(`${BUNDLE}ProgressAt_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0077
     * @tc.name      PageLoading_ProgressAt_0077
     * @tc.desc      progressAt(elapsedMs=2451320) returns 49020
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0077 begin`);
      const actual: number = progressAt(2451320);
      logInfo(`progressAt(elapsedMs=2451320): actual=${actual}`);
      expect(actual).assertEqual(49020);
      logInfo(`${BUNDLE}ProgressAt_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0078
     * @tc.name      PageLoading_ProgressAt_0078
     * @tc.desc      progressAt(elapsedMs=633686.69) returns 12670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0078 begin`);
      const actual: number = progressAt(633686.69);
      logInfo(`progressAt(elapsedMs=633686.69): actual=${actual}`);
      expect(actual).assertEqual(12670);
      logInfo(`${BUNDLE}ProgressAt_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0079
     * @tc.name      PageLoading_ProgressAt_0079
     * @tc.desc      progressAt(elapsedMs=5275311) returns 105500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0079 begin`);
      const actual: number = progressAt(5275311);
      logInfo(`progressAt(elapsedMs=5275311): actual=${actual}`);
      expect(actual).assertEqual(105500);
      logInfo(`${BUNDLE}ProgressAt_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0080
     * @tc.name      PageLoading_ProgressAt_0080
     * @tc.desc      progressAt(elapsedMs=3779695) returns 75590
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0080 begin`);
      const actual: number = progressAt(3779695);
      logInfo(`progressAt(elapsedMs=3779695): actual=${actual}`);
      expect(actual).assertEqual(75590);
      logInfo(`${BUNDLE}ProgressAt_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0081
     * @tc.name      PageLoading_ProgressAt_0081
     * @tc.desc      progressAt(elapsedMs=1415921) returns 28310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0081 begin`);
      const actual: number = progressAt(1415921);
      logInfo(`progressAt(elapsedMs=1415921): actual=${actual}`);
      expect(actual).assertEqual(28310);
      logInfo(`${BUNDLE}ProgressAt_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0082
     * @tc.name      PageLoading_ProgressAt_0082
     * @tc.desc      progressAt(elapsedMs=5669675) returns 113390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0082 begin`);
      const actual: number = progressAt(5669675);
      logInfo(`progressAt(elapsedMs=5669675): actual=${actual}`);
      expect(actual).assertEqual(113390);
      logInfo(`${BUNDLE}ProgressAt_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0083
     * @tc.name      PageLoading_ProgressAt_0083
     * @tc.desc      progressAt(elapsedMs=175340) returns 3500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0083 begin`);
      const actual: number = progressAt(175340);
      logInfo(`progressAt(elapsedMs=175340): actual=${actual}`);
      expect(actual).assertEqual(3500);
      logInfo(`${BUNDLE}ProgressAt_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0084
     * @tc.name      PageLoading_ProgressAt_0084
     * @tc.desc      progressAt(elapsedMs=1517667.03) returns 30350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0084 begin`);
      const actual: number = progressAt(1517667.03);
      logInfo(`progressAt(elapsedMs=1517667.03): actual=${actual}`);
      expect(actual).assertEqual(30350);
      logInfo(`${BUNDLE}ProgressAt_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0085
     * @tc.name      PageLoading_ProgressAt_0085
     * @tc.desc      progressAt(elapsedMs=264038) returns 5280
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0085 begin`);
      const actual: number = progressAt(264038);
      logInfo(`progressAt(elapsedMs=264038): actual=${actual}`);
      expect(actual).assertEqual(5280);
      logInfo(`${BUNDLE}ProgressAt_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0086
     * @tc.name      PageLoading_ProgressAt_0086
     * @tc.desc      progressAt(elapsedMs=1592756.95) returns 31850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0086 begin`);
      const actual: number = progressAt(1592756.95);
      logInfo(`progressAt(elapsedMs=1592756.95): actual=${actual}`);
      expect(actual).assertEqual(31850);
      logInfo(`${BUNDLE}ProgressAt_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0087
     * @tc.name      PageLoading_ProgressAt_0087
     * @tc.desc      progressAt(elapsedMs=767752.62) returns 15350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0087 begin`);
      const actual: number = progressAt(767752.62);
      logInfo(`progressAt(elapsedMs=767752.62): actual=${actual}`);
      expect(actual).assertEqual(15350);
      logInfo(`${BUNDLE}ProgressAt_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0088
     * @tc.name      PageLoading_ProgressAt_0088
     * @tc.desc      progressAt(elapsedMs=1111735.64) returns 22230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0088 begin`);
      const actual: number = progressAt(1111735.64);
      logInfo(`progressAt(elapsedMs=1111735.64): actual=${actual}`);
      expect(actual).assertEqual(22230);
      logInfo(`${BUNDLE}ProgressAt_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0089
     * @tc.name      PageLoading_ProgressAt_0089
     * @tc.desc      progressAt(elapsedMs=6786710) returns 135730
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0089 begin`);
      const actual: number = progressAt(6786710);
      logInfo(`progressAt(elapsedMs=6786710): actual=${actual}`);
      expect(actual).assertEqual(135730);
      logInfo(`${BUNDLE}ProgressAt_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0090
     * @tc.name      PageLoading_ProgressAt_0090
     * @tc.desc      progressAt(elapsedMs=5587134) returns 111740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0090 begin`);
      const actual: number = progressAt(5587134);
      logInfo(`progressAt(elapsedMs=5587134): actual=${actual}`);
      expect(actual).assertEqual(111740);
      logInfo(`${BUNDLE}ProgressAt_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0091
     * @tc.name      PageLoading_ProgressAt_0091
     * @tc.desc      progressAt(elapsedMs=2526860.21) returns 50530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0091 begin`);
      const actual: number = progressAt(2526860.21);
      logInfo(`progressAt(elapsedMs=2526860.21): actual=${actual}`);
      expect(actual).assertEqual(50530);
      logInfo(`${BUNDLE}ProgressAt_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0092
     * @tc.name      PageLoading_ProgressAt_0092
     * @tc.desc      progressAt(elapsedMs=2955119) returns 59100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0092 begin`);
      const actual: number = progressAt(2955119);
      logInfo(`progressAt(elapsedMs=2955119): actual=${actual}`);
      expect(actual).assertEqual(59100);
      logInfo(`${BUNDLE}ProgressAt_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0093
     * @tc.name      PageLoading_ProgressAt_0093
     * @tc.desc      progressAt(elapsedMs=2946266.84) returns 58920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0093 begin`);
      const actual: number = progressAt(2946266.84);
      logInfo(`progressAt(elapsedMs=2946266.84): actual=${actual}`);
      expect(actual).assertEqual(58920);
      logInfo(`${BUNDLE}ProgressAt_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0094
     * @tc.name      PageLoading_ProgressAt_0094
     * @tc.desc      progressAt(elapsedMs=2057257) returns 41140
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0094 begin`);
      const actual: number = progressAt(2057257);
      logInfo(`progressAt(elapsedMs=2057257): actual=${actual}`);
      expect(actual).assertEqual(41140);
      logInfo(`${BUNDLE}ProgressAt_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0095
     * @tc.name      PageLoading_ProgressAt_0095
     * @tc.desc      progressAt(elapsedMs=904232.62) returns 18080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0095 begin`);
      const actual: number = progressAt(904232.62);
      logInfo(`progressAt(elapsedMs=904232.62): actual=${actual}`);
      expect(actual).assertEqual(18080);
      logInfo(`${BUNDLE}ProgressAt_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0096
     * @tc.name      PageLoading_ProgressAt_0096
     * @tc.desc      progressAt(elapsedMs=6749508) returns 134990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0096 begin`);
      const actual: number = progressAt(6749508);
      logInfo(`progressAt(elapsedMs=6749508): actual=${actual}`);
      expect(actual).assertEqual(134990);
      logInfo(`${BUNDLE}ProgressAt_0096 end`);
    });
  });
}
