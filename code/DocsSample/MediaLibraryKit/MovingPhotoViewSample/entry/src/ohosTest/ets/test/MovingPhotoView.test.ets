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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN = 0xF811;
const TAG = 'MovingPhotoViewTest';
const DELAY_TIME_1S = 1000;
const DELAY_TIME_3S = 3000;
const LOADED_TEXT = '动态照片已加载，长按可播放';
const PLAY_BUTTON_TEXT = 'PLAY';
const STOP_BUTTON_TEXT = 'STOP';
const PLAYING_TEXT = '开始播放';
const STOPPED_TEXT = '停止播放';
const MUTE_BUTTON_TEXT = '静音';
const UNMUTE_BUTTON_TEXT = '取消静音';

const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
const BUNDLENAME = abilityDelegatorRegistry.getArguments().bundleName;

export default function movingPhotoViewTest() {
  describe('MovingPhotoViewTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, 'beforeAll called');
      driver = Driver.create();
      // Start the application under test so that the page is in the foreground
      const want: Want = {
        bundleName: BUNDLENAME,
        abilityName: 'EntryAbility'
      };
      await DELEGATOR.startAbility(want);
      await driver.delayMs(DELAY_TIME_3S);
    });
    beforeEach(() => {
      hilog.info(DOMAIN, TAG, 'beforeEach called');
    });
    afterEach(() => {
      hilog.info(DOMAIN, TAG, 'afterEach called');
    });
    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'afterAll called');
    });

    /**
     * @tc.number MOVING_PHOTO_VIEW_FUNCTION_TEST_0100
     * @tc.name MovingPhotoViewFunctionTest0001
     * @tc.desc Verify that the preset moving photo is loaded automatically and the load message is shown
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('MovingPhotoViewFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0100 begin');
        try {
          await driver.delayMs(DELAY_TIME_3S);
          let loadedText: Component = await driver.findComponent(ON.text(LOADED_TEXT));
          expect(await loadedText.getText()).assertEqual(LOADED_TEXT);
          hilog.info(DOMAIN, TAG, 'MovingPhoto loaded automatically');
        } catch (error) {
          hilog.error(DOMAIN, TAG, 'Test failed: ' + JSON.stringify(error));
          expect(false).assertFail();
        } finally {
          hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0100 complete');
          done();
        }
      });

    /**
     * @tc.number MOVING_PHOTO_VIEW_FUNCTION_TEST_0200
     * @tc.name MovingPhotoViewFunctionTest0002
     * @tc.desc Verify that the PLAY button starts the playback and the STOP button stops it
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('MovingPhotoViewFunctionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0200 begin');
        try {
          await driver.delayMs(DELAY_TIME_1S);
          let playButton: Component = await driver.findComponent(ON.text(PLAY_BUTTON_TEXT));
          expect(await playButton.getText()).assertEqual(PLAY_BUTTON_TEXT);
          await playButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          let playingText: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
          expect(await playingText.getText()).assertEqual(PLAYING_TEXT);

          let stopButton: Component = await driver.findComponent(ON.text(STOP_BUTTON_TEXT));
          await stopButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          let stoppedText: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
          expect(await stoppedText.getText()).assertEqual(STOPPED_TEXT);
          hilog.info(DOMAIN, TAG, 'MovingPhoto play and stop succeed');
        } catch (error) {
          hilog.error(DOMAIN, TAG, 'Test failed: ' + JSON.stringify(error));
          expect(false).assertFail();
        } finally {
          hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0200 complete');
          done();
        }
      });

    /**
     * @tc.number MOVING_PHOTO_VIEW_FUNCTION_TEST_0300
     * @tc.name MovingPhotoViewFunctionTest0003
     * @tc.desc Verify that the mute button toggles the muted state of the moving photo playback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('MovingPhotoViewFunctionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0300 begin');
        try {
          await driver.delayMs(DELAY_TIME_1S);
          let muteButton: Component = await driver.findComponent(ON.text(MUTE_BUTTON_TEXT));
          expect(await muteButton.getText()).assertEqual(MUTE_BUTTON_TEXT);
          await muteButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          let unmuteButton: Component = await driver.findComponent(ON.text(UNMUTE_BUTTON_TEXT));
          expect(await unmuteButton.getText()).assertEqual(UNMUTE_BUTTON_TEXT);
          await unmuteButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          let restoredButton: Component = await driver.findComponent(ON.text(MUTE_BUTTON_TEXT));
          expect(await restoredButton.getText()).assertEqual(MUTE_BUTTON_TEXT);
          hilog.info(DOMAIN, TAG, 'MovingPhoto mute state toggled');
        } catch (error) {
          hilog.error(DOMAIN, TAG, 'Test failed: ' + JSON.stringify(error));
          expect(false).assertFail();
        } finally {
          hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0300 complete');
          done();
        }
      });

    /**
     * @tc.number MOVING_PHOTO_VIEW_FUNCTION_TEST_0400
     * @tc.name MovingPhotoViewFunctionTest0004
     * @tc.desc Verify that the PLAY and STOP buttons are present
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('MovingPhotoViewFunctionTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0400 begin');
        try {
          await driver.delayMs(DELAY_TIME_1S);
          await driver.assertComponentExist(ON.text(PLAY_BUTTON_TEXT));
          await driver.assertComponentExist(ON.text(STOP_BUTTON_TEXT));
          expect(true).assertTrue();
        } catch (error) {
          hilog.error(DOMAIN, TAG, 'Test failed: ' + JSON.stringify(error));
          expect(false).assertFail();
        } finally {
          hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0400 complete');
          done();
        }
      });

    /**
     * @tc.number MOVING_PHOTO_VIEW_FUNCTION_TEST_0500
     * @tc.name MovingPhotoViewFunctionTest0005
     * @tc.desc Verify that PLAY updates the playback status message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('MovingPhotoViewFunctionTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0500 begin');
        try {
          let stopButton: Component = await driver.findComponent(ON.text(STOP_BUTTON_TEXT));
          await stopButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          let playButton: Component = await driver.findComponent(ON.text(PLAY_BUTTON_TEXT));
          await playButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          let playingText: Component = await driver.findComponent(ON.text(PLAYING_TEXT));
          expect(await playingText.getText()).assertEqual(PLAYING_TEXT);
        } catch (error) {
          hilog.error(DOMAIN, TAG, 'Test failed: ' + JSON.stringify(error));
          expect(false).assertFail();
        } finally {
          hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0500 complete');
          done();
        }
      });

    /**
     * @tc.number MOVING_PHOTO_VIEW_FUNCTION_TEST_0600
     * @tc.name MovingPhotoViewFunctionTest0006
     * @tc.desc Verify that STOP updates the playback status message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('MovingPhotoViewFunctionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0600 begin');
        try {
          let stopButton: Component = await driver.findComponent(ON.text(STOP_BUTTON_TEXT));
          await stopButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          let stoppedText: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
          expect(await stoppedText.getText()).assertEqual(STOPPED_TEXT);
        } catch (error) {
          hilog.error(DOMAIN, TAG, 'Test failed: ' + JSON.stringify(error));
          expect(false).assertFail();
        } finally {
          hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0600 complete');
          done();
        }
      });

    /**
     * @tc.number MOVING_PHOTO_VIEW_FUNCTION_TEST_0700
     * @tc.name MovingPhotoViewFunctionTest0007
     * @tc.desc Verify that repeated STOP clicks keep the stopped message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('MovingPhotoViewFunctionTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0700 begin');
        try {
          let stopButton: Component = await driver.findComponent(ON.text(STOP_BUTTON_TEXT));
          await stopButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          await stopButton.click();
          await driver.delayMs(DELAY_TIME_1S);
          let stoppedText: Component = await driver.findComponent(ON.text(STOPPED_TEXT));
          expect(await stoppedText.getText()).assertEqual(STOPPED_TEXT);
        } catch (error) {
          hilog.error(DOMAIN, TAG, 'Test failed: ' + JSON.stringify(error));
          expect(false).assertFail();
        } finally {
          hilog.info(DOMAIN, TAG, 'MOVING_PHOTO_VIEW_FUNCTION_TEST_0700 complete');
          done();
        }
      });
  });
}
