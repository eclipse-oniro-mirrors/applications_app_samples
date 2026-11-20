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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { ensureHomeReady, openFromHome, tapId, exists, PAGE_TIMEOUT, HOME_ID } from './shared/AudioDriver';

const CAPTURER_CARD: string = 'audio_capturer_card';
const NORMAL_TAB: string = 'btn_normal_capturer';
const LIVE_TAB: string = 'btn_live_capturer';
const PARALLEL_TAB: string = 'btn_parallel_capturer';
const NORMAL_START: string = 'normal_start_record_btn';
const LIVE_START: string = 'live_start_record_btn';
const PARALLEL_START: string = 'parallel_start_btn';
const PARALLEL_CARD: string = 'music_player_card';

async function openCapturer(driver: Driver): Promise<boolean> {
  if (!(await openFromHome(driver, CAPTURER_CARD, NORMAL_TAB))) {
    return false;
  }
  return await exists(driver, NORMAL_START, PAGE_TIMEOUT);
}

/**
 * 采集器三标签页切换
 *
 * 采集入口始终落在 Normal 标签；切换 Live/Parallel 后只显示对应页面的起始控件，
 * 其余标签的起始控件消失；标签往返与离开重入都能回到 Normal 初始态。
 */
export default function audioCaptureTabsTest() {
  describe('audioCaptureTabsTest', () => {
    const driver: Driver = Driver.create();

    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_TABS_0100
     * @tc.name normalTabShowsIdleStart
     * @tc.desc Verify the capturer entry lands on the normal tab showing only its start control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('normalTabShowsIdleStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturer(driver)).assertTrue();
      expect(await exists(driver, NORMAL_START, 3000)).assertTrue();
      expect(await exists(driver, LIVE_START, 1000)).assertFalse();
      expect(await exists(driver, PARALLEL_START, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_TABS_0200
     * @tc.name switchToLiveShowsLiveStart
     * @tc.desc Verify switching to the live tab exposes the live start control and hides normal start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('switchToLiveShowsLiveStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturer(driver)).assertTrue();
      expect(await tapId(driver, LIVE_TAB, 1800)).assertTrue();
      expect(await exists(driver, LIVE_START, PAGE_TIMEOUT)).assertTrue();
      expect(await exists(driver, NORMAL_START, 1000)).assertFalse();
      expect(await exists(driver, PARALLEL_START, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_TABS_0300
     * @tc.name switchToParallelShowsParallelStart
     * @tc.desc Verify switching to the parallel tab exposes its start control and music player card
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('switchToParallelShowsParallelStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturer(driver)).assertTrue();
      expect(await tapId(driver, PARALLEL_TAB, 1800)).assertTrue();
      expect(await exists(driver, PARALLEL_START, PAGE_TIMEOUT)).assertTrue();
      expect(await exists(driver, PARALLEL_CARD, PAGE_TIMEOUT)).assertTrue();
      expect(await exists(driver, NORMAL_START, 1000)).assertFalse();
      expect(await exists(driver, LIVE_START, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_TABS_0400
     * @tc.name liveBackToNormal
     * @tc.desc Verify switching from the live tab back to normal restores the normal start control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('liveBackToNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openCapturer(driver)).assertTrue();
      expect(await tapId(driver, LIVE_TAB, 1800)).assertTrue();
      expect(await exists(driver, LIVE_START, PAGE_TIMEOUT)).assertTrue();
      expect(await tapId(driver, NORMAL_TAB, 1800)).assertTrue();
      expect(await exists(driver, NORMAL_START, PAGE_TIMEOUT)).assertTrue();
      expect(await exists(driver, LIVE_START, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_TABS_0500
     * @tc.name tabRoundTripStaysConsistent
     * @tc.desc Verify a normal-live-parallel-live-normal round trip ends on the normal controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('tabRoundTripStaysConsistent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openCapturer(driver)).assertTrue();
      expect(await tapId(driver, LIVE_TAB, 1500)).assertTrue();
      expect(await exists(driver, LIVE_START, PAGE_TIMEOUT)).assertTrue();
      expect(await tapId(driver, PARALLEL_TAB, 1500)).assertTrue();
      expect(await exists(driver, PARALLEL_START, PAGE_TIMEOUT)).assertTrue();
      expect(await tapId(driver, LIVE_TAB, 1500)).assertTrue();
      expect(await exists(driver, LIVE_START, PAGE_TIMEOUT)).assertTrue();
      expect(await tapId(driver, NORMAL_TAB, 1500)).assertTrue();
      expect(await exists(driver, NORMAL_START, PAGE_TIMEOUT)).assertTrue();
      expect(await exists(driver, PARALLEL_START, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_TABS_0600
     * @tc.name allTabButtonsPresentOnNormal
     * @tc.desc Verify the normal tab page still renders all three tab buttons for switching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('allTabButtonsPresentOnNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturer(driver)).assertTrue();
      expect(await exists(driver, NORMAL_TAB, 3000)).assertTrue();
      expect(await exists(driver, LIVE_TAB, 3000)).assertTrue();
      expect(await exists(driver, PARALLEL_TAB, 3000)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_TABS_0700
     * @tc.name backReturnsHomeFromCapturer
     * @tc.desc Verify leaving the capturer page returns to the home entry cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('backReturnsHomeFromCapturer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openCapturer(driver)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await exists(driver, HOME_ID, 4000)).assertTrue();
      expect(await exists(driver, NORMAL_START, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_CAPTURE_TABS_0800
     * @tc.name reopenResetsToNormalTab
     * @tc.desc Verify reopening the capturer after using the parallel tab lands back on normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('reopenResetsToNormalTab', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openCapturer(driver)).assertTrue();
      expect(await tapId(driver, PARALLEL_TAB, 1800)).assertTrue();
      expect(await exists(driver, PARALLEL_START, PAGE_TIMEOUT)).assertTrue();
      expect(await ensureHomeReady(driver)).assertTrue();
      expect(await openCapturer(driver)).assertTrue();
      expect(await exists(driver, NORMAL_START, PAGE_TIMEOUT)).assertTrue();
      expect(await exists(driver, PARALLEL_START, 1000)).assertFalse();
    });
  });
}
