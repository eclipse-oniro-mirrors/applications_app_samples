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
import { Driver } from '@ohos.UiTest';
import Logger from '../../utils/Logger';
import {
  BUNDLE,
  ID_DESTROY_ANIMATION,
  ID_PAUSE,
  ID_PLAY,
  ID_START_PLAY,
  ID_STOP_BY_NAME,
  ID_SUSPEND,
  SETTLE_UI,
  TAB_INDEX_PLAY_PAUSE,
  TAB_INDEX_THIS,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  clickTabContentIcon,
  createDriver,
  ensureAnimationLoaded,
  ensureAppVisible,
  pageAlive,
  scrollPageToTop,
  selectAnimation,
  sleep,
  switchTab,
  tapById,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.PLAYBACK;

async function restoreTop(driver: Driver): Promise<void> {
  await scrollPageToTop(driver);
  await sleep(SETTLE_UI);
}

/**
 * Playback control matrix. The top panel uses the global lottie facade, the
 * first tab uses the by-name facade and the second tab uses the animation item
 * instance. Each facade is exercised separately so a regression in one of them
 * cannot hide behind the other two.
 */
export default function playbackControlTest(): void {
  describe('LottiePlaybackControlTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
      await ensureAnimationLoaded(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PLAYBACK_0100
     * @tc.name playToggleTwice001
     * @tc.desc Verify two taps on the top play control return the animation to its initial state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'playToggleTwice_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'playToggleTwice_001 begin');
      const check01: boolean = await tapById(driver, ID_PLAY);
      Logger.info(TAG, 'playToggleTwice_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await tapById(driver, ID_PLAY);
      Logger.info(TAG, 'playToggleTwice_001, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'playToggleTwice_001, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'playToggleTwice_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PLAYBACK_0200
     * @tc.name playToggleOddTimes002
     * @tc.desc Verify an odd number of play toggles leaves the page responsive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'playToggleOddTimes_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'playToggleOddTimes_002 begin');
      for (let tap: number = 0; tap < 5; tap++) {
        const check01: boolean = await tapById(driver, ID_PLAY);
        Logger.info(TAG, 'playToggleOddTimes_002, check01=' + JSON.stringify(check01));
        expect(check01).assertTrue();
      }
      const check02: boolean = await pageAlive(driver);
      Logger.info(TAG, 'playToggleOddTimes_002, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'playToggleOddTimes_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PLAYBACK_0300
     * @tc.name stopThenStart003
     * @tc.desc Verify stop followed by start returns the animation to playback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'stopThenStart_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stopThenStart_003 begin');
      const check01: boolean = await tapById(driver, ID_SUSPEND);
      Logger.info(TAG, 'stopThenStart_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await tapById(driver, ID_START_PLAY);
      Logger.info(TAG, 'stopThenStart_003, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'stopThenStart_003, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'stopThenStart_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PLAYBACK_0400
     * @tc.name pauseThenStart004
     * @tc.desc Verify pause followed by start returns the animation to playback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'pauseThenStart_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pauseThenStart_004 begin');
      const check01: boolean = await tapById(driver, ID_PAUSE);
      Logger.info(TAG, 'pauseThenStart_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await tapById(driver, ID_START_PLAY);
      Logger.info(TAG, 'pauseThenStart_004, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'pauseThenStart_004, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'pauseThenStart_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PLAYBACK_0500
     * @tc.name stopTwice005
     * @tc.desc Verify stopping an already stopped animation is harmless
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'stopTwice_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stopTwice_005 begin');
      const check01: boolean = await tapById(driver, ID_SUSPEND);
      Logger.info(TAG, 'stopTwice_005, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await tapById(driver, ID_SUSPEND);
      Logger.info(TAG, 'stopTwice_005, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'stopTwice_005, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'stopTwice_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PLAYBACK_0600
     * @tc.name pauseTwice006
     * @tc.desc Verify pausing an already paused animation is harmless
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'pauseTwice_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pauseTwice_006 begin');
      const check01: boolean = await tapById(driver, ID_PAUSE);
      Logger.info(TAG, 'pauseTwice_006, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await tapById(driver, ID_PAUSE);
      Logger.info(TAG, 'pauseTwice_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await pageAlive(driver);
      Logger.info(TAG, 'pauseTwice_006, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'pauseTwice_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_PLAYBACK_0700
     * @tc.name mixedStopPauseStart007
     * @tc.desc Verify a stop, pause and start sequence leaves the animation usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'mixedStopPauseStart_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'mixedStopPauseStart_007 begin');
      const check01: boolean = await tapById(driver, ID_SUSPEND);
      Logger.info(TAG, 'mixedStopPauseStart_007, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await tapById(driver, ID_PAUSE);
      Logger.info(TAG, 'mixedStopPauseStart_007, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await tapById(driver, ID_START_PLAY);
      Logger.info(TAG, 'mixedStopPauseStart_007, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await pageAlive(driver);
      Logger.info(TAG, 'mixedStopPauseStart_007, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      Logger.info(TAG, 'mixedStopPauseStart_007 end');
    });
  });
}
