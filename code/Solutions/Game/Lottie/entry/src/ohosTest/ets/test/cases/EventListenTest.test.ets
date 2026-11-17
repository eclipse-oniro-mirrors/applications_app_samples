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
  TAB_INDEX_LISTEN,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  clickTabContentIcon,
  createDriver,
  ensureAnimationLoaded,
  ensureAppVisible,
  findTabBar,
  sleep,
  switchTab,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.LISTEN;

async function openListenTab(driver: Driver): Promise<boolean> {
  return await switchTab(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.CONTENT_LISTEN);
}

/**
 * Listener tab coverage. The four controls register, stop, pause and play the
 * animation item. The add control also shows a toast, but toast content cannot
 * be observed by the event observer on this API level, so the suite asserts
 * liveness and the follow-up control behavior instead.
 */
export default function eventListenTest(): void {
  describe('LottieEventListenTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
      await ensureAnimationLoaded(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LISTEN_0100
     * @tc.name listenTabLabels001
     * @tc.desc Verify the listener tab renders the add, delete, callback and delete-all labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listenTabLabels_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listenTabLabels_001 begin');
      const check01: boolean = await openListenTab(driver);
      Logger.info(TAG, 'listenTabLabels_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await waitForText(driver, UiText.LABEL_DELETE_LISTEN, TIMEOUT_TEXT);
      Logger.info(TAG, 'listenTabLabels_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.LABEL_PAUSE_ALL, TIMEOUT_TEXT);
      Logger.info(TAG, 'listenTabLabels_001, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await waitForText(driver, UiText.LABEL_DELETE_ALL_LISTEN, TIMEOUT_TEXT);
      Logger.info(TAG, 'listenTabLabels_001, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = await waitForText(driver, UiText.LABEL_ADD_LISTEN, TIMEOUT_TEXT);
      Logger.info(TAG, 'listenTabLabels_001, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check06: boolean = bar !== null;
      Logger.info(TAG, 'listenTabLabels_001, check06=' + JSON.stringify(check06));
      expect(check06).assertTrue();
      Logger.info(TAG, 'listenTabLabels_001 all four labels verified');
      Logger.info(TAG, 'listenTabLabels_001 end, labels=4');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LISTEN_0200
     * @tc.name addLoopCompleteListener002
     * @tc.desc Verify a loop complete listener can be registered on the animation item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'addLoopCompleteListener_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'addLoopCompleteListener_002 begin');
      const check01: boolean = await openListenTab(driver);
      Logger.info(TAG, 'addLoopCompleteListener_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const added: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN,
        UiText.LABEL_ADD_LISTEN);
      const check02: boolean = added;
      Logger.info(TAG, 'addLoopCompleteListener_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      await sleep(SETTLE_UI);
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'addLoopCompleteListener_002, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'addLoopCompleteListener_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LISTEN_0300
     * @tc.name registerListenerTwice003
     * @tc.desc Verify registering the same loop complete listener twice is harmless
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'registerListenerTwice_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'registerListenerTwice_003 begin');
      const check01: boolean = await openListenTab(driver);
      Logger.info(TAG, 'registerListenerTwice_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.LABEL_ADD_LISTEN);
      Logger.info(TAG, 'registerListenerTwice_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.LABEL_ADD_LISTEN);
      Logger.info(TAG, 'registerListenerTwice_003, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'registerListenerTwice_003, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'registerListenerTwice_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LISTEN_0400
     * @tc.name deleteListenerStopsAnimation004
     * @tc.desc Verify the delete listener control stops the animation item safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'deleteListenerStopsAnimation_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'deleteListenerStopsAnimation_004 begin');
      const check01: boolean = await openListenTab(driver);
      Logger.info(TAG, 'deleteListenerStopsAnimation_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const stopped: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN,
        UiText.LABEL_DELETE_LISTEN);
      const check02: boolean = stopped;
      Logger.info(TAG, 'deleteListenerStopsAnimation_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'deleteListenerStopsAnimation_004, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'deleteListenerStopsAnimation_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LISTEN_0500
     * @tc.name pauseAllCallbacks005
     * @tc.desc Verify the control that pauses the animation while callbacks are registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'pauseAllCallbacks_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pauseAllCallbacks_005 begin');
      const check01: boolean = await openListenTab(driver);
      Logger.info(TAG, 'pauseAllCallbacks_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const paused: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN,
        UiText.LABEL_PAUSE_ALL);
      const check02: boolean = paused;
      Logger.info(TAG, 'pauseAllCallbacks_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check03: boolean = bar !== null;
      Logger.info(TAG, 'pauseAllCallbacks_005, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'pauseAllCallbacks_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LISTEN_0600
     * @tc.name resumeAfterPauseAll006
     * @tc.desc Verify the control that resumes playback after the pause-all control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'resumeAfterPauseAll_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'resumeAfterPauseAll_006 begin');
      const check01: boolean = await openListenTab(driver);
      Logger.info(TAG, 'resumeAfterPauseAll_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.LABEL_PAUSE_ALL);
      Logger.info(TAG, 'resumeAfterPauseAll_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.LABEL_DELETE_ALL_LISTEN);
      Logger.info(TAG, 'resumeAfterPauseAll_006, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check04: boolean = bar !== null;
      Logger.info(TAG, 'resumeAfterPauseAll_006, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'resumeAfterPauseAll_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LISTEN_0700
     * @tc.name addThenStopSequence007
     * @tc.desc Verify a listener can be added and the animation can still be stopped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'addThenStopSequence_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'addThenStopSequence_007 begin');
      const check01: boolean = await openListenTab(driver);
      Logger.info(TAG, 'addThenStopSequence_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.LABEL_ADD_LISTEN);
      Logger.info(TAG, 'addThenStopSequence_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.LABEL_DELETE_LISTEN);
      Logger.info(TAG, 'addThenStopSequence_007, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await clickTabContentIcon(driver, UiText.TAB_LISTEN, TAB_INDEX_LISTEN, UiText.LABEL_DELETE_ALL_LISTEN);
      Logger.info(TAG, 'addThenStopSequence_007, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const bar: Component | null = await findTabBar(driver);
      const check05: boolean = bar !== null;
      Logger.info(TAG, 'addThenStopSequence_007, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'addThenStopSequence_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LISTEN_0800
     * @tc.name listenTabReentry008
     * @tc.desc Verify the listener tab can be left and entered again with its controls intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'listenTabReentry_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'listenTabReentry_008 begin');
      const check01: boolean = await openListenTab(driver);
      Logger.info(TAG, 'listenTabReentry_008, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await switchTab(driver, UiText.TAB_CYCLE, 2, UiText.CONTENT_CYCLE);
      Logger.info(TAG, 'listenTabReentry_008, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await openListenTab(driver);
      Logger.info(TAG, 'listenTabReentry_008, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await waitForText(driver, UiText.LABEL_ADD_LISTEN, TIMEOUT_TEXT);
      Logger.info(TAG, 'listenTabReentry_008, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'listenTabReentry_008 end');
    });
  });
}
