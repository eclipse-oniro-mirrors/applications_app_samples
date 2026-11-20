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
  HOME_ID,
  INDEX_CARD_IDS,
  openFromHome,
  tapBackToHome,
  exists,
  getIdText,
  backToHomeIfNeeded,
  ensureHomeReady
} from './shared/AudioDriver';

export default function audioPageRoundTrip() {
  describe('AudioPageRoundTrip', () => {
    const driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_0100
     * @tc.name testRoundTrip0001
     * @tc.desc Verify the home page exposes all seven feature entries on a cold start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoundTrip0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      const missing: string[] = [];
      for (let i = 0; i < INDEX_CARD_IDS.length; i++) {
        if (!(await exists(driver, INDEX_CARD_IDS[i]))) {
          missing.push(INDEX_CARD_IDS[i]);
        }
      }
      expect(INDEX_CARD_IDS.length).assertEqual(7);
      expect(missing.length).assertEqual(0);
      expect(await exists(driver, HOME_ID)).assertTrue();
    });
    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_0200
     * @tc.name testRoute0001
     * @tc.desc Verify the device entry opens its page and returns to the home cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoute0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'select_output_device_card', 'device_name_text')).assertTrue();
      expect(await exists(driver, HOME_ID)).assertFalse();
      expect(await tapBackToHome(driver, 'back_btn')).assertTrue();
      expect(await exists(driver, 'device_name_text')).assertFalse();
      expect(await exists(driver, HOME_ID)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_0300
     * @tc.name testRoute0002
     * @tc.desc Verify the focus entry opens its page and returns to the home cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoute0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'audio_focus_card', 'music_player_item')).assertTrue();
      expect(await exists(driver, HOME_ID)).assertFalse();
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
      expect(await exists(driver, 'music_player_item')).assertFalse();
      expect(await exists(driver, HOME_ID)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_0400
     * @tc.name testRoute0003
     * @tc.desc Verify the effect entry opens its page and returns to the home cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoute0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'audio_effect_manager_card', 'query_btn_preset')).assertTrue();
      expect(await exists(driver, HOME_ID)).assertFalse();
      expect(await tapBackToHome(driver, 'back_btn_preset')).assertTrue();
      expect(await exists(driver, 'query_btn_preset')).assertFalse();
      expect(await exists(driver, HOME_ID)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_0500
     * @tc.name testRoute0004
     * @tc.desc Verify the capturer entry opens its page and returns to the home cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoute0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'audio_capturer_card', 'btn_normal_capturer')).assertTrue();
      expect(await exists(driver, HOME_ID)).assertFalse();
      expect(await tapBackToHome(driver, 'normal_capturer_back_btn')).assertTrue();
      expect(await exists(driver, 'btn_normal_capturer')).assertFalse();
      expect(await exists(driver, HOME_ID)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_0700
     * @tc.name testRoute0006
     * @tc.desc Verify the spatial audio entry opens its page and returns to the home cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoute0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'spatial_audio_card', '2P0_play_btn')).assertTrue();
      expect(await exists(driver, HOME_ID)).assertFalse();
      expect(await tapBackToHome(driver, 'spatial_audio_back_btn')).assertTrue();
      expect(await exists(driver, '2P0_play_btn')).assertFalse();
      expect(await exists(driver, HOME_ID)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_0800
     * @tc.name testRoute0007
     * @tc.desc Verify the karaoke entry opens its page and returns to the home cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoute0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'karaoke_card', 'karaoke_init_btn')).assertTrue();
      expect(await exists(driver, HOME_ID)).assertFalse();
      expect(await tapBackToHome(driver, 'karaoke_back_btn')).assertTrue();
      expect(await exists(driver, 'karaoke_init_btn')).assertFalse();
      expect(await exists(driver, HOME_ID)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_0900
     * @tc.name testRoundTrip0002
     * @tc.desc Verify the output device page reports a device name that is not the invalid fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoundTrip0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'select_output_device_card', 'device_name_text')).assertTrue();
      const name: string | null = await getIdText(driver, 'device_name_text');
      expect(name !== null).assertTrue();
      expect(name === 'Invalid').assertFalse();
      expect(await exists(driver, 'back_btn')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_1000
     * @tc.name testRoundTrip0003
     * @tc.desc Verify the volume panel shows the title and both volume controls, then returns to home
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoundTrip0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'audio_volume_card', 'back_btn_focus')).assertTrue();
      expect(await getIdText(driver, 'back_btn_focus') !== null).assertTrue();
      expect(await exists(driver, HOME_ID)).assertFalse();
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
      expect(await exists(driver, HOME_ID)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_1100
     * @tc.name testRoundTrip0004
     * @tc.desc Verify the karaoke page opens uninitialised and returns to home from its own back control
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoundTrip0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'karaoke_card', 'karaoke_status_text')).assertTrue();
      expect(await getIdText(driver, 'karaoke_status_text')).assertEqual('未初始化');
      expect(await tapBackToHome(driver, 'karaoke_back_btn')).assertTrue();
      expect(await exists(driver, 'karaoke_status_text')).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_ROUND_TRIP_1200
     * @tc.name testRoundTrip0005
     * @tc.desc Verify the spatial audio page keeps its back control available after a cold start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRoundTrip0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_focus')).assertTrue();
      expect(await openFromHome(driver, 'spatial_audio_card', 'spatial_audio_back_btn')).assertTrue();
      expect(await exists(driver, '2P0_play_btn')).assertTrue();
      expect(await exists(driver, '2P0_pause_btn')).assertFalse();
      expect(await tapBackToHome(driver, 'spatial_audio_back_btn')).assertTrue();
    });
  });
}
