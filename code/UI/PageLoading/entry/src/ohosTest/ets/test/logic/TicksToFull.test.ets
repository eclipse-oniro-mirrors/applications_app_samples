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
import { ticksToFull } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ticksToFull (75 cases). */
export default function ticksToFullTest(): void {
  describe('TicksToFullTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0001
     * @tc.name      PageLoading_TicksToFull_0001
     * @tc.desc      ticksToFull(progress=0) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_TicksToFull_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TicksToFull_0001 begin`);
      const actual: number = ticksToFull(0);
      logInfo(`ticksToFull(progress=0): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TicksToFull_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0002
     * @tc.name      PageLoading_TicksToFull_0002
     * @tc.desc      ticksToFull(progress=500) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_TicksToFull_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TicksToFull_0002 begin`);
      const actual: number = ticksToFull(500);
      logInfo(`ticksToFull(progress=500): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0003
     * @tc.name      PageLoading_TicksToFull_0003
     * @tc.desc      ticksToFull(progress=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0003 begin`);
      const actual: number = ticksToFull(10);
      logInfo(`ticksToFull(progress=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TicksToFull_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0004
     * @tc.name      PageLoading_TicksToFull_0004
     * @tc.desc      ticksToFull(progress=999) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0004 begin`);
      const actual: number = ticksToFull(999);
      logInfo(`ticksToFull(progress=999): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0005
     * @tc.name      PageLoading_TicksToFull_0005
     * @tc.desc      ticksToFull(progress=1000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0005 begin`);
      const actual: number = ticksToFull(1000);
      logInfo(`ticksToFull(progress=1000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0006
     * @tc.name      PageLoading_TicksToFull_0006
     * @tc.desc      ticksToFull(progress=59999) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0006 begin`);
      const actual: number = ticksToFull(59999);
      logInfo(`ticksToFull(progress=59999): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0007
     * @tc.name      PageLoading_TicksToFull_0007
     * @tc.desc      ticksToFull(progress=60000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0007 begin`);
      const actual: number = ticksToFull(60000);
      logInfo(`ticksToFull(progress=60000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0008
     * @tc.name      PageLoading_TicksToFull_0008
     * @tc.desc      ticksToFull(progress=61000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0008 begin`);
      const actual: number = ticksToFull(61000);
      logInfo(`ticksToFull(progress=61000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0009
     * @tc.name      PageLoading_TicksToFull_0009
     * @tc.desc      ticksToFull(progress=3599000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0009 begin`);
      const actual: number = ticksToFull(3599000);
      logInfo(`ticksToFull(progress=3599000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0010
     * @tc.name      PageLoading_TicksToFull_0010
     * @tc.desc      ticksToFull(progress=3600000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0010 begin`);
      const actual: number = ticksToFull(3600000);
      logInfo(`ticksToFull(progress=3600000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0011
     * @tc.name      PageLoading_TicksToFull_0011
     * @tc.desc      ticksToFull(progress=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0011 begin`);
      const actual: number = ticksToFull(1);
      logInfo(`ticksToFull(progress=1): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TicksToFull_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0012
     * @tc.name      PageLoading_TicksToFull_0012
     * @tc.desc      ticksToFull(progress=-1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_TicksToFull_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TicksToFull_0012 begin`);
      const actual: number = ticksToFull(-1);
      logInfo(`ticksToFull(progress=-1): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TicksToFull_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0013
     * @tc.name      PageLoading_TicksToFull_0013
     * @tc.desc      ticksToFull(progress=2) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0013 begin`);
      const actual: number = ticksToFull(2);
      logInfo(`ticksToFull(progress=2): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TicksToFull_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0014
     * @tc.name      PageLoading_TicksToFull_0014
     * @tc.desc      ticksToFull(progress=3) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0014 begin`);
      const actual: number = ticksToFull(3);
      logInfo(`ticksToFull(progress=3): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TicksToFull_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0015
     * @tc.name      PageLoading_TicksToFull_0015
     * @tc.desc      ticksToFull(progress=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0015 begin`);
      const actual: number = ticksToFull(100);
      logInfo(`ticksToFull(progress=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0016
     * @tc.name      PageLoading_TicksToFull_0016
     * @tc.desc      ticksToFull(progress=180000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0016 begin`);
      const actual: number = ticksToFull(180000);
      logInfo(`ticksToFull(progress=180000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0017
     * @tc.name      PageLoading_TicksToFull_0017
     * @tc.desc      ticksToFull(progress=360000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0017 begin`);
      const actual: number = ticksToFull(360000);
      logInfo(`ticksToFull(progress=360000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0018
     * @tc.name      PageLoading_TicksToFull_0018
     * @tc.desc      ticksToFull(progress=540000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0018 begin`);
      const actual: number = ticksToFull(540000);
      logInfo(`ticksToFull(progress=540000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0019
     * @tc.name      PageLoading_TicksToFull_0019
     * @tc.desc      ticksToFull(progress=720000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0019 begin`);
      const actual: number = ticksToFull(720000);
      logInfo(`ticksToFull(progress=720000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0020
     * @tc.name      PageLoading_TicksToFull_0020
     * @tc.desc      ticksToFull(progress=900000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0020 begin`);
      const actual: number = ticksToFull(900000);
      logInfo(`ticksToFull(progress=900000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0021
     * @tc.name      PageLoading_TicksToFull_0021
     * @tc.desc      ticksToFull(progress=1080000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0021 begin`);
      const actual: number = ticksToFull(1080000);
      logInfo(`ticksToFull(progress=1080000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0022
     * @tc.name      PageLoading_TicksToFull_0022
     * @tc.desc      ticksToFull(progress=1260000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0022 begin`);
      const actual: number = ticksToFull(1260000);
      logInfo(`ticksToFull(progress=1260000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0023
     * @tc.name      PageLoading_TicksToFull_0023
     * @tc.desc      ticksToFull(progress=1440000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0023 begin`);
      const actual: number = ticksToFull(1440000);
      logInfo(`ticksToFull(progress=1440000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0024
     * @tc.name      PageLoading_TicksToFull_0024
     * @tc.desc      ticksToFull(progress=1620000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0024 begin`);
      const actual: number = ticksToFull(1620000);
      logInfo(`ticksToFull(progress=1620000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0025
     * @tc.name      PageLoading_TicksToFull_0025
     * @tc.desc      ticksToFull(progress=1800000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0025 begin`);
      const actual: number = ticksToFull(1800000);
      logInfo(`ticksToFull(progress=1800000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0026
     * @tc.name      PageLoading_TicksToFull_0026
     * @tc.desc      ticksToFull(progress=1980000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0026 begin`);
      const actual: number = ticksToFull(1980000);
      logInfo(`ticksToFull(progress=1980000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0027
     * @tc.name      PageLoading_TicksToFull_0027
     * @tc.desc      ticksToFull(progress=2160000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0027 begin`);
      const actual: number = ticksToFull(2160000);
      logInfo(`ticksToFull(progress=2160000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0028
     * @tc.name      PageLoading_TicksToFull_0028
     * @tc.desc      ticksToFull(progress=2340000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0028 begin`);
      const actual: number = ticksToFull(2340000);
      logInfo(`ticksToFull(progress=2340000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0029
     * @tc.name      PageLoading_TicksToFull_0029
     * @tc.desc      ticksToFull(progress=2520000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0029 begin`);
      const actual: number = ticksToFull(2520000);
      logInfo(`ticksToFull(progress=2520000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0030
     * @tc.name      PageLoading_TicksToFull_0030
     * @tc.desc      ticksToFull(progress=2700000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0030 begin`);
      const actual: number = ticksToFull(2700000);
      logInfo(`ticksToFull(progress=2700000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0031
     * @tc.name      PageLoading_TicksToFull_0031
     * @tc.desc      ticksToFull(progress=2880000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0031 begin`);
      const actual: number = ticksToFull(2880000);
      logInfo(`ticksToFull(progress=2880000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0032
     * @tc.name      PageLoading_TicksToFull_0032
     * @tc.desc      ticksToFull(progress=3060000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0032 begin`);
      const actual: number = ticksToFull(3060000);
      logInfo(`ticksToFull(progress=3060000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0033
     * @tc.name      PageLoading_TicksToFull_0033
     * @tc.desc      ticksToFull(progress=3240000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0033 begin`);
      const actual: number = ticksToFull(3240000);
      logInfo(`ticksToFull(progress=3240000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0034
     * @tc.name      PageLoading_TicksToFull_0034
     * @tc.desc      ticksToFull(progress=3420000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0034 begin`);
      const actual: number = ticksToFull(3420000);
      logInfo(`ticksToFull(progress=3420000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0035
     * @tc.name      PageLoading_TicksToFull_0035
     * @tc.desc      ticksToFull(progress=3780000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0035 begin`);
      const actual: number = ticksToFull(3780000);
      logInfo(`ticksToFull(progress=3780000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0036
     * @tc.name      PageLoading_TicksToFull_0036
     * @tc.desc      ticksToFull(progress=3960000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0036 begin`);
      const actual: number = ticksToFull(3960000);
      logInfo(`ticksToFull(progress=3960000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0037
     * @tc.name      PageLoading_TicksToFull_0037
     * @tc.desc      ticksToFull(progress=4140000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0037 begin`);
      const actual: number = ticksToFull(4140000);
      logInfo(`ticksToFull(progress=4140000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0038
     * @tc.name      PageLoading_TicksToFull_0038
     * @tc.desc      ticksToFull(progress=4320000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0038 begin`);
      const actual: number = ticksToFull(4320000);
      logInfo(`ticksToFull(progress=4320000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0039
     * @tc.name      PageLoading_TicksToFull_0039
     * @tc.desc      ticksToFull(progress=4500000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0039 begin`);
      const actual: number = ticksToFull(4500000);
      logInfo(`ticksToFull(progress=4500000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0040
     * @tc.name      PageLoading_TicksToFull_0040
     * @tc.desc      ticksToFull(progress=4680000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0040 begin`);
      const actual: number = ticksToFull(4680000);
      logInfo(`ticksToFull(progress=4680000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0041
     * @tc.name      PageLoading_TicksToFull_0041
     * @tc.desc      ticksToFull(progress=4860000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0041 begin`);
      const actual: number = ticksToFull(4860000);
      logInfo(`ticksToFull(progress=4860000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0042
     * @tc.name      PageLoading_TicksToFull_0042
     * @tc.desc      ticksToFull(progress=5040000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0042 begin`);
      const actual: number = ticksToFull(5040000);
      logInfo(`ticksToFull(progress=5040000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0043
     * @tc.name      PageLoading_TicksToFull_0043
     * @tc.desc      ticksToFull(progress=5220000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0043 begin`);
      const actual: number = ticksToFull(5220000);
      logInfo(`ticksToFull(progress=5220000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0044
     * @tc.name      PageLoading_TicksToFull_0044
     * @tc.desc      ticksToFull(progress=5400000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0044 begin`);
      const actual: number = ticksToFull(5400000);
      logInfo(`ticksToFull(progress=5400000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0045
     * @tc.name      PageLoading_TicksToFull_0045
     * @tc.desc      ticksToFull(progress=5580000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0045 begin`);
      const actual: number = ticksToFull(5580000);
      logInfo(`ticksToFull(progress=5580000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0046
     * @tc.name      PageLoading_TicksToFull_0046
     * @tc.desc      ticksToFull(progress=5760000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0046 begin`);
      const actual: number = ticksToFull(5760000);
      logInfo(`ticksToFull(progress=5760000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0047
     * @tc.name      PageLoading_TicksToFull_0047
     * @tc.desc      ticksToFull(progress=5940000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0047 begin`);
      const actual: number = ticksToFull(5940000);
      logInfo(`ticksToFull(progress=5940000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0048
     * @tc.name      PageLoading_TicksToFull_0048
     * @tc.desc      ticksToFull(progress=6120000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0048 begin`);
      const actual: number = ticksToFull(6120000);
      logInfo(`ticksToFull(progress=6120000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0049
     * @tc.name      PageLoading_TicksToFull_0049
     * @tc.desc      ticksToFull(progress=6300000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0049 begin`);
      const actual: number = ticksToFull(6300000);
      logInfo(`ticksToFull(progress=6300000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0050
     * @tc.name      PageLoading_TicksToFull_0050
     * @tc.desc      ticksToFull(progress=6480000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0050 begin`);
      const actual: number = ticksToFull(6480000);
      logInfo(`ticksToFull(progress=6480000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0051
     * @tc.name      PageLoading_TicksToFull_0051
     * @tc.desc      ticksToFull(progress=6660000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0051 begin`);
      const actual: number = ticksToFull(6660000);
      logInfo(`ticksToFull(progress=6660000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0052
     * @tc.name      PageLoading_TicksToFull_0052
     * @tc.desc      ticksToFull(progress=6840000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0052 begin`);
      const actual: number = ticksToFull(6840000);
      logInfo(`ticksToFull(progress=6840000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0053
     * @tc.name      PageLoading_TicksToFull_0053
     * @tc.desc      ticksToFull(progress=7020000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0053 begin`);
      const actual: number = ticksToFull(7020000);
      logInfo(`ticksToFull(progress=7020000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0054
     * @tc.name      PageLoading_TicksToFull_0054
     * @tc.desc      ticksToFull(progress=7200000) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0054 begin`);
      const actual: number = ticksToFull(7200000);
      logInfo(`ticksToFull(progress=7200000): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0055
     * @tc.name      PageLoading_TicksToFull_0055
     * @tc.desc      ticksToFull(progress=5039655) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0055 begin`);
      const actual: number = ticksToFull(5039655);
      logInfo(`ticksToFull(progress=5039655): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0056
     * @tc.name      PageLoading_TicksToFull_0056
     * @tc.desc      ticksToFull(progress=4201728) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0056 begin`);
      const actual: number = ticksToFull(4201728);
      logInfo(`ticksToFull(progress=4201728): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0057
     * @tc.name      PageLoading_TicksToFull_0057
     * @tc.desc      ticksToFull(progress=3133272.19) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0057 begin`);
      const actual: number = ticksToFull(3133272.19);
      logInfo(`ticksToFull(progress=3133272.19): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0058
     * @tc.name      PageLoading_TicksToFull_0058
     * @tc.desc      ticksToFull(progress=1686519) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0058 begin`);
      const actual: number = ticksToFull(1686519);
      logInfo(`ticksToFull(progress=1686519): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0059
     * @tc.name      PageLoading_TicksToFull_0059
     * @tc.desc      ticksToFull(progress=2201095.73) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0059 begin`);
      const actual: number = ticksToFull(2201095.73);
      logInfo(`ticksToFull(progress=2201095.73): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0060
     * @tc.name      PageLoading_TicksToFull_0060
     * @tc.desc      ticksToFull(progress=5695278) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0060 begin`);
      const actual: number = ticksToFull(5695278);
      logInfo(`ticksToFull(progress=5695278): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0061
     * @tc.name      PageLoading_TicksToFull_0061
     * @tc.desc      ticksToFull(progress=192526.8) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0061 begin`);
      const actual: number = ticksToFull(192526.8);
      logInfo(`ticksToFull(progress=192526.8): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0062
     * @tc.name      PageLoading_TicksToFull_0062
     * @tc.desc      ticksToFull(progress=5397543) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0062 begin`);
      const actual: number = ticksToFull(5397543);
      logInfo(`ticksToFull(progress=5397543): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0063
     * @tc.name      PageLoading_TicksToFull_0063
     * @tc.desc      ticksToFull(progress=6072271) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0063 begin`);
      const actual: number = ticksToFull(6072271);
      logInfo(`ticksToFull(progress=6072271): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0064
     * @tc.name      PageLoading_TicksToFull_0064
     * @tc.desc      ticksToFull(progress=2604716) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0064 begin`);
      const actual: number = ticksToFull(2604716);
      logInfo(`ticksToFull(progress=2604716): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0065
     * @tc.name      PageLoading_TicksToFull_0065
     * @tc.desc      ticksToFull(progress=631396.25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0065 begin`);
      const actual: number = ticksToFull(631396.25);
      logInfo(`ticksToFull(progress=631396.25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0066
     * @tc.name      PageLoading_TicksToFull_0066
     * @tc.desc      ticksToFull(progress=4746919) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0066 begin`);
      const actual: number = ticksToFull(4746919);
      logInfo(`ticksToFull(progress=4746919): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0067
     * @tc.name      PageLoading_TicksToFull_0067
     * @tc.desc      ticksToFull(progress=1248839.66) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0067 begin`);
      const actual: number = ticksToFull(1248839.66);
      logInfo(`ticksToFull(progress=1248839.66): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0068
     * @tc.name      PageLoading_TicksToFull_0068
     * @tc.desc      ticksToFull(progress=5929108) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0068 begin`);
      const actual: number = ticksToFull(5929108);
      logInfo(`ticksToFull(progress=5929108): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0069
     * @tc.name      PageLoading_TicksToFull_0069
     * @tc.desc      ticksToFull(progress=2137779.26) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0069 begin`);
      const actual: number = ticksToFull(2137779.26);
      logInfo(`ticksToFull(progress=2137779.26): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0070
     * @tc.name      PageLoading_TicksToFull_0070
     * @tc.desc      ticksToFull(progress=2684291) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0070 begin`);
      const actual: number = ticksToFull(2684291);
      logInfo(`ticksToFull(progress=2684291): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0071
     * @tc.name      PageLoading_TicksToFull_0071
     * @tc.desc      ticksToFull(progress=2671202.92) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0071 begin`);
      const actual: number = ticksToFull(2671202.92);
      logInfo(`ticksToFull(progress=2671202.92): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0072
     * @tc.name      PageLoading_TicksToFull_0072
     * @tc.desc      ticksToFull(progress=5424196) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0072 begin`);
      const actual: number = ticksToFull(5424196);
      logInfo(`ticksToFull(progress=5424196): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0073
     * @tc.name      PageLoading_TicksToFull_0073
     * @tc.desc      ticksToFull(progress=192260) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0073 begin`);
      const actual: number = ticksToFull(192260);
      logInfo(`ticksToFull(progress=192260): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0074
     * @tc.name      PageLoading_TicksToFull_0074
     * @tc.desc      ticksToFull(progress=178181.35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0074 begin`);
      const actual: number = ticksToFull(178181.35);
      logInfo(`ticksToFull(progress=178181.35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_TICKS_TO_FULL_0075
     * @tc.name      PageLoading_TicksToFull_0075
     * @tc.desc      ticksToFull(progress=504922) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_TicksToFull_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TicksToFull_0075 begin`);
      const actual: number = ticksToFull(504922);
      logInfo(`ticksToFull(progress=504922): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TicksToFull_0075 end`);
    });
  });
}
