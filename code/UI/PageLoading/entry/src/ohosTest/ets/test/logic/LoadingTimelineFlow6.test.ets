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

/** Logic checks for LoadingTimeline flow (43 cases). */
export default function loadingTimelineFlow6Test(): void {
  describe('LoadingTimelineFlow6Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0304
     * @tc.name      PageLoading_LoadingTimelineFlow_0304
     * @tc.desc      LoadingTimeline call flow text > advance > text > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0304 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.advance(3860622);
      logInfo(`step2 advance(3860622): step2=${step2}`);
      expect(step2).assertEqual(77210);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d77210%');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d77210%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0305
     * @tc.name      PageLoading_LoadingTimelineFlow_0305
     * @tc.desc      LoadingTimeline call flow history > view > advance > view > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0305 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.advance(2160000);
      logInfo(`step3 advance(2160000): step3=${step3}`);
      expect(step3).assertEqual(43200);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(43200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0306
     * @tc.name      PageLoading_LoadingTimelineFlow_0306
     * @tc.desc      LoadingTimeline call flow advance > advance > nowProgress > isLoading > history keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0306 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(2340000);
      logInfo(`step1 advance(2340000): step1=${step1}`);
      expect(step1).assertEqual(46800);
      const step2: number = subject.advance(4536256);
      logInfo(`step2 advance(4536256): step2=${step2}`);
      expect(step2).assertEqual(137520);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(137520);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(13753);
      logInfo(`step5 history(): JSON.stringify(step5.slice(0, 4))=${JSON.stringify(step5.slice(0, 4))}`);
      expect(JSON.stringify(step5.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0307
     * @tc.name      PageLoading_LoadingTimelineFlow_0307
     * @tc.desc      LoadingTimeline call flow history > history > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0307 begin`);
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
      const step4: number = subject.advance(0);
      logInfo(`step4 advance(0): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0308
     * @tc.name      PageLoading_LoadingTimelineFlow_0308
     * @tc.desc      LoadingTimeline call flow history > isLoading > advance > text > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0308 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(3960000);
      logInfo(`step3 advance(3960000): step3=${step3}`);
      expect(step3).assertEqual(79200);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d79200%');
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(79200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0309
     * @tc.name      PageLoading_LoadingTimelineFlow_0309
     * @tc.desc      LoadingTimeline call flow nowProgress > view > isLoading > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0309 begin`);
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
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0310
     * @tc.name      PageLoading_LoadingTimelineFlow_0310
     * @tc.desc      LoadingTimeline call flow nowProgress > view > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0310 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0311
     * @tc.name      PageLoading_LoadingTimelineFlow_0311
     * @tc.desc      LoadingTimeline call flow text > advance > history > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0311 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.advance(4500000);
      logInfo(`step2 advance(4500000): step2=${step2}`);
      expect(step2).assertEqual(90000);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(9001);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(9001);
      logInfo(`step4 history(): JSON.stringify(step4.slice(0, 4))=${JSON.stringify(step4.slice(0, 4))}`);
      expect(JSON.stringify(step4.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0312
     * @tc.name      PageLoading_LoadingTimelineFlow_0312
     * @tc.desc      LoadingTimeline call flow history > nowProgress > isLoading > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0312 begin`);
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
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0313
     * @tc.name      PageLoading_LoadingTimelineFlow_0313
     * @tc.desc      LoadingTimeline call flow nowProgress > isLoading > advance > nowProgress > isLoading keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0313 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(6120000);
      logInfo(`step3 advance(6120000): step3=${step3}`);
      expect(step3).assertEqual(122400);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(122400);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0314
     * @tc.name      PageLoading_LoadingTimelineFlow_0314
     * @tc.desc      LoadingTimeline call flow nowProgress > advance > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0314 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(339813);
      logInfo(`step2 advance(339813): step2=${step2}`);
      expect(step2).assertEqual(6790);
      const step3: number = subject.advance(231973.05);
      logInfo(`step3 advance(231973.05): step3=${step3}`);
      expect(step3).assertEqual(11430);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0315
     * @tc.name      PageLoading_LoadingTimelineFlow_0315
     * @tc.desc      LoadingTimeline call flow text > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0315 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0316
     * @tc.name      PageLoading_LoadingTimelineFlow_0316
     * @tc.desc      LoadingTimeline call flow isLoading > nowProgress > isLoading > history > isLoading keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0316 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0317
     * @tc.name      PageLoading_LoadingTimelineFlow_0317
     * @tc.desc      LoadingTimeline call flow advance > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0317 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(59999);
      logInfo(`step1 advance(59999): step1=${step1}`);
      expect(step1).assertEqual(1190);
      const step2: number = subject.advance(720000);
      logInfo(`step2 advance(720000): step2=${step2}`);
      expect(step2).assertEqual(15590);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0317 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0318
     * @tc.name      PageLoading_LoadingTimelineFlow_0318
     * @tc.desc      LoadingTimeline call flow history > advance > advance > nowProgress > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0318 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(4189112);
      logInfo(`step2 advance(4189112): step2=${step2}`);
      expect(step2).assertEqual(83780);
      const step3: number = subject.advance(3075429.84);
      logInfo(`step3 advance(3075429.84): step3=${step3}`);
      expect(step3).assertEqual(145290);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(145290);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d145290%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0318 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0319
     * @tc.name      PageLoading_LoadingTimelineFlow_0319
     * @tc.desc      LoadingTimeline call flow advance > history > text > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0319 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(540000);
      logInfo(`step1 advance(540000): step1=${step1}`);
      expect(step1).assertEqual(10800);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1081);
      logInfo(`step2 history(): JSON.stringify(step2.slice(0, 4))=${JSON.stringify(step2.slice(0, 4))}`);
      expect(JSON.stringify(step2.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d10800%');
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(10800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0319 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0320
     * @tc.name      PageLoading_LoadingTimelineFlow_0320
     * @tc.desc      LoadingTimeline call flow view > nowProgress > history > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0320 begin`);
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
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      const step5: number = subject.advance(2513375.22);
      logInfo(`step5 advance(2513375.22): step5=${step5}`);
      expect(step5).assertEqual(50260);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0320 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0321
     * @tc.name      PageLoading_LoadingTimelineFlow_0321
     * @tc.desc      LoadingTimeline call flow isLoading > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0321 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(3234590.96);
      logInfo(`step2 advance(3234590.96): step2=${step2}`);
      expect(step2).assertEqual(64690);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(64690);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0321 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0322
     * @tc.name      PageLoading_LoadingTimelineFlow_0322
     * @tc.desc      LoadingTimeline call flow isLoading > text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0322 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.advance(738524);
      logInfo(`step3 advance(738524): step3=${step3}`);
      expect(step3).assertEqual(14770);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0322 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0323
     * @tc.name      PageLoading_LoadingTimelineFlow_0323
     * @tc.desc      LoadingTimeline call flow history > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0323 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.advance(6300000);
      logInfo(`step3 advance(6300000): step3=${step3}`);
      expect(step3).assertEqual(126000);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0323 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0324
     * @tc.name      PageLoading_LoadingTimelineFlow_0324
     * @tc.desc      LoadingTimeline call flow view > isLoading > history > history > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0324 begin`);
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
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0324 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0325
     * @tc.name      PageLoading_LoadingTimelineFlow_0325
     * @tc.desc      LoadingTimeline call flow nowProgress > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0325 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(6106830);
      logInfo(`step2 advance(6106830): step2=${step2}`);
      expect(step2).assertEqual(122130);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(122130);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0325 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0326
     * @tc.name      PageLoading_LoadingTimelineFlow_0326
     * @tc.desc      LoadingTimeline call flow advance > advance > nowProgress > isLoading > history keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0326 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(61000);
      logInfo(`step1 advance(61000): step1=${step1}`);
      expect(step1).assertEqual(1220);
      const step2: number = subject.advance(7035161);
      logInfo(`step2 advance(7035161): step2=${step2}`);
      expect(step2).assertEqual(141920);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(141920);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(14193);
      logInfo(`step5 history(): JSON.stringify(step5.slice(0, 4))=${JSON.stringify(step5.slice(0, 4))}`);
      expect(JSON.stringify(step5.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0326 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0327
     * @tc.name      PageLoading_LoadingTimelineFlow_0327
     * @tc.desc      LoadingTimeline call flow isLoading > nowProgress > nowProgress > nowProgress keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0327 begin`);
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
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0327 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0328
     * @tc.name      PageLoading_LoadingTimelineFlow_0328
     * @tc.desc      LoadingTimeline call flow isLoading > advance > nowProgress > nowProgress > advance keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0328 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(1440000);
      logInfo(`step2 advance(1440000): step2=${step2}`);
      expect(step2).assertEqual(28800);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(28800);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(28800);
      const step5: number = subject.advance(6120000);
      logInfo(`step5 advance(6120000): step5=${step5}`);
      expect(step5).assertEqual(151200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0328 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0329
     * @tc.name      PageLoading_LoadingTimelineFlow_0329
     * @tc.desc      LoadingTimeline call flow nowProgress > view > text > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0329 begin`);
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
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0329 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0330
     * @tc.name      PageLoading_LoadingTimelineFlow_0330
     * @tc.desc      LoadingTimeline call flow history > advance > isLoading > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0330 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(-1274684);
      logInfo(`step2 advance(-1274684): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0330 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0331
     * @tc.name      PageLoading_LoadingTimelineFlow_0331
     * @tc.desc      LoadingTimeline call flow advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0331 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3777947);
      logInfo(`step1 advance(3777947): step1=${step1}`);
      expect(step1).assertEqual(75550);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(7556);
      logInfo(`step2 history(): JSON.stringify(step2.slice(0, 4))=${JSON.stringify(step2.slice(0, 4))}`);
      expect(JSON.stringify(step2.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0331 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0332
     * @tc.name      PageLoading_LoadingTimelineFlow_0332
     * @tc.desc      LoadingTimeline call flow advance > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0332 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3600000);
      logInfo(`step1 advance(3600000): step1=${step1}`);
      expect(step1).assertEqual(72000);
      const step2: number = subject.advance(2747461.53);
      logInfo(`step2 advance(2747461.53): step2=${step2}`);
      expect(step2).assertEqual(126940);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(126940);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0332 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0333
     * @tc.name      PageLoading_LoadingTimelineFlow_0333
     * @tc.desc      LoadingTimeline call flow history > isLoading > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0333 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(3071466.91);
      logInfo(`step3 advance(3071466.91): step3=${step3}`);
      expect(step3).assertEqual(61420);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0333 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0334
     * @tc.name      PageLoading_LoadingTimelineFlow_0334
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > nowProgress > history > isLoading keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0334 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0334 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0335
     * @tc.name      PageLoading_LoadingTimelineFlow_0335
     * @tc.desc      LoadingTimeline call flow nowProgress > nowProgress > view > nowProgress > nowProgress keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0335 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0335 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0336
     * @tc.name      PageLoading_LoadingTimelineFlow_0336
     * @tc.desc      LoadingTimeline call flow history > nowProgress > advance > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0336 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.advance(2853842);
      logInfo(`step3 advance(2853842): step3=${step3}`);
      expect(step3).assertEqual(57070);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0336 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0337
     * @tc.name      PageLoading_LoadingTimelineFlow_0337
     * @tc.desc      LoadingTimeline call flow text > view > view > isLoading > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0337 begin`);
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
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0337 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0338
     * @tc.name      PageLoading_LoadingTimelineFlow_0338
     * @tc.desc      LoadingTimeline call flow view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0338 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.advance(3777947);
      logInfo(`step2 advance(3777947): step2=${step2}`);
      expect(step2).assertEqual(75550);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0338 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0339
     * @tc.name      PageLoading_LoadingTimelineFlow_0339
     * @tc.desc      LoadingTimeline call flow text > view > nowProgress > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0339 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0339 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0340
     * @tc.name      PageLoading_LoadingTimelineFlow_0340
     * @tc.desc      LoadingTimeline call flow history > advance > history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0340 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(738524);
      logInfo(`step2 advance(738524): step2=${step2}`);
      expect(step2).assertEqual(14770);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1478);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d14770%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0340 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0341
     * @tc.name      PageLoading_LoadingTimelineFlow_0341
     * @tc.desc      LoadingTimeline call flow isLoading > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0341 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(60000);
      logInfo(`step2 advance(60000): step2=${step2}`);
      expect(step2).assertEqual(1200);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0341 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0342
     * @tc.name      PageLoading_LoadingTimelineFlow_0342
     * @tc.desc      LoadingTimeline call flow history > nowProgress > text > advance > nowProgress keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0342 begin`);
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
      const step4: number = subject.advance(5996181);
      logInfo(`step4 advance(5996181): step4=${step4}`);
      expect(step4).assertEqual(119920);
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(119920);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0342 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0343
     * @tc.name      PageLoading_LoadingTimelineFlow_0343
     * @tc.desc      LoadingTimeline call flow view > history > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0343 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.advance(4410101);
      logInfo(`step3 advance(4410101): step3=${step3}`);
      expect(step3).assertEqual(88200);
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(8821);
      logInfo(`step4 history(): JSON.stringify(step4.slice(0, 4))=${JSON.stringify(step4.slice(0, 4))}`);
      expect(JSON.stringify(step4.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0343 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0344
     * @tc.name      PageLoading_LoadingTimelineFlow_0344
     * @tc.desc      LoadingTimeline call flow isLoading > advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0344 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(522532);
      logInfo(`step2 advance(522532): step2=${step2}`);
      expect(step2).assertEqual(10450);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0344 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0345
     * @tc.name      PageLoading_LoadingTimelineFlow_0345
     * @tc.desc      LoadingTimeline call flow advance > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0345 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(180000);
      logInfo(`step1 advance(180000): step1=${step1}`);
      expect(step1).assertEqual(3600);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d3600%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0345 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0346
     * @tc.name      PageLoading_LoadingTimelineFlow_0346
     * @tc.desc      LoadingTimeline call flow isLoading > advance > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0346 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(3901783);
      logInfo(`step2 advance(3901783): step2=${step2}`);
      expect(step2).assertEqual(78030);
      const step3: number = subject.advance(180000);
      logInfo(`step3 advance(180000): step3=${step3}`);
      expect(step3).assertEqual(81630);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0346 end`);
    });
  });
}
