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

/** Logic checks for LoadingTimeline flow (60 cases). */
export default function loadingTimelineFlowTest(): void {
  describe('LoadingTimelineFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0001
     * @tc.name      PageLoading_LoadingTimelineFlow_0001
     * @tc.desc      LoadingTimeline call flow history > view > isLoading > nowProgress > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_LoadingTimelineFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0001 begin`);
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
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0002
     * @tc.name      PageLoading_LoadingTimelineFlow_0002
     * @tc.desc      LoadingTimeline call flow history > text > isLoading > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_LoadingTimelineFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0002 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0003
     * @tc.name      PageLoading_LoadingTimelineFlow_0003
     * @tc.desc      LoadingTimeline call flow view > nowProgress > view > nowProgress > isLoading keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0003 begin`);
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
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0004
     * @tc.name      PageLoading_LoadingTimelineFlow_0004
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > history > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0004 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3441279.2);
      logInfo(`step1 advance(3441279.2): step1=${step1}`);
      expect(step1).assertEqual(68820);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(68820);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(6883);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0005
     * @tc.name      PageLoading_LoadingTimelineFlow_0005
     * @tc.desc      LoadingTimeline call flow view > nowProgress > view > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0005 begin`);
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
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0006
     * @tc.name      PageLoading_LoadingTimelineFlow_0006
     * @tc.desc      LoadingTimeline call flow nowProgress > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0006 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0007
     * @tc.name      PageLoading_LoadingTimelineFlow_0007
     * @tc.desc      LoadingTimeline call flow text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0007 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0008
     * @tc.name      PageLoading_LoadingTimelineFlow_0008
     * @tc.desc      LoadingTimeline call flow nowProgress > advance > view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0008 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(-617465);
      logInfo(`step2 advance(-617465): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0009
     * @tc.name      PageLoading_LoadingTimelineFlow_0009
     * @tc.desc      LoadingTimeline call flow history > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0009 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0010
     * @tc.name      PageLoading_LoadingTimelineFlow_0010
     * @tc.desc      LoadingTimeline call flow nowProgress > advance > advance > text > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0010 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(4716812);
      logInfo(`step2 advance(4716812): step2=${step2}`);
      expect(step2).assertEqual(94330);
      const step3: number = subject.advance(-664866);
      logInfo(`step3 advance(-664866): step3=${step3}`);
      expect(step3).assertEqual(94330);
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d94330%');
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(9434);
      logInfo(`step5 history(): JSON.stringify(step5.slice(0, 4))=${JSON.stringify(step5.slice(0, 4))}`);
      expect(JSON.stringify(step5.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0011
     * @tc.name      PageLoading_LoadingTimelineFlow_0011
     * @tc.desc      LoadingTimeline call flow text > advance > nowProgress > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0011 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.advance(7200000);
      logInfo(`step2 advance(7200000): step2=${step2}`);
      expect(step2).assertEqual(144000);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(144000);
      const step4: number = subject.advance(540000);
      logInfo(`step4 advance(540000): step4=${step4}`);
      expect(step4).assertEqual(154800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0012
     * @tc.name      PageLoading_LoadingTimelineFlow_0012
     * @tc.desc      LoadingTimeline call flow view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0012 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0013
     * @tc.name      PageLoading_LoadingTimelineFlow_0013
     * @tc.desc      LoadingTimeline call flow view > view > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0013 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0014
     * @tc.name      PageLoading_LoadingTimelineFlow_0014
     * @tc.desc      LoadingTimeline call flow view > text > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0014 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.advance(1440000);
      logInfo(`step3 advance(1440000): step3=${step3}`);
      expect(step3).assertEqual(28800);
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(28800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0015
     * @tc.name      PageLoading_LoadingTimelineFlow_0015
     * @tc.desc      LoadingTimeline call flow history > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0015 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(3213726);
      logInfo(`step2 advance(3213726): step2=${step2}`);
      expect(step2).assertEqual(64270);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(64270);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0016
     * @tc.name      PageLoading_LoadingTimelineFlow_0016
     * @tc.desc      LoadingTimeline call flow text > history > view > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0016 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0017
     * @tc.name      PageLoading_LoadingTimelineFlow_0017
     * @tc.desc      LoadingTimeline call flow text > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0017 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0018
     * @tc.name      PageLoading_LoadingTimelineFlow_0018
     * @tc.desc      LoadingTimeline call flow view > history > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0018 begin`);
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
      const step4: number = subject.advance(1980295.07);
      logInfo(`step4 advance(1980295.07): step4=${step4}`);
      expect(step4).assertEqual(39600);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0019
     * @tc.name      PageLoading_LoadingTimelineFlow_0019
     * @tc.desc      LoadingTimeline call flow view > nowProgress > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0019 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0020
     * @tc.name      PageLoading_LoadingTimelineFlow_0020
     * @tc.desc      LoadingTimeline call flow text > isLoading > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0020 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0021
     * @tc.name      PageLoading_LoadingTimelineFlow_0021
     * @tc.desc      LoadingTimeline call flow nowProgress > text > nowProgress > advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0021 begin`);
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
      const step4: number = subject.advance(7035161);
      logInfo(`step4 advance(7035161): step4=${step4}`);
      expect(step4).assertEqual(140700);
      const step5: string = subject.view();
      logInfo(`step5 view(): step5=${step5}`);
      expect(step5).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0022
     * @tc.name      PageLoading_LoadingTimelineFlow_0022
     * @tc.desc      LoadingTimeline call flow nowProgress > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0022 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0023
     * @tc.name      PageLoading_LoadingTimelineFlow_0023
     * @tc.desc      LoadingTimeline call flow advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0023 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3860622);
      logInfo(`step1 advance(3860622): step1=${step1}`);
      expect(step1).assertEqual(77210);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0024
     * @tc.name      PageLoading_LoadingTimelineFlow_0024
     * @tc.desc      LoadingTimeline call flow nowProgress > advance > text > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0024 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(2216807.81);
      logInfo(`step2 advance(2216807.81): step2=${step2}`);
      expect(step2).assertEqual(44330);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d44330%');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      const step5: number = subject.advance(3075429.84);
      logInfo(`step5 advance(3075429.84): step5=${step5}`);
      expect(step5).assertEqual(105840);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0025
     * @tc.name      PageLoading_LoadingTimelineFlow_0025
     * @tc.desc      LoadingTimeline call flow isLoading > advance > history > nowProgress > isLoading keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0025 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.advance(339813);
      logInfo(`step2 advance(339813): step2=${step2}`);
      expect(step2).assertEqual(6790);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(680);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(6790);
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0026
     * @tc.name      PageLoading_LoadingTimelineFlow_0026
     * @tc.desc      LoadingTimeline call flow advance > advance > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0026 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(1800000);
      logInfo(`step1 advance(1800000): step1=${step1}`);
      expect(step1).assertEqual(36000);
      const step2: number = subject.advance(7200000);
      logInfo(`step2 advance(7200000): step2=${step2}`);
      expect(step2).assertEqual(180000);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d180000%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0027
     * @tc.name      PageLoading_LoadingTimelineFlow_0027
     * @tc.desc      LoadingTimeline call flow history > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0027 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.history();
      logInfo(`step2 history(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0028
     * @tc.name      PageLoading_LoadingTimelineFlow_0028
     * @tc.desc      LoadingTimeline call flow history > advance > isLoading > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0028 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(6840000);
      logInfo(`step2 advance(6840000): step2=${step2}`);
      expect(step2).assertEqual(136800);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(136800);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0029
     * @tc.name      PageLoading_LoadingTimelineFlow_0029
     * @tc.desc      LoadingTimeline call flow history > nowProgress > history > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0029 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.advance(339813);
      logInfo(`step4 advance(339813): step4=${step4}`);
      expect(step4).assertEqual(6790);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0030
     * @tc.name      PageLoading_LoadingTimelineFlow_0030
     * @tc.desc      LoadingTimeline call flow nowProgress > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0030 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0031
     * @tc.name      PageLoading_LoadingTimelineFlow_0031
     * @tc.desc      LoadingTimeline call flow advance > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0031 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(-2422);
      logInfo(`step1 advance(-2422): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0032
     * @tc.name      PageLoading_LoadingTimelineFlow_0032
     * @tc.desc      LoadingTimeline call flow history > text > isLoading > view > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0032 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      const step5: boolean = subject.isLoading();
      logInfo(`step5 isLoading(): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0033
     * @tc.name      PageLoading_LoadingTimelineFlow_0033
     * @tc.desc      LoadingTimeline call flow view > view > history > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0033 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.view();
      logInfo(`step2 view(): step2=${step2}`);
      expect(step2).assertEqual('LoadingHUD');
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0034
     * @tc.name      PageLoading_LoadingTimelineFlow_0034
     * @tc.desc      LoadingTimeline call flow nowProgress > text > view > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0034 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('LoadingHUD');
      const step4: number = subject.advance(6120000);
      logInfo(`step4 advance(6120000): step4=${step4}`);
      expect(step4).assertEqual(122400);
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(12241);
      logInfo(`step5 history(): JSON.stringify(step5.slice(0, 4))=${JSON.stringify(step5.slice(0, 4))}`);
      expect(JSON.stringify(step5.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0035
     * @tc.name      PageLoading_LoadingTimelineFlow_0035
     * @tc.desc      LoadingTimeline call flow nowProgress > history > nowProgress > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0035 begin`);
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
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0036
     * @tc.name      PageLoading_LoadingTimelineFlow_0036
     * @tc.desc      LoadingTimeline call flow advance > advance > text > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0036 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(2520000);
      logInfo(`step1 advance(2520000): step1=${step1}`);
      expect(step1).assertEqual(50400);
      const step2: number = subject.advance(1980000);
      logInfo(`step2 advance(1980000): step2=${step2}`);
      expect(step2).assertEqual(90000);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d90000%');
      const step4: number = subject.advance(-2045340);
      logInfo(`step4 advance(-2045340): step4=${step4}`);
      expect(step4).assertEqual(90000);
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(90000);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0037
     * @tc.name      PageLoading_LoadingTimelineFlow_0037
     * @tc.desc      LoadingTimeline call flow history > advance > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0037 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string[] = subject.history();
      logInfo(`step1 history(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.advance(4039524);
      logInfo(`step2 advance(4039524): step2=${step2}`);
      expect(step2).assertEqual(80790);
      const step3: boolean = subject.isLoading();
      logInfo(`step3 isLoading(): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0038
     * @tc.name      PageLoading_LoadingTimelineFlow_0038
     * @tc.desc      LoadingTimeline call flow isLoading > view > view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0038 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0039
     * @tc.name      PageLoading_LoadingTimelineFlow_0039
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0039 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(6840000);
      logInfo(`step1 advance(6840000): step1=${step1}`);
      expect(step1).assertEqual(136800);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(136800);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d136800%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0040
     * @tc.name      PageLoading_LoadingTimelineFlow_0040
     * @tc.desc      LoadingTimeline call flow text > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0040 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.text();
      logInfo(`step1 text(): step1=${step1}`);
      expect(step1).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step2: number = subject.advance(2520000);
      logInfo(`step2 advance(2520000): step2=${step2}`);
      expect(step2).assertEqual(50400);
      const step3: string[] = subject.history();
      logInfo(`step3 history(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(5041);
      logInfo(`step3 history(): JSON.stringify(step3.slice(0, 4))=${JSON.stringify(step3.slice(0, 4))}`);
      expect(JSON.stringify(step3.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0041
     * @tc.name      PageLoading_LoadingTimelineFlow_0041
     * @tc.desc      LoadingTimeline call flow view > nowProgress > view > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0041 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0042
     * @tc.name      PageLoading_LoadingTimelineFlow_0042
     * @tc.desc      LoadingTimeline call flow advance > text > text > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0042 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(3);
      logInfo(`step1 advance(3): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0043
     * @tc.name      PageLoading_LoadingTimelineFlow_0043
     * @tc.desc      LoadingTimeline call flow text > view > view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0043 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0044
     * @tc.name      PageLoading_LoadingTimelineFlow_0044
     * @tc.desc      LoadingTimeline call flow view > isLoading > advance > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0044 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.advance(360000);
      logInfo(`step3 advance(360000): step3=${step3}`);
      expect(step3).assertEqual(7200);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0045
     * @tc.name      PageLoading_LoadingTimelineFlow_0045
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0045 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0046
     * @tc.name      PageLoading_LoadingTimelineFlow_0046
     * @tc.desc      LoadingTimeline call flow advance > advance > advance > isLoading > nowProgress keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0046 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(180000);
      logInfo(`step1 advance(180000): step1=${step1}`);
      expect(step1).assertEqual(3600);
      const step2: number = subject.advance(4140000);
      logInfo(`step2 advance(4140000): step2=${step2}`);
      expect(step2).assertEqual(86400);
      const step3: number = subject.advance(1000);
      logInfo(`step3 advance(1000): step3=${step3}`);
      expect(step3).assertEqual(86420);
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(86420);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0047
     * @tc.name      PageLoading_LoadingTimelineFlow_0047
     * @tc.desc      LoadingTimeline call flow view > history > history > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0047 begin`);
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
      const step4: number = subject.advance(2230624.39);
      logInfo(`step4 advance(2230624.39): step4=${step4}`);
      expect(step4).assertEqual(44610);
      const step5: number = subject.nowProgress();
      logInfo(`step5 nowProgress(): step5=${step5}`);
      expect(step5).assertEqual(44610);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0048
     * @tc.name      PageLoading_LoadingTimelineFlow_0048
     * @tc.desc      LoadingTimeline call flow advance > text > view > isLoading > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0048 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(7035161);
      logInfo(`step1 advance(7035161): step1=${step1}`);
      expect(step1).assertEqual(140700);
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d140700%');
      const step3: string = subject.view();
      logInfo(`step3 view(): step3=${step3}`);
      expect(step3).assertEqual('CommodityList');
      const step4: boolean = subject.isLoading();
      logInfo(`step4 isLoading(): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string[] = subject.history();
      logInfo(`step5 history(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(14071);
      logInfo(`step5 history(): JSON.stringify(step5.slice(0, 4))=${JSON.stringify(step5.slice(0, 4))}`);
      expect(JSON.stringify(step5.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0049
     * @tc.name      PageLoading_LoadingTimelineFlow_0049
     * @tc.desc      LoadingTimeline call flow advance > isLoading > text > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0049 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(59999);
      logInfo(`step1 advance(59999): step1=${step1}`);
      expect(step1).assertEqual(1190);
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d1190%');
      const step4: number = subject.advance(-259121);
      logInfo(`step4 advance(-259121): step4=${step4}`);
      expect(step4).assertEqual(1190);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0050
     * @tc.name      PageLoading_LoadingTimelineFlow_0050
     * @tc.desc      LoadingTimeline call flow text > nowProgress > view keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0050 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0051
     * @tc.name      PageLoading_LoadingTimelineFlow_0051
     * @tc.desc      LoadingTimeline call flow nowProgress > advance > text > nowProgress > advance keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0051 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.nowProgress();
      logInfo(`step1 nowProgress(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.advance(3240000);
      logInfo(`step2 advance(3240000): step2=${step2}`);
      expect(step2).assertEqual(64800);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d64800%');
      const step4: number = subject.nowProgress();
      logInfo(`step4 nowProgress(): step4=${step4}`);
      expect(step4).assertEqual(64800);
      const step5: number = subject.advance(3213726);
      logInfo(`step5 advance(3213726): step5=${step5}`);
      expect(step5).assertEqual(129070);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0052
     * @tc.name      PageLoading_LoadingTimelineFlow_0052
     * @tc.desc      LoadingTimeline call flow view > nowProgress > history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0052 begin`);
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
      const step4: string = subject.text();
      logInfo(`step4 text(): step4=${step4}`);
      expect(step4).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0053
     * @tc.name      PageLoading_LoadingTimelineFlow_0053
     * @tc.desc      LoadingTimeline call flow advance > nowProgress > text > view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0053 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: number = subject.advance(4320000);
      logInfo(`step1 advance(4320000): step1=${step1}`);
      expect(step1).assertEqual(86400);
      const step2: number = subject.nowProgress();
      logInfo(`step2 nowProgress(): step2=${step2}`);
      expect(step2).assertEqual(86400);
      const step3: string = subject.text();
      logInfo(`step3 text(): step3=${step3}`);
      expect(step3).assertEqual('当前已加载86400%');
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('CommodityList');
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('当前已加载86400%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0054
     * @tc.name      PageLoading_LoadingTimelineFlow_0054
     * @tc.desc      LoadingTimeline call flow view > text > nowProgress > view > advance keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0054 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.view();
      logInfo(`step4 view(): step4=${step4}`);
      expect(step4).assertEqual('LoadingHUD');
      const step5: number = subject.advance(5996181);
      logInfo(`step5 advance(5996181): step5=${step5}`);
      expect(step5).assertEqual(119920);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0055
     * @tc.name      PageLoading_LoadingTimelineFlow_0055
     * @tc.desc      LoadingTimeline call flow history > view > isLoading > history > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0055 begin`);
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
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string = subject.text();
      logInfo(`step5 text(): step5=${step5}`);
      expect(step5).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0056
     * @tc.name      PageLoading_LoadingTimelineFlow_0056
     * @tc.desc      LoadingTimeline call flow isLoading > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0056 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.text();
      logInfo(`step2 text(): step2=${step2}`);
      expect(step2).assertEqual('\u5f53\u524d\u5df2\u52a0\u8f7d0%');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0057
     * @tc.name      PageLoading_LoadingTimelineFlow_0057
     * @tc.desc      LoadingTimeline call flow nowProgress > view > text keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0057 begin`);
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
      logInfo(`${BUNDLE}LoadingTimelineFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0058
     * @tc.name      PageLoading_LoadingTimelineFlow_0058
     * @tc.desc      LoadingTimeline call flow view > advance > nowProgress keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0058 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.advance(2134238.89);
      logInfo(`step2 advance(2134238.89): step2=${step2}`);
      expect(step2).assertEqual(42680);
      const step3: number = subject.nowProgress();
      logInfo(`step3 nowProgress(): step3=${step3}`);
      expect(step3).assertEqual(42680);
      logInfo(`${BUNDLE}LoadingTimelineFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0059
     * @tc.name      PageLoading_LoadingTimelineFlow_0059
     * @tc.desc      LoadingTimeline call flow isLoading > isLoading keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0059 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: boolean = subject.isLoading();
      logInfo(`step1 isLoading(): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.isLoading();
      logInfo(`step2 isLoading(): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}LoadingTimelineFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_FLOW_0060
     * @tc.name      PageLoading_LoadingTimelineFlow_0060
     * @tc.desc      LoadingTimeline call flow view > advance > advance > history keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineFlow_0060 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const step1: string = subject.view();
      logInfo(`step1 view(): step1=${step1}`);
      expect(step1).assertEqual('LoadingHUD');
      const step2: number = subject.advance(5220000);
      logInfo(`step2 advance(5220000): step2=${step2}`);
      expect(step2).assertEqual(104400);
      const step3: number = subject.advance(3213726);
      logInfo(`step3 advance(3213726): step3=${step3}`);
      expect(step3).assertEqual(168670);
      const step4: string[] = subject.history();
      logInfo(`step4 history(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(16868);
      logInfo(`step4 history(): JSON.stringify(step4.slice(0, 4))=${JSON.stringify(step4.slice(0, 4))}`);
      expect(JSON.stringify(step4.slice(0, 4))).assertEqual('["progress10","progress20","progress30","progress40"]');
      logInfo(`${BUNDLE}LoadingTimelineFlow_0060 end`);
    });
  });
}
