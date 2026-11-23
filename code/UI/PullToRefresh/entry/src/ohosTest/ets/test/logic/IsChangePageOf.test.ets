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
import { isChangePageOf } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isChangePageOf (30 cases). */
export default function isChangePageOfTest(): void {
  describe('IsChangePageOfTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0001
     * @tc.name      PullToRefresh_IsChangePageOf_0001
     * @tc.desc      isChangePageOf(pullHeightValue=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_IsChangePageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0001 begin`);
      const actual: boolean = isChangePageOf(0);
      logInfo(`isChangePageOf(pullHeightValue=0): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0002
     * @tc.name      PullToRefresh_IsChangePageOf_0002
     * @tc.desc      isChangePageOf(pullHeightValue=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_IsChangePageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0002 begin`);
      const actual: boolean = isChangePageOf(1);
      logInfo(`isChangePageOf(pullHeightValue=1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0003
     * @tc.name      PullToRefresh_IsChangePageOf_0003
     * @tc.desc      isChangePageOf(pullHeightValue=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0003 begin`);
      const actual: boolean = isChangePageOf(100);
      logInfo(`isChangePageOf(pullHeightValue=100): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0004
     * @tc.name      PullToRefresh_IsChangePageOf_0004
     * @tc.desc      isChangePageOf(pullHeightValue=360) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0004 begin`);
      const actual: boolean = isChangePageOf(360);
      logInfo(`isChangePageOf(pullHeightValue=360): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0005
     * @tc.name      PullToRefresh_IsChangePageOf_0005
     * @tc.desc      isChangePageOf(pullHeightValue=720) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0005 begin`);
      const actual: boolean = isChangePageOf(720);
      logInfo(`isChangePageOf(pullHeightValue=720): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0006
     * @tc.name      PullToRefresh_IsChangePageOf_0006
     * @tc.desc      isChangePageOf(pullHeightValue=1080) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0006 begin`);
      const actual: boolean = isChangePageOf(1080);
      logInfo(`isChangePageOf(pullHeightValue=1080): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0007
     * @tc.name      PullToRefresh_IsChangePageOf_0007
     * @tc.desc      isChangePageOf(pullHeightValue=1920) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0007 begin`);
      const actual: boolean = isChangePageOf(1920);
      logInfo(`isChangePageOf(pullHeightValue=1920): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0008
     * @tc.name      PullToRefresh_IsChangePageOf_0008
     * @tc.desc      isChangePageOf(pullHeightValue=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_IsChangePageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0008 begin`);
      const actual: boolean = isChangePageOf(-1);
      logInfo(`isChangePageOf(pullHeightValue=-1): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0009
     * @tc.name      PullToRefresh_IsChangePageOf_0009
     * @tc.desc      isChangePageOf(pullHeightValue=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0009 begin`);
      const actual: boolean = isChangePageOf(2);
      logInfo(`isChangePageOf(pullHeightValue=2): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0010
     * @tc.name      PullToRefresh_IsChangePageOf_0010
     * @tc.desc      isChangePageOf(pullHeightValue=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0010 begin`);
      const actual: boolean = isChangePageOf(3);
      logInfo(`isChangePageOf(pullHeightValue=3): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0011
     * @tc.name      PullToRefresh_IsChangePageOf_0011
     * @tc.desc      isChangePageOf(pullHeightValue=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0011 begin`);
      const actual: boolean = isChangePageOf(10);
      logInfo(`isChangePageOf(pullHeightValue=10): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0012
     * @tc.name      PullToRefresh_IsChangePageOf_0012
     * @tc.desc      isChangePageOf(pullHeightValue=96) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0012 begin`);
      const actual: boolean = isChangePageOf(96);
      logInfo(`isChangePageOf(pullHeightValue=96): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0013
     * @tc.name      PullToRefresh_IsChangePageOf_0013
     * @tc.desc      isChangePageOf(pullHeightValue=192) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0013 begin`);
      const actual: boolean = isChangePageOf(192);
      logInfo(`isChangePageOf(pullHeightValue=192): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0014
     * @tc.name      PullToRefresh_IsChangePageOf_0014
     * @tc.desc      isChangePageOf(pullHeightValue=288) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0014 begin`);
      const actual: boolean = isChangePageOf(288);
      logInfo(`isChangePageOf(pullHeightValue=288): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0015
     * @tc.name      PullToRefresh_IsChangePageOf_0015
     * @tc.desc      isChangePageOf(pullHeightValue=384) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0015 begin`);
      const actual: boolean = isChangePageOf(384);
      logInfo(`isChangePageOf(pullHeightValue=384): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0016
     * @tc.name      PullToRefresh_IsChangePageOf_0016
     * @tc.desc      isChangePageOf(pullHeightValue=480) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0016 begin`);
      const actual: boolean = isChangePageOf(480);
      logInfo(`isChangePageOf(pullHeightValue=480): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0017
     * @tc.name      PullToRefresh_IsChangePageOf_0017
     * @tc.desc      isChangePageOf(pullHeightValue=576) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0017 begin`);
      const actual: boolean = isChangePageOf(576);
      logInfo(`isChangePageOf(pullHeightValue=576): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0018
     * @tc.name      PullToRefresh_IsChangePageOf_0018
     * @tc.desc      isChangePageOf(pullHeightValue=672) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0018 begin`);
      const actual: boolean = isChangePageOf(672);
      logInfo(`isChangePageOf(pullHeightValue=672): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0019
     * @tc.name      PullToRefresh_IsChangePageOf_0019
     * @tc.desc      isChangePageOf(pullHeightValue=768) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0019 begin`);
      const actual: boolean = isChangePageOf(768);
      logInfo(`isChangePageOf(pullHeightValue=768): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0020
     * @tc.name      PullToRefresh_IsChangePageOf_0020
     * @tc.desc      isChangePageOf(pullHeightValue=864) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0020 begin`);
      const actual: boolean = isChangePageOf(864);
      logInfo(`isChangePageOf(pullHeightValue=864): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0021
     * @tc.name      PullToRefresh_IsChangePageOf_0021
     * @tc.desc      isChangePageOf(pullHeightValue=960) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0021 begin`);
      const actual: boolean = isChangePageOf(960);
      logInfo(`isChangePageOf(pullHeightValue=960): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0022
     * @tc.name      PullToRefresh_IsChangePageOf_0022
     * @tc.desc      isChangePageOf(pullHeightValue=1056) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0022 begin`);
      const actual: boolean = isChangePageOf(1056);
      logInfo(`isChangePageOf(pullHeightValue=1056): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0023
     * @tc.name      PullToRefresh_IsChangePageOf_0023
     * @tc.desc      isChangePageOf(pullHeightValue=1152) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0023 begin`);
      const actual: boolean = isChangePageOf(1152);
      logInfo(`isChangePageOf(pullHeightValue=1152): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0024
     * @tc.name      PullToRefresh_IsChangePageOf_0024
     * @tc.desc      isChangePageOf(pullHeightValue=1248) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0024 begin`);
      const actual: boolean = isChangePageOf(1248);
      logInfo(`isChangePageOf(pullHeightValue=1248): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0025
     * @tc.name      PullToRefresh_IsChangePageOf_0025
     * @tc.desc      isChangePageOf(pullHeightValue=1344) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0025 begin`);
      const actual: boolean = isChangePageOf(1344);
      logInfo(`isChangePageOf(pullHeightValue=1344): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0026
     * @tc.name      PullToRefresh_IsChangePageOf_0026
     * @tc.desc      isChangePageOf(pullHeightValue=1440) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0026 begin`);
      const actual: boolean = isChangePageOf(1440);
      logInfo(`isChangePageOf(pullHeightValue=1440): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0027
     * @tc.name      PullToRefresh_IsChangePageOf_0027
     * @tc.desc      isChangePageOf(pullHeightValue=1536) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0027 begin`);
      const actual: boolean = isChangePageOf(1536);
      logInfo(`isChangePageOf(pullHeightValue=1536): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0028
     * @tc.name      PullToRefresh_IsChangePageOf_0028
     * @tc.desc      isChangePageOf(pullHeightValue=1632) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0028 begin`);
      const actual: boolean = isChangePageOf(1632);
      logInfo(`isChangePageOf(pullHeightValue=1632): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0029
     * @tc.name      PullToRefresh_IsChangePageOf_0029
     * @tc.desc      isChangePageOf(pullHeightValue=1728) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0029 begin`);
      const actual: boolean = isChangePageOf(1728);
      logInfo(`isChangePageOf(pullHeightValue=1728): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_IS_CHANGE_PAGE_OF_0030
     * @tc.name      PullToRefresh_IsChangePageOf_0030
     * @tc.desc      isChangePageOf(pullHeightValue=1824) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PullToRefresh_IsChangePageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsChangePageOf_0030 begin`);
      const actual: boolean = isChangePageOf(1824);
      logInfo(`isChangePageOf(pullHeightValue=1824): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsChangePageOf_0030 end`);
    });
  });
}
