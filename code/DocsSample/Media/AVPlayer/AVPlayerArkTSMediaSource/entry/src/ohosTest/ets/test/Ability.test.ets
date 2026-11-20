/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const TAG = '[Sample_AVPlayerArkTSMediaSource]';
const DOMAIN = 0xF811;
const DELAY_UI_READY = 3000;
const DELAY_TIME_SAMPLE = 2000;
const DELAY_STATE_SWITCH = 1000;
const DELAY_SEEK_STABLE = 1500;
const DELAY_PAUSE_CHECK = 2000;
const DRAG_LEFT_OFFSET = 50;
const DRAG_RIGHT_OFFSET = 100;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

/**
 * Parses the "min:sec" time text into total seconds, returns -1 when parsing fails.
 */
function parseTimeToSeconds(text: string): number {
  const parts: string[] = text.split(':');
  if (parts.length !== 2) {
    return -1;
  }
  const min: number = Number.parseInt(parts[0], 10);
  const sec: number = Number.parseInt(parts[1], 10);
  if (Number.isNaN(min) || Number.isNaN(sec)) {
    return -1;
  }
  return min * 60 + sec;
}

/**
 * Resumes playback when the application is in the paused state,
 * so that each test case starts from the playing state.
 */
async function ensurePlaying(driver: Driver): Promise<void> {
  try {
    const pausedButton = await driver.findComponent(ON.id('play'));
    await pausedButton.click();
    await driver.delayMs(DELAY_STATE_SWITCH);
    hilog.info(DOMAIN, TAG, '%{public}s', 'ensurePlaying: app was paused, resumed playing');
  } catch (error) {
    hilog.info(DOMAIN, TAG, '%{public}s', `ensurePlaying: app is already playing, ${JSON.stringify(error)}`);
  }
}

export default function abilityTest(): void {
  describe('AVPlayerArkTSMediaSourceTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.name   testAVPlayerArkTSMediaSource0001
     * @tc.number SUB_MEDIA_AVPLAYER_ARKTS_MEDIA_SOURCE_0100
     * @tc.desc   Verify the application is launched and the player page is displayed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAVPlayerArkTSMediaSource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility'
          };
          await delegator.startAbility(want);
          const driver = Driver.create();
          await driver.delayMs(DELAY_UI_READY);
          const ability: UIAbility = await delegator.getCurrentTopAbility();
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          await ensurePlaying(driver);
          await driver.assertComponentExist(ON.id('pause'));
        } catch (error) {
          hilog.error(DOMAIN, TAG, '%{public}s', `test0001 failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   testAVPlayerArkTSMediaSource0002
     * @tc.number SUB_MEDIA_AVPLAYER_ARKTS_MEDIA_SOURCE_0200
     * @tc.desc   Verify the resource is playing and the play button toggles the playback state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAVPlayerArkTSMediaSource0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility'
          };
          await delegator.startAbility(want);
          const driver = Driver.create();
          await driver.delayMs(DELAY_UI_READY);
          await ensurePlaying(driver);
          const firstText = await driver.findComponent(ON.id('currentTimeText'));
          const first: number = parseTimeToSeconds(await firstText.getText());
          await driver.delayMs(DELAY_TIME_SAMPLE);
          const secondText = await driver.findComponent(ON.id('currentTimeText'));
          const second: number = parseTimeToSeconds(await secondText.getText());
          hilog.info(DOMAIN, TAG, '%{public}s', `test0002 play time first: ${first}, second: ${second}`);
          expect(second).assertLarger(first);
          await driver.assertComponentExist(ON.id('pause'));
          const playingButton = await driver.findComponent(ON.id('pause'));
          await playingButton.click();
          await driver.delayMs(DELAY_STATE_SWITCH);
          await driver.assertComponentExist(ON.id('play'));
          const pausedButton = await driver.findComponent(ON.id('play'));
          await pausedButton.click();
          await driver.delayMs(DELAY_STATE_SWITCH);
          await driver.assertComponentExist(ON.id('pause'));
        } catch (error) {
          hilog.error(DOMAIN, TAG, '%{public}s', `test0002 failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   testAVPlayerArkTSMediaSource0003
     * @tc.number SUB_MEDIA_AVPLAYER_ARKTS_MEDIA_SOURCE_0300
     * @tc.desc   Verify the playback progress changes after the slider is dragged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAVPlayerArkTSMediaSource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility'
          };
          await delegator.startAbility(want);
          const driver = Driver.create();
          await driver.delayMs(DELAY_UI_READY);
          await ensurePlaying(driver);
          await driver.assertComponentExist(ON.id('pause'));
          const playingButton = await driver.findComponent(ON.id('pause'));
          await playingButton.click();
          await driver.delayMs(DELAY_STATE_SWITCH);
          const beforeText = await driver.findComponent(ON.id('currentTimeText'));
          const before: number = parseTimeToSeconds(await beforeText.getText());
          await driver.assertComponentExist(ON.id('Slider'));
          const slider = await driver.findComponent(ON.id('Slider'));
          const point = await slider.getBoundsCenter();
          await driver.drag(point.x - DRAG_LEFT_OFFSET, point.y, point.x + DRAG_RIGHT_OFFSET, point.y, 800);
          await driver.delayMs(DELAY_SEEK_STABLE);
          const afterText = await driver.findComponent(ON.id('currentTimeText'));
          const after: number = parseTimeToSeconds(await afterText.getText());
          hilog.info(DOMAIN, TAG, '%{public}s', `test0003 seek time before: ${before}, after: ${after}`);
          expect(after).assertLarger(before);
          const pausedButton = await driver.findComponent(ON.id('play'));
          await pausedButton.click();
        } catch (error) {
          hilog.error(DOMAIN, TAG, '%{public}s', `test0003 failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   testAVPlayerArkTSMediaSource0004
     * @tc.number SUB_MEDIA_AVPLAYER_ARKTS_MEDIA_SOURCE_0400
     * @tc.desc   Verify the playback is paused and the time stops advancing after the button is clicked.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAVPlayerArkTSMediaSource0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility'
          };
          await delegator.startAbility(want);
          const driver = Driver.create();
          await driver.delayMs(DELAY_UI_READY);
          await ensurePlaying(driver);
          await driver.assertComponentExist(ON.id('pause'));
          const playingButton = await driver.findComponent(ON.id('pause'));
          await playingButton.click();
          await driver.delayMs(DELAY_STATE_SWITCH);
          await driver.assertComponentExist(ON.id('play'));
          const beforeText = await driver.findComponent(ON.id('currentTimeText'));
          const before: number = parseTimeToSeconds(await beforeText.getText());
          await driver.delayMs(DELAY_PAUSE_CHECK);
          const afterText = await driver.findComponent(ON.id('currentTimeText'));
          const after: number = parseTimeToSeconds(await afterText.getText());
          hilog.info(DOMAIN, TAG, '%{public}s', `test0004 pause time before: ${before}, after: ${after}`);
          expect(after).assertEqual(before);
        } catch (error) {
          hilog.error(DOMAIN, TAG, '%{public}s', `test0004 failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });
  })
}
