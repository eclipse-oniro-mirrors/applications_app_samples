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
import { pullUpStateOf } from '../model/PullRefreshLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PullToRefresh]';
const BUNDLE: string = 'PullToRefresh_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for pullUpStateOf (50 cases). */
export default function pullUpStateOfTest(): void {
  describe('PullUpStateOfTest', (): void => {
    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0001
     * @tc.name      PullToRefresh_PullUpStateOf_0001
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=0) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullUpStateOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0001 begin`);
      const actual: number = pullUpStateOf(-100, 0);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0001 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0002
     * @tc.name      PullToRefresh_PullUpStateOf_0002
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=360) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PullToRefresh_PullUpStateOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0002 begin`);
      const actual: number = pullUpStateOf(-100, 360);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0002 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0003
     * @tc.name      PullToRefresh_PullUpStateOf_0003
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0003 begin`);
      const actual: number = pullUpStateOf(-100, 1);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0003 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0004
     * @tc.name      PullToRefresh_PullUpStateOf_0004
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=100) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0004 begin`);
      const actual: number = pullUpStateOf(-100, 100);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0004 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0005
     * @tc.name      PullToRefresh_PullUpStateOf_0005
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=720) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0005 begin`);
      const actual: number = pullUpStateOf(-100, 720);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0005 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0006
     * @tc.name      PullToRefresh_PullUpStateOf_0006
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1080) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0006 begin`);
      const actual: number = pullUpStateOf(-100, 1080);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0006 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0007
     * @tc.name      PullToRefresh_PullUpStateOf_0007
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1920) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0007 begin`);
      const actual: number = pullUpStateOf(-100, 1920);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0007 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0008
     * @tc.name      PullToRefresh_PullUpStateOf_0008
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=-1) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0008 begin`);
      const actual: number = pullUpStateOf(-100, -1);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0008 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0009
     * @tc.name      PullToRefresh_PullUpStateOf_0009
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=2) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0009 begin`);
      const actual: number = pullUpStateOf(-100, 2);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0009 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0010
     * @tc.name      PullToRefresh_PullUpStateOf_0010
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=3) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0010 begin`);
      const actual: number = pullUpStateOf(-100, 3);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0010 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0011
     * @tc.name      PullToRefresh_PullUpStateOf_0011
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=10) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0011 begin`);
      const actual: number = pullUpStateOf(-100, 10);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0011 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0012
     * @tc.name      PullToRefresh_PullUpStateOf_0012
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=96) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0012 begin`);
      const actual: number = pullUpStateOf(-100, 96);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0012 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0013
     * @tc.name      PullToRefresh_PullUpStateOf_0013
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=192) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0013 begin`);
      const actual: number = pullUpStateOf(-100, 192);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0013 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0014
     * @tc.name      PullToRefresh_PullUpStateOf_0014
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=288) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0014 begin`);
      const actual: number = pullUpStateOf(-100, 288);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0014 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0015
     * @tc.name      PullToRefresh_PullUpStateOf_0015
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=384) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0015 begin`);
      const actual: number = pullUpStateOf(-100, 384);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0015 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0016
     * @tc.name      PullToRefresh_PullUpStateOf_0016
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=480) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0016 begin`);
      const actual: number = pullUpStateOf(-100, 480);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0016 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0017
     * @tc.name      PullToRefresh_PullUpStateOf_0017
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=576) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0017 begin`);
      const actual: number = pullUpStateOf(-100, 576);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0017 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0018
     * @tc.name      PullToRefresh_PullUpStateOf_0018
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=672) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0018 begin`);
      const actual: number = pullUpStateOf(-100, 672);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0018 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0019
     * @tc.name      PullToRefresh_PullUpStateOf_0019
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=768) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0019 begin`);
      const actual: number = pullUpStateOf(-100, 768);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0019 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0020
     * @tc.name      PullToRefresh_PullUpStateOf_0020
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=864) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0020 begin`);
      const actual: number = pullUpStateOf(-100, 864);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0020 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0021
     * @tc.name      PullToRefresh_PullUpStateOf_0021
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=960) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0021 begin`);
      const actual: number = pullUpStateOf(-100, 960);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0021 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0022
     * @tc.name      PullToRefresh_PullUpStateOf_0022
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1056) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0022 begin`);
      const actual: number = pullUpStateOf(-100, 1056);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0022 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0023
     * @tc.name      PullToRefresh_PullUpStateOf_0023
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1152) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0023 begin`);
      const actual: number = pullUpStateOf(-100, 1152);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0023 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0024
     * @tc.name      PullToRefresh_PullUpStateOf_0024
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1248) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0024 begin`);
      const actual: number = pullUpStateOf(-100, 1248);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0024 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0025
     * @tc.name      PullToRefresh_PullUpStateOf_0025
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1344) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0025 begin`);
      const actual: number = pullUpStateOf(-100, 1344);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0025 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0026
     * @tc.name      PullToRefresh_PullUpStateOf_0026
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1440) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0026 begin`);
      const actual: number = pullUpStateOf(-100, 1440);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0026 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0027
     * @tc.name      PullToRefresh_PullUpStateOf_0027
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1536) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0027 begin`);
      const actual: number = pullUpStateOf(-100, 1536);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0027 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0028
     * @tc.name      PullToRefresh_PullUpStateOf_0028
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1632) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0028 begin`);
      const actual: number = pullUpStateOf(-100, 1632);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0028 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0029
     * @tc.name      PullToRefresh_PullUpStateOf_0029
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1728) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0029 begin`);
      const actual: number = pullUpStateOf(-100, 1728);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0029 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0030
     * @tc.name      PullToRefresh_PullUpStateOf_0030
     * @tc.desc      pullUpStateOf(trYBottom=-100, loadImgHeight=1824) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0030 begin`);
      const actual: number = pullUpStateOf(-100, 1824);
      logInfo(`pullUpStateOf(trYBottom=-100, loadImgHeig...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0030 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0031
     * @tc.name      PullToRefresh_PullUpStateOf_0031
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=0) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0031 begin`);
      const actual: number = pullUpStateOf(-1, 0);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight=0): actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0031 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0032
     * @tc.name      PullToRefresh_PullUpStateOf_0032
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=1) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0032 begin`);
      const actual: number = pullUpStateOf(-1, 1);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight=1): actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0032 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0033
     * @tc.name      PullToRefresh_PullUpStateOf_0033
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=100) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0033 begin`);
      const actual: number = pullUpStateOf(-1, 100);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0033 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0034
     * @tc.name      PullToRefresh_PullUpStateOf_0034
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=360) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0034 begin`);
      const actual: number = pullUpStateOf(-1, 360);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0034 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0035
     * @tc.name      PullToRefresh_PullUpStateOf_0035
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=720) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0035 begin`);
      const actual: number = pullUpStateOf(-1, 720);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0035 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0036
     * @tc.name      PullToRefresh_PullUpStateOf_0036
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=1080) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0036 begin`);
      const actual: number = pullUpStateOf(-1, 1080);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0036 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0037
     * @tc.name      PullToRefresh_PullUpStateOf_0037
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=1920) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0037 begin`);
      const actual: number = pullUpStateOf(-1, 1920);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0037 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0038
     * @tc.name      PullToRefresh_PullUpStateOf_0038
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=-1) returns 42
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0038 begin`);
      const actual: number = pullUpStateOf(-1, -1);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(42);
      logInfo(`${BUNDLE}PullUpStateOf_0038 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0039
     * @tc.name      PullToRefresh_PullUpStateOf_0039
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=2) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0039 begin`);
      const actual: number = pullUpStateOf(-1, 2);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight=2): actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0039 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0040
     * @tc.name      PullToRefresh_PullUpStateOf_0040
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=3) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0040 begin`);
      const actual: number = pullUpStateOf(-1, 3);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight=3): actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0040 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0041
     * @tc.name      PullToRefresh_PullUpStateOf_0041
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=10) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0041 begin`);
      const actual: number = pullUpStateOf(-1, 10);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0041 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0042
     * @tc.name      PullToRefresh_PullUpStateOf_0042
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=96) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0042 begin`);
      const actual: number = pullUpStateOf(-1, 96);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0042 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0043
     * @tc.name      PullToRefresh_PullUpStateOf_0043
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=192) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0043 begin`);
      const actual: number = pullUpStateOf(-1, 192);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0043 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0044
     * @tc.name      PullToRefresh_PullUpStateOf_0044
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=288) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0044 begin`);
      const actual: number = pullUpStateOf(-1, 288);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0044 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0045
     * @tc.name      PullToRefresh_PullUpStateOf_0045
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=384) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0045 begin`);
      const actual: number = pullUpStateOf(-1, 384);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0045 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0046
     * @tc.name      PullToRefresh_PullUpStateOf_0046
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=480) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0046 begin`);
      const actual: number = pullUpStateOf(-1, 480);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0046 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0047
     * @tc.name      PullToRefresh_PullUpStateOf_0047
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=576) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0047 begin`);
      const actual: number = pullUpStateOf(-1, 576);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0047 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0048
     * @tc.name      PullToRefresh_PullUpStateOf_0048
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=672) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0048 begin`);
      const actual: number = pullUpStateOf(-1, 672);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0048 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0049
     * @tc.name      PullToRefresh_PullUpStateOf_0049
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=768) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0049 begin`);
      const actual: number = pullUpStateOf(-1, 768);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0049 end`);
    });

    /**
     * @tc.number    SUB_PULLTOREFRESH_PULL_UP_STATE_OF_0050
     * @tc.name      PullToRefresh_PullUpStateOf_0050
     * @tc.desc      pullUpStateOf(trYBottom=-1, loadImgHeight=864) returns 41
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PullToRefresh_PullUpStateOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}PullUpStateOf_0050 begin`);
      const actual: number = pullUpStateOf(-1, 864);
      logInfo(`pullUpStateOf(trYBottom=-1, loadImgHeight...: actual=${actual}`);
      expect(actual).assertEqual(41);
      logInfo(`${BUNDLE}PullUpStateOf_0050 end`);
    });
  });
}
