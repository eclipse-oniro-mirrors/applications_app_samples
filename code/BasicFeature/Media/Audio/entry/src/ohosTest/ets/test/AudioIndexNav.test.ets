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
import { ensureHomeReady, startEntryAbility } from './shared/AudioDriver';
import { Driver, ON } from '@kit.TestKit';
import type { Component } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG = 'AudioIndexNav';
const BUNDLE_NAME: string = 'com.samples.audio';
const INDEX_CARD_IDS: string[] = [
  'select_output_device_card',
  'audio_focus_card',
  'audio_effect_manager_card',
  'audio_capturer_card',
  'audio_volume_card',
  'spatial_audio_card',
  'karaoke_card'
];
const KNOWN_BACK_IDS: string[] = [
  'back_btn_focus', 'back_btn', 'back_btn_preset', 'back_btn_realtime',
  'normal_capturer_back_btn', 'spatial_audio_back_btn', 'karaoke_back_btn'
];

// force-stop would kill the in-process test runner, so walk back to home instead
async function relaunchToHome(driver: Driver): Promise<boolean> {
  let homeCard: Component | null = await driver.waitForComponent(ON.id('select_output_device_card'), 1000);
  for (let i = 0; i < 8 && homeCard === null; i++) {
    try {
      await driver.pressBack();
    } catch (err) {
      break;
    }
    await driver.delayMs(800);
    homeCard = await driver.waitForComponent(ON.id('select_output_device_card'), 1500);
  }
  if (homeCard === null) {
    await startEntryAbility();
    await driver.delayMs(800);
    homeCard = await driver.waitForComponent(ON.id('select_output_device_card'), 10000);
  }
  return homeCard !== null;
}

async function tapBackToHome(driver: Driver, backId: string): Promise<boolean> {
  if (await driver.waitForComponent(ON.id('select_output_device_card'), 500) !== null) {
    return true;
  }
  try {
    await driver.pressBack();
  } catch (err) {
    return false;
  }
  await driver.delayMs(800);
  const home: Component | null = await driver.waitForComponent(ON.id('select_output_device_card'), 4000);
  return home !== null;
}

export default function audioIndexNav() {
  describe('AudioIndexNav', () => {
    let driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0100
     * @tc.name testIndexNav0001
     * @tc.desc Verify all seven entry cards are visible on the home page after launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexNav0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      let visibleCount: number = 0;
      const missingCards: string[] = [];
      for (const cardId of INDEX_CARD_IDS) {
        const card: Component | null = await driver.findComponent(ON.id(cardId));
        if (card !== null) {
          visibleCount++;
        } else {
          missingCards.push(cardId);
        }
      }
      hilog.info(DOMAIN, TAG, 'visible home cards: %{public}d missing: %{public}s', visibleCount,
        JSON.stringify(missingCards));
      expect(visibleCount).assertEqual(7);
      expect(missingCards.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0200
     * @tc.name testIndexNav0002
     * @tc.desc Verify tapping the output device card opens the device page and back returns home
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexNav0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      const card: Component | null = await driver.waitForComponent(ON.id('select_output_device_card'), 6000);
      expect(card !== null).assertTrue();
      await card!.click();
      const back: Component | null = await driver.waitForComponent(ON.id('back_btn'), 8000);
      expect(back !== null).assertTrue();
      const deviceName: Component | null = await driver.findComponent(ON.id('device_name_text'));
      expect(deviceName !== null).assertTrue();
      expect(await tapBackToHome(driver, 'back_btn')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0300
     * @tc.name testIndexNav0003
     * @tc.desc Verify the device page shows a resolved device name instead of the Invalid fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexNav0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      const card: Component | null = await driver.waitForComponent(ON.id('select_output_device_card'), 6000);
      await card!.click();
      await driver.delayMs(2000);
      const deviceName: Component | null = await driver.waitForComponent(ON.id('device_name_text'), 8000);
      expect(deviceName !== null).assertTrue();
      const text: string = await deviceName!.getText();
      expect(text.length > 0).assertTrue();
      expect(text === 'Invalid').assertFalse();
      expect(await tapBackToHome(driver, 'back_btn')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0400
     * @tc.name testIndexNav0004
     * @tc.desc Verify tapping the audio focus card opens both player rows with initial pause labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexNav0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      const card: Component | null = await driver.waitForComponent(ON.id('audio_focus_card'), 6000);
      await card!.click();
      const musicRow: Component | null = await driver.waitForComponent(ON.id('music_player_item'), 8000);
      expect(musicRow !== null).assertTrue();
      const ringtoneRow: Component | null = await driver.findComponent(ON.id('ringtone_player_item'));
      expect(ringtoneRow !== null).assertTrue();
      const musicState: string = await (await driver.findComponent(ON.id('music_state_text'))!).getText();
      const ringtoneState: string = await (await driver.findComponent(ON.id('ringtone_state_text'))!).getText();
      expect(musicState).assertEqual('ic_pause');
      expect(ringtoneState).assertEqual('ic_pause_no');
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0500
     * @tc.name testIndexNav0005
     * @tc.desc Verify tapping the music row switches its label to the playing state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexNav0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('audio_focus_card'), 6000))!.click();
      const musicRow: Component | null = await driver.waitForComponent(ON.id('music_player_item'), 8000);
      const stateBefore: string = await (await driver.findComponent(ON.id('music_state_text'))!).getText();
      expect(stateBefore).assertEqual('ic_pause');
      await musicRow!.click();
      await driver.delayMs(1200);
      const stateAfter: string = await (await driver.findComponent(ON.id('music_state_text'))!).getText();
      expect(stateAfter).assertEqual('ic_play_no');
      const ringtoneAfter: string = await (await driver.findComponent(ON.id('ringtone_state_text'))!).getText();
      expect(ringtoneAfter).assertEqual('ic_pause');
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0600
     * @tc.name testIndexNav0006
     * @tc.desc Verify the ringtone row stays paused before the music row is ever tapped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexNav0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('audio_focus_card'), 6000))!.click();
      const ringtoneRow: Component | null = await driver.waitForComponent(ON.id('ringtone_player_item'), 8000);
      expect(ringtoneRow !== null).assertTrue();
      await ringtoneRow!.click();
      await driver.delayMs(1000);
      const ringtoneState: string = await (await driver.findComponent(ON.id('ringtone_state_text'))!).getText();
      expect(ringtoneState).assertEqual('ic_pause_no');
      const musicState: string = await (await driver.findComponent(ON.id('music_state_text'))!).getText();
      expect(musicState).assertEqual('ic_pause');
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0700
     * @tc.name testIndexNav0007
     * @tc.desc Verify the audio effect card opens the preset page with both selectors and query button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexNav0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('audio_effect_manager_card'), 6000))!.click();
      const back: Component | null = await driver.waitForComponent(ON.id('back_btn_preset'), 8000);
      expect(back !== null).assertTrue();
      const contentSelector: Component | null = await driver.findComponent(ON.id('select_content_preset'));
      const usageSelector: Component | null = await driver.findComponent(ON.id('select_usage_preset'));
      const queryBtn: Component | null = await driver.findComponent(ON.id('query_btn_preset'));
      expect(contentSelector !== null).assertTrue();
      expect(usageSelector !== null).assertTrue();
      expect(queryBtn !== null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0800
     * @tc.name testIndexNav0008
     * @tc.desc Verify the capturer card opens the recording page with three tabs and its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexNav0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('audio_capturer_card'), 6000))!.click();
      const back: Component | null = await driver.waitForComponent(ON.id('normal_capturer_back_btn'), 8000);
      expect(back !== null).assertTrue();
      const normalTab: Component | null = await driver.findComponent(ON.id('btn_normal_capturer'));
      const parallelTab: Component | null = await driver.findComponent(ON.id('btn_parallel_capturer'));
      const liveTab: Component | null = await driver.findComponent(ON.id('btn_live_capturer'));
      expect(normalTab !== null).assertTrue();
      expect(parallelTab !== null).assertTrue();
      expect(liveTab !== null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_0900
     * @tc.name testIndexNav0009
     * @tc.desc Verify the capturer page opens in the idle state offering only the record button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexNav0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('audio_capturer_card'), 6000))!.click();
      const startBtn: Component | null = await driver.waitForComponent(ON.id('normal_start_record_btn'), 8000);
      expect(startBtn !== null).assertTrue();
      const stopBtn: Component | null = await driver.findComponent(ON.id('normal_stop_record_btn'));
      const pauseBtn: Component | null = await driver.findComponent(ON.id('normal_pause_record_btn'));
      const player: Component | null = await driver.findComponent(ON.id('normal_player'));
      expect(stopBtn === null).assertTrue();
      expect(pauseBtn === null).assertTrue();
      expect(player === null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_1000
     * @tc.name testIndexNav0010
     * @tc.desc Verify the volume card opens the volume panel with up and down buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexNav0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('audio_volume_card'), 6000))!.click();
      const resMgr = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      const upText: string = String(resMgr.getStringByNameSync('VOLUME_UP'));
      const downText: string = String(resMgr.getStringByNameSync('VOLUME_DOWN'));
      const titleText: string = String(resMgr.getStringByNameSync('AVVOLUME_PANEL_TITLE'));
      const upBtn: Component | null = await driver.waitForComponent(ON.text(upText), 8000);
      expect(upBtn !== null).assertTrue();
      const downBtn: Component | null = await driver.findComponent(ON.text(downText));
      expect(downBtn !== null).assertTrue();
      const title: Component | null = await driver.findComponent(ON.text(titleText));
      expect(title !== null).assertTrue();
      expect(upText === downText).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_1100
     * @tc.name testIndexNav0011
     * @tc.desc Verify the spatial audio card opens the page with the stereo player control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexNav0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('spatial_audio_card'), 6000))!.click();
      const back: Component | null = await driver.waitForComponent(ON.id('spatial_audio_back_btn'), 8000);
      expect(back !== null).assertTrue();
      const playBtn: Component | null = await driver.waitForComponent(ON.id('2P0_play_btn'), 6000);
      expect(playBtn !== null).assertTrue();
      expect(await tapBackToHome(driver, 'spatial_audio_back_btn')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_1200
     * @tc.name testIndexNav0012
     * @tc.desc Verify the karaoke card opens the page showing the not-initialized status first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testIndexNav0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('karaoke_card'), 6000))!.click();
      const status: Component | null = await driver.waitForComponent(ON.id('karaoke_status_text'), 8000);
      expect(status !== null).assertTrue();
      const resMgr = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      const idleRes: string = String(resMgr.getStringByNameSync('KARAOKE_NOT_INITIALIZED'));
      expect(await status!.getText()).assertEqual(idleRes);
      const initBtn: Component | null = await driver.findComponent(ON.id('karaoke_init_btn'));
      expect(initBtn !== null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_1300
     * @tc.name testIndexNav0013
     * @tc.desc Verify the karaoke page renders all control buttons and the volume slider
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexNav0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('karaoke_card'), 6000))!.click();
      const ids: string[] = ['karaoke_init_btn', 'karaoke_enable_btn', 'karaoke_disable_btn', 'karaoke_volume_slider'];
      let found: number = 0;
      for (const id of ids) {
        const comp: Component | null = await driver.waitForComponent(ON.id(id), 6000);
        if (comp !== null) {
          found++;
        }
      }
      expect(found).assertEqual(4);
      const slider: Component | null = await driver.findComponent(ON.id('karaoke_volume_slider'));
      expect(slider !== null).assertTrue();
      expect(await tapBackToHome(driver, 'karaoke_back_btn')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_INDEX_NAV_1400
     * @tc.name testIndexNav0014
     * @tc.desc Verify switching from the capturer page to the parallel tab replaces it with the parallel view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexNav0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await relaunchToHome(driver)).assertTrue();
      await (await driver.waitForComponent(ON.id('audio_capturer_card'), 6000))!.click();
      const parallelTab: Component | null = await driver.waitForComponent(ON.id('btn_parallel_capturer'), 8000);
      expect(parallelTab !== null).assertTrue();
      await parallelTab!.click();
      await driver.delayMs(1200);
      const musicCard: Component | null = await driver.waitForComponent(ON.id('music_player_card'), 8000);
      const startBtn: Component | null = await driver.findComponent(ON.id('parallel_start_btn'));
      expect(musicCard !== null).assertTrue();
      expect(startBtn !== null).assertTrue();
      const normalStart: Component | null = await driver.findComponent(ON.id('normal_start_record_btn'));
      expect(normalStart === null).assertTrue();
    });
  });
}
