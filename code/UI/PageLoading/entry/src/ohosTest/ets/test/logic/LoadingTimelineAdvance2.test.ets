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
import { LoadingTimeline } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for LoadingTimeline.advance (30 cases). */
export default function loadingTimelineAdvance2Test(): void {
  describe('LoadingTimelineAdvance2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0091
     * @tc.name      PageLoading_LoadingTimelineAdvance_0091
     * @tc.desc      LoadingTimeline.advance(ms=4636635) yields 92730
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0091 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4636635);
      logInfo(`advance(ms=4636635): actual=${actual}`);
      expect(actual).assertEqual(92730);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0092
     * @tc.name      PageLoading_LoadingTimelineAdvance_0092
     * @tc.desc      LoadingTimeline.advance(ms=5996181) yields 119920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0092 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5996181);
      logInfo(`advance(ms=5996181): actual=${actual}`);
      expect(actual).assertEqual(119920);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0093
     * @tc.name      PageLoading_LoadingTimelineAdvance_0093
     * @tc.desc      LoadingTimeline.advance(ms=81507) yields 1630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0093 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(81507);
      logInfo(`advance(ms=81507): actual=${actual}`);
      expect(actual).assertEqual(1630);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0094
     * @tc.name      PageLoading_LoadingTimelineAdvance_0094
     * @tc.desc      LoadingTimeline.advance(ms=6717.52) yields 130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0094 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6717.52);
      logInfo(`advance(ms=6717.52): actual=${actual}`);
      expect(actual).assertEqual(130);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0095
     * @tc.name      PageLoading_LoadingTimelineAdvance_0095
     * @tc.desc      LoadingTimeline.advance(ms=3234590.96) yields 64690
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0095 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3234590.96);
      logInfo(`advance(ms=3234590.96): actual=${actual}`);
      expect(actual).assertEqual(64690);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0096
     * @tc.name      PageLoading_LoadingTimelineAdvance_0096
     * @tc.desc      LoadingTimeline.advance(ms=2134238.89) yields 42680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0096 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2134238.89);
      logInfo(`advance(ms=2134238.89): actual=${actual}`);
      expect(actual).assertEqual(42680);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0096 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0097
     * @tc.name      PageLoading_LoadingTimelineAdvance_0097
     * @tc.desc      LoadingTimeline.advance(ms=2513375.22) yields 50260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0097 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2513375.22);
      logInfo(`advance(ms=2513375.22): actual=${actual}`);
      expect(actual).assertEqual(50260);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0098
     * @tc.name      PageLoading_LoadingTimelineAdvance_0098
     * @tc.desc      LoadingTimeline.advance(ms=6892015) yields 137840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0098 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6892015);
      logInfo(`advance(ms=6892015): actual=${actual}`);
      expect(actual).assertEqual(137840);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0099
     * @tc.name      PageLoading_LoadingTimelineAdvance_0099
     * @tc.desc      LoadingTimeline.advance(ms=2216807.81) yields 44330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0099 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2216807.81);
      logInfo(`advance(ms=2216807.81): actual=${actual}`);
      expect(actual).assertEqual(44330);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0100
     * @tc.name      PageLoading_LoadingTimelineAdvance_0100
     * @tc.desc      LoadingTimeline.advance(ms=4536256) yields 90720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0100 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4536256);
      logInfo(`advance(ms=4536256): actual=${actual}`);
      expect(actual).assertEqual(90720);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0101
     * @tc.name      PageLoading_LoadingTimelineAdvance_0101
     * @tc.desc      LoadingTimeline.advance(ms=-1) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_LoadingTimelineAdvance_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0101 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-1);
      logInfo(`advance(ms=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0102
     * @tc.name      PageLoading_LoadingTimelineAdvance_0102
     * @tc.desc      LoadingTimeline.advance(ms=1) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('PageLoading_LoadingTimelineAdvance_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0102 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1);
      logInfo(`advance(ms=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0103
     * @tc.name      PageLoading_LoadingTimelineAdvance_0103
     * @tc.desc      LoadingTimeline.advance(ms=999) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0103 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(999);
      logInfo(`advance(ms=999): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0104
     * @tc.name      PageLoading_LoadingTimelineAdvance_0104
     * @tc.desc      LoadingTimeline.advance(ms=2) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0104 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2);
      logInfo(`advance(ms=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0105
     * @tc.name      PageLoading_LoadingTimelineAdvance_0105
     * @tc.desc      LoadingTimeline.advance(ms=3) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0105 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3);
      logInfo(`advance(ms=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0106
     * @tc.name      PageLoading_LoadingTimelineAdvance_0106
     * @tc.desc      LoadingTimeline.advance(ms=10) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0106 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(10);
      logInfo(`advance(ms=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0107
     * @tc.name      PageLoading_LoadingTimelineAdvance_0107
     * @tc.desc      LoadingTimeline.advance(ms=100) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0107 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(100);
      logInfo(`advance(ms=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0108
     * @tc.name      PageLoading_LoadingTimelineAdvance_0108
     * @tc.desc      LoadingTimeline.advance(ms=-1274684) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0108 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-1274684);
      logInfo(`advance(ms=-1274684): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0109
     * @tc.name      PageLoading_LoadingTimelineAdvance_0109
     * @tc.desc      LoadingTimeline.advance(ms=-2045340) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0109 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-2045340);
      logInfo(`advance(ms=-2045340): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0110
     * @tc.name      PageLoading_LoadingTimelineAdvance_0110
     * @tc.desc      LoadingTimeline.advance(ms=-42086) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0110 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-42086);
      logInfo(`advance(ms=-42086): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0111
     * @tc.name      PageLoading_LoadingTimelineAdvance_0111
     * @tc.desc      LoadingTimeline.advance(ms=1980295.07) yields 39600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0111 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1980295.07);
      logInfo(`advance(ms=1980295.07): actual=${actual}`);
      expect(actual).assertEqual(39600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0112
     * @tc.name      PageLoading_LoadingTimelineAdvance_0112
     * @tc.desc      LoadingTimeline.advance(ms=-259121) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0112 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-259121);
      logInfo(`advance(ms=-259121): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0113
     * @tc.name      PageLoading_LoadingTimelineAdvance_0113
     * @tc.desc      LoadingTimeline.advance(ms=-664914) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0113 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-664914);
      logInfo(`advance(ms=-664914): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0114
     * @tc.name      PageLoading_LoadingTimelineAdvance_0114
     * @tc.desc      LoadingTimeline.advance(ms=-3245598) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0114 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-3245598);
      logInfo(`advance(ms=-3245598): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0115
     * @tc.name      PageLoading_LoadingTimelineAdvance_0115
     * @tc.desc      LoadingTimeline.advance(ms=-664866) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0115 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-664866);
      logInfo(`advance(ms=-664866): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0116
     * @tc.name      PageLoading_LoadingTimelineAdvance_0116
     * @tc.desc      LoadingTimeline.advance(ms=-617465) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0116 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-617465);
      logInfo(`advance(ms=-617465): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0117
     * @tc.name      PageLoading_LoadingTimelineAdvance_0117
     * @tc.desc      LoadingTimeline.advance(ms=-2422) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0117 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-2422);
      logInfo(`advance(ms=-2422): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0118
     * @tc.name      PageLoading_LoadingTimelineAdvance_0118
     * @tc.desc      LoadingTimeline.advance(ms=-2715968) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0118 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-2715968);
      logInfo(`advance(ms=-2715968): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0119
     * @tc.name      PageLoading_LoadingTimelineAdvance_0119
     * @tc.desc      LoadingTimeline.advance(ms=-3535751) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0119 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-3535751);
      logInfo(`advance(ms=-3535751): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0120
     * @tc.name      PageLoading_LoadingTimelineAdvance_0120
     * @tc.desc      LoadingTimeline.advance(ms=-2463359) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('PageLoading_LoadingTimelineAdvance_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0120 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(-2463359);
      logInfo(`advance(ms=-2463359): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0120 end`);
    });
  });
}
