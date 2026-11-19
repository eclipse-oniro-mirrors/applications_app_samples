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
import { drawsRefreshRing } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for drawsRefreshRing (50 cases). */
export default function drawsRefreshRingTest(): void {
  describe('DrawsRefreshRingTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0001
     * @tc.name      PullToRefresh_DrawsRefreshRing_0001
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_DrawsRefreshRing_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0001 begin`);
      const actual: boolean = drawsRefreshRing(-100, 0);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0002
     * @tc.name      PullToRefresh_DrawsRefreshRing_0002
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_DrawsRefreshRing_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0002 begin`);
      const actual: boolean = drawsRefreshRing(-1, -1);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}DrawsRefreshRing_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0003
     * @tc.name      PullToRefresh_DrawsRefreshRing_0003
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0003 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0004
     * @tc.name      PullToRefresh_DrawsRefreshRing_0004
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0004 begin`);
      const actual: boolean = drawsRefreshRing(-100, 100);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0005
     * @tc.name      PullToRefresh_DrawsRefreshRing_0005
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=360) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0005 begin`);
      const actual: boolean = drawsRefreshRing(-100, 360);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0006
     * @tc.name      PullToRefresh_DrawsRefreshRing_0006
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=720) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0006 begin`);
      const actual: boolean = drawsRefreshRing(-100, 720);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0007
     * @tc.name      PullToRefresh_DrawsRefreshRing_0007
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1080) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0007 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1080);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0008
     * @tc.name      PullToRefresh_DrawsRefreshRing_0008
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1920) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0008 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1920);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0009
     * @tc.name      PullToRefresh_DrawsRefreshRing_0009
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0009 begin`);
      const actual: boolean = drawsRefreshRing(-100, -1);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0010
     * @tc.name      PullToRefresh_DrawsRefreshRing_0010
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0010 begin`);
      const actual: boolean = drawsRefreshRing(-100, 2);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0011
     * @tc.name      PullToRefresh_DrawsRefreshRing_0011
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0011 begin`);
      const actual: boolean = drawsRefreshRing(-100, 3);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0012
     * @tc.name      PullToRefresh_DrawsRefreshRing_0012
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0012 begin`);
      const actual: boolean = drawsRefreshRing(-100, 10);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0013
     * @tc.name      PullToRefresh_DrawsRefreshRing_0013
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=96) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0013 begin`);
      const actual: boolean = drawsRefreshRing(-100, 96);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0014
     * @tc.name      PullToRefresh_DrawsRefreshRing_0014
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=192) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0014 begin`);
      const actual: boolean = drawsRefreshRing(-100, 192);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0015
     * @tc.name      PullToRefresh_DrawsRefreshRing_0015
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=288) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0015 begin`);
      const actual: boolean = drawsRefreshRing(-100, 288);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0016
     * @tc.name      PullToRefresh_DrawsRefreshRing_0016
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=384) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0016 begin`);
      const actual: boolean = drawsRefreshRing(-100, 384);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0017
     * @tc.name      PullToRefresh_DrawsRefreshRing_0017
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=480) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0017 begin`);
      const actual: boolean = drawsRefreshRing(-100, 480);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0018
     * @tc.name      PullToRefresh_DrawsRefreshRing_0018
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=576) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0018 begin`);
      const actual: boolean = drawsRefreshRing(-100, 576);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0019
     * @tc.name      PullToRefresh_DrawsRefreshRing_0019
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=672) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0019 begin`);
      const actual: boolean = drawsRefreshRing(-100, 672);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0020
     * @tc.name      PullToRefresh_DrawsRefreshRing_0020
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=768) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0020 begin`);
      const actual: boolean = drawsRefreshRing(-100, 768);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0021
     * @tc.name      PullToRefresh_DrawsRefreshRing_0021
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=864) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0021 begin`);
      const actual: boolean = drawsRefreshRing(-100, 864);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0022
     * @tc.name      PullToRefresh_DrawsRefreshRing_0022
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=960) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0022 begin`);
      const actual: boolean = drawsRefreshRing(-100, 960);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0023
     * @tc.name      PullToRefresh_DrawsRefreshRing_0023
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1056) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0023 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1056);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0024
     * @tc.name      PullToRefresh_DrawsRefreshRing_0024
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1152) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0024 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1152);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0025
     * @tc.name      PullToRefresh_DrawsRefreshRing_0025
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1248) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0025 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1248);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0026
     * @tc.name      PullToRefresh_DrawsRefreshRing_0026
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1344) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0026 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1344);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0027
     * @tc.name      PullToRefresh_DrawsRefreshRing_0027
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1440) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0027 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1440);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0028
     * @tc.name      PullToRefresh_DrawsRefreshRing_0028
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1536) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0028 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1536);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0029
     * @tc.name      PullToRefresh_DrawsRefreshRing_0029
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1632) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0029 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1632);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0030
     * @tc.name      PullToRefresh_DrawsRefreshRing_0030
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1728) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0030 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1728);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0031
     * @tc.name      PullToRefresh_DrawsRefreshRing_0031
     * @tc.desc      drawsRefreshRing(trYTop=-100, refreshHeight=1824) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0031 begin`);
      const actual: boolean = drawsRefreshRing(-100, 1824);
      logInfo(`drawsRefreshRing(trYTop=-100, refreshHeig...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0032
     * @tc.name      PullToRefresh_DrawsRefreshRing_0032
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0032 begin`);
      const actual: boolean = drawsRefreshRing(-1, 0);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0033
     * @tc.name      PullToRefresh_DrawsRefreshRing_0033
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0033 begin`);
      const actual: boolean = drawsRefreshRing(-1, 1);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0034
     * @tc.name      PullToRefresh_DrawsRefreshRing_0034
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0034 begin`);
      const actual: boolean = drawsRefreshRing(-1, 100);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0035
     * @tc.name      PullToRefresh_DrawsRefreshRing_0035
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=360) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0035 begin`);
      const actual: boolean = drawsRefreshRing(-1, 360);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0036
     * @tc.name      PullToRefresh_DrawsRefreshRing_0036
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=720) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0036 begin`);
      const actual: boolean = drawsRefreshRing(-1, 720);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0037
     * @tc.name      PullToRefresh_DrawsRefreshRing_0037
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=1080) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0037 begin`);
      const actual: boolean = drawsRefreshRing(-1, 1080);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0038
     * @tc.name      PullToRefresh_DrawsRefreshRing_0038
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=1920) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0038 begin`);
      const actual: boolean = drawsRefreshRing(-1, 1920);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0039
     * @tc.name      PullToRefresh_DrawsRefreshRing_0039
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0039 begin`);
      const actual: boolean = drawsRefreshRing(-1, 2);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0040
     * @tc.name      PullToRefresh_DrawsRefreshRing_0040
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0040 begin`);
      const actual: boolean = drawsRefreshRing(-1, 3);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0041
     * @tc.name      PullToRefresh_DrawsRefreshRing_0041
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0041 begin`);
      const actual: boolean = drawsRefreshRing(-1, 10);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0042
     * @tc.name      PullToRefresh_DrawsRefreshRing_0042
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=96) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0042 begin`);
      const actual: boolean = drawsRefreshRing(-1, 96);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0043
     * @tc.name      PullToRefresh_DrawsRefreshRing_0043
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=192) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0043 begin`);
      const actual: boolean = drawsRefreshRing(-1, 192);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0044
     * @tc.name      PullToRefresh_DrawsRefreshRing_0044
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=288) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0044 begin`);
      const actual: boolean = drawsRefreshRing(-1, 288);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0045
     * @tc.name      PullToRefresh_DrawsRefreshRing_0045
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=384) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0045 begin`);
      const actual: boolean = drawsRefreshRing(-1, 384);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0046
     * @tc.name      PullToRefresh_DrawsRefreshRing_0046
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=480) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0046 begin`);
      const actual: boolean = drawsRefreshRing(-1, 480);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0047
     * @tc.name      PullToRefresh_DrawsRefreshRing_0047
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=576) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0047 begin`);
      const actual: boolean = drawsRefreshRing(-1, 576);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0048
     * @tc.name      PullToRefresh_DrawsRefreshRing_0048
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=672) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0048 begin`);
      const actual: boolean = drawsRefreshRing(-1, 672);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0049
     * @tc.name      PullToRefresh_DrawsRefreshRing_0049
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=768) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0049 begin`);
      const actual: boolean = drawsRefreshRing(-1, 768);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_DRAWS_REFRESH_RING_0050
     * @tc.name      PullToRefresh_DrawsRefreshRing_0050
     * @tc.desc      drawsRefreshRing(trYTop=-1, refreshHeight=864) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_DrawsRefreshRing_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DrawsRefreshRing_0050 begin`);
      const actual: boolean = drawsRefreshRing(-1, 864);
      logInfo(`drawsRefreshRing(trYTop=-1, refreshHeight...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}DrawsRefreshRing_0050 end`);
    });
  });
}
