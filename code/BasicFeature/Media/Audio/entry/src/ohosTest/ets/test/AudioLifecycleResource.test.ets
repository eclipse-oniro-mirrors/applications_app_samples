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
import { Driver } from '@kit.TestKit';
import {
  backToHomeIfNeeded,
  openFromHome,
  tapBackToHome,
  tapId,
  exists,
  getIdText,
  ensureHomeReady
} from './shared/AudioDriver';

const MUSIC_TEXT_ID: string = 'music_state_text';
const MUSIC_ITEM_ID: string = 'music_player_item';
const RINGTONE_ITEM_ID: string = 'ringtone_player_item';
const RINGTONE_TEXT_ID: string = 'ringtone_state_text';
const IDLE_MUSIC: string = 'ic_pause';
const IDLE_RINGTONE: string = 'ic_pause_no';

async function openFocus(driver: Driver): Promise<boolean> {
  if (!(await backToHomeIfNeeded(driver, 'back_btn_focus'))) {
    return false;
  }
  return await openFromHome(driver, 'audio_focus_card', MUSIC_ITEM_ID);
}

async function openRealtime(driver: Driver): Promise<boolean> {
  if (!(await backToHomeIfNeeded(driver, 'back_btn_preset'))) {
    return false;
  }
  if (!(await openFromHome(driver, 'audio_effect_manager_card', 'query_btn_preset'))) {
    return false;
  }
  return await tapId(driver, 'switch_btn_preset', 1500);
}

export default function audioLifecycleResource() {
  describe('AudioLifecycleResource', () => {
    const driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_LIFE_0100
     * @tc.name testResourceLife0001
     * @tc.desc Verify the focus page reinitialises both players after leaving and returning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testResourceLife0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapId(driver, MUSIC_ITEM_ID, 2000)).assertTrue();
      expect(await getIdText(driver, RINGTONE_TEXT_ID)).assertEqual(IDLE_MUSIC);
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
      expect(await openFocus(driver)).assertTrue();
      expect(await getIdText(driver, MUSIC_TEXT_ID)).assertEqual(IDLE_MUSIC);
      expect(await getIdText(driver, RINGTONE_TEXT_ID)).assertEqual(IDLE_RINGTONE);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_LIFE_0200
     * @tc.name testResourceLife0002
     * @tc.desc Verify the focus page still accepts a music tap after a release and re-init cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testResourceLife0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
      expect(await openFocus(driver)).assertTrue();
      expect(await tapId(driver, MUSIC_ITEM_ID, 2000)).assertTrue();
      expect(await getIdText(driver, RINGTONE_TEXT_ID)).assertEqual(IDLE_MUSIC);
      expect(await tapId(driver, RINGTONE_ITEM_ID, 2000)).assertTrue();
      expect(await getIdText(driver, RINGTONE_TEXT_ID) === IDLE_RINGTONE).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_LIFE_0300
     * @tc.name testResourceLife0003
     * @tc.desc Verify three consecutive focus page entries each leave the players idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResourceLife0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const observed: string[] = [];
      for (let round = 0; round < 3; round++) {
        expect(await openFocus(driver)).assertTrue();
        observed.push(await getIdText(driver, MUSIC_TEXT_ID) as string);
        expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
      }
      expect(observed.length).assertEqual(3);
      observed.forEach((state: string) => {
        expect(state).assertEqual(IDLE_MUSIC);
      });
      expect(new Set(observed).size).assertEqual(1);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_LIFE_0400
     * @tc.name testResourceLife0004
     * @tc.desc Verify the realtime page pauses its player after leaving and re-enters idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testResourceLife0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openRealtime(driver)).assertTrue();
      expect(await tapId(driver, 'play_pause_realtime', 2500)).assertTrue();
      expect(await getIdText(driver, 'audio_play_state')).assertEqual('onPlaying');
      expect(await tapId(driver, 'switch_btn_realtime', 1500)).assertTrue();
      expect(await getIdText(driver, 'query_btn_preset') !== null).assertTrue();
      expect(await tapId(driver, 'switch_btn_preset', 1500)).assertTrue();
      expect(await getIdText(driver, 'audio_play_state')).assertEqual('notPlaying');
      expect(await getIdText(driver, 'select_mode_name_realtime')).assertEqual('默认');
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_LIFE_0500
     * @tc.name testResourceLife0005
     * @tc.desc Verify the realtime page can play again after the previous player was released on exit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testResourceLife0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openRealtime(driver)).assertTrue();
      expect(await tapId(driver, 'play_pause_realtime', 2500)).assertTrue();
      expect(await getIdText(driver, 'audio_play_state')).assertEqual('onPlaying');
      expect(await tapId(driver, 'switch_btn_realtime', 1500)).assertTrue();
      expect(await tapId(driver, 'switch_btn_preset', 1500)).assertTrue();
      expect(await tapId(driver, 'play_pause_realtime', 2500)).assertTrue();
      expect(await getIdText(driver, 'audio_play_state')).assertEqual('onPlaying');
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_LIFE_0600
     * @tc.name testResourceLife0006
     * @tc.desc Verify the spatial audio page keeps both demo rows after leaving and returning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testResourceLife0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'spatial_audio_back_btn')).assertTrue();
      expect(await openFromHome(driver, 'spatial_audio_card', 'spatial_audio_back_btn')).assertTrue();
      expect(await exists(driver, '2P0_play_btn')).assertTrue();
      expect(await tapBackToHome(driver, 'spatial_audio_back_btn')).assertTrue();
      expect(await openFromHome(driver, 'spatial_audio_card', 'spatial_audio_back_btn')).assertTrue();
      expect(await exists(driver, '2P0_play_btn')).assertTrue();
      expect(await exists(driver, '2P0_pause_btn')).assertFalse();
      expect(await exists(driver, '5P1_play_btn')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_LIFE_0700
     * @tc.name testResourceLife0008
     * @tc.desc Verify the karaoke page reports uninitialised again after leaving and returning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResourceLife0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await backToHomeIfNeeded(driver, 'karaoke_back_btn')).assertTrue();
      expect(await openFromHome(driver, 'karaoke_card', 'karaoke_status_text')).assertTrue();
      expect(await getIdText(driver, 'karaoke_status_text')).assertEqual('未初始化');
      expect(await tapBackToHome(driver, 'karaoke_back_btn')).assertTrue();
      expect(await openFromHome(driver, 'karaoke_card', 'karaoke_status_text')).assertTrue();
      expect(await getIdText(driver, 'karaoke_status_text')).assertEqual('未初始化');
      expect(await exists(driver, 'karaoke_init_btn')).assertTrue();
    });
  });
}
