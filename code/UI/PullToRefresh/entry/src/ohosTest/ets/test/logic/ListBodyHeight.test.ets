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
import { listBodyHeight } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listBodyHeight (59 cases). */
export default function listBodyHeightTest(): void {
  describe('ListBodyHeightTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0001
     * @tc.name      PullToRefresh_ListBodyHeight_0001
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_ListBodyHeight_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0001 begin`);
      const actual: number = listBodyHeight(0, -100, -100);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListBodyHeight_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0002
     * @tc.name      PullToRefresh_ListBodyHeight_0002
     * @tc.desc      listBodyHeight(height=1, trYTop=-100, trYBottom=-100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_ListBodyHeight_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0002 begin`);
      const actual: number = listBodyHeight(1, -100, -100);
      logInfo(`listBodyHeight(height=1, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ListBodyHeight_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0003
     * @tc.name      PullToRefresh_ListBodyHeight_0003
     * @tc.desc      listBodyHeight(height=100, trYTop=-100, trYBottom=-100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0003 begin`);
      const actual: number = listBodyHeight(100, -100, -100);
      logInfo(`listBodyHeight(height=100, trYTop=-100, t...: actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ListBodyHeight_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0004
     * @tc.name      PullToRefresh_ListBodyHeight_0004
     * @tc.desc      listBodyHeight(height=360, trYTop=-100, trYBottom=-100) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0004 begin`);
      const actual: number = listBodyHeight(360, -100, -100);
      logInfo(`listBodyHeight(height=360, trYTop=-100, t...: actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}ListBodyHeight_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0005
     * @tc.name      PullToRefresh_ListBodyHeight_0005
     * @tc.desc      listBodyHeight(height=720, trYTop=-100, trYBottom=-100) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0005 begin`);
      const actual: number = listBodyHeight(720, -100, -100);
      logInfo(`listBodyHeight(height=720, trYTop=-100, t...: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ListBodyHeight_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0006
     * @tc.name      PullToRefresh_ListBodyHeight_0006
     * @tc.desc      listBodyHeight(height=1080, trYTop=-100, trYBottom=-100) returns 1080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0006 begin`);
      const actual: number = listBodyHeight(1080, -100, -100);
      logInfo(`listBodyHeight(height=1080, trYTop=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(1080);
      logInfo(`${BUNDLE}ListBodyHeight_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0007
     * @tc.name      PullToRefresh_ListBodyHeight_0007
     * @tc.desc      listBodyHeight(height=1920, trYTop=-100, trYBottom=-100) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0007 begin`);
      const actual: number = listBodyHeight(1920, -100, -100);
      logInfo(`listBodyHeight(height=1920, trYTop=-100, ...: actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}ListBodyHeight_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0008
     * @tc.name      PullToRefresh_ListBodyHeight_0008
     * @tc.desc      listBodyHeight(height=-1, trYTop=-100, trYBottom=-100) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0008 begin`);
      const actual: number = listBodyHeight(-1, -100, -100);
      logInfo(`listBodyHeight(height=-1, trYTop=-100, tr...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListBodyHeight_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0009
     * @tc.name      PullToRefresh_ListBodyHeight_0009
     * @tc.desc      listBodyHeight(height=2, trYTop=-100, trYBottom=-100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0009 begin`);
      const actual: number = listBodyHeight(2, -100, -100);
      logInfo(`listBodyHeight(height=2, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ListBodyHeight_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0010
     * @tc.name      PullToRefresh_ListBodyHeight_0010
     * @tc.desc      listBodyHeight(height=3, trYTop=-100, trYBottom=-100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0010 begin`);
      const actual: number = listBodyHeight(3, -100, -100);
      logInfo(`listBodyHeight(height=3, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ListBodyHeight_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0011
     * @tc.name      PullToRefresh_ListBodyHeight_0011
     * @tc.desc      listBodyHeight(height=10, trYTop=-100, trYBottom=-100) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0011 begin`);
      const actual: number = listBodyHeight(10, -100, -100);
      logInfo(`listBodyHeight(height=10, trYTop=-100, tr...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ListBodyHeight_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0012
     * @tc.name      PullToRefresh_ListBodyHeight_0012
     * @tc.desc      listBodyHeight(height=96, trYTop=-100, trYBottom=-100) returns 96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0012 begin`);
      const actual: number = listBodyHeight(96, -100, -100);
      logInfo(`listBodyHeight(height=96, trYTop=-100, tr...: actual=${actual}`);
      expect(actual).assertEqual(96);
      logInfo(`${BUNDLE}ListBodyHeight_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0013
     * @tc.name      PullToRefresh_ListBodyHeight_0013
     * @tc.desc      listBodyHeight(height=0, trYTop=-1, trYBottom=-100) returns -99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0013 begin`);
      const actual: number = listBodyHeight(0, -1, -100);
      logInfo(`listBodyHeight(height=0, trYTop=-1, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(-99);
      logInfo(`${BUNDLE}ListBodyHeight_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0014
     * @tc.name      PullToRefresh_ListBodyHeight_0014
     * @tc.desc      listBodyHeight(height=0, trYTop=0, trYBottom=-100) returns -100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0014 begin`);
      const actual: number = listBodyHeight(0, 0, -100);
      logInfo(`listBodyHeight(height=0, trYTop=0, trYBot...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}ListBodyHeight_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0015
     * @tc.name      PullToRefresh_ListBodyHeight_0015
     * @tc.desc      listBodyHeight(height=0, trYTop=1, trYBottom=-100) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0015 begin`);
      const actual: number = listBodyHeight(0, 1, -100);
      logInfo(`listBodyHeight(height=0, trYTop=1, trYBot...: actual=${actual}`);
      expect(actual).assertEqual(-101);
      logInfo(`${BUNDLE}ListBodyHeight_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0016
     * @tc.name      PullToRefresh_ListBodyHeight_0016
     * @tc.desc      listBodyHeight(height=0, trYTop=50, trYBottom=-100) returns -150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0016 begin`);
      const actual: number = listBodyHeight(0, 50, -100);
      logInfo(`listBodyHeight(height=0, trYTop=50, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(-150);
      logInfo(`${BUNDLE}ListBodyHeight_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0017
     * @tc.name      PullToRefresh_ListBodyHeight_0017
     * @tc.desc      listBodyHeight(height=0, trYTop=100, trYBottom=-100) returns -200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0017 begin`);
      const actual: number = listBodyHeight(0, 100, -100);
      logInfo(`listBodyHeight(height=0, trYTop=100, trYB...: actual=${actual}`);
      expect(actual).assertEqual(-200);
      logInfo(`${BUNDLE}ListBodyHeight_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0018
     * @tc.name      PullToRefresh_ListBodyHeight_0018
     * @tc.desc      listBodyHeight(height=0, trYTop=2, trYBottom=-100) returns -102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0018 begin`);
      const actual: number = listBodyHeight(0, 2, -100);
      logInfo(`listBodyHeight(height=0, trYTop=2, trYBot...: actual=${actual}`);
      expect(actual).assertEqual(-102);
      logInfo(`${BUNDLE}ListBodyHeight_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0019
     * @tc.name      PullToRefresh_ListBodyHeight_0019
     * @tc.desc      listBodyHeight(height=0, trYTop=3, trYBottom=-100) returns -103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0019 begin`);
      const actual: number = listBodyHeight(0, 3, -100);
      logInfo(`listBodyHeight(height=0, trYTop=3, trYBot...: actual=${actual}`);
      expect(actual).assertEqual(-103);
      logInfo(`${BUNDLE}ListBodyHeight_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0020
     * @tc.name      PullToRefresh_ListBodyHeight_0020
     * @tc.desc      listBodyHeight(height=0, trYTop=10, trYBottom=-100) returns -110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0020 begin`);
      const actual: number = listBodyHeight(0, 10, -100);
      logInfo(`listBodyHeight(height=0, trYTop=10, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(-110);
      logInfo(`${BUNDLE}ListBodyHeight_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0021
     * @tc.name      PullToRefresh_ListBodyHeight_0021
     * @tc.desc      listBodyHeight(height=0, trYTop=5, trYBottom=-100) returns -105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0021 begin`);
      const actual: number = listBodyHeight(0, 5, -100);
      logInfo(`listBodyHeight(height=0, trYTop=5, trYBot...: actual=${actual}`);
      expect(actual).assertEqual(-105);
      logInfo(`${BUNDLE}ListBodyHeight_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0022
     * @tc.name      PullToRefresh_ListBodyHeight_0022
     * @tc.desc      listBodyHeight(height=0, trYTop=15, trYBottom=-100) returns -115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0022 begin`);
      const actual: number = listBodyHeight(0, 15, -100);
      logInfo(`listBodyHeight(height=0, trYTop=15, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(-115);
      logInfo(`${BUNDLE}ListBodyHeight_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0023
     * @tc.name      PullToRefresh_ListBodyHeight_0023
     * @tc.desc      listBodyHeight(height=0, trYTop=161, trYBottom=-100) returns -261
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0023 begin`);
      const actual: number = listBodyHeight(0, 161, -100);
      logInfo(`listBodyHeight(height=0, trYTop=161, trYB...: actual=${actual}`);
      expect(actual).assertEqual(-261);
      logInfo(`${BUNDLE}ListBodyHeight_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0024
     * @tc.name      PullToRefresh_ListBodyHeight_0024
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=-1) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0024 begin`);
      const actual: number = listBodyHeight(0, -100, -1);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}ListBodyHeight_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0025
     * @tc.name      PullToRefresh_ListBodyHeight_0025
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=1) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0025 begin`);
      const actual: number = listBodyHeight(0, -100, 1);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}ListBodyHeight_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0026
     * @tc.name      PullToRefresh_ListBodyHeight_0026
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=50) returns 150
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0026 begin`);
      const actual: number = listBodyHeight(0, -100, 50);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(150);
      logInfo(`${BUNDLE}ListBodyHeight_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0027
     * @tc.name      PullToRefresh_ListBodyHeight_0027
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=100) returns 200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0027 begin`);
      const actual: number = listBodyHeight(0, -100, 100);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(200);
      logInfo(`${BUNDLE}ListBodyHeight_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0028
     * @tc.name      PullToRefresh_ListBodyHeight_0028
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=2) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0028 begin`);
      const actual: number = listBodyHeight(0, -100, 2);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}ListBodyHeight_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0029
     * @tc.name      PullToRefresh_ListBodyHeight_0029
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=3) returns 103
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0029 begin`);
      const actual: number = listBodyHeight(0, -100, 3);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(103);
      logInfo(`${BUNDLE}ListBodyHeight_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0030
     * @tc.name      PullToRefresh_ListBodyHeight_0030
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=10) returns 110
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0030 begin`);
      const actual: number = listBodyHeight(0, -100, 10);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(110);
      logInfo(`${BUNDLE}ListBodyHeight_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0031
     * @tc.name      PullToRefresh_ListBodyHeight_0031
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=5) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0031 begin`);
      const actual: number = listBodyHeight(0, -100, 5);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}ListBodyHeight_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0032
     * @tc.name      PullToRefresh_ListBodyHeight_0032
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=15) returns 115
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0032 begin`);
      const actual: number = listBodyHeight(0, -100, 15);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertEqual(115);
      logInfo(`${BUNDLE}ListBodyHeight_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0033
     * @tc.name      PullToRefresh_ListBodyHeight_0033
     * @tc.desc      listBodyHeight(height=0, trYTop=-100, trYBottom=23.01) returns 123.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0033 begin`);
      const actual: number = listBodyHeight(0, -100, 23.01);
      logInfo(`listBodyHeight(height=0, trYTop=-100, trY...: actual=${actual}`);
      expect(actual).assertClose(123.01, PRECISION);
      logInfo(`${BUNDLE}ListBodyHeight_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0034
     * @tc.name      PullToRefresh_ListBodyHeight_0034
     * @tc.desc      listBodyHeight(height=1, trYTop=-1, trYBottom=-100) returns -98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0034 begin`);
      const actual: number = listBodyHeight(1, -1, -100);
      logInfo(`listBodyHeight(height=1, trYTop=-1, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(-98);
      logInfo(`${BUNDLE}ListBodyHeight_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0035
     * @tc.name      PullToRefresh_ListBodyHeight_0035
     * @tc.desc      listBodyHeight(height=3, trYTop=161, trYBottom=-1) returns -159
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0035 begin`);
      const actual: number = listBodyHeight(3, 161, -1);
      logInfo(`listBodyHeight(height=3, trYTop=161, trYB...: actual=${actual}`);
      expect(actual).assertEqual(-159);
      logInfo(`${BUNDLE}ListBodyHeight_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0036
     * @tc.name      PullToRefresh_ListBodyHeight_0036
     * @tc.desc      listBodyHeight(height=2, trYTop=10, trYBottom=50) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0036 begin`);
      const actual: number = listBodyHeight(2, 10, 50);
      logInfo(`listBodyHeight(height=2, trYTop=10, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}ListBodyHeight_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0037
     * @tc.name      PullToRefresh_ListBodyHeight_0037
     * @tc.desc      listBodyHeight(height=1080, trYTop=10, trYBottom=3) returns 1073
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0037 begin`);
      const actual: number = listBodyHeight(1080, 10, 3);
      logInfo(`listBodyHeight(height=1080, trYTop=10, tr...: actual=${actual}`);
      expect(actual).assertEqual(1073);
      logInfo(`${BUNDLE}ListBodyHeight_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0038
     * @tc.name      PullToRefresh_ListBodyHeight_0038
     * @tc.desc      listBodyHeight(height=10, trYTop=2, trYBottom=3) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0038 begin`);
      const actual: number = listBodyHeight(10, 2, 3);
      logInfo(`listBodyHeight(height=10, trYTop=2, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}ListBodyHeight_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0039
     * @tc.name      PullToRefresh_ListBodyHeight_0039
     * @tc.desc      listBodyHeight(height=2, trYTop=-1, trYBottom=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0039 begin`);
      const actual: number = listBodyHeight(2, -1, 2);
      logInfo(`listBodyHeight(height=2, trYTop=-1, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ListBodyHeight_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0040
     * @tc.name      PullToRefresh_ListBodyHeight_0040
     * @tc.desc      listBodyHeight(height=1080, trYTop=5, trYBottom=-1) returns 1074
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0040 begin`);
      const actual: number = listBodyHeight(1080, 5, -1);
      logInfo(`listBodyHeight(height=1080, trYTop=5, trY...: actual=${actual}`);
      expect(actual).assertEqual(1074);
      logInfo(`${BUNDLE}ListBodyHeight_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0041
     * @tc.name      PullToRefresh_ListBodyHeight_0041
     * @tc.desc      listBodyHeight(height=2, trYTop=3, trYBottom=-1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0041 begin`);
      const actual: number = listBodyHeight(2, 3, -1);
      logInfo(`listBodyHeight(height=2, trYTop=3, trYBot...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}ListBodyHeight_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0042
     * @tc.name      PullToRefresh_ListBodyHeight_0042
     * @tc.desc      listBodyHeight(height=2, trYTop=1, trYBottom=23.01) returns 24.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0042 begin`);
      const actual: number = listBodyHeight(2, 1, 23.01);
      logInfo(`listBodyHeight(height=2, trYTop=1, trYBot...: actual=${actual}`);
      expect(actual).assertClose(24.01, PRECISION);
      logInfo(`${BUNDLE}ListBodyHeight_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0043
     * @tc.name      PullToRefresh_ListBodyHeight_0043
     * @tc.desc      listBodyHeight(height=1080, trYTop=1, trYBottom=50) returns 1129
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0043 begin`);
      const actual: number = listBodyHeight(1080, 1, 50);
      logInfo(`listBodyHeight(height=1080, trYTop=1, trY...: actual=${actual}`);
      expect(actual).assertEqual(1129);
      logInfo(`${BUNDLE}ListBodyHeight_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0044
     * @tc.name      PullToRefresh_ListBodyHeight_0044
     * @tc.desc      listBodyHeight(height=1920, trYTop=2, trYBottom=5) returns 1923
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0044 begin`);
      const actual: number = listBodyHeight(1920, 2, 5);
      logInfo(`listBodyHeight(height=1920, trYTop=2, trY...: actual=${actual}`);
      expect(actual).assertEqual(1923);
      logInfo(`${BUNDLE}ListBodyHeight_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0045
     * @tc.name      PullToRefresh_ListBodyHeight_0045
     * @tc.desc      listBodyHeight(height=360, trYTop=1, trYBottom=0) returns 359
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0045 begin`);
      const actual: number = listBodyHeight(360, 1, 0);
      logInfo(`listBodyHeight(height=360, trYTop=1, trYB...: actual=${actual}`);
      expect(actual).assertEqual(359);
      logInfo(`${BUNDLE}ListBodyHeight_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0046
     * @tc.name      PullToRefresh_ListBodyHeight_0046
     * @tc.desc      listBodyHeight(height=360, trYTop=100, trYBottom=-100) returns 160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0046 begin`);
      const actual: number = listBodyHeight(360, 100, -100);
      logInfo(`listBodyHeight(height=360, trYTop=100, tr...: actual=${actual}`);
      expect(actual).assertEqual(160);
      logInfo(`${BUNDLE}ListBodyHeight_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0047
     * @tc.name      PullToRefresh_ListBodyHeight_0047
     * @tc.desc      listBodyHeight(height=100, trYTop=-100, trYBottom=3) returns 203
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0047 begin`);
      const actual: number = listBodyHeight(100, -100, 3);
      logInfo(`listBodyHeight(height=100, trYTop=-100, t...: actual=${actual}`);
      expect(actual).assertEqual(203);
      logInfo(`${BUNDLE}ListBodyHeight_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0048
     * @tc.name      PullToRefresh_ListBodyHeight_0048
     * @tc.desc      listBodyHeight(height=3, trYTop=15, trYBottom=3) returns -9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0048 begin`);
      const actual: number = listBodyHeight(3, 15, 3);
      logInfo(`listBodyHeight(height=3, trYTop=15, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(-9);
      logInfo(`${BUNDLE}ListBodyHeight_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0049
     * @tc.name      PullToRefresh_ListBodyHeight_0049
     * @tc.desc      listBodyHeight(height=1920, trYTop=161, trYBottom=1) returns 1760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0049 begin`);
      const actual: number = listBodyHeight(1920, 161, 1);
      logInfo(`listBodyHeight(height=1920, trYTop=161, t...: actual=${actual}`);
      expect(actual).assertEqual(1760);
      logInfo(`${BUNDLE}ListBodyHeight_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0050
     * @tc.name      PullToRefresh_ListBodyHeight_0050
     * @tc.desc      listBodyHeight(height=720, trYTop=-1, trYBottom=1) returns 722
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0050 begin`);
      const actual: number = listBodyHeight(720, -1, 1);
      logInfo(`listBodyHeight(height=720, trYTop=-1, trY...: actual=${actual}`);
      expect(actual).assertEqual(722);
      logInfo(`${BUNDLE}ListBodyHeight_0050 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0051
     * @tc.name      PullToRefresh_ListBodyHeight_0051
     * @tc.desc      listBodyHeight(height=2, trYTop=161, trYBottom=1) returns -158
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0051 begin`);
      const actual: number = listBodyHeight(2, 161, 1);
      logInfo(`listBodyHeight(height=2, trYTop=161, trYB...: actual=${actual}`);
      expect(actual).assertEqual(-158);
      logInfo(`${BUNDLE}ListBodyHeight_0051 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0052
     * @tc.name      PullToRefresh_ListBodyHeight_0052
     * @tc.desc      listBodyHeight(height=1920, trYTop=161, trYBottom=15) returns 1774
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0052 begin`);
      const actual: number = listBodyHeight(1920, 161, 15);
      logInfo(`listBodyHeight(height=1920, trYTop=161, t...: actual=${actual}`);
      expect(actual).assertEqual(1774);
      logInfo(`${BUNDLE}ListBodyHeight_0052 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0053
     * @tc.name      PullToRefresh_ListBodyHeight_0053
     * @tc.desc      listBodyHeight(height=10, trYTop=3, trYBottom=50) returns 57
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0053 begin`);
      const actual: number = listBodyHeight(10, 3, 50);
      logInfo(`listBodyHeight(height=10, trYTop=3, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(57);
      logInfo(`${BUNDLE}ListBodyHeight_0053 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0054
     * @tc.name      PullToRefresh_ListBodyHeight_0054
     * @tc.desc      listBodyHeight(height=-1, trYTop=100, trYBottom=15) returns -86
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0054 begin`);
      const actual: number = listBodyHeight(-1, 100, 15);
      logInfo(`listBodyHeight(height=-1, trYTop=100, trY...: actual=${actual}`);
      expect(actual).assertEqual(-86);
      logInfo(`${BUNDLE}ListBodyHeight_0054 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0055
     * @tc.name      PullToRefresh_ListBodyHeight_0055
     * @tc.desc      listBodyHeight(height=1080, trYTop=5, trYBottom=10) returns 1085
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0055 begin`);
      const actual: number = listBodyHeight(1080, 5, 10);
      logInfo(`listBodyHeight(height=1080, trYTop=5, trY...: actual=${actual}`);
      expect(actual).assertEqual(1085);
      logInfo(`${BUNDLE}ListBodyHeight_0055 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0056
     * @tc.name      PullToRefresh_ListBodyHeight_0056
     * @tc.desc      listBodyHeight(height=100, trYTop=161, trYBottom=10) returns -51
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0056 begin`);
      const actual: number = listBodyHeight(100, 161, 10);
      logInfo(`listBodyHeight(height=100, trYTop=161, tr...: actual=${actual}`);
      expect(actual).assertEqual(-51);
      logInfo(`${BUNDLE}ListBodyHeight_0056 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0057
     * @tc.name      PullToRefresh_ListBodyHeight_0057
     * @tc.desc      listBodyHeight(height=96, trYTop=161, trYBottom=23.01) returns -41.989999999999995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0057 begin`);
      const actual: number = listBodyHeight(96, 161, 23.01);
      logInfo(`listBodyHeight(height=96, trYTop=161, trY...: actual=${actual}`);
      expect(actual).assertClose(-41.989999999999995, PRECISION);
      logInfo(`${BUNDLE}ListBodyHeight_0057 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0058
     * @tc.name      PullToRefresh_ListBodyHeight_0058
     * @tc.desc      listBodyHeight(height=0, trYTop=5, trYBottom=-1) returns -6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_ListBodyHeight_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0058 begin`);
      const actual: number = listBodyHeight(0, 5, -1);
      logInfo(`listBodyHeight(height=0, trYTop=5, trYBot...: actual=${actual}`);
      expect(actual).assertEqual(-6);
      logInfo(`${BUNDLE}ListBodyHeight_0058 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_LIST_BODY_HEIGHT_0059
     * @tc.name      PullToRefresh_ListBodyHeight_0059
     * @tc.desc      listBodyHeight(height=1, trYTop=10, trYBottom=100) returns 91
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_ListBodyHeight_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListBodyHeight_0059 begin`);
      const actual: number = listBodyHeight(1, 10, 100);
      logInfo(`listBodyHeight(height=1, trYTop=10, trYBo...: actual=${actual}`);
      expect(actual).assertEqual(91);
      logInfo(`${BUNDLE}ListBodyHeight_0059 end`);
    });
  });
}
