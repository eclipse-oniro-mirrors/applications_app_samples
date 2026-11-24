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
import { progressAt } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for progressAt (24 cases). */
export default function progressAt2Test(): void {
  describe('ProgressAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0097
     * @tc.name      PageLoading_ProgressAt_0097
     * @tc.desc      progressAt(elapsedMs=3469920) returns 69390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0097 begin`);
      const actual: number = progressAt(3469920);
      logInfo(`progressAt(elapsedMs=3469920): actual=${actual}`);
      expect(actual).assertEqual(69390);
      logInfo(`${BUNDLE}ProgressAt_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0098
     * @tc.name      PageLoading_ProgressAt_0098
     * @tc.desc      progressAt(elapsedMs=7091125) returns 141820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0098 begin`);
      const actual: number = progressAt(7091125);
      logInfo(`progressAt(elapsedMs=7091125): actual=${actual}`);
      expect(actual).assertEqual(141820);
      logInfo(`${BUNDLE}ProgressAt_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0099
     * @tc.name      PageLoading_ProgressAt_0099
     * @tc.desc      progressAt(elapsedMs=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_ProgressAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ProgressAt_0099 begin`);
      const actual: number = progressAt(-1);
      logInfo(`progressAt(elapsedMs=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0100
     * @tc.name      PageLoading_ProgressAt_0100
     * @tc.desc      progressAt(elapsedMs=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_ProgressAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ProgressAt_0100 begin`);
      const actual: number = progressAt(1);
      logInfo(`progressAt(elapsedMs=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0101
     * @tc.name      PageLoading_ProgressAt_0101
     * @tc.desc      progressAt(elapsedMs=999) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0101 begin`);
      const actual: number = progressAt(999);
      logInfo(`progressAt(elapsedMs=999): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ProgressAt_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0102
     * @tc.name      PageLoading_ProgressAt_0102
     * @tc.desc      progressAt(elapsedMs=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0102 begin`);
      const actual: number = progressAt(2);
      logInfo(`progressAt(elapsedMs=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0103
     * @tc.name      PageLoading_ProgressAt_0103
     * @tc.desc      progressAt(elapsedMs=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0103 begin`);
      const actual: number = progressAt(3);
      logInfo(`progressAt(elapsedMs=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0104
     * @tc.name      PageLoading_ProgressAt_0104
     * @tc.desc      progressAt(elapsedMs=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0104 begin`);
      const actual: number = progressAt(10);
      logInfo(`progressAt(elapsedMs=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0105
     * @tc.name      PageLoading_ProgressAt_0105
     * @tc.desc      progressAt(elapsedMs=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressAt_0105 begin`);
      const actual: number = progressAt(100);
      logInfo(`progressAt(elapsedMs=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0106
     * @tc.name      PageLoading_ProgressAt_0106
     * @tc.desc      progressAt(elapsedMs=-2118779) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0106 begin`);
      const actual: number = progressAt(-2118779);
      logInfo(`progressAt(elapsedMs=-2118779): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0107
     * @tc.name      PageLoading_ProgressAt_0107
     * @tc.desc      progressAt(elapsedMs=-2869016) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0107 begin`);
      const actual: number = progressAt(-2869016);
      logInfo(`progressAt(elapsedMs=-2869016): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0108
     * @tc.name      PageLoading_ProgressAt_0108
     * @tc.desc      progressAt(elapsedMs=-801940) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0108 begin`);
      const actual: number = progressAt(-801940);
      logInfo(`progressAt(elapsedMs=-801940): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0109
     * @tc.name      PageLoading_ProgressAt_0109
     * @tc.desc      progressAt(elapsedMs=-1237213) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0109 begin`);
      const actual: number = progressAt(-1237213);
      logInfo(`progressAt(elapsedMs=-1237213): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0110
     * @tc.name      PageLoading_ProgressAt_0110
     * @tc.desc      progressAt(elapsedMs=-1894417) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0110 begin`);
      const actual: number = progressAt(-1894417);
      logInfo(`progressAt(elapsedMs=-1894417): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0111
     * @tc.name      PageLoading_ProgressAt_0111
     * @tc.desc      progressAt(elapsedMs=-1579801) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0111 begin`);
      const actual: number = progressAt(-1579801);
      logInfo(`progressAt(elapsedMs=-1579801): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0112
     * @tc.name      PageLoading_ProgressAt_0112
     * @tc.desc      progressAt(elapsedMs=-1475192) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0112 begin`);
      const actual: number = progressAt(-1475192);
      logInfo(`progressAt(elapsedMs=-1475192): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0113
     * @tc.name      PageLoading_ProgressAt_0113
     * @tc.desc      progressAt(elapsedMs=-3191146) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0113 begin`);
      const actual: number = progressAt(-3191146);
      logInfo(`progressAt(elapsedMs=-3191146): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0114
     * @tc.name      PageLoading_ProgressAt_0114
     * @tc.desc      progressAt(elapsedMs=-248961) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0114 begin`);
      const actual: number = progressAt(-248961);
      logInfo(`progressAt(elapsedMs=-248961): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0115
     * @tc.name      PageLoading_ProgressAt_0115
     * @tc.desc      progressAt(elapsedMs=-2179291) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0115 begin`);
      const actual: number = progressAt(-2179291);
      logInfo(`progressAt(elapsedMs=-2179291): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0116
     * @tc.name      PageLoading_ProgressAt_0116
     * @tc.desc      progressAt(elapsedMs=-3188286) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0116 begin`);
      const actual: number = progressAt(-3188286);
      logInfo(`progressAt(elapsedMs=-3188286): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0117
     * @tc.name      PageLoading_ProgressAt_0117
     * @tc.desc      progressAt(elapsedMs=-2104963) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0117 begin`);
      const actual: number = progressAt(-2104963);
      logInfo(`progressAt(elapsedMs=-2104963): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0118
     * @tc.name      PageLoading_ProgressAt_0118
     * @tc.desc      progressAt(elapsedMs=-2377457) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0118 begin`);
      const actual: number = progressAt(-2377457);
      logInfo(`progressAt(elapsedMs=-2377457): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0119
     * @tc.name      PageLoading_ProgressAt_0119
     * @tc.desc      progressAt(elapsedMs=-439982) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0119 begin`);
      const actual: number = progressAt(-439982);
      logInfo(`progressAt(elapsedMs=-439982): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_AT_0120
     * @tc.name      PageLoading_ProgressAt_0120
     * @tc.desc      progressAt(elapsedMs=-671397) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressAt_0120 begin`);
      const actual: number = progressAt(-671397);
      logInfo(`progressAt(elapsedMs=-671397): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressAt_0120 end`);
    });
  });
}
