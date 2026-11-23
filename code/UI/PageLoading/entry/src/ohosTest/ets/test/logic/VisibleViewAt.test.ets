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
import { visibleViewAt } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for visibleViewAt (50 cases). */
export default function visibleViewAtTest(): void {
  describe('VisibleViewAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0001
     * @tc.name      PageLoading_VisibleViewAt_0001
     * @tc.desc      visibleViewAt(elapsedMs=0) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_VisibleViewAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0001 begin`);
      const actual: string = visibleViewAt(0);
      logInfo(`visibleViewAt(elapsedMs=0): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0002
     * @tc.name      PageLoading_VisibleViewAt_0002
     * @tc.desc      visibleViewAt(elapsedMs=59999) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_VisibleViewAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0002 begin`);
      const actual: string = visibleViewAt(59999);
      logInfo(`visibleViewAt(elapsedMs=59999): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0003
     * @tc.name      PageLoading_VisibleViewAt_0003
     * @tc.desc      visibleViewAt(elapsedMs=500) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0003 begin`);
      const actual: string = visibleViewAt(500);
      logInfo(`visibleViewAt(elapsedMs=500): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0004
     * @tc.name      PageLoading_VisibleViewAt_0004
     * @tc.desc      visibleViewAt(elapsedMs=999) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0004 begin`);
      const actual: string = visibleViewAt(999);
      logInfo(`visibleViewAt(elapsedMs=999): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0005
     * @tc.name      PageLoading_VisibleViewAt_0005
     * @tc.desc      visibleViewAt(elapsedMs=1000) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0005 begin`);
      const actual: string = visibleViewAt(1000);
      logInfo(`visibleViewAt(elapsedMs=1000): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0006
     * @tc.name      PageLoading_VisibleViewAt_0006
     * @tc.desc      visibleViewAt(elapsedMs=60000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0006 begin`);
      const actual: string = visibleViewAt(60000);
      logInfo(`visibleViewAt(elapsedMs=60000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0007
     * @tc.name      PageLoading_VisibleViewAt_0007
     * @tc.desc      visibleViewAt(elapsedMs=61000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0007 begin`);
      const actual: string = visibleViewAt(61000);
      logInfo(`visibleViewAt(elapsedMs=61000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0008
     * @tc.name      PageLoading_VisibleViewAt_0008
     * @tc.desc      visibleViewAt(elapsedMs=3599000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0008 begin`);
      const actual: string = visibleViewAt(3599000);
      logInfo(`visibleViewAt(elapsedMs=3599000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0009
     * @tc.name      PageLoading_VisibleViewAt_0009
     * @tc.desc      visibleViewAt(elapsedMs=3600000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0009 begin`);
      const actual: string = visibleViewAt(3600000);
      logInfo(`visibleViewAt(elapsedMs=3600000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0010
     * @tc.name      PageLoading_VisibleViewAt_0010
     * @tc.desc      visibleViewAt(elapsedMs=1) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0010 begin`);
      const actual: string = visibleViewAt(1);
      logInfo(`visibleViewAt(elapsedMs=1): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0011
     * @tc.name      PageLoading_VisibleViewAt_0011
     * @tc.desc      visibleViewAt(elapsedMs=-1) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_VisibleViewAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0011 begin`);
      const actual: string = visibleViewAt(-1);
      logInfo(`visibleViewAt(elapsedMs=-1): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0012
     * @tc.name      PageLoading_VisibleViewAt_0012
     * @tc.desc      visibleViewAt(elapsedMs=2) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0012 begin`);
      const actual: string = visibleViewAt(2);
      logInfo(`visibleViewAt(elapsedMs=2): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0013
     * @tc.name      PageLoading_VisibleViewAt_0013
     * @tc.desc      visibleViewAt(elapsedMs=3) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0013 begin`);
      const actual: string = visibleViewAt(3);
      logInfo(`visibleViewAt(elapsedMs=3): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0014
     * @tc.name      PageLoading_VisibleViewAt_0014
     * @tc.desc      visibleViewAt(elapsedMs=10) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0014 begin`);
      const actual: string = visibleViewAt(10);
      logInfo(`visibleViewAt(elapsedMs=10): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0015
     * @tc.name      PageLoading_VisibleViewAt_0015
     * @tc.desc      visibleViewAt(elapsedMs=100) returns "LoadingHUD"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0015 begin`);
      const actual: string = visibleViewAt(100);
      logInfo(`visibleViewAt(elapsedMs=100): actual=${actual}`);
      expect(actual).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}VisibleViewAt_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0016
     * @tc.name      PageLoading_VisibleViewAt_0016
     * @tc.desc      visibleViewAt(elapsedMs=180000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0016 begin`);
      const actual: string = visibleViewAt(180000);
      logInfo(`visibleViewAt(elapsedMs=180000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0017
     * @tc.name      PageLoading_VisibleViewAt_0017
     * @tc.desc      visibleViewAt(elapsedMs=360000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0017 begin`);
      const actual: string = visibleViewAt(360000);
      logInfo(`visibleViewAt(elapsedMs=360000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0018
     * @tc.name      PageLoading_VisibleViewAt_0018
     * @tc.desc      visibleViewAt(elapsedMs=540000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0018 begin`);
      const actual: string = visibleViewAt(540000);
      logInfo(`visibleViewAt(elapsedMs=540000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0019
     * @tc.name      PageLoading_VisibleViewAt_0019
     * @tc.desc      visibleViewAt(elapsedMs=720000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0019 begin`);
      const actual: string = visibleViewAt(720000);
      logInfo(`visibleViewAt(elapsedMs=720000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0020
     * @tc.name      PageLoading_VisibleViewAt_0020
     * @tc.desc      visibleViewAt(elapsedMs=900000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0020 begin`);
      const actual: string = visibleViewAt(900000);
      logInfo(`visibleViewAt(elapsedMs=900000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0021
     * @tc.name      PageLoading_VisibleViewAt_0021
     * @tc.desc      visibleViewAt(elapsedMs=1080000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0021 begin`);
      const actual: string = visibleViewAt(1080000);
      logInfo(`visibleViewAt(elapsedMs=1080000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0022
     * @tc.name      PageLoading_VisibleViewAt_0022
     * @tc.desc      visibleViewAt(elapsedMs=1260000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0022 begin`);
      const actual: string = visibleViewAt(1260000);
      logInfo(`visibleViewAt(elapsedMs=1260000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0023
     * @tc.name      PageLoading_VisibleViewAt_0023
     * @tc.desc      visibleViewAt(elapsedMs=1440000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0023 begin`);
      const actual: string = visibleViewAt(1440000);
      logInfo(`visibleViewAt(elapsedMs=1440000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0024
     * @tc.name      PageLoading_VisibleViewAt_0024
     * @tc.desc      visibleViewAt(elapsedMs=1620000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0024 begin`);
      const actual: string = visibleViewAt(1620000);
      logInfo(`visibleViewAt(elapsedMs=1620000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0025
     * @tc.name      PageLoading_VisibleViewAt_0025
     * @tc.desc      visibleViewAt(elapsedMs=1800000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0025 begin`);
      const actual: string = visibleViewAt(1800000);
      logInfo(`visibleViewAt(elapsedMs=1800000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0026
     * @tc.name      PageLoading_VisibleViewAt_0026
     * @tc.desc      visibleViewAt(elapsedMs=1980000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0026 begin`);
      const actual: string = visibleViewAt(1980000);
      logInfo(`visibleViewAt(elapsedMs=1980000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0027
     * @tc.name      PageLoading_VisibleViewAt_0027
     * @tc.desc      visibleViewAt(elapsedMs=2160000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0027 begin`);
      const actual: string = visibleViewAt(2160000);
      logInfo(`visibleViewAt(elapsedMs=2160000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0028
     * @tc.name      PageLoading_VisibleViewAt_0028
     * @tc.desc      visibleViewAt(elapsedMs=2340000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0028 begin`);
      const actual: string = visibleViewAt(2340000);
      logInfo(`visibleViewAt(elapsedMs=2340000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0029
     * @tc.name      PageLoading_VisibleViewAt_0029
     * @tc.desc      visibleViewAt(elapsedMs=2520000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0029 begin`);
      const actual: string = visibleViewAt(2520000);
      logInfo(`visibleViewAt(elapsedMs=2520000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0030
     * @tc.name      PageLoading_VisibleViewAt_0030
     * @tc.desc      visibleViewAt(elapsedMs=2700000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0030 begin`);
      const actual: string = visibleViewAt(2700000);
      logInfo(`visibleViewAt(elapsedMs=2700000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0031
     * @tc.name      PageLoading_VisibleViewAt_0031
     * @tc.desc      visibleViewAt(elapsedMs=2880000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0031 begin`);
      const actual: string = visibleViewAt(2880000);
      logInfo(`visibleViewAt(elapsedMs=2880000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0032
     * @tc.name      PageLoading_VisibleViewAt_0032
     * @tc.desc      visibleViewAt(elapsedMs=3060000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0032 begin`);
      const actual: string = visibleViewAt(3060000);
      logInfo(`visibleViewAt(elapsedMs=3060000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0033
     * @tc.name      PageLoading_VisibleViewAt_0033
     * @tc.desc      visibleViewAt(elapsedMs=3240000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0033 begin`);
      const actual: string = visibleViewAt(3240000);
      logInfo(`visibleViewAt(elapsedMs=3240000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0034
     * @tc.name      PageLoading_VisibleViewAt_0034
     * @tc.desc      visibleViewAt(elapsedMs=3420000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0034 begin`);
      const actual: string = visibleViewAt(3420000);
      logInfo(`visibleViewAt(elapsedMs=3420000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0035
     * @tc.name      PageLoading_VisibleViewAt_0035
     * @tc.desc      visibleViewAt(elapsedMs=3780000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0035 begin`);
      const actual: string = visibleViewAt(3780000);
      logInfo(`visibleViewAt(elapsedMs=3780000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0036
     * @tc.name      PageLoading_VisibleViewAt_0036
     * @tc.desc      visibleViewAt(elapsedMs=3960000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0036 begin`);
      const actual: string = visibleViewAt(3960000);
      logInfo(`visibleViewAt(elapsedMs=3960000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0037
     * @tc.name      PageLoading_VisibleViewAt_0037
     * @tc.desc      visibleViewAt(elapsedMs=4140000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0037 begin`);
      const actual: string = visibleViewAt(4140000);
      logInfo(`visibleViewAt(elapsedMs=4140000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0038
     * @tc.name      PageLoading_VisibleViewAt_0038
     * @tc.desc      visibleViewAt(elapsedMs=4320000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0038 begin`);
      const actual: string = visibleViewAt(4320000);
      logInfo(`visibleViewAt(elapsedMs=4320000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0039
     * @tc.name      PageLoading_VisibleViewAt_0039
     * @tc.desc      visibleViewAt(elapsedMs=4500000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0039 begin`);
      const actual: string = visibleViewAt(4500000);
      logInfo(`visibleViewAt(elapsedMs=4500000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0040
     * @tc.name      PageLoading_VisibleViewAt_0040
     * @tc.desc      visibleViewAt(elapsedMs=4680000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0040 begin`);
      const actual: string = visibleViewAt(4680000);
      logInfo(`visibleViewAt(elapsedMs=4680000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0041
     * @tc.name      PageLoading_VisibleViewAt_0041
     * @tc.desc      visibleViewAt(elapsedMs=4860000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0041 begin`);
      const actual: string = visibleViewAt(4860000);
      logInfo(`visibleViewAt(elapsedMs=4860000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0042
     * @tc.name      PageLoading_VisibleViewAt_0042
     * @tc.desc      visibleViewAt(elapsedMs=5040000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0042 begin`);
      const actual: string = visibleViewAt(5040000);
      logInfo(`visibleViewAt(elapsedMs=5040000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0043
     * @tc.name      PageLoading_VisibleViewAt_0043
     * @tc.desc      visibleViewAt(elapsedMs=5220000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0043 begin`);
      const actual: string = visibleViewAt(5220000);
      logInfo(`visibleViewAt(elapsedMs=5220000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0044
     * @tc.name      PageLoading_VisibleViewAt_0044
     * @tc.desc      visibleViewAt(elapsedMs=5400000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0044 begin`);
      const actual: string = visibleViewAt(5400000);
      logInfo(`visibleViewAt(elapsedMs=5400000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0045
     * @tc.name      PageLoading_VisibleViewAt_0045
     * @tc.desc      visibleViewAt(elapsedMs=5580000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0045 begin`);
      const actual: string = visibleViewAt(5580000);
      logInfo(`visibleViewAt(elapsedMs=5580000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0046
     * @tc.name      PageLoading_VisibleViewAt_0046
     * @tc.desc      visibleViewAt(elapsedMs=5760000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0046 begin`);
      const actual: string = visibleViewAt(5760000);
      logInfo(`visibleViewAt(elapsedMs=5760000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0047
     * @tc.name      PageLoading_VisibleViewAt_0047
     * @tc.desc      visibleViewAt(elapsedMs=5940000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0047 begin`);
      const actual: string = visibleViewAt(5940000);
      logInfo(`visibleViewAt(elapsedMs=5940000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0048
     * @tc.name      PageLoading_VisibleViewAt_0048
     * @tc.desc      visibleViewAt(elapsedMs=6120000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0048 begin`);
      const actual: string = visibleViewAt(6120000);
      logInfo(`visibleViewAt(elapsedMs=6120000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0049
     * @tc.name      PageLoading_VisibleViewAt_0049
     * @tc.desc      visibleViewAt(elapsedMs=6300000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0049 begin`);
      const actual: string = visibleViewAt(6300000);
      logInfo(`visibleViewAt(elapsedMs=6300000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_VISIBLE_VIEW_AT_0050
     * @tc.name      PageLoading_VisibleViewAt_0050
     * @tc.desc      visibleViewAt(elapsedMs=6480000) returns "CommodityList"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_VisibleViewAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}VisibleViewAt_0050 begin`);
      const actual: string = visibleViewAt(6480000);
      logInfo(`visibleViewAt(elapsedMs=6480000): actual=${actual}`);
      expect(actual).assertEqual('CommodityList');
      logInfo(`${BUNDLE}VisibleViewAt_0050 end`);
    });
  });
}
