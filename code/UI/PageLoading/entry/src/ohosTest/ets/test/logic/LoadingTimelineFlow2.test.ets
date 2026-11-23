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

/** Logic checks for LoadingTimeline flow (61 cases). */
export default function loadingTimelineFlow2Test(): void {
  describe('LoadingTimelineFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0061
     * @tc.name      PageLoading_LoadingTimelineFlow_0061
     * @tc.desc      LoadingTimeline call flow history > history > text > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0061 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0062
     * @tc.name      PageLoading_LoadingTimelineFlow_0062
     * @tc.desc      LoadingTimeline call flow nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0062 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(4860000);
      logInfo(`step2 advance(4860000): step2=${step2}`);
      expect(step2).assertEqual(97200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0063
     * @tc.name      PageLoading_LoadingTimelineFlow_0063
     * @tc.desc      LoadingTimeline call flow nowProgress > text > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0063 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0064
     * @tc.name      PageLoading_LoadingTimelineFlow_0064
     * @tc.desc      LoadingTimeline call flow isLoading > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0064 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0065
     * @tc.name      PageLoading_LoadingTimelineFlow_0065
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0065 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(2513375.22);
      logInfo(`step1 advance(2513375.22): step1=${step1}`);
      expect(step1).assertEqual(50260);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(50260);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(50260);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0066
     * @tc.name      PageLoading_LoadingTimelineFlow_0066
     * @tc.desc      LoadingTimeline call flow nowProgress > isLoading > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0066 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(339813);
      logInfo(`step3 advance(339813): step3=${step3}`);
      expect(step3).assertEqual(6790);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0067
     * @tc.name      PageLoading_LoadingTimelineFlow_0067
     * @tc.desc      LoadingTimeline call flow history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0067 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0068
     * @tc.name      PageLoading_LoadingTimelineFlow_0068
     * @tc.desc      LoadingTimeline call flow isLoading > history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0068 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.advance(2);
      logInfo(`step3 advance(2): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0069
     * @tc.name      PageLoading_LoadingTimelineFlow_0069
     * @tc.desc      LoadingTimeline call flow isLoading > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0069 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.advance(4033534);
      logInfo(`step3 advance(4033534): step3=${step3}`);
      expect(step3).assertEqual(80670);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0070
     * @tc.name      PageLoading_LoadingTimelineFlow_0070
     * @tc.desc      LoadingTimeline call flow text > text > history > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0070 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0071
     * @tc.name      PageLoading_LoadingTimelineFlow_0071
     * @tc.desc      LoadingTimeline call flow advance > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0071 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3213726);
      logInfo(`step1 advance(3213726): step1=${step1}`);
      expect(step1).assertEqual(64270);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0072
     * @tc.name      PageLoading_LoadingTimelineFlow_0072
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0072 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(4860000);
      logInfo(`step1 advance(4860000): step1=${step1}`);
      expect(step1).assertEqual(97200);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(97200);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0073
     * @tc.name      PageLoading_LoadingTimelineFlow_0073
     * @tc.desc      LoadingTimeline call flow text > text > text > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0073 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: number = subject.advance(-2422);
      logInfo(`step4 advance(-2422): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0074
     * @tc.name      PageLoading_LoadingTimelineFlow_0074
     * @tc.desc      LoadingTimeline call flow isLoading > text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0074 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.advance(2340000);
      logInfo(`step3 advance(2340000): step3=${step3}`);
      expect(step3).assertEqual(46800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0075
     * @tc.name      PageLoading_LoadingTimelineFlow_0075
     * @tc.desc      LoadingTimeline call flow text > nowProgress > isLoading > text > nowProgress keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0075 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0076
     * @tc.name      PageLoading_LoadingTimelineFlow_0076
     * @tc.desc      LoadingTimeline call flow advance > isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0076 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(2125319.83);
      logInfo(`step1 advance(2125319.83): step1=${step1}`);
      expect(step1).assertEqual(42500);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(4251);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0077
     * @tc.name      PageLoading_LoadingTimelineFlow_0077
     * @tc.desc      LoadingTimeline call flow isLoading > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0077 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(1854279);
      logInfo(`step2 advance(1854279): step2=${step2}`);
      expect(step2).assertEqual(37080);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0078
     * @tc.name      PageLoading_LoadingTimelineFlow_0078
     * @tc.desc      LoadingTimeline call flow view > nowProgress > view > view > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0078 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0079
     * @tc.name      PageLoading_LoadingTimelineFlow_0079
     * @tc.desc      LoadingTimeline call flow advance > view > history > isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0079 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(2);
      logInfo(`step1 advance(2): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0080
     * @tc.name      PageLoading_LoadingTimelineFlow_0080
     * @tc.desc      LoadingTimeline call flow view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0080 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.advance(738524);
      logInfo(`step2 advance(738524): step2=${step2}`);
      expect(step2).assertEqual(14770);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0081
     * @tc.name      PageLoading_LoadingTimelineFlow_0081
     * @tc.desc      LoadingTimeline call flow view > nowProgress > history > advance > nowProgress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0081 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.advance(7200000);
      logInfo(`step4 advance(7200000): step4=${step4}`);
      expect(step4).assertEqual(144000);
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(144000);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0082
     * @tc.name      PageLoading_LoadingTimelineFlow_0082
     * @tc.desc      LoadingTimeline call flow view > text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0082 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.advance(3780000);
      logInfo(`step3 advance(3780000): step3=${step3}`);
      expect(step3).assertEqual(75600);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0083
     * @tc.name      PageLoading_LoadingTimelineFlow_0083
     * @tc.desc      LoadingTimeline call flow nowProgress > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0083 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(2216807.81);
      logInfo(`step2 advance(2216807.81): step2=${step2}`);
      expect(step2).assertEqual(44330);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(4434);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0084
     * @tc.name      PageLoading_LoadingTimelineFlow_0084
     * @tc.desc      LoadingTimeline call flow nowProgress > view > text > isLoading > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0084 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0085
     * @tc.name      PageLoading_LoadingTimelineFlow_0085
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > history > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0085 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(6480000);
      logInfo(`step1 advance(6480000): step1=${step1}`);
      expect(step1).assertEqual(129600);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(129600);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(12961);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0086
     * @tc.name      PageLoading_LoadingTimelineFlow_0086
     * @tc.desc      LoadingTimeline call flow text > text > nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0086 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.advance(2);
      logInfo(`step4 advance(2): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0087
     * @tc.name      PageLoading_LoadingTimelineFlow_0087
     * @tc.desc      LoadingTimeline call flow nowProgress > text > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0087 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.advance(3860622);
      logInfo(`step3 advance(3860622): step3=${step3}`);
      expect(step3).assertEqual(77210);
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(7722);
      logInfo(`step4 history(): JSON.stringify(step4.slice(0, 4))=${JSON.stringify(step4.slice(0, 4))}`);
      expect(JSON.stringify(step4.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0088
     * @tc.name      PageLoading_LoadingTimelineFlow_0088
     * @tc.desc      LoadingTimeline call flow advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0088 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3060000);
      logInfo(`step1 advance(3060000): step1=${step1}`);
      expect(step1).assertEqual(61200);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0089
     * @tc.name      PageLoading_LoadingTimelineFlow_0089
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0089 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0090
     * @tc.name      PageLoading_LoadingTimelineFlow_0090
     * @tc.desc      LoadingTimeline call flow nowProgress > view > nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0090 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.advance(5040000);
      logInfo(`step4 advance(5040000): step4=${step4}`);
      expect(step4).assertEqual(100800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0091
     * @tc.name      PageLoading_LoadingTimelineFlow_0091
     * @tc.desc      LoadingTimeline call flow text > view > isLoading > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0091 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0092
     * @tc.name      PageLoading_LoadingTimelineFlow_0092
     * @tc.desc      LoadingTimeline call flow nowProgress > view > view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0092 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0093
     * @tc.name      PageLoading_LoadingTimelineFlow_0093
     * @tc.desc      LoadingTimeline call flow text > history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0093 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.advance(6480000);
      logInfo(`step3 advance(6480000): step3=${step3}`);
      expect(step3).assertEqual(129600);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0094
     * @tc.name      PageLoading_LoadingTimelineFlow_0094
     * @tc.desc      LoadingTimeline call flow nowProgress > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0094 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0095
     * @tc.name      PageLoading_LoadingTimelineFlow_0095
     * @tc.desc      LoadingTimeline call flow view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0095 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0096
     * @tc.name      PageLoading_LoadingTimelineFlow_0096
     * @tc.desc      LoadingTimeline call flow nowProgress > isLoading > nowProgress > isLoading > history keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0096 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0097
     * @tc.name      PageLoading_LoadingTimelineFlow_0097
     * @tc.desc      LoadingTimeline call flow history > text > history > nowProgress > nowProgress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0097 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0098
     * @tc.name      PageLoading_LoadingTimelineFlow_0098
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > text > history > nowProgress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0098 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0099
     * @tc.name      PageLoading_LoadingTimelineFlow_0099
     * @tc.desc      LoadingTimeline call flow history > advance > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0099 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(3901783);
      logInfo(`step2 advance(3901783): step2=${step2}`);
      expect(step2).assertEqual(78030);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0100
     * @tc.name      PageLoading_LoadingTimelineFlow_0100
     * @tc.desc      LoadingTimeline call flow history > isLoading > text > text > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0100 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0101
     * @tc.name      PageLoading_LoadingTimelineFlow_0101
     * @tc.desc      LoadingTimeline call flow text > view > isLoading > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0101 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0102
     * @tc.name      PageLoading_LoadingTimelineFlow_0102
     * @tc.desc      LoadingTimeline call flow advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0102 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(360000);
      logInfo(`step1 advance(360000): step1=${step1}`);
      expect(step1).assertEqual(7200);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(721);
      logInfo(`step2 history(): JSON.stringify(step2.slice(0, 4))=${JSON.stringify(step2.slice(0, 4))}`);
      expect(JSON.stringify(step2.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0103
     * @tc.name      PageLoading_LoadingTimelineFlow_0103
     * @tc.desc      LoadingTimeline call flow advance > history > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0103 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1620000);
      logInfo(`step1 advance(1620000): step1=${step1}`);
      expect(step1).assertEqual(32400);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(3241);
      logInfo(`step2 history(): JSON.stringify(step2.slice(0, 4))=${JSON.stringify(step2.slice(0, 4))}`);
      expect(JSON.stringify(step2.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0104
     * @tc.name      PageLoading_LoadingTimelineFlow_0104
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > history > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0104 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(5220000);
      logInfo(`step1 advance(5220000): step1=${step1}`);
      expect(step1).assertEqual(104400);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(104400);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(10441);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(104400);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0105
     * @tc.name      PageLoading_LoadingTimelineFlow_0105
     * @tc.desc      LoadingTimeline call flow text > history > nowProgress > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0105 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0106
     * @tc.name      PageLoading_LoadingTimelineFlow_0106
     * @tc.desc      LoadingTimeline call flow advance > history > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0106 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1800000);
      logInfo(`step1 advance(1800000): step1=${step1}`);
      expect(step1).assertEqual(36000);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(3601);
      logInfo(`step2 history(): JSON.stringify(step2.slice(0, 4))=${JSON.stringify(step2.slice(0, 4))}`);
      expect(JSON.stringify(step2.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      const step4: number = subject.advance(2);
      logInfo(`step4 advance(2): step4=${step4}`);
      expect(step4).assertEqual(36000);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0107
     * @tc.name      PageLoading_LoadingTimelineFlow_0107
     * @tc.desc      LoadingTimeline call flow text > view > advance > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0107 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.advance(1620000);
      logInfo(`step3 advance(1620000): step3=${step3}`);
      expect(step3).assertEqual(32400);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0108
     * @tc.name      PageLoading_LoadingTimelineFlow_0108
     * @tc.desc      LoadingTimeline call flow isLoading > text > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0108 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0109
     * @tc.name      PageLoading_LoadingTimelineFlow_0109
     * @tc.desc      LoadingTimeline call flow text > text > text > advance > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0109 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: number = subject.advance(1080000);
      logInfo(`step4 advance(1080000): step4=${step4}`);
      expect(step4).assertEqual(21600);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0110
     * @tc.name      PageLoading_LoadingTimelineFlow_0110
     * @tc.desc      LoadingTimeline call flow nowProgress > text > history > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0110 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0111
     * @tc.name      PageLoading_LoadingTimelineFlow_0111
     * @tc.desc      LoadingTimeline call flow history > text > nowProgress > isLoading > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0111 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.advance(3777947);
      logInfo(`step5 advance(3777947): step5=${step5}`);
      expect(step5).assertEqual(75550);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0112
     * @tc.name      PageLoading_LoadingTimelineFlow_0112
     * @tc.desc      LoadingTimeline call flow history > text > nowProgress > text > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0112 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0113
     * @tc.name      PageLoading_LoadingTimelineFlow_0113
     * @tc.desc      LoadingTimeline call flow text > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0113 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0114
     * @tc.name      PageLoading_LoadingTimelineFlow_0114
     * @tc.desc      LoadingTimeline call flow history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0114 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(4033534);
      logInfo(`step2 advance(4033534): step2=${step2}`);
      expect(step2).assertEqual(80670);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0115
     * @tc.name      PageLoading_LoadingTimelineFlow_0115
     * @tc.desc      LoadingTimeline call flow history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0115 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(6840000);
      logInfo(`step2 advance(6840000): step2=${step2}`);
      expect(step2).assertEqual(136800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0116
     * @tc.name      PageLoading_LoadingTimelineFlow_0116
     * @tc.desc      LoadingTimeline call flow view > isLoading > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0116 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0117
     * @tc.name      PageLoading_LoadingTimelineFlow_0117
     * @tc.desc      LoadingTimeline call flow history > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0117 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0118
     * @tc.name      PageLoading_LoadingTimelineFlow_0118
     * @tc.desc      LoadingTimeline call flow view > history > history > isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0118 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0119
     * @tc.name      PageLoading_LoadingTimelineFlow_0119
     * @tc.desc      LoadingTimeline call flow isLoading > nowProgress > advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0119 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.advance(-2045340);
      logInfo(`step3 advance(-2045340): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0120
     * @tc.name      PageLoading_LoadingTimelineFlow_0120
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0120 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(3960000);
      logInfo(`step3 advance(3960000): step3=${step3}`);
      expect(step3).assertEqual(79200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0121
     * @tc.name      PageLoading_LoadingTimelineFlow_0121
     * @tc.desc      LoadingTimeline call flow view > view > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0121 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0121 end`);
    });
  });
}
