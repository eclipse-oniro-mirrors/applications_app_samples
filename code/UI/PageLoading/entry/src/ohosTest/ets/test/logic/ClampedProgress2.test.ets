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
import { clampedProgress } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for clampedProgress (24 cases). */
export default function clampedProgress2Test(): void {
  describe('ClampedProgress2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0097
     * @tc.name      PageLoading_ClampedProgress_0097
     * @tc.desc      clampedProgress(progress=5755553) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0097 begin`);
      const actual: number = clampedProgress(5755553);
      logInfo(`clampedProgress(progress=5755553): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0098
     * @tc.name      PageLoading_ClampedProgress_0098
     * @tc.desc      clampedProgress(progress=2564388.9) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0098 begin`);
      const actual: number = clampedProgress(2564388.9);
      logInfo(`clampedProgress(progress=2564388.9): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0099
     * @tc.name      PageLoading_ClampedProgress_0099
     * @tc.desc      clampedProgress(progress=811260.09) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0099 begin`);
      const actual: number = clampedProgress(811260.09);
      logInfo(`clampedProgress(progress=811260.09): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0100
     * @tc.name      PageLoading_ClampedProgress_0100
     * @tc.desc      clampedProgress(progress=2714032) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0100 begin`);
      const actual: number = clampedProgress(2714032);
      logInfo(`clampedProgress(progress=2714032): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0101
     * @tc.name      PageLoading_ClampedProgress_0101
     * @tc.desc      clampedProgress(progress=1482193.14) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0101 begin`);
      const actual: number = clampedProgress(1482193.14);
      logInfo(`clampedProgress(progress=1482193.14): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0102
     * @tc.name      PageLoading_ClampedProgress_0102
     * @tc.desc      clampedProgress(progress=5891028) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0102 begin`);
      const actual: number = clampedProgress(5891028);
      logInfo(`clampedProgress(progress=5891028): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0103
     * @tc.name      PageLoading_ClampedProgress_0103
     * @tc.desc      clampedProgress(progress=-334671) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0103 begin`);
      const actual: number = clampedProgress(-334671);
      logInfo(`clampedProgress(progress=-334671): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0104
     * @tc.name      PageLoading_ClampedProgress_0104
     * @tc.desc      clampedProgress(progress=3111514.94) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0104 begin`);
      const actual: number = clampedProgress(3111514.94);
      logInfo(`clampedProgress(progress=3111514.94): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0105
     * @tc.name      PageLoading_ClampedProgress_0105
     * @tc.desc      clampedProgress(progress=5276985) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0105 begin`);
      const actual: number = clampedProgress(5276985);
      logInfo(`clampedProgress(progress=5276985): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0106
     * @tc.name      PageLoading_ClampedProgress_0106
     * @tc.desc      clampedProgress(progress=2471099.62) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0106 begin`);
      const actual: number = clampedProgress(2471099.62);
      logInfo(`clampedProgress(progress=2471099.62): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0107
     * @tc.name      PageLoading_ClampedProgress_0107
     * @tc.desc      clampedProgress(progress=3441927) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0107 begin`);
      const actual: number = clampedProgress(3441927);
      logInfo(`clampedProgress(progress=3441927): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0108
     * @tc.name      PageLoading_ClampedProgress_0108
     * @tc.desc      clampedProgress(progress=-3589835) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0108 begin`);
      const actual: number = clampedProgress(-3589835);
      logInfo(`clampedProgress(progress=-3589835): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0109
     * @tc.name      PageLoading_ClampedProgress_0109
     * @tc.desc      clampedProgress(progress=1768059.98) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0109 begin`);
      const actual: number = clampedProgress(1768059.98);
      logInfo(`clampedProgress(progress=1768059.98): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0110
     * @tc.name      PageLoading_ClampedProgress_0110
     * @tc.desc      clampedProgress(progress=6381096) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0110 begin`);
      const actual: number = clampedProgress(6381096);
      logInfo(`clampedProgress(progress=6381096): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0111
     * @tc.name      PageLoading_ClampedProgress_0111
     * @tc.desc      clampedProgress(progress=2562459.29) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0111 begin`);
      const actual: number = clampedProgress(2562459.29);
      logInfo(`clampedProgress(progress=2562459.29): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0112
     * @tc.name      PageLoading_ClampedProgress_0112
     * @tc.desc      clampedProgress(progress=5514562) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0112 begin`);
      const actual: number = clampedProgress(5514562);
      logInfo(`clampedProgress(progress=5514562): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0113
     * @tc.name      PageLoading_ClampedProgress_0113
     * @tc.desc      clampedProgress(progress=208316) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0113 begin`);
      const actual: number = clampedProgress(208316);
      logInfo(`clampedProgress(progress=208316): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0114
     * @tc.name      PageLoading_ClampedProgress_0114
     * @tc.desc      clampedProgress(progress=1945040.13) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0114 begin`);
      const actual: number = clampedProgress(1945040.13);
      logInfo(`clampedProgress(progress=1945040.13): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0115
     * @tc.name      PageLoading_ClampedProgress_0115
     * @tc.desc      clampedProgress(progress=3335838.13) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0115 begin`);
      const actual: number = clampedProgress(3335838.13);
      logInfo(`clampedProgress(progress=3335838.13): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0116
     * @tc.name      PageLoading_ClampedProgress_0116
     * @tc.desc      clampedProgress(progress=2306788) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0116 begin`);
      const actual: number = clampedProgress(2306788);
      logInfo(`clampedProgress(progress=2306788): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0117
     * @tc.name      PageLoading_ClampedProgress_0117
     * @tc.desc      clampedProgress(progress=5167133) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0117 begin`);
      const actual: number = clampedProgress(5167133);
      logInfo(`clampedProgress(progress=5167133): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0118
     * @tc.name      PageLoading_ClampedProgress_0118
     * @tc.desc      clampedProgress(progress=4457363) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0118 begin`);
      const actual: number = clampedProgress(4457363);
      logInfo(`clampedProgress(progress=4457363): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0119
     * @tc.name      PageLoading_ClampedProgress_0119
     * @tc.desc      clampedProgress(progress=993510.71) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ClampedProgress_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClampedProgress_0119 begin`);
      const actual: number = clampedProgress(993510.71);
      logInfo(`clampedProgress(progress=993510.71): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}ClampedProgress_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_CLAMPED_PROGRESS_0120
     * @tc.name      PageLoading_ClampedProgress_0120
     * @tc.desc      clampedProgress(progress=-662328) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ClampedProgress_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClampedProgress_0120 begin`);
      const actual: number = clampedProgress(-662328);
      logInfo(`clampedProgress(progress=-662328): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ClampedProgress_0120 end`);
    });
  });
}
