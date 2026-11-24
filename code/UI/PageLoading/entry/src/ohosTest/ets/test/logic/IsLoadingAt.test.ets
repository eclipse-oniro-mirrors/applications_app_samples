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
import { isLoadingAt } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isLoadingAt (50 cases). */
export default function isLoadingAtTest(): void {
  describe('IsLoadingAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0001
     * @tc.name      PageLoading_IsLoadingAt_0001
     * @tc.desc      isLoadingAt(elapsedMs=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_IsLoadingAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0001 begin`);
      const actual: boolean = isLoadingAt(0);
      logInfo(`isLoadingAt(elapsedMs=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0002
     * @tc.name      PageLoading_IsLoadingAt_0002
     * @tc.desc      isLoadingAt(elapsedMs=59999) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_IsLoadingAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0002 begin`);
      const actual: boolean = isLoadingAt(59999);
      logInfo(`isLoadingAt(elapsedMs=59999): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0003
     * @tc.name      PageLoading_IsLoadingAt_0003
     * @tc.desc      isLoadingAt(elapsedMs=500) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0003 begin`);
      const actual: boolean = isLoadingAt(500);
      logInfo(`isLoadingAt(elapsedMs=500): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0004
     * @tc.name      PageLoading_IsLoadingAt_0004
     * @tc.desc      isLoadingAt(elapsedMs=999) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0004 begin`);
      const actual: boolean = isLoadingAt(999);
      logInfo(`isLoadingAt(elapsedMs=999): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0005
     * @tc.name      PageLoading_IsLoadingAt_0005
     * @tc.desc      isLoadingAt(elapsedMs=1000) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0005 begin`);
      const actual: boolean = isLoadingAt(1000);
      logInfo(`isLoadingAt(elapsedMs=1000): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0006
     * @tc.name      PageLoading_IsLoadingAt_0006
     * @tc.desc      isLoadingAt(elapsedMs=60000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0006 begin`);
      const actual: boolean = isLoadingAt(60000);
      logInfo(`isLoadingAt(elapsedMs=60000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0007
     * @tc.name      PageLoading_IsLoadingAt_0007
     * @tc.desc      isLoadingAt(elapsedMs=61000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0007 begin`);
      const actual: boolean = isLoadingAt(61000);
      logInfo(`isLoadingAt(elapsedMs=61000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0008
     * @tc.name      PageLoading_IsLoadingAt_0008
     * @tc.desc      isLoadingAt(elapsedMs=3599000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0008 begin`);
      const actual: boolean = isLoadingAt(3599000);
      logInfo(`isLoadingAt(elapsedMs=3599000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0009
     * @tc.name      PageLoading_IsLoadingAt_0009
     * @tc.desc      isLoadingAt(elapsedMs=3600000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0009 begin`);
      const actual: boolean = isLoadingAt(3600000);
      logInfo(`isLoadingAt(elapsedMs=3600000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0010
     * @tc.name      PageLoading_IsLoadingAt_0010
     * @tc.desc      isLoadingAt(elapsedMs=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0010 begin`);
      const actual: boolean = isLoadingAt(1);
      logInfo(`isLoadingAt(elapsedMs=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0011
     * @tc.name      PageLoading_IsLoadingAt_0011
     * @tc.desc      isLoadingAt(elapsedMs=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_IsLoadingAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0011 begin`);
      const actual: boolean = isLoadingAt(-1);
      logInfo(`isLoadingAt(elapsedMs=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0012
     * @tc.name      PageLoading_IsLoadingAt_0012
     * @tc.desc      isLoadingAt(elapsedMs=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0012 begin`);
      const actual: boolean = isLoadingAt(2);
      logInfo(`isLoadingAt(elapsedMs=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0013
     * @tc.name      PageLoading_IsLoadingAt_0013
     * @tc.desc      isLoadingAt(elapsedMs=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0013 begin`);
      const actual: boolean = isLoadingAt(3);
      logInfo(`isLoadingAt(elapsedMs=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0014
     * @tc.name      PageLoading_IsLoadingAt_0014
     * @tc.desc      isLoadingAt(elapsedMs=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0014 begin`);
      const actual: boolean = isLoadingAt(10);
      logInfo(`isLoadingAt(elapsedMs=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0015
     * @tc.name      PageLoading_IsLoadingAt_0015
     * @tc.desc      isLoadingAt(elapsedMs=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0015 begin`);
      const actual: boolean = isLoadingAt(100);
      logInfo(`isLoadingAt(elapsedMs=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsLoadingAt_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0016
     * @tc.name      PageLoading_IsLoadingAt_0016
     * @tc.desc      isLoadingAt(elapsedMs=180000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0016 begin`);
      const actual: boolean = isLoadingAt(180000);
      logInfo(`isLoadingAt(elapsedMs=180000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0017
     * @tc.name      PageLoading_IsLoadingAt_0017
     * @tc.desc      isLoadingAt(elapsedMs=360000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0017 begin`);
      const actual: boolean = isLoadingAt(360000);
      logInfo(`isLoadingAt(elapsedMs=360000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0018
     * @tc.name      PageLoading_IsLoadingAt_0018
     * @tc.desc      isLoadingAt(elapsedMs=540000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0018 begin`);
      const actual: boolean = isLoadingAt(540000);
      logInfo(`isLoadingAt(elapsedMs=540000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0019
     * @tc.name      PageLoading_IsLoadingAt_0019
     * @tc.desc      isLoadingAt(elapsedMs=720000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0019 begin`);
      const actual: boolean = isLoadingAt(720000);
      logInfo(`isLoadingAt(elapsedMs=720000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0020
     * @tc.name      PageLoading_IsLoadingAt_0020
     * @tc.desc      isLoadingAt(elapsedMs=900000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0020 begin`);
      const actual: boolean = isLoadingAt(900000);
      logInfo(`isLoadingAt(elapsedMs=900000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0021
     * @tc.name      PageLoading_IsLoadingAt_0021
     * @tc.desc      isLoadingAt(elapsedMs=1080000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0021 begin`);
      const actual: boolean = isLoadingAt(1080000);
      logInfo(`isLoadingAt(elapsedMs=1080000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0022
     * @tc.name      PageLoading_IsLoadingAt_0022
     * @tc.desc      isLoadingAt(elapsedMs=1260000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0022 begin`);
      const actual: boolean = isLoadingAt(1260000);
      logInfo(`isLoadingAt(elapsedMs=1260000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0023
     * @tc.name      PageLoading_IsLoadingAt_0023
     * @tc.desc      isLoadingAt(elapsedMs=1440000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0023 begin`);
      const actual: boolean = isLoadingAt(1440000);
      logInfo(`isLoadingAt(elapsedMs=1440000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0024
     * @tc.name      PageLoading_IsLoadingAt_0024
     * @tc.desc      isLoadingAt(elapsedMs=1620000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0024 begin`);
      const actual: boolean = isLoadingAt(1620000);
      logInfo(`isLoadingAt(elapsedMs=1620000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0025
     * @tc.name      PageLoading_IsLoadingAt_0025
     * @tc.desc      isLoadingAt(elapsedMs=1800000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0025 begin`);
      const actual: boolean = isLoadingAt(1800000);
      logInfo(`isLoadingAt(elapsedMs=1800000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0026
     * @tc.name      PageLoading_IsLoadingAt_0026
     * @tc.desc      isLoadingAt(elapsedMs=1980000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0026 begin`);
      const actual: boolean = isLoadingAt(1980000);
      logInfo(`isLoadingAt(elapsedMs=1980000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0027
     * @tc.name      PageLoading_IsLoadingAt_0027
     * @tc.desc      isLoadingAt(elapsedMs=2160000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0027 begin`);
      const actual: boolean = isLoadingAt(2160000);
      logInfo(`isLoadingAt(elapsedMs=2160000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0028
     * @tc.name      PageLoading_IsLoadingAt_0028
     * @tc.desc      isLoadingAt(elapsedMs=2340000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0028 begin`);
      const actual: boolean = isLoadingAt(2340000);
      logInfo(`isLoadingAt(elapsedMs=2340000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0029
     * @tc.name      PageLoading_IsLoadingAt_0029
     * @tc.desc      isLoadingAt(elapsedMs=2520000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0029 begin`);
      const actual: boolean = isLoadingAt(2520000);
      logInfo(`isLoadingAt(elapsedMs=2520000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0030
     * @tc.name      PageLoading_IsLoadingAt_0030
     * @tc.desc      isLoadingAt(elapsedMs=2700000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0030 begin`);
      const actual: boolean = isLoadingAt(2700000);
      logInfo(`isLoadingAt(elapsedMs=2700000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0031
     * @tc.name      PageLoading_IsLoadingAt_0031
     * @tc.desc      isLoadingAt(elapsedMs=2880000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0031 begin`);
      const actual: boolean = isLoadingAt(2880000);
      logInfo(`isLoadingAt(elapsedMs=2880000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0032
     * @tc.name      PageLoading_IsLoadingAt_0032
     * @tc.desc      isLoadingAt(elapsedMs=3060000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0032 begin`);
      const actual: boolean = isLoadingAt(3060000);
      logInfo(`isLoadingAt(elapsedMs=3060000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0033
     * @tc.name      PageLoading_IsLoadingAt_0033
     * @tc.desc      isLoadingAt(elapsedMs=3240000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0033 begin`);
      const actual: boolean = isLoadingAt(3240000);
      logInfo(`isLoadingAt(elapsedMs=3240000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0034
     * @tc.name      PageLoading_IsLoadingAt_0034
     * @tc.desc      isLoadingAt(elapsedMs=3420000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0034 begin`);
      const actual: boolean = isLoadingAt(3420000);
      logInfo(`isLoadingAt(elapsedMs=3420000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0035
     * @tc.name      PageLoading_IsLoadingAt_0035
     * @tc.desc      isLoadingAt(elapsedMs=3780000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0035 begin`);
      const actual: boolean = isLoadingAt(3780000);
      logInfo(`isLoadingAt(elapsedMs=3780000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0036
     * @tc.name      PageLoading_IsLoadingAt_0036
     * @tc.desc      isLoadingAt(elapsedMs=3960000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0036 begin`);
      const actual: boolean = isLoadingAt(3960000);
      logInfo(`isLoadingAt(elapsedMs=3960000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0037
     * @tc.name      PageLoading_IsLoadingAt_0037
     * @tc.desc      isLoadingAt(elapsedMs=4140000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0037 begin`);
      const actual: boolean = isLoadingAt(4140000);
      logInfo(`isLoadingAt(elapsedMs=4140000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0038
     * @tc.name      PageLoading_IsLoadingAt_0038
     * @tc.desc      isLoadingAt(elapsedMs=4320000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0038 begin`);
      const actual: boolean = isLoadingAt(4320000);
      logInfo(`isLoadingAt(elapsedMs=4320000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0039
     * @tc.name      PageLoading_IsLoadingAt_0039
     * @tc.desc      isLoadingAt(elapsedMs=4500000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0039 begin`);
      const actual: boolean = isLoadingAt(4500000);
      logInfo(`isLoadingAt(elapsedMs=4500000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0040
     * @tc.name      PageLoading_IsLoadingAt_0040
     * @tc.desc      isLoadingAt(elapsedMs=4680000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0040 begin`);
      const actual: boolean = isLoadingAt(4680000);
      logInfo(`isLoadingAt(elapsedMs=4680000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0041
     * @tc.name      PageLoading_IsLoadingAt_0041
     * @tc.desc      isLoadingAt(elapsedMs=4860000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0041 begin`);
      const actual: boolean = isLoadingAt(4860000);
      logInfo(`isLoadingAt(elapsedMs=4860000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0042
     * @tc.name      PageLoading_IsLoadingAt_0042
     * @tc.desc      isLoadingAt(elapsedMs=5040000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0042 begin`);
      const actual: boolean = isLoadingAt(5040000);
      logInfo(`isLoadingAt(elapsedMs=5040000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0043
     * @tc.name      PageLoading_IsLoadingAt_0043
     * @tc.desc      isLoadingAt(elapsedMs=5220000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0043 begin`);
      const actual: boolean = isLoadingAt(5220000);
      logInfo(`isLoadingAt(elapsedMs=5220000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0044
     * @tc.name      PageLoading_IsLoadingAt_0044
     * @tc.desc      isLoadingAt(elapsedMs=5400000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0044 begin`);
      const actual: boolean = isLoadingAt(5400000);
      logInfo(`isLoadingAt(elapsedMs=5400000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0045
     * @tc.name      PageLoading_IsLoadingAt_0045
     * @tc.desc      isLoadingAt(elapsedMs=5580000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0045 begin`);
      const actual: boolean = isLoadingAt(5580000);
      logInfo(`isLoadingAt(elapsedMs=5580000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0046
     * @tc.name      PageLoading_IsLoadingAt_0046
     * @tc.desc      isLoadingAt(elapsedMs=5760000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0046 begin`);
      const actual: boolean = isLoadingAt(5760000);
      logInfo(`isLoadingAt(elapsedMs=5760000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0047
     * @tc.name      PageLoading_IsLoadingAt_0047
     * @tc.desc      isLoadingAt(elapsedMs=5940000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0047 begin`);
      const actual: boolean = isLoadingAt(5940000);
      logInfo(`isLoadingAt(elapsedMs=5940000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0048
     * @tc.name      PageLoading_IsLoadingAt_0048
     * @tc.desc      isLoadingAt(elapsedMs=6120000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0048 begin`);
      const actual: boolean = isLoadingAt(6120000);
      logInfo(`isLoadingAt(elapsedMs=6120000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0049
     * @tc.name      PageLoading_IsLoadingAt_0049
     * @tc.desc      isLoadingAt(elapsedMs=6300000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0049 begin`);
      const actual: boolean = isLoadingAt(6300000);
      logInfo(`isLoadingAt(elapsedMs=6300000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_IS_LOADING_AT_0050
     * @tc.name      PageLoading_IsLoadingAt_0050
     * @tc.desc      isLoadingAt(elapsedMs=6480000) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_IsLoadingAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsLoadingAt_0050 begin`);
      const actual: boolean = isLoadingAt(6480000);
      logInfo(`isLoadingAt(elapsedMs=6480000): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsLoadingAt_0050 end`);
    });
  });
}
