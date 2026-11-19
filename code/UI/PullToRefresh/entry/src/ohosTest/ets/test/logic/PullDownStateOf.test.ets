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
import { pullDownStateOf } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for pullDownStateOf (50 cases). */
export default function pullDownStateOfTest(): void {
  describe('PullDownStateOfTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0001
     * @tc.name      PullToRefresh_PullDownStateOf_0001
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=0) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullDownStateOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0001 begin`);
      const actual: number = pullDownStateOf(-100, 0);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0002
     * @tc.name      PullToRefresh_PullDownStateOf_0002
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=-1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullDownStateOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0002 begin`);
      const actual: number = pullDownStateOf(-1, -1);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=-1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}PullDownStateOf_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0003
     * @tc.name      PullToRefresh_PullDownStateOf_0003
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0003 begin`);
      const actual: number = pullDownStateOf(-100, 1);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0004
     * @tc.name      PullToRefresh_PullDownStateOf_0004
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=100) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0004 begin`);
      const actual: number = pullDownStateOf(-100, 100);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0005
     * @tc.name      PullToRefresh_PullDownStateOf_0005
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=360) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0005 begin`);
      const actual: number = pullDownStateOf(-100, 360);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0006
     * @tc.name      PullToRefresh_PullDownStateOf_0006
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=720) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0006 begin`);
      const actual: number = pullDownStateOf(-100, 720);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0007
     * @tc.name      PullToRefresh_PullDownStateOf_0007
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1080) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0007 begin`);
      const actual: number = pullDownStateOf(-100, 1080);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0008
     * @tc.name      PullToRefresh_PullDownStateOf_0008
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1920) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0008 begin`);
      const actual: number = pullDownStateOf(-100, 1920);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0009
     * @tc.name      PullToRefresh_PullDownStateOf_0009
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=-1) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0009 begin`);
      const actual: number = pullDownStateOf(-100, -1);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0010
     * @tc.name      PullToRefresh_PullDownStateOf_0010
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=2) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0010 begin`);
      const actual: number = pullDownStateOf(-100, 2);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0011
     * @tc.name      PullToRefresh_PullDownStateOf_0011
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=3) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0011 begin`);
      const actual: number = pullDownStateOf(-100, 3);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0012
     * @tc.name      PullToRefresh_PullDownStateOf_0012
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=10) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0012 begin`);
      const actual: number = pullDownStateOf(-100, 10);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0013
     * @tc.name      PullToRefresh_PullDownStateOf_0013
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=96) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0013 begin`);
      const actual: number = pullDownStateOf(-100, 96);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0014
     * @tc.name      PullToRefresh_PullDownStateOf_0014
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=192) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0014 begin`);
      const actual: number = pullDownStateOf(-100, 192);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0015
     * @tc.name      PullToRefresh_PullDownStateOf_0015
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=288) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0015 begin`);
      const actual: number = pullDownStateOf(-100, 288);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0016
     * @tc.name      PullToRefresh_PullDownStateOf_0016
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=384) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0016 begin`);
      const actual: number = pullDownStateOf(-100, 384);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0017
     * @tc.name      PullToRefresh_PullDownStateOf_0017
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=480) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0017 begin`);
      const actual: number = pullDownStateOf(-100, 480);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0018
     * @tc.name      PullToRefresh_PullDownStateOf_0018
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=576) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0018 begin`);
      const actual: number = pullDownStateOf(-100, 576);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0019
     * @tc.name      PullToRefresh_PullDownStateOf_0019
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=672) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0019 begin`);
      const actual: number = pullDownStateOf(-100, 672);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0020
     * @tc.name      PullToRefresh_PullDownStateOf_0020
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=768) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0020 begin`);
      const actual: number = pullDownStateOf(-100, 768);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0021
     * @tc.name      PullToRefresh_PullDownStateOf_0021
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=864) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0021 begin`);
      const actual: number = pullDownStateOf(-100, 864);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0022
     * @tc.name      PullToRefresh_PullDownStateOf_0022
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=960) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0022 begin`);
      const actual: number = pullDownStateOf(-100, 960);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0023
     * @tc.name      PullToRefresh_PullDownStateOf_0023
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1056) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0023 begin`);
      const actual: number = pullDownStateOf(-100, 1056);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0024
     * @tc.name      PullToRefresh_PullDownStateOf_0024
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1152) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0024 begin`);
      const actual: number = pullDownStateOf(-100, 1152);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0025
     * @tc.name      PullToRefresh_PullDownStateOf_0025
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1248) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0025 begin`);
      const actual: number = pullDownStateOf(-100, 1248);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0026
     * @tc.name      PullToRefresh_PullDownStateOf_0026
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1344) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0026 begin`);
      const actual: number = pullDownStateOf(-100, 1344);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0027
     * @tc.name      PullToRefresh_PullDownStateOf_0027
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1440) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0027 begin`);
      const actual: number = pullDownStateOf(-100, 1440);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0028
     * @tc.name      PullToRefresh_PullDownStateOf_0028
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1536) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0028 begin`);
      const actual: number = pullDownStateOf(-100, 1536);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0029
     * @tc.name      PullToRefresh_PullDownStateOf_0029
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1632) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0029 begin`);
      const actual: number = pullDownStateOf(-100, 1632);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0030
     * @tc.name      PullToRefresh_PullDownStateOf_0030
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1728) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0030 begin`);
      const actual: number = pullDownStateOf(-100, 1728);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0031
     * @tc.name      PullToRefresh_PullDownStateOf_0031
     * @tc.desc      pullDownStateOf(trYTop=-100, refreshHeight=1824) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0031 begin`);
      const actual: number = pullDownStateOf(-100, 1824);
      logInfo(`pullDownStateOf(trYTop=-100, refreshHeigh...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0032
     * @tc.name      PullToRefresh_PullDownStateOf_0032
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=0) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0032 begin`);
      const actual: number = pullDownStateOf(-1, 0);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=0): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0033
     * @tc.name      PullToRefresh_PullDownStateOf_0033
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=1) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0033 begin`);
      const actual: number = pullDownStateOf(-1, 1);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=1): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0034
     * @tc.name      PullToRefresh_PullDownStateOf_0034
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=100) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0034 begin`);
      const actual: number = pullDownStateOf(-1, 100);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0035
     * @tc.name      PullToRefresh_PullDownStateOf_0035
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=360) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0035 begin`);
      const actual: number = pullDownStateOf(-1, 360);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0036
     * @tc.name      PullToRefresh_PullDownStateOf_0036
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=720) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0036 begin`);
      const actual: number = pullDownStateOf(-1, 720);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0037
     * @tc.name      PullToRefresh_PullDownStateOf_0037
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=1080) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0037 begin`);
      const actual: number = pullDownStateOf(-1, 1080);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0038
     * @tc.name      PullToRefresh_PullDownStateOf_0038
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=1920) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0038 begin`);
      const actual: number = pullDownStateOf(-1, 1920);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0039
     * @tc.name      PullToRefresh_PullDownStateOf_0039
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=2) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0039 begin`);
      const actual: number = pullDownStateOf(-1, 2);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=2): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0040
     * @tc.name      PullToRefresh_PullDownStateOf_0040
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=3) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0040 begin`);
      const actual: number = pullDownStateOf(-1, 3);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=3): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0041
     * @tc.name      PullToRefresh_PullDownStateOf_0041
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=10) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0041 begin`);
      const actual: number = pullDownStateOf(-1, 10);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=10): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0042
     * @tc.name      PullToRefresh_PullDownStateOf_0042
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=96) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0042 begin`);
      const actual: number = pullDownStateOf(-1, 96);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=96): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0043
     * @tc.name      PullToRefresh_PullDownStateOf_0043
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=192) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0043 begin`);
      const actual: number = pullDownStateOf(-1, 192);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0044
     * @tc.name      PullToRefresh_PullDownStateOf_0044
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=288) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0044 begin`);
      const actual: number = pullDownStateOf(-1, 288);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0045
     * @tc.name      PullToRefresh_PullDownStateOf_0045
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=384) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0045 begin`);
      const actual: number = pullDownStateOf(-1, 384);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0046
     * @tc.name      PullToRefresh_PullDownStateOf_0046
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=480) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0046 begin`);
      const actual: number = pullDownStateOf(-1, 480);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0047
     * @tc.name      PullToRefresh_PullDownStateOf_0047
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=576) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0047 begin`);
      const actual: number = pullDownStateOf(-1, 576);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0048
     * @tc.name      PullToRefresh_PullDownStateOf_0048
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=672) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0048 begin`);
      const actual: number = pullDownStateOf(-1, 672);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0049
     * @tc.name      PullToRefresh_PullDownStateOf_0049
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=768) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0049 begin`);
      const actual: number = pullDownStateOf(-1, 768);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_DOWN_STATE_OF_0050
     * @tc.name      PullToRefresh_PullDownStateOf_0050
     * @tc.desc      pullDownStateOf(trYTop=-1, refreshHeight=864) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullDownStateOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullDownStateOf_0050 begin`);
      const actual: number = pullDownStateOf(-1, 864);
      logInfo(`pullDownStateOf(trYTop=-1, refreshHeight=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}PullDownStateOf_0050 end`);
    });
  });
}
