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
  tapId,
  exists,
  existsText,
  getIdText,
  openFromHome,
  tapBackToHome,
  ensureHomeReady
} from './shared/AudioDriver';

const MUSIC_TEXT_ID: string = 'music_state_text';
const RINGTONE_TEXT_ID: string = 'ringtone_state_text';
const MUSIC_ITEM_ID: string = 'music_player_item';
const RINGTONE_ITEM_ID: string = 'ringtone_player_item';
const IDLE_MUSIC: string = 'ic_pause';
const IDLE_RINGTONE: string = 'ic_pause_no';

async function openFocus(driver: Driver): Promise<boolean> {
  if (!(await backToHomeIfNeeded(driver, 'back_btn_focus'))) {
    return false;
  }
  return await openFromHome(driver, 'audio_focus_card', MUSIC_ITEM_ID);
}

export default function audioFocusInteraction() {
  describe('AudioFocusInteraction', () => {
    const driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_FOCUS_INTER_0100
     * @tc.name testFocusInter0001
     * @tc.desc Verify the focus page opens with music and ringtone players both in the idle state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFocusInter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await getIdText(driver, MUSIC_TEXT_ID)).assertEqual(IDLE_MUSIC);
      expect(await getIdText(driver, RINGTONE_TEXT_ID)).assertEqual(IDLE_RINGTONE);
      expect(await exists(driver, RINGTONE_ITEM_ID)).assertTrue();
      expect(await existsText(driver, '音频焦点')).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_FOCUS_INTER_0200
     * @tc.name testFocusInter0002
     * @tc.desc Verify tapping the ringtone player before music does not start ringtone playback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFocusInter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapId(driver, RINGTONE_ITEM_ID, 1200)).assertTrue();
      expect(await getIdText(driver, RINGTONE_TEXT_ID)).assertEqual(IDLE_RINGTONE);
      expect(await getIdText(driver, MUSIC_TEXT_ID)).assertEqual(IDLE_MUSIC);
    });

    /**
     * @tc.number SUB_AUDIO_FOCUS_INTER_0300
     * @tc.name testFocusInter0003
     * @tc.desc Verify tapping the music player starts music and moves the ringtone player out of idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFocusInter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapId(driver, MUSIC_ITEM_ID, 2000)).assertTrue();
      expect(await getIdText(driver, RINGTONE_TEXT_ID)).assertEqual(IDLE_MUSIC);
      expect(await exists(driver, MUSIC_TEXT_ID)).assertTrue();
      expect(await getIdText(driver, MUSIC_TEXT_ID)).assertEqual('ic_play_no');
    });

    /**
     * @tc.number SUB_AUDIO_FOCUS_INTER_0400
     * @tc.name testFocusInter0004
     * @tc.desc Verify the ringtone player becomes clickable once music has been tapped and switches to playing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFocusInter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapId(driver, MUSIC_ITEM_ID, 2000)).assertTrue();
      expect(await getIdText(driver, RINGTONE_TEXT_ID)).assertEqual(IDLE_MUSIC);
      expect(await tapId(driver, RINGTONE_ITEM_ID, 2000)).assertTrue();
      expect(await getIdText(driver, RINGTONE_TEXT_ID) === IDLE_RINGTONE).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_FOCUS_INTER_0500
     * @tc.name testFocusInter0005
     * @tc.desc Verify tapping the playing ringtone player a second time stops it back to idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusInter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapId(driver, MUSIC_ITEM_ID, 2000)).assertTrue();
      expect(await tapId(driver, RINGTONE_ITEM_ID, 2000)).assertTrue();
      const playing: string = await getIdText(driver, RINGTONE_TEXT_ID) as string;
      expect(playing === IDLE_RINGTONE).assertFalse();
      expect(await tapId(driver, RINGTONE_ITEM_ID, 2000)).assertTrue();
      const afterStop: string = await getIdText(driver, RINGTONE_TEXT_ID) as string;
      expect(afterStop === playing).assertFalse();
      expect(afterStop.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_FOCUS_INTER_0600
     * @tc.name testFocusInter0006
     * @tc.desc Verify the focus page returns to the home page when the back region is used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testFocusInter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
      expect(await exists(driver, 'select_output_device_card')).assertTrue();
      expect(await exists(driver, MUSIC_ITEM_ID)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_FOCUS_INTER_0700
     * @tc.name testFocusInter0007
     * @tc.desc Verify reopening the focus page after navigating away shows fresh idle state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusInter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapId(driver, MUSIC_ITEM_ID, 2000)).assertTrue();
      expect(await tapBackToHome(driver, 'back_btn_focus')).assertTrue();
      expect(await openFocus(driver)).assertTrue();
      expect(await getIdText(driver, MUSIC_TEXT_ID)).assertEqual(IDLE_MUSIC);
      expect(await getIdText(driver, RINGTONE_TEXT_ID)).assertEqual(IDLE_RINGTONE);
    });

    /**
     * @tc.number SUB_AUDIO_FOCUS_INTER_0800
     * @tc.name testFocusInter0008
     * @tc.desc Verify the music player keeps reporting a non idle state after music has started
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusInter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFocus(driver)).assertTrue();
      expect(await tapId(driver, MUSIC_ITEM_ID, 2000)).assertTrue();
      const started: string = await getIdText(driver, MUSIC_TEXT_ID) as string;
      await driver.delayMs(2000);
      const later: string = await getIdText(driver, MUSIC_TEXT_ID) as string;
      expect(started === '').assertFalse();
      expect(later === '').assertFalse();
      expect(later).assertEqual(started);
    });
  });
}
