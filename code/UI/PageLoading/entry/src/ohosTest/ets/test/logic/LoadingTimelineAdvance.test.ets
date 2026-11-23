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

/** Logic checks for LoadingTimeline.advance (90 cases). */
export default function loadingTimelineAdvanceTest(): void {
  describe('LoadingTimelineAdvanceTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0001
     * @tc.name      PageLoading_LoadingTimelineAdvance_0001
     * @tc.desc      LoadingTimeline.advance(ms=0) yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_LoadingTimelineAdvance_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0001 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(0);
      logInfo(`advance(ms=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0001 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0002
     * @tc.name      PageLoading_LoadingTimelineAdvance_0002
     * @tc.desc      LoadingTimeline.advance(ms=500) yields 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_LoadingTimelineAdvance_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0002 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(500);
      logInfo(`advance(ms=500): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0002 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0003
     * @tc.name      PageLoading_LoadingTimelineAdvance_0003
     * @tc.desc      LoadingTimeline.advance(ms=1000) yields 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0003 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1000);
      logInfo(`advance(ms=1000): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0003 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0004
     * @tc.name      PageLoading_LoadingTimelineAdvance_0004
     * @tc.desc      LoadingTimeline.advance(ms=59999) yields 1190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0004 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(59999);
      logInfo(`advance(ms=59999): actual=${actual}`);
      expect(actual).assertEqual(1190);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0004 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0005
     * @tc.name      PageLoading_LoadingTimelineAdvance_0005
     * @tc.desc      LoadingTimeline.advance(ms=60000) yields 1200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0005 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(60000);
      logInfo(`advance(ms=60000): actual=${actual}`);
      expect(actual).assertEqual(1200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0005 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0006
     * @tc.name      PageLoading_LoadingTimelineAdvance_0006
     * @tc.desc      LoadingTimeline.advance(ms=61000) yields 1220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0006 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(61000);
      logInfo(`advance(ms=61000): actual=${actual}`);
      expect(actual).assertEqual(1220);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0006 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0007
     * @tc.name      PageLoading_LoadingTimelineAdvance_0007
     * @tc.desc      LoadingTimeline.advance(ms=3599000) yields 71980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0007 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3599000);
      logInfo(`advance(ms=3599000): actual=${actual}`);
      expect(actual).assertEqual(71980);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0007 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0008
     * @tc.name      PageLoading_LoadingTimelineAdvance_0008
     * @tc.desc      LoadingTimeline.advance(ms=3600000) yields 72000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0008 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3600000);
      logInfo(`advance(ms=3600000): actual=${actual}`);
      expect(actual).assertEqual(72000);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0008 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0009
     * @tc.name      PageLoading_LoadingTimelineAdvance_0009
     * @tc.desc      LoadingTimeline.advance(ms=180000) yields 3600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0009 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(180000);
      logInfo(`advance(ms=180000): actual=${actual}`);
      expect(actual).assertEqual(3600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0009 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0010
     * @tc.name      PageLoading_LoadingTimelineAdvance_0010
     * @tc.desc      LoadingTimeline.advance(ms=360000) yields 7200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0010 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(360000);
      logInfo(`advance(ms=360000): actual=${actual}`);
      expect(actual).assertEqual(7200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0010 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0011
     * @tc.name      PageLoading_LoadingTimelineAdvance_0011
     * @tc.desc      LoadingTimeline.advance(ms=540000) yields 10800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0011 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(540000);
      logInfo(`advance(ms=540000): actual=${actual}`);
      expect(actual).assertEqual(10800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0011 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0012
     * @tc.name      PageLoading_LoadingTimelineAdvance_0012
     * @tc.desc      LoadingTimeline.advance(ms=720000) yields 14400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0012 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(720000);
      logInfo(`advance(ms=720000): actual=${actual}`);
      expect(actual).assertEqual(14400);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0012 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0013
     * @tc.name      PageLoading_LoadingTimelineAdvance_0013
     * @tc.desc      LoadingTimeline.advance(ms=900000) yields 18000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0013 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(900000);
      logInfo(`advance(ms=900000): actual=${actual}`);
      expect(actual).assertEqual(18000);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0013 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0014
     * @tc.name      PageLoading_LoadingTimelineAdvance_0014
     * @tc.desc      LoadingTimeline.advance(ms=1080000) yields 21600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0014 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1080000);
      logInfo(`advance(ms=1080000): actual=${actual}`);
      expect(actual).assertEqual(21600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0014 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0015
     * @tc.name      PageLoading_LoadingTimelineAdvance_0015
     * @tc.desc      LoadingTimeline.advance(ms=1260000) yields 25200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0015 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1260000);
      logInfo(`advance(ms=1260000): actual=${actual}`);
      expect(actual).assertEqual(25200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0015 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0016
     * @tc.name      PageLoading_LoadingTimelineAdvance_0016
     * @tc.desc      LoadingTimeline.advance(ms=1440000) yields 28800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0016 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1440000);
      logInfo(`advance(ms=1440000): actual=${actual}`);
      expect(actual).assertEqual(28800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0016 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0017
     * @tc.name      PageLoading_LoadingTimelineAdvance_0017
     * @tc.desc      LoadingTimeline.advance(ms=1620000) yields 32400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0017 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1620000);
      logInfo(`advance(ms=1620000): actual=${actual}`);
      expect(actual).assertEqual(32400);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0017 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0018
     * @tc.name      PageLoading_LoadingTimelineAdvance_0018
     * @tc.desc      LoadingTimeline.advance(ms=1800000) yields 36000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0018 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1800000);
      logInfo(`advance(ms=1800000): actual=${actual}`);
      expect(actual).assertEqual(36000);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0018 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0019
     * @tc.name      PageLoading_LoadingTimelineAdvance_0019
     * @tc.desc      LoadingTimeline.advance(ms=1980000) yields 39600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0019 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1980000);
      logInfo(`advance(ms=1980000): actual=${actual}`);
      expect(actual).assertEqual(39600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0019 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0020
     * @tc.name      PageLoading_LoadingTimelineAdvance_0020
     * @tc.desc      LoadingTimeline.advance(ms=2160000) yields 43200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0020 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2160000);
      logInfo(`advance(ms=2160000): actual=${actual}`);
      expect(actual).assertEqual(43200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0020 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0021
     * @tc.name      PageLoading_LoadingTimelineAdvance_0021
     * @tc.desc      LoadingTimeline.advance(ms=2340000) yields 46800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0021 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2340000);
      logInfo(`advance(ms=2340000): actual=${actual}`);
      expect(actual).assertEqual(46800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0021 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0022
     * @tc.name      PageLoading_LoadingTimelineAdvance_0022
     * @tc.desc      LoadingTimeline.advance(ms=2520000) yields 50400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0022 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2520000);
      logInfo(`advance(ms=2520000): actual=${actual}`);
      expect(actual).assertEqual(50400);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0022 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0023
     * @tc.name      PageLoading_LoadingTimelineAdvance_0023
     * @tc.desc      LoadingTimeline.advance(ms=2700000) yields 54000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0023 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2700000);
      logInfo(`advance(ms=2700000): actual=${actual}`);
      expect(actual).assertEqual(54000);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0023 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0024
     * @tc.name      PageLoading_LoadingTimelineAdvance_0024
     * @tc.desc      LoadingTimeline.advance(ms=2880000) yields 57600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0024 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2880000);
      logInfo(`advance(ms=2880000): actual=${actual}`);
      expect(actual).assertEqual(57600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0024 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0025
     * @tc.name      PageLoading_LoadingTimelineAdvance_0025
     * @tc.desc      LoadingTimeline.advance(ms=3060000) yields 61200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0025 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3060000);
      logInfo(`advance(ms=3060000): actual=${actual}`);
      expect(actual).assertEqual(61200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0025 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0026
     * @tc.name      PageLoading_LoadingTimelineAdvance_0026
     * @tc.desc      LoadingTimeline.advance(ms=3240000) yields 64800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0026 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3240000);
      logInfo(`advance(ms=3240000): actual=${actual}`);
      expect(actual).assertEqual(64800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0026 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0027
     * @tc.name      PageLoading_LoadingTimelineAdvance_0027
     * @tc.desc      LoadingTimeline.advance(ms=3420000) yields 68400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0027 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3420000);
      logInfo(`advance(ms=3420000): actual=${actual}`);
      expect(actual).assertEqual(68400);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0027 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0028
     * @tc.name      PageLoading_LoadingTimelineAdvance_0028
     * @tc.desc      LoadingTimeline.advance(ms=3780000) yields 75600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0028 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3780000);
      logInfo(`advance(ms=3780000): actual=${actual}`);
      expect(actual).assertEqual(75600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0028 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0029
     * @tc.name      PageLoading_LoadingTimelineAdvance_0029
     * @tc.desc      LoadingTimeline.advance(ms=3960000) yields 79200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0029 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3960000);
      logInfo(`advance(ms=3960000): actual=${actual}`);
      expect(actual).assertEqual(79200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0029 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0030
     * @tc.name      PageLoading_LoadingTimelineAdvance_0030
     * @tc.desc      LoadingTimeline.advance(ms=4140000) yields 82800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0030 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4140000);
      logInfo(`advance(ms=4140000): actual=${actual}`);
      expect(actual).assertEqual(82800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0030 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0031
     * @tc.name      PageLoading_LoadingTimelineAdvance_0031
     * @tc.desc      LoadingTimeline.advance(ms=4320000) yields 86400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0031 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4320000);
      logInfo(`advance(ms=4320000): actual=${actual}`);
      expect(actual).assertEqual(86400);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0031 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0032
     * @tc.name      PageLoading_LoadingTimelineAdvance_0032
     * @tc.desc      LoadingTimeline.advance(ms=4500000) yields 90000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0032 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4500000);
      logInfo(`advance(ms=4500000): actual=${actual}`);
      expect(actual).assertEqual(90000);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0032 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0033
     * @tc.name      PageLoading_LoadingTimelineAdvance_0033
     * @tc.desc      LoadingTimeline.advance(ms=4680000) yields 93600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0033 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4680000);
      logInfo(`advance(ms=4680000): actual=${actual}`);
      expect(actual).assertEqual(93600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0033 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0034
     * @tc.name      PageLoading_LoadingTimelineAdvance_0034
     * @tc.desc      LoadingTimeline.advance(ms=4860000) yields 97200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0034 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4860000);
      logInfo(`advance(ms=4860000): actual=${actual}`);
      expect(actual).assertEqual(97200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0034 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0035
     * @tc.name      PageLoading_LoadingTimelineAdvance_0035
     * @tc.desc      LoadingTimeline.advance(ms=5040000) yields 100800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0035 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5040000);
      logInfo(`advance(ms=5040000): actual=${actual}`);
      expect(actual).assertEqual(100800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0035 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0036
     * @tc.name      PageLoading_LoadingTimelineAdvance_0036
     * @tc.desc      LoadingTimeline.advance(ms=5220000) yields 104400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0036 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5220000);
      logInfo(`advance(ms=5220000): actual=${actual}`);
      expect(actual).assertEqual(104400);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0036 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0037
     * @tc.name      PageLoading_LoadingTimelineAdvance_0037
     * @tc.desc      LoadingTimeline.advance(ms=5400000) yields 108000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0037 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5400000);
      logInfo(`advance(ms=5400000): actual=${actual}`);
      expect(actual).assertEqual(108000);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0037 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0038
     * @tc.name      PageLoading_LoadingTimelineAdvance_0038
     * @tc.desc      LoadingTimeline.advance(ms=5580000) yields 111600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0038 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5580000);
      logInfo(`advance(ms=5580000): actual=${actual}`);
      expect(actual).assertEqual(111600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0038 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0039
     * @tc.name      PageLoading_LoadingTimelineAdvance_0039
     * @tc.desc      LoadingTimeline.advance(ms=5760000) yields 115200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0039 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5760000);
      logInfo(`advance(ms=5760000): actual=${actual}`);
      expect(actual).assertEqual(115200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0039 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0040
     * @tc.name      PageLoading_LoadingTimelineAdvance_0040
     * @tc.desc      LoadingTimeline.advance(ms=5940000) yields 118800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0040 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5940000);
      logInfo(`advance(ms=5940000): actual=${actual}`);
      expect(actual).assertEqual(118800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0040 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0041
     * @tc.name      PageLoading_LoadingTimelineAdvance_0041
     * @tc.desc      LoadingTimeline.advance(ms=6120000) yields 122400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0041 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6120000);
      logInfo(`advance(ms=6120000): actual=${actual}`);
      expect(actual).assertEqual(122400);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0041 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0042
     * @tc.name      PageLoading_LoadingTimelineAdvance_0042
     * @tc.desc      LoadingTimeline.advance(ms=6300000) yields 126000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0042 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6300000);
      logInfo(`advance(ms=6300000): actual=${actual}`);
      expect(actual).assertEqual(126000);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0042 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0043
     * @tc.name      PageLoading_LoadingTimelineAdvance_0043
     * @tc.desc      LoadingTimeline.advance(ms=6480000) yields 129600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0043 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6480000);
      logInfo(`advance(ms=6480000): actual=${actual}`);
      expect(actual).assertEqual(129600);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0043 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0044
     * @tc.name      PageLoading_LoadingTimelineAdvance_0044
     * @tc.desc      LoadingTimeline.advance(ms=6660000) yields 133200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0044 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6660000);
      logInfo(`advance(ms=6660000): actual=${actual}`);
      expect(actual).assertEqual(133200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0044 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0045
     * @tc.name      PageLoading_LoadingTimelineAdvance_0045
     * @tc.desc      LoadingTimeline.advance(ms=6840000) yields 136800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0045 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6840000);
      logInfo(`advance(ms=6840000): actual=${actual}`);
      expect(actual).assertEqual(136800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0045 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0046
     * @tc.name      PageLoading_LoadingTimelineAdvance_0046
     * @tc.desc      LoadingTimeline.advance(ms=7020000) yields 140400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0046 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(7020000);
      logInfo(`advance(ms=7020000): actual=${actual}`);
      expect(actual).assertEqual(140400);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0046 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0047
     * @tc.name      PageLoading_LoadingTimelineAdvance_0047
     * @tc.desc      LoadingTimeline.advance(ms=7200000) yields 144000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0047 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(7200000);
      logInfo(`advance(ms=7200000): actual=${actual}`);
      expect(actual).assertEqual(144000);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0047 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0048
     * @tc.name      PageLoading_LoadingTimelineAdvance_0048
     * @tc.desc      LoadingTimeline.advance(ms=2230624.39) yields 44610
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0048 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2230624.39);
      logInfo(`advance(ms=2230624.39): actual=${actual}`);
      expect(actual).assertEqual(44610);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0048 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0049
     * @tc.name      PageLoading_LoadingTimelineAdvance_0049
     * @tc.desc      LoadingTimeline.advance(ms=6106830) yields 122130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0049 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6106830);
      logInfo(`advance(ms=6106830): actual=${actual}`);
      expect(actual).assertEqual(122130);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0049 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0050
     * @tc.name      PageLoading_LoadingTimelineAdvance_0050
     * @tc.desc      LoadingTimeline.advance(ms=1209551) yields 24190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0050 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1209551);
      logInfo(`advance(ms=1209551): actual=${actual}`);
      expect(actual).assertEqual(24190);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0050 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0051
     * @tc.name      PageLoading_LoadingTimelineAdvance_0051
     * @tc.desc      LoadingTimeline.advance(ms=7046239) yields 140920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0051 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(7046239);
      logInfo(`advance(ms=7046239): actual=${actual}`);
      expect(actual).assertEqual(140920);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0051 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0052
     * @tc.name      PageLoading_LoadingTimelineAdvance_0052
     * @tc.desc      LoadingTimeline.advance(ms=6000648) yields 120010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0052 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6000648);
      logInfo(`advance(ms=6000648): actual=${actual}`);
      expect(actual).assertEqual(120010);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0052 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0053
     * @tc.name      PageLoading_LoadingTimelineAdvance_0053
     * @tc.desc      LoadingTimeline.advance(ms=949055.81) yields 18980
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0053 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(949055.81);
      logInfo(`advance(ms=949055.81): actual=${actual}`);
      expect(actual).assertEqual(18980);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0053 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0054
     * @tc.name      PageLoading_LoadingTimelineAdvance_0054
     * @tc.desc      LoadingTimeline.advance(ms=3040001) yields 60800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0054 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3040001);
      logInfo(`advance(ms=3040001): actual=${actual}`);
      expect(actual).assertEqual(60800);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0054 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0055
     * @tc.name      PageLoading_LoadingTimelineAdvance_0055
     * @tc.desc      LoadingTimeline.advance(ms=1863177) yields 37260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0055 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1863177);
      logInfo(`advance(ms=1863177): actual=${actual}`);
      expect(actual).assertEqual(37260);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0055 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0056
     * @tc.name      PageLoading_LoadingTimelineAdvance_0056
     * @tc.desc      LoadingTimeline.advance(ms=339813) yields 6790
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0056 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(339813);
      logInfo(`advance(ms=339813): actual=${actual}`);
      expect(actual).assertEqual(6790);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0056 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0057
     * @tc.name      PageLoading_LoadingTimelineAdvance_0057
     * @tc.desc      LoadingTimeline.advance(ms=4189112) yields 83780
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0057 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4189112);
      logInfo(`advance(ms=4189112): actual=${actual}`);
      expect(actual).assertEqual(83780);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0057 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0058
     * @tc.name      PageLoading_LoadingTimelineAdvance_0058
     * @tc.desc      LoadingTimeline.advance(ms=3071466.91) yields 61420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0058 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3071466.91);
      logInfo(`advance(ms=3071466.91): actual=${actual}`);
      expect(actual).assertEqual(61420);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0058 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0059
     * @tc.name      PageLoading_LoadingTimelineAdvance_0059
     * @tc.desc      LoadingTimeline.advance(ms=761087) yields 15220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0059 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(761087);
      logInfo(`advance(ms=761087): actual=${actual}`);
      expect(actual).assertEqual(15220);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0059 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0060
     * @tc.name      PageLoading_LoadingTimelineAdvance_0060
     * @tc.desc      LoadingTimeline.advance(ms=2125319.83) yields 42500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0060 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2125319.83);
      logInfo(`advance(ms=2125319.83): actual=${actual}`);
      expect(actual).assertEqual(42500);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0060 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0061
     * @tc.name      PageLoading_LoadingTimelineAdvance_0061
     * @tc.desc      LoadingTimeline.advance(ms=5447677) yields 108950
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0061 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5447677);
      logInfo(`advance(ms=5447677): actual=${actual}`);
      expect(actual).assertEqual(108950);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0061 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0062
     * @tc.name      PageLoading_LoadingTimelineAdvance_0062
     * @tc.desc      LoadingTimeline.advance(ms=4033534) yields 80670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0062 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4033534);
      logInfo(`advance(ms=4033534): actual=${actual}`);
      expect(actual).assertEqual(80670);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0062 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0063
     * @tc.name      PageLoading_LoadingTimelineAdvance_0063
     * @tc.desc      LoadingTimeline.advance(ms=3860622) yields 77210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0063 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3860622);
      logInfo(`advance(ms=3860622): actual=${actual}`);
      expect(actual).assertEqual(77210);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0063 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0064
     * @tc.name      PageLoading_LoadingTimelineAdvance_0064
     * @tc.desc      LoadingTimeline.advance(ms=542966.67) yields 10850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0064 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(542966.67);
      logInfo(`advance(ms=542966.67): actual=${actual}`);
      expect(actual).assertEqual(10850);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0064 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0065
     * @tc.name      PageLoading_LoadingTimelineAdvance_0065
     * @tc.desc      LoadingTimeline.advance(ms=3777947) yields 75550
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0065 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3777947);
      logInfo(`advance(ms=3777947): actual=${actual}`);
      expect(actual).assertEqual(75550);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0065 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0066
     * @tc.name      PageLoading_LoadingTimelineAdvance_0066
     * @tc.desc      LoadingTimeline.advance(ms=4716812) yields 94330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0066 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4716812);
      logInfo(`advance(ms=4716812): actual=${actual}`);
      expect(actual).assertEqual(94330);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0066 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0067
     * @tc.name      PageLoading_LoadingTimelineAdvance_0067
     * @tc.desc      LoadingTimeline.advance(ms=7035161) yields 140700
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0067 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(7035161);
      logInfo(`advance(ms=7035161): actual=${actual}`);
      expect(actual).assertEqual(140700);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0067 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0068
     * @tc.name      PageLoading_LoadingTimelineAdvance_0068
     * @tc.desc      LoadingTimeline.advance(ms=3901783) yields 78030
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0068 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3901783);
      logInfo(`advance(ms=3901783): actual=${actual}`);
      expect(actual).assertEqual(78030);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0068 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0069
     * @tc.name      PageLoading_LoadingTimelineAdvance_0069
     * @tc.desc      LoadingTimeline.advance(ms=738524) yields 14770
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0069 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(738524);
      logInfo(`advance(ms=738524): actual=${actual}`);
      expect(actual).assertEqual(14770);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0069 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0070
     * @tc.name      PageLoading_LoadingTimelineAdvance_0070
     * @tc.desc      LoadingTimeline.advance(ms=4039524) yields 80790
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0070 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4039524);
      logInfo(`advance(ms=4039524): actual=${actual}`);
      expect(actual).assertEqual(80790);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0070 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0071
     * @tc.name      PageLoading_LoadingTimelineAdvance_0071
     * @tc.desc      LoadingTimeline.advance(ms=974551) yields 19490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0071 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(974551);
      logInfo(`advance(ms=974551): actual=${actual}`);
      expect(actual).assertEqual(19490);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0071 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0072
     * @tc.name      PageLoading_LoadingTimelineAdvance_0072
     * @tc.desc      LoadingTimeline.advance(ms=325188.01) yields 6500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0072 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(325188.01);
      logInfo(`advance(ms=325188.01): actual=${actual}`);
      expect(actual).assertEqual(6500);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0072 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0073
     * @tc.name      PageLoading_LoadingTimelineAdvance_0073
     * @tc.desc      LoadingTimeline.advance(ms=6308418) yields 126160
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0073 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6308418);
      logInfo(`advance(ms=6308418): actual=${actual}`);
      expect(actual).assertEqual(126160);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0073 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0074
     * @tc.name      PageLoading_LoadingTimelineAdvance_0074
     * @tc.desc      LoadingTimeline.advance(ms=2233714) yields 44670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0074 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2233714);
      logInfo(`advance(ms=2233714): actual=${actual}`);
      expect(actual).assertEqual(44670);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0074 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0075
     * @tc.name      PageLoading_LoadingTimelineAdvance_0075
     * @tc.desc      LoadingTimeline.advance(ms=3075429.84) yields 61500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0075 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3075429.84);
      logInfo(`advance(ms=3075429.84): actual=${actual}`);
      expect(actual).assertEqual(61500);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0075 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0076
     * @tc.name      PageLoading_LoadingTimelineAdvance_0076
     * @tc.desc      LoadingTimeline.advance(ms=6600572) yields 132010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0076 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6600572);
      logInfo(`advance(ms=6600572): actual=${actual}`);
      expect(actual).assertEqual(132010);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0076 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0077
     * @tc.name      PageLoading_LoadingTimelineAdvance_0077
     * @tc.desc      LoadingTimeline.advance(ms=177336.9) yields 3540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0077 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(177336.9);
      logInfo(`advance(ms=177336.9): actual=${actual}`);
      expect(actual).assertEqual(3540);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0077 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0078
     * @tc.name      PageLoading_LoadingTimelineAdvance_0078
     * @tc.desc      LoadingTimeline.advance(ms=522532) yields 10450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0078 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(522532);
      logInfo(`advance(ms=522532): actual=${actual}`);
      expect(actual).assertEqual(10450);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0078 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0079
     * @tc.name      PageLoading_LoadingTimelineAdvance_0079
     * @tc.desc      LoadingTimeline.advance(ms=1854279) yields 37080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0079 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1854279);
      logInfo(`advance(ms=1854279): actual=${actual}`);
      expect(actual).assertEqual(37080);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0079 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0080
     * @tc.name      PageLoading_LoadingTimelineAdvance_0080
     * @tc.desc      LoadingTimeline.advance(ms=2853842) yields 57070
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0080 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2853842);
      logInfo(`advance(ms=2853842): actual=${actual}`);
      expect(actual).assertEqual(57070);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0080 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0081
     * @tc.name      PageLoading_LoadingTimelineAdvance_0081
     * @tc.desc      LoadingTimeline.advance(ms=3213726) yields 64270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0081 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3213726);
      logInfo(`advance(ms=3213726): actual=${actual}`);
      expect(actual).assertEqual(64270);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0081 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0082
     * @tc.name      PageLoading_LoadingTimelineAdvance_0082
     * @tc.desc      LoadingTimeline.advance(ms=4410101) yields 88200
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0082 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(4410101);
      logInfo(`advance(ms=4410101): actual=${actual}`);
      expect(actual).assertEqual(88200);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0082 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0083
     * @tc.name      PageLoading_LoadingTimelineAdvance_0083
     * @tc.desc      LoadingTimeline.advance(ms=5309083) yields 106180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0083 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5309083);
      logInfo(`advance(ms=5309083): actual=${actual}`);
      expect(actual).assertEqual(106180);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0083 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0084
     * @tc.name      PageLoading_LoadingTimelineAdvance_0084
     * @tc.desc      LoadingTimeline.advance(ms=1076709) yields 21530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0084 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(1076709);
      logInfo(`advance(ms=1076709): actual=${actual}`);
      expect(actual).assertEqual(21530);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0084 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0085
     * @tc.name      PageLoading_LoadingTimelineAdvance_0085
     * @tc.desc      LoadingTimeline.advance(ms=174578.07) yields 3490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0085 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(174578.07);
      logInfo(`advance(ms=174578.07): actual=${actual}`);
      expect(actual).assertEqual(3490);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0085 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0086
     * @tc.name      PageLoading_LoadingTimelineAdvance_0086
     * @tc.desc      LoadingTimeline.advance(ms=231973.05) yields 4630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0086 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(231973.05);
      logInfo(`advance(ms=231973.05): actual=${actual}`);
      expect(actual).assertEqual(4630);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0086 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0087
     * @tc.name      PageLoading_LoadingTimelineAdvance_0087
     * @tc.desc      LoadingTimeline.advance(ms=3441279.2) yields 68820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0087 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(3441279.2);
      logInfo(`advance(ms=3441279.2): actual=${actual}`);
      expect(actual).assertEqual(68820);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0087 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0088
     * @tc.name      PageLoading_LoadingTimelineAdvance_0088
     * @tc.desc      LoadingTimeline.advance(ms=5440862) yields 108810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0088 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(5440862);
      logInfo(`advance(ms=5440862): actual=${actual}`);
      expect(actual).assertEqual(108810);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0088 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0089
     * @tc.name      PageLoading_LoadingTimelineAdvance_0089
     * @tc.desc      LoadingTimeline.advance(ms=2747461.53) yields 54940
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0089 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(2747461.53);
      logInfo(`advance(ms=2747461.53): actual=${actual}`);
      expect(actual).assertEqual(54940);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0089 end`);
    });

    /**
     * @tc.number    SUB_PAGELOADING_LOADING_TIMELINE_ADVANCE_0090
     * @tc.name      PageLoading_LoadingTimelineAdvance_0090
     * @tc.desc      LoadingTimeline.advance(ms=6811932) yields 136230
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('PageLoading_LoadingTimelineAdvance_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0090 begin`);
      const subject: LoadingTimeline = new LoadingTimeline();
      const actual: number = subject.advance(6811932);
      logInfo(`advance(ms=6811932): actual=${actual}`);
      expect(actual).assertEqual(136230);
      logInfo(`${BUNDLE}LoadingTimelineAdvance_0090 end`);
    });
  });
}
