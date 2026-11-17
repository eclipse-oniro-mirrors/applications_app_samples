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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import Logger from '../../utils/Logger';
import {
  BUNDLE,
  SETTLE_UI,
  TAB_INDEX_CYCLE,
  TIMEOUT_MENU,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  clickTabContentIcon,
  createDriver,
  ensureAnimationLoaded,
  ensureAppVisible,
  findByText,
  findTabBar,
  sleep,
  switchTab,
  tapMenuOption,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.SEGMENT;

async function openCycleTab(driver: Driver): Promise<boolean> {
  return await switchTab(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE, UiText.CONTENT_CYCLE);
}

async function openResetMenu(driver: Driver): Promise<boolean> {
  const clicked: boolean = await clickTabContentIcon(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE,
    UiText.LABEL_RESET_SEGMENT);
  if (!clicked) {
    return false;
  }
  return await waitForText(driver, UiText.RESET_IMMEDIATE, TIMEOUT_MENU);
}

/**
 * Segment and subframe controls of the third tab. The reset control owns a
 * popup with an immediate and a deferred mode, and the subframe control shows
 * a toast. Toast content is not asserted here because the toast event observer
 * is not available on the target API level; the path is exercised for
 * liveness instead.
 */
export default function segmentControlTest(): void {
  describe('LottieSegmentControlTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
      await ensureAnimationLoaded(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0100
     * @tc.name cycleTabContentLabels001
     * @tc.desc Verify the cycle tab renders the segment, reset and subframe labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'cycleTabContentLabels_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'cycleTabContentLabels_001 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'cycleTabContentLabels_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await waitForText(driver, UiText.LABEL_SEGMENT, TIMEOUT_TEXT);
      Logger.info(TAG, 'cycleTabContentLabels_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.LABEL_PLAY_SEGMENTS, TIMEOUT_TEXT);
      Logger.info(TAG, 'cycleTabContentLabels_001, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await waitForText(driver, UiText.LABEL_RESET_SEGMENT, TIMEOUT_TEXT);
      Logger.info(TAG, 'cycleTabContentLabels_001, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = await waitForText(driver, UiText.LABEL_SUBFRAME, TIMEOUT_TEXT);
      Logger.info(TAG, 'cycleTabContentLabels_001, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'cycleTabContentLabels_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0200
     * @tc.name setSegmentApplied002
     * @tc.desc Verify the fixed 20 to 30 frame segment can be applied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'setSegmentApplied_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'setSegmentApplied_002 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'setSegmentApplied_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const applied: boolean = await clickTabContentIcon(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE,
        UiText.LABEL_SEGMENT);
      const check02: boolean = applied;
      Logger.info(TAG, 'setSegmentApplied_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'setSegmentApplied_002, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'setSegmentApplied_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0300
     * @tc.name playSegmentsApplied003
     * @tc.desc Verify the multi range playSegments control can be applied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'playSegmentsApplied_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'playSegmentsApplied_003 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'playSegmentsApplied_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const applied: boolean = await clickTabContentIcon(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE,
        UiText.LABEL_PLAY_SEGMENTS);
      const check02: boolean = applied;
      Logger.info(TAG, 'playSegmentsApplied_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'playSegmentsApplied_003, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'playSegmentsApplied_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0400
     * @tc.name resetMenuOffersBothModes004
     * @tc.desc Verify the reset menu offers the immediate and deferred modes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'resetMenuOffersBothModes_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'resetMenuOffersBothModes_004 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'resetMenuOffersBothModes_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openResetMenu(driver);
      Logger.info(TAG, 'resetMenuOffersBothModes_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.RESET_DEFERRED, TIMEOUT_MENU);
      Logger.info(TAG, 'resetMenuOffersBothModes_004, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await driver.pressBack();
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'resetMenuOffersBothModes_004, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'resetMenuOffersBothModes_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0500
     * @tc.name resetImmediateMode005
     * @tc.desc Verify the immediate reset mode removes the active segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'resetImmediateMode_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'resetImmediateMode_005 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'resetImmediateMode_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openResetMenu(driver);
      Logger.info(TAG, 'resetImmediateMode_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapMenuOption(driver, UiText.RESET_IMMEDIATE);
      Logger.info(TAG, 'resetImmediateMode_005, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      await sleep(SETTLE_UI);
      const menuItem: Component | null = await findByText(driver, UiText.RESET_IMMEDIATE);
      const check04: boolean = menuItem === null;
      Logger.info(TAG, 'resetImmediateMode_005, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check05: boolean = bar !== null;
      Logger.info(TAG, 'resetImmediateMode_005, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'resetImmediateMode_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0600
     * @tc.name resetDeferredMode006
     * @tc.desc Verify the deferred reset mode can be selected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'resetDeferredMode_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'resetDeferredMode_006 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'resetDeferredMode_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await openResetMenu(driver);
      Logger.info(TAG, 'resetDeferredMode_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapMenuOption(driver, UiText.RESET_DEFERRED);
      Logger.info(TAG, 'resetDeferredMode_006, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'resetDeferredMode_006, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'resetDeferredMode_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0700
     * @tc.name resetAfterSetSegment007
     * @tc.desc Verify resetting the segment after applying one leaves the page responsive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'resetAfterSetSegment_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'resetAfterSetSegment_007 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'resetAfterSetSegment_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await clickTabContentIcon(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE, UiText.LABEL_SEGMENT);
      Logger.info(TAG, 'resetAfterSetSegment_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await openResetMenu(driver);
      Logger.info(TAG, 'resetAfterSetSegment_007, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await tapMenuOption(driver, UiText.RESET_IMMEDIATE);
      Logger.info(TAG, 'resetAfterSetSegment_007, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check05: boolean = bar !== null;
      Logger.info(TAG, 'resetAfterSetSegment_007, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'resetAfterSetSegment_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0800
     * @tc.name playSegmentsAfterSetSegment008
     * @tc.desc Verify the multi range control can overwrite a previously set segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'playSegmentsAfterSetSegment_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'playSegmentsAfterSetSegment_008 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'playSegmentsAfterSetSegment_008, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await clickTabContentIcon(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE, UiText.LABEL_SEGMENT);
      Logger.info(TAG, 'playSegmentsAfterSetSegment_008, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await clickTabContentIcon(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE, UiText.LABEL_PLAY_SEGMENTS);
      Logger.info(TAG, 'playSegmentsAfterSetSegment_008, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'playSegmentsAfterSetSegment_008, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'playSegmentsAfterSetSegment_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_0900
     * @tc.name subframeControlApplied009
     * @tc.desc Verify the subframe control can be applied without leaving the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'subframeControlApplied_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'subframeControlApplied_009 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'subframeControlApplied_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const applied: boolean = await clickTabContentIcon(driver, UiText.TAB_CYCLE, TAB_INDEX_CYCLE,
        UiText.LABEL_SUBFRAME);
      const check02: boolean = applied;
      Logger.info(TAG, 'subframeControlApplied_009, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'subframeControlApplied_009, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'subframeControlApplied_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_SEGMENT_1000
     * @tc.name cycleTabReentry010
     * @tc.desc Verify the cycle tab can be left and entered again with its content intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'cycleTabReentry_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'cycleTabReentry_010 begin');
      const check01: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'cycleTabReentry_010, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await switchTab(driver, UiText.TAB_POSITION, 3, UiText.CONTENT_POSITION);
      Logger.info(TAG, 'cycleTabReentry_010, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await openCycleTab(driver);
      Logger.info(TAG, 'cycleTabReentry_010, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await waitForText(driver, UiText.LABEL_SUBFRAME, TIMEOUT_TEXT);
      Logger.info(TAG, 'cycleTabReentry_010, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'cycleTabReentry_010 end');
    });
  });
}
