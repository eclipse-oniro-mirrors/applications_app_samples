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

/** Logic checks for LoadingTimeline flow (62 cases). */
export default function loadingTimelineFlow4Test(): void {
  describe('LoadingTimelineFlow4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0183
     * @tc.name      PageLoading_LoadingTimelineFlow_0183
     * @tc.desc      LoadingTimeline call flow advance > isLoading > history > history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0183 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1000);
      logInfo(`step1 advance(1000): step1=${step1}`);
      expect(step1).assertEqual(20);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 history(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["progress10","progress20"]');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 history(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["progress10","progress20"]');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d20%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0184
     * @tc.name      PageLoading_LoadingTimelineFlow_0184
     * @tc.desc      LoadingTimeline call flow history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0184 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(6600572);
      logInfo(`step2 advance(6600572): step2=${step2}`);
      expect(step2).assertEqual(132010);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0185
     * @tc.name      PageLoading_LoadingTimelineFlow_0185
     * @tc.desc      LoadingTimeline call flow history > nowProgress > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0185 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0186
     * @tc.name      PageLoading_LoadingTimelineFlow_0186
     * @tc.desc      LoadingTimeline call flow isLoading > view > view > text > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0186 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0187
     * @tc.name      PageLoading_LoadingTimelineFlow_0187
     * @tc.desc      LoadingTimeline call flow nowProgress > isLoading > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0187 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(325188.01);
      logInfo(`step3 advance(325188.01): step3=${step3}`);
      expect(step3).assertEqual(6500);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0188
     * @tc.name      PageLoading_LoadingTimelineFlow_0188
     * @tc.desc      LoadingTimeline call flow advance > view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0188 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3960000);
      logInfo(`step1 advance(3960000): step1=${step1}`);
      expect(step1).assertEqual(79200);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('CommodityList');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d79200%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0189
     * @tc.name      PageLoading_LoadingTimelineFlow_0189
     * @tc.desc      LoadingTimeline call flow nowProgress > isLoading > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0189 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0190
     * @tc.name      PageLoading_LoadingTimelineFlow_0190
     * @tc.desc      LoadingTimeline call flow history > text > nowProgress > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0190 begin`);
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
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0191
     * @tc.name      PageLoading_LoadingTimelineFlow_0191
     * @tc.desc      LoadingTimeline call flow text > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0191 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0192
     * @tc.name      PageLoading_LoadingTimelineFlow_0192
     * @tc.desc      LoadingTimeline call flow history > history > nowProgress > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0192 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0193
     * @tc.name      PageLoading_LoadingTimelineFlow_0193
     * @tc.desc      LoadingTimeline call flow isLoading > view > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0193 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0194
     * @tc.name      PageLoading_LoadingTimelineFlow_0194
     * @tc.desc      LoadingTimeline call flow view > isLoading > history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0194 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0195
     * @tc.name      PageLoading_LoadingTimelineFlow_0195
     * @tc.desc      LoadingTimeline call flow advance > history > nowProgress > view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0195 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(360000);
      logInfo(`step1 advance(360000): step1=${step1}`);
      expect(step1).assertEqual(7200);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(721);
      logInfo(`step2 history(): JSON.stringify(step2.slice(0, 4))=${JSON.stringify(step2.slice(0, 4))}`);
      expect(JSON.stringify(step2.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(7200);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0196
     * @tc.name      PageLoading_LoadingTimelineFlow_0196
     * @tc.desc      LoadingTimeline call flow nowProgress > nowProgress > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0196 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.advance(1260000);
      logInfo(`step3 advance(1260000): step3=${step3}`);
      expect(step3).assertEqual(25200);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(25200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0197
     * @tc.name      PageLoading_LoadingTimelineFlow_0197
     * @tc.desc      LoadingTimeline call flow advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0197 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(999);
      logInfo(`step1 advance(999): step1=${step1}`);
      expect(step1).assertEqual(10);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 history(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["progress10"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0198
     * @tc.name      PageLoading_LoadingTimelineFlow_0198
     * @tc.desc      LoadingTimeline call flow history > nowProgress > view > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0198 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      const step5: number = subject.advance(4860000);
      logInfo(`step5 advance(4860000): step5=${step5}`);
      expect(step5).assertEqual(97200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0199
     * @tc.name      PageLoading_LoadingTimelineFlow_0199
     * @tc.desc      LoadingTimeline call flow history > advance > isLoading > advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0199 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(5309083);
      logInfo(`step2 advance(5309083): step2=${step2}`);
      expect(step2).assertEqual(106180);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.advance(3240000);
      logInfo(`step4 advance(3240000): step4=${step4}`);
      expect(step4).assertEqual(170980);
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0200
     * @tc.name      PageLoading_LoadingTimelineFlow_0200
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0200 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0201
     * @tc.name      PageLoading_LoadingTimelineFlow_0201
     * @tc.desc      LoadingTimeline call flow nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0201 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(500);
      logInfo(`step2 advance(500): step2=${step2}`);
      expect(step2).assertEqual(10);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0202
     * @tc.name      PageLoading_LoadingTimelineFlow_0202
     * @tc.desc      LoadingTimeline call flow view > nowProgress > history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0202 begin`);
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
      const step4: number = subject.advance(4410101);
      logInfo(`step4 advance(4410101): step4=${step4}`);
      expect(step4).assertEqual(88200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0203
     * @tc.name      PageLoading_LoadingTimelineFlow_0203
     * @tc.desc      LoadingTimeline call flow history > advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0203 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(177336.9);
      logInfo(`step2 advance(177336.9): step2=${step2}`);
      expect(step2).assertEqual(3540);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0204
     * @tc.name      PageLoading_LoadingTimelineFlow_0204
     * @tc.desc      LoadingTimeline call flow view > text > isLoading > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0204 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0205
     * @tc.name      PageLoading_LoadingTimelineFlow_0205
     * @tc.desc      LoadingTimeline call flow history > nowProgress > nowProgress > nowProgress > text keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0205 begin`);
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
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0206
     * @tc.name      PageLoading_LoadingTimelineFlow_0206
     * @tc.desc      LoadingTimeline call flow view > history > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0206 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0207
     * @tc.name      PageLoading_LoadingTimelineFlow_0207
     * @tc.desc      LoadingTimeline call flow view > nowProgress > text > text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0207 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: number = subject.advance(2747461.53);
      logInfo(`step5 advance(2747461.53): step5=${step5}`);
      expect(step5).assertEqual(54940);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0208
     * @tc.name      PageLoading_LoadingTimelineFlow_0208
     * @tc.desc      LoadingTimeline call flow history > advance > view > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0208 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(4189112);
      logInfo(`step2 advance(4189112): step2=${step2}`);
      expect(step2).assertEqual(83780);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(8379);
      logInfo(`step4 history(): JSON.stringify(step4.slice(0, 4))=${JSON.stringify(step4.slice(0, 4))}`);
      expect(JSON.stringify(step4.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0209
     * @tc.name      PageLoading_LoadingTimelineFlow_0209
     * @tc.desc      LoadingTimeline call flow advance > advance > nowProgress > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0209 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3600000);
      logInfo(`step1 advance(3600000): step1=${step1}`);
      expect(step1).assertEqual(72000);
      const step2: number = subject.advance(1);
      logInfo(`step2 advance(1): step2=${step2}`);
      expect(step2).assertEqual(72000);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(72000);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0210
     * @tc.name      PageLoading_LoadingTimelineFlow_0210
     * @tc.desc      LoadingTimeline call flow isLoading > history > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0210 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0211
     * @tc.name      PageLoading_LoadingTimelineFlow_0211
     * @tc.desc      LoadingTimeline call flow history > isLoading > view > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0211 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0212
     * @tc.name      PageLoading_LoadingTimelineFlow_0212
     * @tc.desc      LoadingTimeline call flow view > history > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0212 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0213
     * @tc.name      PageLoading_LoadingTimelineFlow_0213
     * @tc.desc      LoadingTimeline call flow advance > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0213 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(540000);
      logInfo(`step1 advance(540000): step1=${step1}`);
      expect(step1).assertEqual(10800);
      const step2: number = subject.advance(522532);
      logInfo(`step2 advance(522532): step2=${step2}`);
      expect(step2).assertEqual(21250);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0214
     * @tc.name      PageLoading_LoadingTimelineFlow_0214
     * @tc.desc      LoadingTimeline call flow text > view > isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0214 begin`);
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
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0215
     * @tc.name      PageLoading_LoadingTimelineFlow_0215
     * @tc.desc      LoadingTimeline call flow text > nowProgress > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0215 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: number = subject.advance(5400000);
      logInfo(`step4 advance(5400000): step4=${step4}`);
      expect(step4).assertEqual(108000);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0216
     * @tc.name      PageLoading_LoadingTimelineFlow_0216
     * @tc.desc      LoadingTimeline call flow isLoading > nowProgress > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0216 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0217
     * @tc.name      PageLoading_LoadingTimelineFlow_0217
     * @tc.desc      LoadingTimeline call flow nowProgress > advance > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0217 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(2125319.83);
      logInfo(`step2 advance(2125319.83): step2=${step2}`);
      expect(step2).assertEqual(42500);
      const step3: number = subject.advance(4033534);
      logInfo(`step3 advance(4033534): step3=${step3}`);
      expect(step3).assertEqual(123170);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0218
     * @tc.name      PageLoading_LoadingTimelineFlow_0218
     * @tc.desc      LoadingTimeline call flow advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0218 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(6892015);
      logInfo(`step1 advance(6892015): step1=${step1}`);
      expect(step1).assertEqual(137840);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0219
     * @tc.name      PageLoading_LoadingTimelineFlow_0219
     * @tc.desc      LoadingTimeline call flow view > view > isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0219 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0220
     * @tc.name      PageLoading_LoadingTimelineFlow_0220
     * @tc.desc      LoadingTimeline call flow isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0220 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0221
     * @tc.name      PageLoading_LoadingTimelineFlow_0221
     * @tc.desc      LoadingTimeline call flow advance > advance > text > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0221 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1);
      logInfo(`step1 advance(1): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(4716812);
      logInfo(`step2 advance(4716812): step2=${step2}`);
      expect(step2).assertEqual(94330);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d94330%');
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0222
     * @tc.name      PageLoading_LoadingTimelineFlow_0222
     * @tc.desc      LoadingTimeline call flow advance > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0222 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1000);
      logInfo(`step1 advance(1000): step1=${step1}`);
      expect(step1).assertEqual(20);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d20%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0223
     * @tc.name      PageLoading_LoadingTimelineFlow_0223
     * @tc.desc      LoadingTimeline call flow isLoading > view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0223 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0224
     * @tc.name      PageLoading_LoadingTimelineFlow_0224
     * @tc.desc      LoadingTimeline call flow history > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0224 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(-2463359);
      logInfo(`step2 advance(-2463359): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0225
     * @tc.name      PageLoading_LoadingTimelineFlow_0225
     * @tc.desc      LoadingTimeline call flow isLoading > advance > advance > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0225 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(2700000);
      logInfo(`step2 advance(2700000): step2=${step2}`);
      expect(step2).assertEqual(54000);
      const step3: number = subject.advance(6840000);
      logInfo(`step3 advance(6840000): step3=${step3}`);
      expect(step3).assertEqual(190800);
      const step4: number = subject.advance(2230624.39);
      logInfo(`step4 advance(2230624.39): step4=${step4}`);
      expect(step4).assertEqual(235410);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0226
     * @tc.name      PageLoading_LoadingTimelineFlow_0226
     * @tc.desc      LoadingTimeline call flow nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0226 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(325188.01);
      logInfo(`step2 advance(325188.01): step2=${step2}`);
      expect(step2).assertEqual(6500);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0227
     * @tc.name      PageLoading_LoadingTimelineFlow_0227
     * @tc.desc      LoadingTimeline call flow advance > view > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0227 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(325188.01);
      logInfo(`step1 advance(325188.01): step1=${step1}`);
      expect(step1).assertEqual(6500);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('CommodityList');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6500%');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d6500%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0228
     * @tc.name      PageLoading_LoadingTimelineFlow_0228
     * @tc.desc      LoadingTimeline call flow text > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0228 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0229
     * @tc.name      PageLoading_LoadingTimelineFlow_0229
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0229 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(177336.9);
      logInfo(`step1 advance(177336.9): step1=${step1}`);
      expect(step1).assertEqual(3540);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(3540);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0230
     * @tc.name      PageLoading_LoadingTimelineFlow_0230
     * @tc.desc      LoadingTimeline call flow advance > view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0230 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3071466.91);
      logInfo(`step1 advance(3071466.91): step1=${step1}`);
      expect(step1).assertEqual(61420);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('CommodityList');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0231
     * @tc.name      PageLoading_LoadingTimelineFlow_0231
     * @tc.desc      LoadingTimeline call flow advance > isLoading > nowProgress > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0231 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(177336.9);
      logInfo(`step1 advance(177336.9): step1=${step1}`);
      expect(step1).assertEqual(3540);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(3540);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0232
     * @tc.name      PageLoading_LoadingTimelineFlow_0232
     * @tc.desc      LoadingTimeline call flow history > nowProgress > isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0232 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0233
     * @tc.name      PageLoading_LoadingTimelineFlow_0233
     * @tc.desc      LoadingTimeline call flow advance > isLoading > view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0233 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1980000);
      logInfo(`step1 advance(1980000): step1=${step1}`);
      expect(step1).assertEqual(39600);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0234
     * @tc.name      PageLoading_LoadingTimelineFlow_0234
     * @tc.desc      LoadingTimeline call flow nowProgress > nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0234 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.advance(100);
      logInfo(`step3 advance(100): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0235
     * @tc.name      PageLoading_LoadingTimelineFlow_0235
     * @tc.desc      LoadingTimeline call flow advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0235 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(2880000);
      logInfo(`step1 advance(2880000): step1=${step1}`);
      expect(step1).assertEqual(57600);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0236
     * @tc.name      PageLoading_LoadingTimelineFlow_0236
     * @tc.desc      LoadingTimeline call flow nowProgress > nowProgress > text > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0236 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0237
     * @tc.name      PageLoading_LoadingTimelineFlow_0237
     * @tc.desc      LoadingTimeline call flow history > advance > history > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0237 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(177336.9);
      logInfo(`step2 advance(177336.9): step2=${step2}`);
      expect(step2).assertEqual(3540);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(355);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0238
     * @tc.name      PageLoading_LoadingTimelineFlow_0238
     * @tc.desc      LoadingTimeline call flow nowProgress > history > nowProgress > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0238 begin`);
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
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0239
     * @tc.name      PageLoading_LoadingTimelineFlow_0239
     * @tc.desc      LoadingTimeline call flow view > advance > isLoading > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0239 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.advance(2160000);
      logInfo(`step2 advance(2160000): step2=${step2}`);
      expect(step2).assertEqual(43200);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d43200%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0240
     * @tc.name      PageLoading_LoadingTimelineFlow_0240
     * @tc.desc      LoadingTimeline call flow advance > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0240 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(-1274684);
      logInfo(`step1 advance(-1274684): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(2880000);
      logInfo(`step2 advance(2880000): step2=${step2}`);
      expect(step2).assertEqual(57600);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(57600);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0241
     * @tc.name      PageLoading_LoadingTimelineFlow_0241
     * @tc.desc      LoadingTimeline call flow text > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0241 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.advance(5400000);
      logInfo(`step2 advance(5400000): step2=${step2}`);
      expect(step2).assertEqual(108000);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(108000);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0242
     * @tc.name      PageLoading_LoadingTimelineFlow_0242
     * @tc.desc      LoadingTimeline call flow isLoading > view > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0242 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0243
     * @tc.name      PageLoading_LoadingTimelineFlow_0243
     * @tc.desc      LoadingTimeline call flow view > history > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0243 begin`);
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
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0244
     * @tc.name      PageLoading_LoadingTimelineFlow_0244
     * @tc.desc      LoadingTimeline call flow nowProgress > view > nowProgress > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0244 begin`);
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
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0244 end`);
    });
  });
}
