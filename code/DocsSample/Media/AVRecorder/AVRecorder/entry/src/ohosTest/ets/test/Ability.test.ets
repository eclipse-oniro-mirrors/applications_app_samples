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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON, Component } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const DELAY_SHORT = 1000;
const DELAY_MEDIUM = 3000;
const DELAY_LONG = 5000;
const BUNDLE_NAME = 'com.samples.avrecorder';
const ABILITY_NAME = 'EntryAbility';

async function msleepAsync(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok");
    }, time);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  });
}

async function driveFn(num: number) {
  let driver: Driver = Driver.create();
  for (let i = 0; i < num; i++) {
    let button = await driver.findComponent(ON.text('允许')) ||
      await driver.findComponent(ON.text('始终允许'));
    if (button != null) {
      await button.click();
    }
    await msleepAsync(DELAY_SHORT);
  }
}

export default function abilityTest() {
  describe('IndexPageUITest', () => {
    let driver: Driver = Driver.create();
    let delegator = abilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(async () => {
      hilog.info(0x0000, 'UITest', 'IndexPageUITest beforeAll start');
      await delegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
      });
      await driver.delayMs(DELAY_MEDIUM);
      await driveFn(4);
      await driver.delayMs(DELAY_MEDIUM);
      hilog.info(0x0000, 'UITest', 'IndexPageUITest beforeAll end');
    })

    afterAll(async () => {
      hilog.info(0x0000, 'UITest', 'IndexPageUITest afterAll');
    })

    it('indexPage_shouldDisplayAllEntryItems', 0, async () => {
      let videoItem: Component = await driver.findComponent(ON.id('videoRecorderPage'));
      expect(videoItem !== null).assertTrue();

      let audioItem: Component = await driver.findComponent(ON.id('audioRecorderPage'));
      expect(audioItem !== null).assertTrue();

      let videoNdkItem: Component = await driver.findComponent(ON.id('videoRecorderNDKPage'));
      expect(videoNdkItem !== null).assertTrue();

      let audioNdkItem: Component = await driver.findComponent(ON.id('audioRecorderNDKPage'));
      expect(audioNdkItem !== null).assertTrue();
    })

    it('navigateToAudioRecorderPage_andBack', 0, async () => {
      let audioItem: Component = await driver.findComponent(ON.id('audioRecorderPage'));
      expect(audioItem !== null).assertTrue();
      await audioItem.click();
      await driver.delayMs(DELAY_MEDIUM);

      let audioStartBtn: Component = await driver.findComponent(ON.id('audioStart'));
      expect(audioStartBtn !== null).assertTrue();

      await driver.pressBack();
      await driver.delayMs(DELAY_SHORT);
    })

    it('navigateToVideoRecorderPage_andBack', 0, async () => {
      let videoItem: Component = await driver.findComponent(ON.id('videoRecorderPage'));
      expect(videoItem !== null).assertTrue();
      await videoItem.click();
      await driver.delayMs(DELAY_MEDIUM);

      let videoStartBtn: Component = await driver.findComponent(ON.id('videoStart'));
      expect(videoStartBtn !== null).assertTrue();

      await driver.pressBack();
      await driver.delayMs(DELAY_SHORT);
    })
  })

  describe('AudioRecorderUITest', () => {
    let driver: Driver = Driver.create();
    let delegator = abilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(async () => {
      hilog.info(0x0000, 'UITest', 'AudioRecorderUITest beforeAll start');
      await delegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
      });
      await driver.delayMs(DELAY_MEDIUM);

      let audioItem: Component = await driver.findComponent(ON.id('audioRecorderPage'));
      expect(audioItem !== null).assertTrue();
      await audioItem.click();
      await driver.delayMs(DELAY_MEDIUM);
      hilog.info(0x0000, 'UITest', 'AudioRecorderUITest beforeAll end');
    })

    afterAll(async () => {
      hilog.info(0x0000, 'UITest', 'AudioRecorderUITest afterAll');
      await driver.pressBack();
      await driver.delayMs(DELAY_SHORT);
    })

    it('audioStartButton_shouldBeVisibleBeforeRecording', 0, async () => {
      let startBtn: Component = await driver.findComponent(ON.id('audioStart'));
      expect(startBtn !== null).assertTrue();
    })

    it('audioSettingButton_shouldBeVisibleBeforeRecording', 0, async () => {
      let settingBtn: Component = await driver.findComponent(ON.id('audioSetting'));
      expect(settingBtn !== null).assertTrue();
    })

    it('audioRecord_startAndStop', 0, async () => {
      let startBtn: Component = await driver.findComponent(ON.id('audioStart'));
      expect(startBtn !== null).assertTrue();
      await startBtn.click();
      await driver.delayMs(DELAY_MEDIUM);

      let stopBtn: Component = await driver.findComponent(ON.id('audioStop'));
      expect(stopBtn !== null).assertTrue();
      await stopBtn.click();
      await driver.delayMs(DELAY_SHORT);
    })

    it('audioRecord_startPauseResumeStop', 0, async () => {
      let startBtn: Component = await driver.findComponent(ON.id('audioStart'));
      expect(startBtn !== null).assertTrue();
      await startBtn.click();
      await driver.delayMs(DELAY_MEDIUM);

      let pauseBtn: Component = await driver.findComponent(ON.id('audioPause'));
      expect(pauseBtn !== null).assertTrue();
      await pauseBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let resumeBtn: Component = await driver.findComponent(ON.id('audioResume'));
      expect(resumeBtn !== null).assertTrue();
      await resumeBtn.click();
      await driver.delayMs(DELAY_MEDIUM);

      let stopBtn: Component = await driver.findComponent(ON.id('audioStop'));
      expect(stopBtn !== null).assertTrue();
      await stopBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let startBtnAgain: Component = await driver.findComponent(ON.id('audioStart'));
      expect(startBtnAgain !== null).assertTrue();
    })

    it('audioSetting_openDialogAndCancel', 0, async () => {
      let settingBtn: Component = await driver.findComponent(ON.id('audioSetting'));
      expect(settingBtn !== null).assertTrue();
      await settingBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let cancelBtn: Component = await driver.findComponent(ON.id('audioCancel'));
      expect(cancelBtn !== null).assertTrue();
      await cancelBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let startBtn: Component = await driver.findComponent(ON.id('audioStart'));
      expect(startBtn !== null).assertTrue();
    })

    it('audioSetting_openDialogAndConfirm', 0, async () => {
      let settingBtn: Component = await driver.findComponent(ON.id('audioSetting'));
      expect(settingBtn !== null).assertTrue();
      await settingBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let confirmBtn: Component = await driver.findComponent(ON.id('audioConfirm'));
      expect(confirmBtn !== null).assertTrue();
      await confirmBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let startBtn: Component = await driver.findComponent(ON.id('audioStart'));
      expect(startBtn !== null).assertTrue();
    })
  })

  describe('VideoRecorderUITest', () => {
    let driver: Driver = Driver.create();
    let delegator = abilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(async () => {
      hilog.info(0x0000, 'UITest', 'VideoRecorderUITest beforeAll start');
      await delegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME,
      });
      await driver.delayMs(DELAY_MEDIUM);

      let videoItem: Component = await driver.findComponent(ON.id('videoRecorderPage'));
      expect(videoItem !== null).assertTrue();
      await videoItem.click();
      await driver.delayMs(DELAY_MEDIUM);
      hilog.info(0x0000, 'UITest', 'VideoRecorderUITest beforeAll end');
    })

    afterAll(async () => {
      hilog.info(0x0000, 'UITest', 'VideoRecorderUITest afterAll');
      await driver.pressBack();
      await driver.delayMs(DELAY_SHORT);
    })

    it('videoStartButton_shouldBeVisibleBeforeRecording', 0, async () => {
      let startBtn: Component = await driver.findComponent(ON.id('videoStart'));
      expect(startBtn !== null).assertTrue();
    })

    it('videoSettingButton_shouldBeVisibleBeforeRecording', 0, async () => {
      let settingBtn: Component = await driver.findComponent(ON.id('videoSetting'));
      expect(settingBtn !== null).assertTrue();
    })

    it('videoRecord_startAndStop', 0, async () => {
      let startBtn: Component = await driver.findComponent(ON.id('videoStart'));
      expect(startBtn !== null).assertTrue();
      await startBtn.click();
      await driver.delayMs(DELAY_MEDIUM);

      let stopBtn: Component = await driver.findComponent(ON.id('videoStop'));
      expect(stopBtn !== null).assertTrue();
      await stopBtn.click();
      await driver.delayMs(DELAY_SHORT);
    })

    it('videoRecord_startPauseResumeStop', 0, async () => {
      let startBtn: Component = await driver.findComponent(ON.id('videoStart'));
      expect(startBtn !== null).assertTrue();
      await startBtn.click();
      await driver.delayMs(DELAY_MEDIUM);

      let pauseBtn: Component = await driver.findComponent(ON.id('videoPause'));
      expect(pauseBtn !== null).assertTrue();
      await pauseBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let resumeBtn: Component = await driver.findComponent(ON.id('videoResume'));
      expect(resumeBtn !== null).assertTrue();
      await resumeBtn.click();
      await driver.delayMs(DELAY_MEDIUM);

      let stopBtn: Component = await driver.findComponent(ON.id('videoStop'));
      expect(stopBtn !== null).assertTrue();
      await stopBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let startBtnAgain: Component = await driver.findComponent(ON.id('videoStart'));
      expect(startBtnAgain !== null).assertTrue();
    })

    it('videoSetting_openDialogAndCancel', 0, async () => {
      let settingBtn: Component = await driver.findComponent(ON.id('videoSetting'));
      expect(settingBtn !== null).assertTrue();
      await settingBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let cancelBtn: Component = await driver.findComponent(ON.id('videoCancel'));
      expect(cancelBtn !== null).assertTrue();
      await cancelBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let startBtn: Component = await driver.findComponent(ON.id('videoStart'));
      expect(startBtn !== null).assertTrue();
    })

    it('videoSetting_openDialogAndConfirm', 0, async () => {
      let settingBtn: Component = await driver.findComponent(ON.id('videoSetting'));
      expect(settingBtn !== null).assertTrue();
      await settingBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let confirmBtn: Component = await driver.findComponent(ON.id('videoConfirm'));
      expect(confirmBtn !== null).assertTrue();
      await confirmBtn.click();
      await driver.delayMs(DELAY_SHORT);

      let startBtn: Component = await driver.findComponent(ON.id('videoStart'));
      expect(startBtn !== null).assertTrue();
    })
  })
}
