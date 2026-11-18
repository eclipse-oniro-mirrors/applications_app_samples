/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { ensureHomeReady } from './shared/AudioDriver';
import { Driver, ON } from '@kit.TestKit';
import type { Component } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG = 'AudioRecordStateMachine';
const BUNDLE_NAME: string = 'com.samples.audio';
const TIME_PATTERN: RegExp = /^\d{2}:\d{2}:\d{2}$/;
const PAUSE_HOLD_MS: number = 6500;

async function openNormalCapturer(driver: Driver): Promise<boolean> {
  // The previous case leaves the app on the capturer page, so reset to home first.
  if (!(await ensureHomeReady(driver))) {
    return false;
  }
  const homeCard: Component | null = await driver.waitForComponent(ON.id('audio_capturer_card'), 3000);
  if (homeCard === null) {
    return false;
  }
  await homeCard.click();
  const startBtn: Component | null = await driver.waitForComponent(ON.id('normal_start_record_btn'), 10000);
  return startBtn !== null;
}

async function recordForSeconds(driver: Driver, seconds: number): Promise<void> {
  const startBtn: Component | null = await driver.waitForComponent(ON.id('normal_start_record_btn'), 6000);
  if (startBtn !== null) {
    await startBtn.click();
  }
  await driver.delayMs(seconds * 1000);
}

async function readShowTime(driver: Driver): Promise<string> {
  const timeTxt: Component | null = await driver.waitForComponent(ON.id('normal_show_time_txt'), 6000);
  if (timeTxt === null) {
    return '';
  }
  return await timeTxt.getText();
}

function parseSeconds(timeText: string): number {
  if (!TIME_PATTERN.test(timeText)) {
    return -1;
  }
  const parts: string[] = timeText.split(':');
  return Number(parts[0]) * 3600 + Number(parts[1]) * 60 + Number(parts[2]);
}

export default function audioRecordStateMachine() {
  describe('AudioRecordStateMachine', () => {
    let driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });
    const resMgr = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_0100
     * @tc.name testRecordState0001
     * @tc.desc Verify the recorder page starts idle with only the record button present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecordState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      const stopBtn: Component | null = await driver.findComponent(ON.id('normal_stop_record_btn'));
      const pauseBtn: Component | null = await driver.findComponent(ON.id('normal_pause_record_btn'));
      const continueBtn: Component | null = await driver.findComponent(ON.id('normal_continue_record_btn'));
      const player: Component | null = await driver.findComponent(ON.id('normal_player'));
      expect(stopBtn === null).assertTrue();
      expect(pauseBtn === null).assertTrue();
      expect(continueBtn === null).assertTrue();
      expect(player === null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_0200
     * @tc.name testRecordState0002
     * @tc.desc Verify starting a recording replaces the record button with stop and pause controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecordState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      await recordForSeconds(driver, 3);
      const stopBtn: Component | null = await driver.findComponent(ON.id('normal_stop_record_btn'));
      const pauseBtn: Component | null = await driver.findComponent(ON.id('normal_pause_record_btn'));
      expect(stopBtn !== null).assertTrue();
      expect(pauseBtn !== null).assertTrue();
      const startBtn: Component | null = await driver.findComponent(ON.id('normal_start_record_btn'));
      expect(startBtn === null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_0500
     * @tc.name testRecordState0005
     * @tc.desc Verify pausing swaps the pause control for the continue control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecordState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      await recordForSeconds(driver, 2);
      const pauseBtn: Component | null = await driver.waitForComponent(ON.id('normal_pause_record_btn'), 6000);
      expect(pauseBtn !== null).assertTrue();
      await pauseBtn!.click();
      await driver.delayMs(1500);
      const continueBtn: Component | null = await driver.findComponent(ON.id('normal_continue_record_btn'));
      expect(continueBtn !== null).assertTrue();
      const pauseAfter: Component | null = await driver.findComponent(ON.id('normal_pause_record_btn'));
      expect(pauseAfter === null).assertTrue();
    });
    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_0600
     * @tc.name testRecordState0007
     * @tc.desc Verify continuing swaps the continue control back for the pause control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecordState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      await recordForSeconds(driver, 2);
      await (await driver.waitForComponent(ON.id('normal_pause_record_btn'), 6000))!.click();
      await driver.delayMs(1500);
      const continueBtn: Component | null = await driver.waitForComponent(ON.id('normal_continue_record_btn'), 6000);
      expect(continueBtn !== null).assertTrue();
      await continueBtn!.click();
      await driver.delayMs(1500);
      const pauseBack: Component | null = await driver.findComponent(ON.id('normal_pause_record_btn'));
      expect(pauseBack !== null).assertTrue();
      const continueAfter: Component | null = await driver.findComponent(ON.id('normal_continue_record_btn'));
      expect(continueAfter === null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_0700
     * @tc.name testRecordState0009
     * @tc.desc Verify stopping a recording shorter than the minimum keeps the record controls on screen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      await recordForSeconds(driver, 2);
      const stopBtn: Component | null = await driver.waitForComponent(ON.id('normal_stop_record_btn'), 6000);
      expect(stopBtn !== null).assertTrue();
      await stopBtn!.click();
      await driver.delayMs(1500);
      const stopAfter: Component | null = await driver.findComponent(ON.id('normal_stop_record_btn'));
      expect(stopAfter !== null).assertTrue();
      const player: Component | null = await driver.findComponent(ON.id('normal_player'));
      expect(player === null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_0800
     * @tc.name testRecordState0010
     * @tc.desc Verify stopping after the minimum duration opens the playback row and disables recording
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecordState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      await recordForSeconds(driver, 7);
      const stopBtn: Component | null = await driver.waitForComponent(ON.id('normal_stop_record_btn'), 6000);
      expect(stopBtn !== null).assertTrue();
      await stopBtn!.click();
      await driver.delayMs(2000);
      const player: Component | null = await driver.waitForComponent(ON.id('normal_player'), 8000);
      expect(player !== null).assertTrue();
      const disabledBtn: Component | null = await driver.findComponent(ON.id('disalbe_btn'));
      expect(disabledBtn !== null).assertTrue();
      const stopAfter: Component | null = await driver.findComponent(ON.id('normal_stop_record_btn'));
      expect(stopAfter === null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_0900
     * @tc.name testRecordState0011
     * @tc.desc Verify the playback row shows a paused indicator before playback is started
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      await recordForSeconds(driver, 7);
      await (await driver.waitForComponent(ON.id('normal_stop_record_btn'), 6000))!.click();
      await driver.delayMs(2500);
      const pausedState: Component | null = await driver.waitForComponent(ON.id('paused_state'), 8000);
      expect(pausedState !== null).assertTrue();
      const playingState: Component | null = await driver.findComponent(ON.id('playing_state'));
      expect(playingState === null).assertTrue();
      const player: Component | null = await driver.findComponent(ON.id('normal_player'));
      expect(player !== null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_1000
     * @tc.name testRecordState0012
     * @tc.desc Verify tapping the playback row switches it from paused to playing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      await recordForSeconds(driver, 7);
      await (await driver.waitForComponent(ON.id('normal_stop_record_btn'), 6000))!.click();
      await driver.delayMs(2500);
      const player: Component | null = await driver.waitForComponent(ON.id('normal_player'), 8000);
      expect(player !== null).assertTrue();
      const pausedBefore: Component | null = await driver.findComponent(ON.id('paused_state'));
      expect(pausedBefore !== null).assertTrue();
      await player!.click();
      const playing: Component | null = await driver.waitForComponent(ON.id('playing_state'), 8000);
      expect(playing !== null).assertTrue();
      const pausedAfter: Component | null = await driver.findComponent(ON.id('paused_state'));
      expect(pausedAfter === null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RECORD_STATE_1100
     * @tc.name testRecordState0013
     * @tc.desc Verify the two recording modes expose their own record button ids on separate tabs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openNormalCapturer(driver)).assertTrue();
      const normalStart: Component | null = await driver.findComponent(ON.id('normal_start_record_btn'));
      const liveStart: Component | null = await driver.findComponent(ON.id('live_start_record_btn'));
      const parallelStart: Component | null = await driver.findComponent(ON.id('parallel_start_btn'));
      expect(normalStart !== null).assertTrue();
      expect(liveStart === null).assertTrue();
      expect(parallelStart === null).assertTrue();
      const liveTab: Component | null = await driver.findComponent(ON.id('btn_live_capturer'));
      expect(liveTab !== null).assertTrue();
    });
  });
}
