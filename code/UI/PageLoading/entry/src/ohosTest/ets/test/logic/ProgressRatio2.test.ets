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
import { progressRatio } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for progressRatio (24 cases). */
export default function progressRatio2Test(): void {
  describe('ProgressRatio2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0097
     * @tc.name      PageLoading_ProgressRatio_0097
     * @tc.desc      progressRatio(progress=5964288) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0097 begin`);
      const actual: number = progressRatio(5964288);
      logInfo(`progressRatio(progress=5964288): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0098
     * @tc.name      PageLoading_ProgressRatio_0098
     * @tc.desc      progressRatio(progress=-3497829) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0098 begin`);
      const actual: number = progressRatio(-3497829);
      logInfo(`progressRatio(progress=-3497829): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0099
     * @tc.name      PageLoading_ProgressRatio_0099
     * @tc.desc      progressRatio(progress=-2560139) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0099 begin`);
      const actual: number = progressRatio(-2560139);
      logInfo(`progressRatio(progress=-2560139): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0100
     * @tc.name      PageLoading_ProgressRatio_0100
     * @tc.desc      progressRatio(progress=5579481) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0100 begin`);
      const actual: number = progressRatio(5579481);
      logInfo(`progressRatio(progress=5579481): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0101
     * @tc.name      PageLoading_ProgressRatio_0101
     * @tc.desc      progressRatio(progress=-2851568) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0101 begin`);
      const actual: number = progressRatio(-2851568);
      logInfo(`progressRatio(progress=-2851568): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0102
     * @tc.name      PageLoading_ProgressRatio_0102
     * @tc.desc      progressRatio(progress=6976890) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0102 begin`);
      const actual: number = progressRatio(6976890);
      logInfo(`progressRatio(progress=6976890): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0103
     * @tc.name      PageLoading_ProgressRatio_0103
     * @tc.desc      progressRatio(progress=3656729) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0103 begin`);
      const actual: number = progressRatio(3656729);
      logInfo(`progressRatio(progress=3656729): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0104
     * @tc.name      PageLoading_ProgressRatio_0104
     * @tc.desc      progressRatio(progress=2681834) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0104 begin`);
      const actual: number = progressRatio(2681834);
      logInfo(`progressRatio(progress=2681834): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0105
     * @tc.name      PageLoading_ProgressRatio_0105
     * @tc.desc      progressRatio(progress=-1258050) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0105 begin`);
      const actual: number = progressRatio(-1258050);
      logInfo(`progressRatio(progress=-1258050): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0106
     * @tc.name      PageLoading_ProgressRatio_0106
     * @tc.desc      progressRatio(progress=1459296.7) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0106 begin`);
      const actual: number = progressRatio(1459296.7);
      logInfo(`progressRatio(progress=1459296.7): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0107
     * @tc.name      PageLoading_ProgressRatio_0107
     * @tc.desc      progressRatio(progress=3213368) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0107 begin`);
      const actual: number = progressRatio(3213368);
      logInfo(`progressRatio(progress=3213368): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0108
     * @tc.name      PageLoading_ProgressRatio_0108
     * @tc.desc      progressRatio(progress=-2012059) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0108 begin`);
      const actual: number = progressRatio(-2012059);
      logInfo(`progressRatio(progress=-2012059): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0109
     * @tc.name      PageLoading_ProgressRatio_0109
     * @tc.desc      progressRatio(progress=7059361) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0109 begin`);
      const actual: number = progressRatio(7059361);
      logInfo(`progressRatio(progress=7059361): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0110
     * @tc.name      PageLoading_ProgressRatio_0110
     * @tc.desc      progressRatio(progress=6142524) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0110 begin`);
      const actual: number = progressRatio(6142524);
      logInfo(`progressRatio(progress=6142524): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0111
     * @tc.name      PageLoading_ProgressRatio_0111
     * @tc.desc      progressRatio(progress=3031965.99) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0111 begin`);
      const actual: number = progressRatio(3031965.99);
      logInfo(`progressRatio(progress=3031965.99): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0112
     * @tc.name      PageLoading_ProgressRatio_0112
     * @tc.desc      progressRatio(progress=5466107) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0112 begin`);
      const actual: number = progressRatio(5466107);
      logInfo(`progressRatio(progress=5466107): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0113
     * @tc.name      PageLoading_ProgressRatio_0113
     * @tc.desc      progressRatio(progress=4288543) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0113 begin`);
      const actual: number = progressRatio(4288543);
      logInfo(`progressRatio(progress=4288543): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0114
     * @tc.name      PageLoading_ProgressRatio_0114
     * @tc.desc      progressRatio(progress=1651812) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0114 begin`);
      const actual: number = progressRatio(1651812);
      logInfo(`progressRatio(progress=1651812): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0115
     * @tc.name      PageLoading_ProgressRatio_0115
     * @tc.desc      progressRatio(progress=1930853.27) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0115 begin`);
      const actual: number = progressRatio(1930853.27);
      logInfo(`progressRatio(progress=1930853.27): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0116
     * @tc.name      PageLoading_ProgressRatio_0116
     * @tc.desc      progressRatio(progress=-2503436) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0116 begin`);
      const actual: number = progressRatio(-2503436);
      logInfo(`progressRatio(progress=-2503436): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0117
     * @tc.name      PageLoading_ProgressRatio_0117
     * @tc.desc      progressRatio(progress=-1268580) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0117 begin`);
      const actual: number = progressRatio(-1268580);
      logInfo(`progressRatio(progress=-1268580): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0118
     * @tc.name      PageLoading_ProgressRatio_0118
     * @tc.desc      progressRatio(progress=-565491) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0118 begin`);
      const actual: number = progressRatio(-565491);
      logInfo(`progressRatio(progress=-565491): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0119
     * @tc.name      PageLoading_ProgressRatio_0119
     * @tc.desc      progressRatio(progress=1442527.34) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_ProgressRatio_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ProgressRatio_0119 begin`);
      const actual: number = progressRatio(1442527.34);
      logInfo(`progressRatio(progress=1442527.34): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ProgressRatio_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_PROGRESS_RATIO_0120
     * @tc.name      PageLoading_ProgressRatio_0120
     * @tc.desc      progressRatio(progress=-3467904) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_ProgressRatio_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ProgressRatio_0120 begin`);
      const actual: number = progressRatio(-3467904);
      logInfo(`progressRatio(progress=-3467904): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ProgressRatio_0120 end`);
    });
  });
}
