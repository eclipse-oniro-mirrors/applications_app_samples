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
import { refreshTipOf } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for refreshTipOf (50 cases). */
export default function refreshTipOfTest(): void {
  describe('RefreshTipOfTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0001
     * @tc.name      PullToRefresh_RefreshTipOf_0001
     * @tc.desc      refreshTipOf(pullHeightValue=0) returns "??????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_RefreshTipOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0001 begin`);
      const actual: string = refreshTipOf(0);
      logInfo(`refreshTipOf(pullHeightValue=0): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0002
     * @tc.name      PullToRefresh_RefreshTipOf_0002
     * @tc.desc      refreshTipOf(pullHeightValue=1) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_RefreshTipOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0002 begin`);
      const actual: string = refreshTipOf(1);
      logInfo(`refreshTipOf(pullHeightValue=1): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0003
     * @tc.name      PullToRefresh_RefreshTipOf_0003
     * @tc.desc      refreshTipOf(pullHeightValue=100) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0003 begin`);
      const actual: string = refreshTipOf(100);
      logInfo(`refreshTipOf(pullHeightValue=100): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0004
     * @tc.name      PullToRefresh_RefreshTipOf_0004
     * @tc.desc      refreshTipOf(pullHeightValue=360) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0004 begin`);
      const actual: string = refreshTipOf(360);
      logInfo(`refreshTipOf(pullHeightValue=360): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0005
     * @tc.name      PullToRefresh_RefreshTipOf_0005
     * @tc.desc      refreshTipOf(pullHeightValue=720) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0005 begin`);
      const actual: string = refreshTipOf(720);
      logInfo(`refreshTipOf(pullHeightValue=720): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0006
     * @tc.name      PullToRefresh_RefreshTipOf_0006
     * @tc.desc      refreshTipOf(pullHeightValue=1080) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0006 begin`);
      const actual: string = refreshTipOf(1080);
      logInfo(`refreshTipOf(pullHeightValue=1080): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0007
     * @tc.name      PullToRefresh_RefreshTipOf_0007
     * @tc.desc      refreshTipOf(pullHeightValue=1920) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0007 begin`);
      const actual: string = refreshTipOf(1920);
      logInfo(`refreshTipOf(pullHeightValue=1920): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0008
     * @tc.name      PullToRefresh_RefreshTipOf_0008
     * @tc.desc      refreshTipOf(pullHeightValue=-1) returns "??????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_RefreshTipOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0008 begin`);
      const actual: string = refreshTipOf(-1);
      logInfo(`refreshTipOf(pullHeightValue=-1): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u5237\u65b0\u5f53\u524d\u9875\u9762\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0009
     * @tc.name      PullToRefresh_RefreshTipOf_0009
     * @tc.desc      refreshTipOf(pullHeightValue=2) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0009 begin`);
      const actual: string = refreshTipOf(2);
      logInfo(`refreshTipOf(pullHeightValue=2): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0010
     * @tc.name      PullToRefresh_RefreshTipOf_0010
     * @tc.desc      refreshTipOf(pullHeightValue=3) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0010 begin`);
      const actual: string = refreshTipOf(3);
      logInfo(`refreshTipOf(pullHeightValue=3): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0011
     * @tc.name      PullToRefresh_RefreshTipOf_0011
     * @tc.desc      refreshTipOf(pullHeightValue=10) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0011 begin`);
      const actual: string = refreshTipOf(10);
      logInfo(`refreshTipOf(pullHeightValue=10): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0012
     * @tc.name      PullToRefresh_RefreshTipOf_0012
     * @tc.desc      refreshTipOf(pullHeightValue=96) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0012 begin`);
      const actual: string = refreshTipOf(96);
      logInfo(`refreshTipOf(pullHeightValue=96): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0013
     * @tc.name      PullToRefresh_RefreshTipOf_0013
     * @tc.desc      refreshTipOf(pullHeightValue=192) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0013 begin`);
      const actual: string = refreshTipOf(192);
      logInfo(`refreshTipOf(pullHeightValue=192): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0014
     * @tc.name      PullToRefresh_RefreshTipOf_0014
     * @tc.desc      refreshTipOf(pullHeightValue=288) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0014 begin`);
      const actual: string = refreshTipOf(288);
      logInfo(`refreshTipOf(pullHeightValue=288): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0015
     * @tc.name      PullToRefresh_RefreshTipOf_0015
     * @tc.desc      refreshTipOf(pullHeightValue=384) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0015 begin`);
      const actual: string = refreshTipOf(384);
      logInfo(`refreshTipOf(pullHeightValue=384): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0016
     * @tc.name      PullToRefresh_RefreshTipOf_0016
     * @tc.desc      refreshTipOf(pullHeightValue=480) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0016 begin`);
      const actual: string = refreshTipOf(480);
      logInfo(`refreshTipOf(pullHeightValue=480): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0017
     * @tc.name      PullToRefresh_RefreshTipOf_0017
     * @tc.desc      refreshTipOf(pullHeightValue=576) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0017 begin`);
      const actual: string = refreshTipOf(576);
      logInfo(`refreshTipOf(pullHeightValue=576): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0018
     * @tc.name      PullToRefresh_RefreshTipOf_0018
     * @tc.desc      refreshTipOf(pullHeightValue=672) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0018 begin`);
      const actual: string = refreshTipOf(672);
      logInfo(`refreshTipOf(pullHeightValue=672): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0019
     * @tc.name      PullToRefresh_RefreshTipOf_0019
     * @tc.desc      refreshTipOf(pullHeightValue=768) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0019 begin`);
      const actual: string = refreshTipOf(768);
      logInfo(`refreshTipOf(pullHeightValue=768): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0020
     * @tc.name      PullToRefresh_RefreshTipOf_0020
     * @tc.desc      refreshTipOf(pullHeightValue=864) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0020 begin`);
      const actual: string = refreshTipOf(864);
      logInfo(`refreshTipOf(pullHeightValue=864): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0021
     * @tc.name      PullToRefresh_RefreshTipOf_0021
     * @tc.desc      refreshTipOf(pullHeightValue=960) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0021 begin`);
      const actual: string = refreshTipOf(960);
      logInfo(`refreshTipOf(pullHeightValue=960): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0022
     * @tc.name      PullToRefresh_RefreshTipOf_0022
     * @tc.desc      refreshTipOf(pullHeightValue=1056) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0022 begin`);
      const actual: string = refreshTipOf(1056);
      logInfo(`refreshTipOf(pullHeightValue=1056): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0023
     * @tc.name      PullToRefresh_RefreshTipOf_0023
     * @tc.desc      refreshTipOf(pullHeightValue=1152) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0023 begin`);
      const actual: string = refreshTipOf(1152);
      logInfo(`refreshTipOf(pullHeightValue=1152): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0024
     * @tc.name      PullToRefresh_RefreshTipOf_0024
     * @tc.desc      refreshTipOf(pullHeightValue=1248) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0024 begin`);
      const actual: string = refreshTipOf(1248);
      logInfo(`refreshTipOf(pullHeightValue=1248): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0025
     * @tc.name      PullToRefresh_RefreshTipOf_0025
     * @tc.desc      refreshTipOf(pullHeightValue=1344) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0025 begin`);
      const actual: string = refreshTipOf(1344);
      logInfo(`refreshTipOf(pullHeightValue=1344): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0026
     * @tc.name      PullToRefresh_RefreshTipOf_0026
     * @tc.desc      refreshTipOf(pullHeightValue=1440) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0026 begin`);
      const actual: string = refreshTipOf(1440);
      logInfo(`refreshTipOf(pullHeightValue=1440): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0027
     * @tc.name      PullToRefresh_RefreshTipOf_0027
     * @tc.desc      refreshTipOf(pullHeightValue=1536) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0027 begin`);
      const actual: string = refreshTipOf(1536);
      logInfo(`refreshTipOf(pullHeightValue=1536): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0028
     * @tc.name      PullToRefresh_RefreshTipOf_0028
     * @tc.desc      refreshTipOf(pullHeightValue=1632) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0028 begin`);
      const actual: string = refreshTipOf(1632);
      logInfo(`refreshTipOf(pullHeightValue=1632): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0029
     * @tc.name      PullToRefresh_RefreshTipOf_0029
     * @tc.desc      refreshTipOf(pullHeightValue=1728) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0029 begin`);
      const actual: string = refreshTipOf(1728);
      logInfo(`refreshTipOf(pullHeightValue=1728): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0030
     * @tc.name      PullToRefresh_RefreshTipOf_0030
     * @tc.desc      refreshTipOf(pullHeightValue=1824) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0030 begin`);
      const actual: string = refreshTipOf(1824);
      logInfo(`refreshTipOf(pullHeightValue=1824): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0031
     * @tc.name      PullToRefresh_RefreshTipOf_0031
     * @tc.desc      refreshTipOf(pullHeightValue=2016) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0031 begin`);
      const actual: string = refreshTipOf(2016);
      logInfo(`refreshTipOf(pullHeightValue=2016): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0032
     * @tc.name      PullToRefresh_RefreshTipOf_0032
     * @tc.desc      refreshTipOf(pullHeightValue=2112) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0032 begin`);
      const actual: string = refreshTipOf(2112);
      logInfo(`refreshTipOf(pullHeightValue=2112): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0033
     * @tc.name      PullToRefresh_RefreshTipOf_0033
     * @tc.desc      refreshTipOf(pullHeightValue=2208) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0033 begin`);
      const actual: string = refreshTipOf(2208);
      logInfo(`refreshTipOf(pullHeightValue=2208): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0034
     * @tc.name      PullToRefresh_RefreshTipOf_0034
     * @tc.desc      refreshTipOf(pullHeightValue=2304) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0034 begin`);
      const actual: string = refreshTipOf(2304);
      logInfo(`refreshTipOf(pullHeightValue=2304): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0035
     * @tc.name      PullToRefresh_RefreshTipOf_0035
     * @tc.desc      refreshTipOf(pullHeightValue=2400) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0035 begin`);
      const actual: string = refreshTipOf(2400);
      logInfo(`refreshTipOf(pullHeightValue=2400): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0036
     * @tc.name      PullToRefresh_RefreshTipOf_0036
     * @tc.desc      refreshTipOf(pullHeightValue=2496) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0036 begin`);
      const actual: string = refreshTipOf(2496);
      logInfo(`refreshTipOf(pullHeightValue=2496): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0037
     * @tc.name      PullToRefresh_RefreshTipOf_0037
     * @tc.desc      refreshTipOf(pullHeightValue=2592) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0037 begin`);
      const actual: string = refreshTipOf(2592);
      logInfo(`refreshTipOf(pullHeightValue=2592): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0038
     * @tc.name      PullToRefresh_RefreshTipOf_0038
     * @tc.desc      refreshTipOf(pullHeightValue=2688) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0038 begin`);
      const actual: string = refreshTipOf(2688);
      logInfo(`refreshTipOf(pullHeightValue=2688): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0039
     * @tc.name      PullToRefresh_RefreshTipOf_0039
     * @tc.desc      refreshTipOf(pullHeightValue=2784) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0039 begin`);
      const actual: string = refreshTipOf(2784);
      logInfo(`refreshTipOf(pullHeightValue=2784): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0040
     * @tc.name      PullToRefresh_RefreshTipOf_0040
     * @tc.desc      refreshTipOf(pullHeightValue=2880) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0040 begin`);
      const actual: string = refreshTipOf(2880);
      logInfo(`refreshTipOf(pullHeightValue=2880): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0041
     * @tc.name      PullToRefresh_RefreshTipOf_0041
     * @tc.desc      refreshTipOf(pullHeightValue=2976) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0041 begin`);
      const actual: string = refreshTipOf(2976);
      logInfo(`refreshTipOf(pullHeightValue=2976): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0042
     * @tc.name      PullToRefresh_RefreshTipOf_0042
     * @tc.desc      refreshTipOf(pullHeightValue=3072) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0042 begin`);
      const actual: string = refreshTipOf(3072);
      logInfo(`refreshTipOf(pullHeightValue=3072): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0043
     * @tc.name      PullToRefresh_RefreshTipOf_0043
     * @tc.desc      refreshTipOf(pullHeightValue=3168) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0043 begin`);
      const actual: string = refreshTipOf(3168);
      logInfo(`refreshTipOf(pullHeightValue=3168): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0044
     * @tc.name      PullToRefresh_RefreshTipOf_0044
     * @tc.desc      refreshTipOf(pullHeightValue=3264) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0044 begin`);
      const actual: string = refreshTipOf(3264);
      logInfo(`refreshTipOf(pullHeightValue=3264): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0045
     * @tc.name      PullToRefresh_RefreshTipOf_0045
     * @tc.desc      refreshTipOf(pullHeightValue=3360) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0045 begin`);
      const actual: string = refreshTipOf(3360);
      logInfo(`refreshTipOf(pullHeightValue=3360): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0046
     * @tc.name      PullToRefresh_RefreshTipOf_0046
     * @tc.desc      refreshTipOf(pullHeightValue=3456) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0046 begin`);
      const actual: string = refreshTipOf(3456);
      logInfo(`refreshTipOf(pullHeightValue=3456): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0047
     * @tc.name      PullToRefresh_RefreshTipOf_0047
     * @tc.desc      refreshTipOf(pullHeightValue=3552) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0047 begin`);
      const actual: string = refreshTipOf(3552);
      logInfo(`refreshTipOf(pullHeightValue=3552): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0048
     * @tc.name      PullToRefresh_RefreshTipOf_0048
     * @tc.desc      refreshTipOf(pullHeightValue=3648) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0048 begin`);
      const actual: string = refreshTipOf(3648);
      logInfo(`refreshTipOf(pullHeightValue=3648): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0049
     * @tc.name      PullToRefresh_RefreshTipOf_0049
     * @tc.desc      refreshTipOf(pullHeightValue=3744) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0049 begin`);
      const actual: string = refreshTipOf(3744);
      logInfo(`refreshTipOf(pullHeightValue=3744): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_REFRESH_TIP_OF_0050
     * @tc.name      PullToRefresh_RefreshTipOf_0050
     * @tc.desc      refreshTipOf(pullHeightValue=3840) returns "????????"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_RefreshTipOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RefreshTipOf_0050 begin`);
      const actual: string = refreshTipOf(3840);
      logInfo(`refreshTipOf(pullHeightValue=3840): actual=${actual}`);
      expect(actual).assertEqual('\u91ca\u653e\u66f4\u65b0\u4e0b\u9875\u6570\u636e');
      logInfo(`${BUNDLE}RefreshTipOf_0050 end`);
    });
  });
}
