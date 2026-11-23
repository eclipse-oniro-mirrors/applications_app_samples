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
export default function loadingTimelineFlow3Test(): void {
  describe('LoadingTimelineFlow3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0122
     * @tc.name      PageLoading_LoadingTimelineFlow_0122
     * @tc.desc      LoadingTimeline call flow isLoading > history > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0122 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.advance(4500000);
      logInfo(`step3 advance(4500000): step3=${step3}`);
      expect(step3).assertEqual(90000);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(90000);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0123
     * @tc.name      PageLoading_LoadingTimelineFlow_0123
     * @tc.desc      LoadingTimeline call flow isLoading > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0123 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0124
     * @tc.name      PageLoading_LoadingTimelineFlow_0124
     * @tc.desc      LoadingTimeline call flow history > view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0124 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0125
     * @tc.name      PageLoading_LoadingTimelineFlow_0125
     * @tc.desc      LoadingTimeline call flow text > nowProgress > nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0125 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.advance(2160000);
      logInfo(`step4 advance(2160000): step4=${step4}`);
      expect(step4).assertEqual(43200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0126
     * @tc.name      PageLoading_LoadingTimelineFlow_0126
     * @tc.desc      LoadingTimeline call flow text > text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0126 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.advance(522532);
      logInfo(`step3 advance(522532): step3=${step3}`);
      expect(step3).assertEqual(10450);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0127
     * @tc.name      PageLoading_LoadingTimelineFlow_0127
     * @tc.desc      LoadingTimeline call flow view > isLoading > history > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0127 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0128
     * @tc.name      PageLoading_LoadingTimelineFlow_0128
     * @tc.desc      LoadingTimeline call flow nowProgress > view > history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0128 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0129
     * @tc.name      PageLoading_LoadingTimelineFlow_0129
     * @tc.desc      LoadingTimeline call flow history > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0129 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0130
     * @tc.name      PageLoading_LoadingTimelineFlow_0130
     * @tc.desc      LoadingTimeline call flow history > history > history > history > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0130 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0131
     * @tc.name      PageLoading_LoadingTimelineFlow_0131
     * @tc.desc      LoadingTimeline call flow nowProgress > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0131 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0132
     * @tc.name      PageLoading_LoadingTimelineFlow_0132
     * @tc.desc      LoadingTimeline call flow text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0132 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0133
     * @tc.name      PageLoading_LoadingTimelineFlow_0133
     * @tc.desc      LoadingTimeline call flow text > nowProgress > isLoading > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0133 begin`);
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
      const step4: number = subject.advance(1854279);
      logInfo(`step4 advance(1854279): step4=${step4}`);
      expect(step4).assertEqual(37080);
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(3709);
      logInfo(`step5 history(): JSON.stringify(step5.slice(0, 4))=${JSON.stringify(step5.slice(0, 4))}`);
      expect(JSON.stringify(step5.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0134
     * @tc.name      PageLoading_LoadingTimelineFlow_0134
     * @tc.desc      LoadingTimeline call flow view > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0134 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.advance(-664914);
      logInfo(`step2 advance(-664914): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0135
     * @tc.name      PageLoading_LoadingTimelineFlow_0135
     * @tc.desc      LoadingTimeline call flow nowProgress > nowProgress > nowProgress > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0135 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0136
     * @tc.name      PageLoading_LoadingTimelineFlow_0136
     * @tc.desc      LoadingTimeline call flow text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0136 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.advance(1000);
      logInfo(`step2 advance(1000): step2=${step2}`);
      expect(step2).assertEqual(20);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0137
     * @tc.name      PageLoading_LoadingTimelineFlow_0137
     * @tc.desc      LoadingTimeline call flow advance > view > history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0137 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(325188.01);
      logInfo(`step1 advance(325188.01): step1=${step1}`);
      expect(step1).assertEqual(6500);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('CommodityList');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(651);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6500%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0138
     * @tc.name      PageLoading_LoadingTimelineFlow_0138
     * @tc.desc      LoadingTimeline call flow view > text > history > nowProgress > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0138 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0139
     * @tc.name      PageLoading_LoadingTimelineFlow_0139
     * @tc.desc      LoadingTimeline call flow view > isLoading > advance > text > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0139 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(2880000);
      logInfo(`step3 advance(2880000): step3=${step3}`);
      expect(step3).assertEqual(57600);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d57600%');
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(57600);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0140
     * @tc.name      PageLoading_LoadingTimelineFlow_0140
     * @tc.desc      LoadingTimeline call flow text > history > history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0140 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.advance(4636635);
      logInfo(`step4 advance(4636635): step4=${step4}`);
      expect(step4).assertEqual(92730);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0141
     * @tc.name      PageLoading_LoadingTimelineFlow_0141
     * @tc.desc      LoadingTimeline call flow nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0141 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(3040001);
      logInfo(`step2 advance(3040001): step2=${step2}`);
      expect(step2).assertEqual(60800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0142
     * @tc.name      PageLoading_LoadingTimelineFlow_0142
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0142 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(339813);
      logInfo(`step3 advance(339813): step3=${step3}`);
      expect(step3).assertEqual(6790);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0143
     * @tc.name      PageLoading_LoadingTimelineFlow_0143
     * @tc.desc      LoadingTimeline call flow nowProgress > history > nowProgress > text > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0143 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0144
     * @tc.name      PageLoading_LoadingTimelineFlow_0144
     * @tc.desc      LoadingTimeline call flow isLoading > text > nowProgress > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0144 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0145
     * @tc.name      PageLoading_LoadingTimelineFlow_0145
     * @tc.desc      LoadingTimeline call flow view > view > nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0145 begin`);
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
      const step4: number = subject.advance(522532);
      logInfo(`step4 advance(522532): step4=${step4}`);
      expect(step4).assertEqual(10450);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0146
     * @tc.name      PageLoading_LoadingTimelineFlow_0146
     * @tc.desc      LoadingTimeline call flow advance > isLoading > view > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0146 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(4636635);
      logInfo(`step1 advance(4636635): step1=${step1}`);
      expect(step1).assertEqual(92730);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d92730%');
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(9274);
      logInfo(`step5 history(): JSON.stringify(step5.slice(0, 4))=${JSON.stringify(step5.slice(0, 4))}`);
      expect(JSON.stringify(step5.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0147
     * @tc.name      PageLoading_LoadingTimelineFlow_0147
     * @tc.desc      LoadingTimeline call flow nowProgress > view > advance > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0147 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.advance(2160000);
      logInfo(`step3 advance(2160000): step3=${step3}`);
      expect(step3).assertEqual(43200);
      const step4: number = subject.advance(4536256);
      logInfo(`step4 advance(4536256): step4=${step4}`);
      expect(step4).assertEqual(133920);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0148
     * @tc.name      PageLoading_LoadingTimelineFlow_0148
     * @tc.desc      LoadingTimeline call flow view > nowProgress > text > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0148 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0149
     * @tc.name      PageLoading_LoadingTimelineFlow_0149
     * @tc.desc      LoadingTimeline call flow text > nowProgress > text > text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0149 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: number = subject.advance(6600572);
      logInfo(`step5 advance(6600572): step5=${step5}`);
      expect(step5).assertEqual(132010);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0150
     * @tc.name      PageLoading_LoadingTimelineFlow_0150
     * @tc.desc      LoadingTimeline call flow text > view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0150 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0151
     * @tc.name      PageLoading_LoadingTimelineFlow_0151
     * @tc.desc      LoadingTimeline call flow advance > advance > advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0151 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(5309083);
      logInfo(`step1 advance(5309083): step1=${step1}`);
      expect(step1).assertEqual(106180);
      const step2: number = subject.advance(2513375.22);
      logInfo(`step2 advance(2513375.22): step2=${step2}`);
      expect(step2).assertEqual(156440);
      const step3: number = subject.advance(360000);
      logInfo(`step3 advance(360000): step3=${step3}`);
      expect(step3).assertEqual(163640);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0152
     * @tc.name      PageLoading_LoadingTimelineFlow_0152
     * @tc.desc      LoadingTimeline call flow view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0152 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.advance(720000);
      logInfo(`step2 advance(720000): step2=${step2}`);
      expect(step2).assertEqual(14400);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0153
     * @tc.name      PageLoading_LoadingTimelineFlow_0153
     * @tc.desc      LoadingTimeline call flow nowProgress > history > isLoading > advance > isLoading keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0153 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.advance(339813);
      logInfo(`step4 advance(339813): step4=${step4}`);
      expect(step4).assertEqual(6790);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0154
     * @tc.name      PageLoading_LoadingTimelineFlow_0154
     * @tc.desc      LoadingTimeline call flow view > isLoading > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0154 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0155
     * @tc.name      PageLoading_LoadingTimelineFlow_0155
     * @tc.desc      LoadingTimeline call flow history > text > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0155 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0156
     * @tc.name      PageLoading_LoadingTimelineFlow_0156
     * @tc.desc      LoadingTimeline call flow history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0156 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(5040000);
      logInfo(`step2 advance(5040000): step2=${step2}`);
      expect(step2).assertEqual(100800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0157
     * @tc.name      PageLoading_LoadingTimelineFlow_0157
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0157 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0158
     * @tc.name      PageLoading_LoadingTimelineFlow_0158
     * @tc.desc      LoadingTimeline call flow history > nowProgress > nowProgress > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0158 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0159
     * @tc.name      PageLoading_LoadingTimelineFlow_0159
     * @tc.desc      LoadingTimeline call flow text > advance > nowProgress > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0159 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.advance(6308418);
      logInfo(`step2 advance(6308418): step2=${step2}`);
      expect(step2).assertEqual(126160);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(126160);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0160
     * @tc.name      PageLoading_LoadingTimelineFlow_0160
     * @tc.desc      LoadingTimeline call flow isLoading > advance > view > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0160 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(2);
      logInfo(`step2 advance(2): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0161
     * @tc.name      PageLoading_LoadingTimelineFlow_0161
     * @tc.desc      LoadingTimeline call flow text > isLoading > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0161 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0162
     * @tc.name      PageLoading_LoadingTimelineFlow_0162
     * @tc.desc      LoadingTimeline call flow nowProgress > nowProgress > isLoading > nowProgress > isLoading keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0162 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0163
     * @tc.name      PageLoading_LoadingTimelineFlow_0163
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0163 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(2230624.39);
      logInfo(`step3 advance(2230624.39): step3=${step3}`);
      expect(step3).assertEqual(44610);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0164
     * @tc.name      PageLoading_LoadingTimelineFlow_0164
     * @tc.desc      LoadingTimeline call flow advance > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0164 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(542966.67);
      logInfo(`step1 advance(542966.67): step1=${step1}`);
      expect(step1).assertEqual(10850);
      const step2: number = subject.advance(5996181);
      logInfo(`step2 advance(5996181): step2=${step2}`);
      expect(step2).assertEqual(130780);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0165
     * @tc.name      PageLoading_LoadingTimelineFlow_0165
     * @tc.desc      LoadingTimeline call flow isLoading > nowProgress > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0165 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0166
     * @tc.name      PageLoading_LoadingTimelineFlow_0166
     * @tc.desc      LoadingTimeline call flow advance > isLoading > view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0166 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(231973.05);
      logInfo(`step1 advance(231973.05): step1=${step1}`);
      expect(step1).assertEqual(4630);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d4630%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0167
     * @tc.name      PageLoading_LoadingTimelineFlow_0167
     * @tc.desc      LoadingTimeline call flow nowProgress > view > isLoading > nowProgress > history keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0167 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0168
     * @tc.name      PageLoading_LoadingTimelineFlow_0168
     * @tc.desc      LoadingTimeline call flow history > isLoading > history > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0168 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0169
     * @tc.name      PageLoading_LoadingTimelineFlow_0169
     * @tc.desc      LoadingTimeline call flow view > history > text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0169 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: number = subject.advance(6811932);
      logInfo(`step4 advance(6811932): step4=${step4}`);
      expect(step4).assertEqual(136230);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0170
     * @tc.name      PageLoading_LoadingTimelineFlow_0170
     * @tc.desc      LoadingTimeline call flow view > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0170 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0171
     * @tc.name      PageLoading_LoadingTimelineFlow_0171
     * @tc.desc      LoadingTimeline call flow view > isLoading > isLoading > nowProgress > isLoading keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0171 begin`);
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
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0172
     * @tc.name      PageLoading_LoadingTimelineFlow_0172
     * @tc.desc      LoadingTimeline call flow text > isLoading > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0172 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0173
     * @tc.name      PageLoading_LoadingTimelineFlow_0173
     * @tc.desc      LoadingTimeline call flow history > history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0173 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.advance(900000);
      logInfo(`step3 advance(900000): step3=${step3}`);
      expect(step3).assertEqual(18000);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0174
     * @tc.name      PageLoading_LoadingTimelineFlow_0174
     * @tc.desc      LoadingTimeline call flow view > isLoading > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0174 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0175
     * @tc.name      PageLoading_LoadingTimelineFlow_0175
     * @tc.desc      LoadingTimeline call flow advance > history > nowProgress > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0175 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1854279);
      logInfo(`step1 advance(1854279): step1=${step1}`);
      expect(step1).assertEqual(37080);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(3709);
      logInfo(`step2 history(): JSON.stringify(step2.slice(0, 4))=${JSON.stringify(step2.slice(0, 4))}`);
      expect(JSON.stringify(step2.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(37080);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0176
     * @tc.name      PageLoading_LoadingTimelineFlow_0176
     * @tc.desc      LoadingTimeline call flow nowProgress > history > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0176 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0177
     * @tc.name      PageLoading_LoadingTimelineFlow_0177
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > nowProgress > advance > advance keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0177 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1863177);
      logInfo(`step1 advance(1863177): step1=${step1}`);
      expect(step1).assertEqual(37260);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(37260);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(37260);
      const step4: number = subject.advance(3441279.2);
      logInfo(`step4 advance(3441279.2): step4=${step4}`);
      expect(step4).assertEqual(106080);
      const step5: number = subject.advance(5040000);
      logInfo(`step5 advance(5040000): step5=${step5}`);
      expect(step5).assertEqual(206880);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0178
     * @tc.name      PageLoading_LoadingTimelineFlow_0178
     * @tc.desc      LoadingTimeline call flow advance > text > history > history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0178 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(522532);
      logInfo(`step1 advance(522532): step1=${step1}`);
      expect(step1).assertEqual(10450);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d10450%');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1046);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1046);
      logInfo(`step4 history(): JSON.stringify(step4.slice(0, 4))=${JSON.stringify(step4.slice(0, 4))}`);
      expect(JSON.stringify(step4.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d10450%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0179
     * @tc.name      PageLoading_LoadingTimelineFlow_0179
     * @tc.desc      LoadingTimeline call flow history > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0179 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0180
     * @tc.name      PageLoading_LoadingTimelineFlow_0180
     * @tc.desc      LoadingTimeline call flow history > history > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0180 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0181
     * @tc.name      PageLoading_LoadingTimelineFlow_0181
     * @tc.desc      LoadingTimeline call flow view > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0181 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.advance(3071466.91);
      logInfo(`step2 advance(3071466.91): step2=${step2}`);
      expect(step2).assertEqual(61420);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(6143);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0182
     * @tc.name      PageLoading_LoadingTimelineFlow_0182
     * @tc.desc      LoadingTimeline call flow view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0182 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0182 end`);
    });
  });
}
