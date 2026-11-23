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
import { nextNewsPage } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextNewsPage (59 cases). */
export default function nextNewsPageTest(): void {
  describe('NextNewsPageTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0001
     * @tc.name      PullToRefresh_NextNewsPage_0001
     * @tc.desc      nextNewsPage(currentPage=0, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NextNewsPage_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextNewsPage_0001 begin`);
      const actual: number = nextNewsPage(0, true);
      logInfo(`nextNewsPage(currentPage=0, isChangePage=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0002
     * @tc.name      PullToRefresh_NextNewsPage_0002
     * @tc.desc      nextNewsPage(currentPage=0, isChangePage=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_NextNewsPage_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NextNewsPage_0002 begin`);
      const actual: number = nextNewsPage(0, false);
      logInfo(`nextNewsPage(currentPage=0, isChangePage=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextNewsPage_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0003
     * @tc.name      PullToRefresh_NextNewsPage_0003
     * @tc.desc      nextNewsPage(currentPage=500, isChangePage=false) returns 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0003 begin`);
      const actual: number = nextNewsPage(500, false);
      logInfo(`nextNewsPage(currentPage=500, isChangePag...: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}NextNewsPage_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0004
     * @tc.name      PullToRefresh_NextNewsPage_0004
     * @tc.desc      nextNewsPage(currentPage=2, isChangePage=false) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NextNewsPage_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextNewsPage_0004 begin`);
      const actual: number = nextNewsPage(2, false);
      logInfo(`nextNewsPage(currentPage=2, isChangePage=...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextNewsPage_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0005
     * @tc.name      PullToRefresh_NextNewsPage_0005
     * @tc.desc      nextNewsPage(currentPage=3, isChangePage=false) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NextNewsPage_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextNewsPage_0005 begin`);
      const actual: number = nextNewsPage(3, false);
      logInfo(`nextNewsPage(currentPage=3, isChangePage=...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextNewsPage_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0006
     * @tc.name      PullToRefresh_NextNewsPage_0006
     * @tc.desc      nextNewsPage(currentPage=999, isChangePage=false) returns 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0006 begin`);
      const actual: number = nextNewsPage(999, false);
      logInfo(`nextNewsPage(currentPage=999, isChangePag...: actual=${actual}`);
      expect(actual).assertEqual(999);
      logInfo(`${BUNDLE}NextNewsPage_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0007
     * @tc.name      PullToRefresh_NextNewsPage_0007
     * @tc.desc      nextNewsPage(currentPage=1000, isChangePage=false) returns 1000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0007 begin`);
      const actual: number = nextNewsPage(1000, false);
      logInfo(`nextNewsPage(currentPage=1000, isChangePa...: actual=${actual}`);
      expect(actual).assertEqual(1000);
      logInfo(`${BUNDLE}NextNewsPage_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0008
     * @tc.name      PullToRefresh_NextNewsPage_0008
     * @tc.desc      nextNewsPage(currentPage=59999, isChangePage=false) returns 59999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0008 begin`);
      const actual: number = nextNewsPage(59999, false);
      logInfo(`nextNewsPage(currentPage=59999, isChangeP...: actual=${actual}`);
      expect(actual).assertEqual(59999);
      logInfo(`${BUNDLE}NextNewsPage_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0009
     * @tc.name      PullToRefresh_NextNewsPage_0009
     * @tc.desc      nextNewsPage(currentPage=60000, isChangePage=false) returns 60000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0009 begin`);
      const actual: number = nextNewsPage(60000, false);
      logInfo(`nextNewsPage(currentPage=60000, isChangeP...: actual=${actual}`);
      expect(actual).assertEqual(60000);
      logInfo(`${BUNDLE}NextNewsPage_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0010
     * @tc.name      PullToRefresh_NextNewsPage_0010
     * @tc.desc      nextNewsPage(currentPage=61000, isChangePage=false) returns 61000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0010 begin`);
      const actual: number = nextNewsPage(61000, false);
      logInfo(`nextNewsPage(currentPage=61000, isChangeP...: actual=${actual}`);
      expect(actual).assertEqual(61000);
      logInfo(`${BUNDLE}NextNewsPage_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0011
     * @tc.name      PullToRefresh_NextNewsPage_0011
     * @tc.desc      nextNewsPage(currentPage=3599000, isChangePage=false) returns 3599000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0011 begin`);
      const actual: number = nextNewsPage(3599000, false);
      logInfo(`nextNewsPage(currentPage=3599000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(3599000);
      logInfo(`${BUNDLE}NextNewsPage_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0012
     * @tc.name      PullToRefresh_NextNewsPage_0012
     * @tc.desc      nextNewsPage(currentPage=3600000, isChangePage=false) returns 3600000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0012 begin`);
      const actual: number = nextNewsPage(3600000, false);
      logInfo(`nextNewsPage(currentPage=3600000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(3600000);
      logInfo(`${BUNDLE}NextNewsPage_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0013
     * @tc.name      PullToRefresh_NextNewsPage_0013
     * @tc.desc      nextNewsPage(currentPage=-1, isChangePage=false) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NextNewsPage_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextNewsPage_0013 begin`);
      const actual: number = nextNewsPage(-1, false);
      logInfo(`nextNewsPage(currentPage=-1, isChangePage...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextNewsPage_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0014
     * @tc.name      PullToRefresh_NextNewsPage_0014
     * @tc.desc      nextNewsPage(currentPage=10, isChangePage=false) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0014 begin`);
      const actual: number = nextNewsPage(10, false);
      logInfo(`nextNewsPage(currentPage=10, isChangePage...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextNewsPage_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0015
     * @tc.name      PullToRefresh_NextNewsPage_0015
     * @tc.desc      nextNewsPage(currentPage=100, isChangePage=false) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0015 begin`);
      const actual: number = nextNewsPage(100, false);
      logInfo(`nextNewsPage(currentPage=100, isChangePag...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextNewsPage_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0016
     * @tc.name      PullToRefresh_NextNewsPage_0016
     * @tc.desc      nextNewsPage(currentPage=180000, isChangePage=false) returns 180000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0016 begin`);
      const actual: number = nextNewsPage(180000, false);
      logInfo(`nextNewsPage(currentPage=180000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(180000);
      logInfo(`${BUNDLE}NextNewsPage_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0017
     * @tc.name      PullToRefresh_NextNewsPage_0017
     * @tc.desc      nextNewsPage(currentPage=360000, isChangePage=false) returns 360000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0017 begin`);
      const actual: number = nextNewsPage(360000, false);
      logInfo(`nextNewsPage(currentPage=360000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(360000);
      logInfo(`${BUNDLE}NextNewsPage_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0018
     * @tc.name      PullToRefresh_NextNewsPage_0018
     * @tc.desc      nextNewsPage(currentPage=540000, isChangePage=false) returns 540000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0018 begin`);
      const actual: number = nextNewsPage(540000, false);
      logInfo(`nextNewsPage(currentPage=540000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(540000);
      logInfo(`${BUNDLE}NextNewsPage_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0019
     * @tc.name      PullToRefresh_NextNewsPage_0019
     * @tc.desc      nextNewsPage(currentPage=720000, isChangePage=false) returns 720000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0019 begin`);
      const actual: number = nextNewsPage(720000, false);
      logInfo(`nextNewsPage(currentPage=720000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(720000);
      logInfo(`${BUNDLE}NextNewsPage_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0020
     * @tc.name      PullToRefresh_NextNewsPage_0020
     * @tc.desc      nextNewsPage(currentPage=900000, isChangePage=false) returns 900000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0020 begin`);
      const actual: number = nextNewsPage(900000, false);
      logInfo(`nextNewsPage(currentPage=900000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(900000);
      logInfo(`${BUNDLE}NextNewsPage_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0021
     * @tc.name      PullToRefresh_NextNewsPage_0021
     * @tc.desc      nextNewsPage(currentPage=1080000, isChangePage=false) returns 1080000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0021 begin`);
      const actual: number = nextNewsPage(1080000, false);
      logInfo(`nextNewsPage(currentPage=1080000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1080000);
      logInfo(`${BUNDLE}NextNewsPage_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0022
     * @tc.name      PullToRefresh_NextNewsPage_0022
     * @tc.desc      nextNewsPage(currentPage=1260000, isChangePage=false) returns 1260000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0022 begin`);
      const actual: number = nextNewsPage(1260000, false);
      logInfo(`nextNewsPage(currentPage=1260000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1260000);
      logInfo(`${BUNDLE}NextNewsPage_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0023
     * @tc.name      PullToRefresh_NextNewsPage_0023
     * @tc.desc      nextNewsPage(currentPage=1440000, isChangePage=false) returns 1440000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0023 begin`);
      const actual: number = nextNewsPage(1440000, false);
      logInfo(`nextNewsPage(currentPage=1440000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1440000);
      logInfo(`${BUNDLE}NextNewsPage_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0024
     * @tc.name      PullToRefresh_NextNewsPage_0024
     * @tc.desc      nextNewsPage(currentPage=1620000, isChangePage=false) returns 1620000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0024 begin`);
      const actual: number = nextNewsPage(1620000, false);
      logInfo(`nextNewsPage(currentPage=1620000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1620000);
      logInfo(`${BUNDLE}NextNewsPage_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0025
     * @tc.name      PullToRefresh_NextNewsPage_0025
     * @tc.desc      nextNewsPage(currentPage=1800000, isChangePage=false) returns 1800000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0025 begin`);
      const actual: number = nextNewsPage(1800000, false);
      logInfo(`nextNewsPage(currentPage=1800000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1800000);
      logInfo(`${BUNDLE}NextNewsPage_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0026
     * @tc.name      PullToRefresh_NextNewsPage_0026
     * @tc.desc      nextNewsPage(currentPage=1980000, isChangePage=false) returns 1980000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0026 begin`);
      const actual: number = nextNewsPage(1980000, false);
      logInfo(`nextNewsPage(currentPage=1980000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1980000);
      logInfo(`${BUNDLE}NextNewsPage_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0027
     * @tc.name      PullToRefresh_NextNewsPage_0027
     * @tc.desc      nextNewsPage(currentPage=2160000, isChangePage=false) returns 2160000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0027 begin`);
      const actual: number = nextNewsPage(2160000, false);
      logInfo(`nextNewsPage(currentPage=2160000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(2160000);
      logInfo(`${BUNDLE}NextNewsPage_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0028
     * @tc.name      PullToRefresh_NextNewsPage_0028
     * @tc.desc      nextNewsPage(currentPage=2340000, isChangePage=false) returns 2340000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0028 begin`);
      const actual: number = nextNewsPage(2340000, false);
      logInfo(`nextNewsPage(currentPage=2340000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(2340000);
      logInfo(`${BUNDLE}NextNewsPage_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0029
     * @tc.name      PullToRefresh_NextNewsPage_0029
     * @tc.desc      nextNewsPage(currentPage=2520000, isChangePage=false) returns 2520000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0029 begin`);
      const actual: number = nextNewsPage(2520000, false);
      logInfo(`nextNewsPage(currentPage=2520000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(2520000);
      logInfo(`${BUNDLE}NextNewsPage_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0030
     * @tc.name      PullToRefresh_NextNewsPage_0030
     * @tc.desc      nextNewsPage(currentPage=2700000, isChangePage=false) returns 2700000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0030 begin`);
      const actual: number = nextNewsPage(2700000, false);
      logInfo(`nextNewsPage(currentPage=2700000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(2700000);
      logInfo(`${BUNDLE}NextNewsPage_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0031
     * @tc.name      PullToRefresh_NextNewsPage_0031
     * @tc.desc      nextNewsPage(currentPage=500, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0031 begin`);
      const actual: number = nextNewsPage(500, true);
      logInfo(`nextNewsPage(currentPage=500, isChangePag...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0032
     * @tc.name      PullToRefresh_NextNewsPage_0032
     * @tc.desc      nextNewsPage(currentPage=1, isChangePage=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NextNewsPage_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextNewsPage_0032 begin`);
      const actual: number = nextNewsPage(1, true);
      logInfo(`nextNewsPage(currentPage=1, isChangePage=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextNewsPage_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0033
     * @tc.name      PullToRefresh_NextNewsPage_0033
     * @tc.desc      nextNewsPage(currentPage=1, isChangePage=false) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NextNewsPage_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextNewsPage_0033 begin`);
      const actual: number = nextNewsPage(1, false);
      logInfo(`nextNewsPage(currentPage=1, isChangePage=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0034
     * @tc.name      PullToRefresh_NextNewsPage_0034
     * @tc.desc      nextNewsPage(currentPage=2, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NextNewsPage_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextNewsPage_0034 begin`);
      const actual: number = nextNewsPage(2, true);
      logInfo(`nextNewsPage(currentPage=2, isChangePage=...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0035
     * @tc.name      PullToRefresh_NextNewsPage_0035
     * @tc.desc      nextNewsPage(currentPage=3, isChangePage=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PullToRefresh_NextNewsPage_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextNewsPage_0035 begin`);
      const actual: number = nextNewsPage(3, true);
      logInfo(`nextNewsPage(currentPage=3, isChangePage=...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextNewsPage_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0036
     * @tc.name      PullToRefresh_NextNewsPage_0036
     * @tc.desc      nextNewsPage(currentPage=999, isChangePage=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0036 begin`);
      const actual: number = nextNewsPage(999, true);
      logInfo(`nextNewsPage(currentPage=999, isChangePag...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextNewsPage_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0037
     * @tc.name      PullToRefresh_NextNewsPage_0037
     * @tc.desc      nextNewsPage(currentPage=1000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0037 begin`);
      const actual: number = nextNewsPage(1000, true);
      logInfo(`nextNewsPage(currentPage=1000, isChangePa...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0038
     * @tc.name      PullToRefresh_NextNewsPage_0038
     * @tc.desc      nextNewsPage(currentPage=59999, isChangePage=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0038 begin`);
      const actual: number = nextNewsPage(59999, true);
      logInfo(`nextNewsPage(currentPage=59999, isChangeP...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextNewsPage_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0039
     * @tc.name      PullToRefresh_NextNewsPage_0039
     * @tc.desc      nextNewsPage(currentPage=60000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0039 begin`);
      const actual: number = nextNewsPage(60000, true);
      logInfo(`nextNewsPage(currentPage=60000, isChangeP...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0040
     * @tc.name      PullToRefresh_NextNewsPage_0040
     * @tc.desc      nextNewsPage(currentPage=61000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0040 begin`);
      const actual: number = nextNewsPage(61000, true);
      logInfo(`nextNewsPage(currentPage=61000, isChangeP...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0041
     * @tc.name      PullToRefresh_NextNewsPage_0041
     * @tc.desc      nextNewsPage(currentPage=3599000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0041 begin`);
      const actual: number = nextNewsPage(3599000, true);
      logInfo(`nextNewsPage(currentPage=3599000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0042
     * @tc.name      PullToRefresh_NextNewsPage_0042
     * @tc.desc      nextNewsPage(currentPage=3600000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0042 begin`);
      const actual: number = nextNewsPage(3600000, true);
      logInfo(`nextNewsPage(currentPage=3600000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0043
     * @tc.name      PullToRefresh_NextNewsPage_0043
     * @tc.desc      nextNewsPage(currentPage=-1, isChangePage=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_NextNewsPage_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextNewsPage_0043 begin`);
      const actual: number = nextNewsPage(-1, true);
      logInfo(`nextNewsPage(currentPage=-1, isChangePage...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextNewsPage_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0044
     * @tc.name      PullToRefresh_NextNewsPage_0044
     * @tc.desc      nextNewsPage(currentPage=10, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0044 begin`);
      const actual: number = nextNewsPage(10, true);
      logInfo(`nextNewsPage(currentPage=10, isChangePage...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0045
     * @tc.name      PullToRefresh_NextNewsPage_0045
     * @tc.desc      nextNewsPage(currentPage=100, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0045 begin`);
      const actual: number = nextNewsPage(100, true);
      logInfo(`nextNewsPage(currentPage=100, isChangePag...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0046
     * @tc.name      PullToRefresh_NextNewsPage_0046
     * @tc.desc      nextNewsPage(currentPage=180000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0046 begin`);
      const actual: number = nextNewsPage(180000, true);
      logInfo(`nextNewsPage(currentPage=180000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0047
     * @tc.name      PullToRefresh_NextNewsPage_0047
     * @tc.desc      nextNewsPage(currentPage=360000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0047 begin`);
      const actual: number = nextNewsPage(360000, true);
      logInfo(`nextNewsPage(currentPage=360000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0048
     * @tc.name      PullToRefresh_NextNewsPage_0048
     * @tc.desc      nextNewsPage(currentPage=540000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0048 begin`);
      const actual: number = nextNewsPage(540000, true);
      logInfo(`nextNewsPage(currentPage=540000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0049
     * @tc.name      PullToRefresh_NextNewsPage_0049
     * @tc.desc      nextNewsPage(currentPage=720000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0049 begin`);
      const actual: number = nextNewsPage(720000, true);
      logInfo(`nextNewsPage(currentPage=720000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0050
     * @tc.name      PullToRefresh_NextNewsPage_0050
     * @tc.desc      nextNewsPage(currentPage=900000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0050 begin`);
      const actual: number = nextNewsPage(900000, true);
      logInfo(`nextNewsPage(currentPage=900000, isChange...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0051
     * @tc.name      PullToRefresh_NextNewsPage_0051
     * @tc.desc      nextNewsPage(currentPage=1080000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0051 begin`);
      const actual: number = nextNewsPage(1080000, true);
      logInfo(`nextNewsPage(currentPage=1080000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0052
     * @tc.name      PullToRefresh_NextNewsPage_0052
     * @tc.desc      nextNewsPage(currentPage=1260000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0052 begin`);
      const actual: number = nextNewsPage(1260000, true);
      logInfo(`nextNewsPage(currentPage=1260000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0053
     * @tc.name      PullToRefresh_NextNewsPage_0053
     * @tc.desc      nextNewsPage(currentPage=1440000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0053 begin`);
      const actual: number = nextNewsPage(1440000, true);
      logInfo(`nextNewsPage(currentPage=1440000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0054
     * @tc.name      PullToRefresh_NextNewsPage_0054
     * @tc.desc      nextNewsPage(currentPage=1620000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0054 begin`);
      const actual: number = nextNewsPage(1620000, true);
      logInfo(`nextNewsPage(currentPage=1620000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0055
     * @tc.name      PullToRefresh_NextNewsPage_0055
     * @tc.desc      nextNewsPage(currentPage=1800000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0055 begin`);
      const actual: number = nextNewsPage(1800000, true);
      logInfo(`nextNewsPage(currentPage=1800000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0056
     * @tc.name      PullToRefresh_NextNewsPage_0056
     * @tc.desc      nextNewsPage(currentPage=1980000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0056 begin`);
      const actual: number = nextNewsPage(1980000, true);
      logInfo(`nextNewsPage(currentPage=1980000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0057
     * @tc.name      PullToRefresh_NextNewsPage_0057
     * @tc.desc      nextNewsPage(currentPage=2160000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0057 begin`);
      const actual: number = nextNewsPage(2160000, true);
      logInfo(`nextNewsPage(currentPage=2160000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0058
     * @tc.name      PullToRefresh_NextNewsPage_0058
     * @tc.desc      nextNewsPage(currentPage=2340000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0058 begin`);
      const actual: number = nextNewsPage(2340000, true);
      logInfo(`nextNewsPage(currentPage=2340000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_NEXT_NEWS_PAGE_0059
     * @tc.name      PullToRefresh_NextNewsPage_0059
     * @tc.desc      nextNewsPage(currentPage=2520000, isChangePage=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_NextNewsPage_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextNewsPage_0059 begin`);
      const actual: number = nextNewsPage(2520000, true);
      logInfo(`nextNewsPage(currentPage=2520000, isChang...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextNewsPage_0059 end`);
    });
  });
}
