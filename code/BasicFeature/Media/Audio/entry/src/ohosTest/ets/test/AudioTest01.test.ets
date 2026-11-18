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
import type { Component, UiWindow, Rect } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { UIAbility } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG = 'Audio01Test';
const BUNDLE_NAME: string = 'com.samples.audio';

async function waitForTopAbility(driver: Driver, delegator: abilityDelegatorRegistry.AbilityDelegator,
  timeoutMs: number): Promise<UIAbility | null> {
  const deadline: number = new Date().getTime() + timeoutMs;
  while (new Date().getTime() < deadline) {
    try {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      if (ability !== null && ability.context.abilityInfo.name === 'EntryAbility') {
        return ability;
      }
    } catch (e) {
      hilog.info(DOMAIN, TAG, '%{public}s', 'top ability not ready, dismiss dialog and retry');
      try {
        const win: UiWindow | null = await driver.findWindow({ bundleName: 'com.ohos.permissionmanager' });
        if (win !== null) {
          const rect: Rect = await win.getBounds();
          const btnX: number = Math.round((rect.left + rect.right) / 2 + 144);
          const btnY: number = Math.round(rect.top + (rect.bottom - rect.top) * 0.58);
          hilog.info(DOMAIN, TAG, 'click allow at: %{public}d, %{public}d', btnX, btnY);
          await driver.click(btnX, btnY);
        }
      } catch (err) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'no permission dialog found');
      }
    }
    await new Promise<void>((resolve) => setTimeout(resolve, 500));
  }
  return null;
}

export default function audioTest01() {
  describe('Audio01Test', () => {
    let driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0100
     * @tc.name testAudio01Chapter0001
     * @tc.desc Verify testAudio01Chapter0001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0001 start');
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' };
      await delegator.startAbility(want);
      await driver.delayMs(2000);
      const topAbility: UIAbility | null = await waitForTopAbility(driver, delegator, 15000);
      hilog.info(DOMAIN, TAG, 'top ability exists: %{public}s', String(topAbility !== null));
      expect(topAbility !== null).assertTrue();
      const topName: string = topAbility!.context.abilityInfo.name;
      hilog.info(DOMAIN, TAG, 'top ability name: %{public}s', topName);
      expect(topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0001 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0200
     * @tc.name testAudio01Chapter0002
     * @tc.desc Verify testAudio01Chapter0002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0002 start');
      let ready: boolean = false;
      for (let i = 0; i < 3 && !ready; i++) {
        ready = await ensureHomeReady(driver);
        if (!ready) {
          await driver.delayMs(800);
        }
      }
      expect(ready).assertTrue();
      const homeCard: Component | null = await driver.waitForComponent(ON.id('select_output_device_card'), 8000);
      hilog.info(DOMAIN, TAG, 'home card exists: %{public}s', String(homeCard !== null));
      expect(homeCard !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0002 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0300
     * @tc.name testAudio01Chapter0003
     * @tc.desc Verify testAudio01Chapter0003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0003 start');
      await driver.delayMs(1000);
      const selectCard: Component | null = await driver.waitForComponent(ON.id('select_output_device_card'), 8000);
      hilog.info(DOMAIN, TAG, 'select_output_device_card exists: %{public}s', String(selectCard !== null));
      expect(selectCard !== null).assertTrue();
      const focusCard: Component | null = await driver.findComponent(ON.id('audio_focus_card'));
      hilog.info(DOMAIN, TAG, 'audio_focus_card exists: %{public}s', String(focusCard !== null));
      expect(focusCard !== null).assertTrue();
      await selectCard!.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0003 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0400
     * @tc.name testAudio01Chapter0004
     * @tc.desc Verify testAudio01Chapter0004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0004 start');
      await driver.delayMs(1000);
      const backBtn: Component | null = await driver.waitForComponent(ON.id('back_btn'), 8000);
      hilog.info(DOMAIN, TAG, 'back_btn exists: %{public}s', String(backBtn !== null));
      expect(backBtn !== null).assertTrue();
      const deviceName: Component | null = await driver.findComponent(ON.id('device_name_text'));
      hilog.info(DOMAIN, TAG, 'device_name_text exists: %{public}s', String(deviceName !== null));
      expect(deviceName !== null).assertTrue();
      const deviceNameText: string = await deviceName!.getText();
      hilog.info(DOMAIN, TAG, 'device name: %{public}s', deviceNameText);
      expect(deviceNameText !== 'Invalid').assertTrue();
      await driver.delayMs(1000);
      await driver.pressBack();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0004 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0500
     * @tc.name testAudio01Chapter0005
     * @tc.desc Verify testAudio01Chapter0005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0005 start');
      await driver.delayMs(1000);
      const selectCard: Component | null = await driver.waitForComponent(ON.id('select_output_device_card'), 8000);
      hilog.info(DOMAIN, TAG, 'select_output_device_card exists: %{public}s', String(selectCard !== null));
      expect(selectCard !== null).assertTrue();
      const focusCard: Component | null = await driver.findComponent(ON.id('audio_focus_card'));
      hilog.info(DOMAIN, TAG, 'audio_focus_card exists: %{public}s', String(focusCard !== null));
      expect(focusCard !== null).assertTrue();
      await focusCard!.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0005 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0600
     * @tc.name testAudio01Chapter0006
     * @tc.desc Verify testAudio01Chapter0006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0006 start');
      await driver.delayMs(1000);
      const backBtn: Component | null = await driver.waitForComponent(ON.id('back_btn_focus'), 8000);
      hilog.info(DOMAIN, TAG, 'back_btn_focus exists: %{public}s', String(backBtn !== null));
      expect(backBtn !== null).assertTrue();
      const musicItem: Component | null = await driver.findComponent(ON.id('music_player_item'));
      hilog.info(DOMAIN, TAG, 'music_player_item exists: %{public}s', String(musicItem !== null));
      expect(musicItem !== null).assertTrue();
      const ringtoneItem: Component | null = await driver.findComponent(ON.id('ringtone_player_item'));
      hilog.info(DOMAIN, TAG, 'ringtone_player_item exists: %{public}s', String(ringtoneItem !== null));
      expect(ringtoneItem !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0006 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0700
     * @tc.name testAudio01Chapter0007
     * @tc.desc Verify testAudio01Chapter0007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0007 start');
      await driver.delayMs(1000);
      const musicState: Component | null = await driver.waitForComponent(ON.id('music_state_text'), 8000);
      hilog.info(DOMAIN, TAG, 'music_state_text exists: %{public}s', String(musicState !== null));
      expect(musicState !== null).assertTrue();
      const musicStateText: string = await musicState!.getText();
      hilog.info(DOMAIN, TAG, 'music state before click: %{public}s', musicStateText);
      expect(musicStateText).assertEqual('ic_pause');
      const ringtoneState: Component | null = await driver.findComponent(ON.id('ringtone_state_text'));
      hilog.info(DOMAIN, TAG, 'ringtone_state_text exists: %{public}s', String(ringtoneState !== null));
      expect(ringtoneState !== null).assertTrue();
      const ringtoneStateText: string = await ringtoneState!.getText();
      hilog.info(DOMAIN, TAG, 'ringtone state before click: %{public}s', ringtoneStateText);
      expect(ringtoneStateText).assertEqual('ic_pause_no');
      const musicItem: Component | null = await driver.findComponent(ON.id('music_player_item'));
      await musicItem!.click();
      await driver.delayMs(500);
      const musicStateAfter: string = await musicState!.getText();
      hilog.info(DOMAIN, TAG, 'music state after click: %{public}s', musicStateAfter);
      expect(musicStateAfter).assertEqual('ic_play_no');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0007 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0800
     * @tc.name testAudio01Chapter0008
     * @tc.desc Verify testAudio01Chapter0008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0008 start');
      await driver.delayMs(1000);
      const ringtoneState: Component | null = await driver.waitForComponent(ON.id('ringtone_state_text'), 8000);
      hilog.info(DOMAIN, TAG, 'ringtone_state_text exists: %{public}s', String(ringtoneState !== null));
      expect(ringtoneState !== null).assertTrue();
      const ringtoneBefore: string = await ringtoneState!.getText();
      hilog.info(DOMAIN, TAG, 'ringtone state before click: %{public}s', ringtoneBefore);
      expect(ringtoneBefore).assertEqual('ic_pause');
      const ringtoneItem: Component | null = await driver.findComponent(ON.id('ringtone_player_item'));
      await ringtoneItem!.click();
      await driver.delayMs(500);
      const ringtoneAfter: string = await ringtoneState!.getText();
      hilog.info(DOMAIN, TAG, 'ringtone state after click: %{public}s', ringtoneAfter);
      expect(ringtoneAfter).assertEqual('ic_play');
      await driver.delayMs(500);
      const musicState: Component | null = await driver.findComponent(ON.id('music_state_text'));
      const musicAfter: string = await musicState!.getText();
      hilog.info(DOMAIN, TAG, 'music state after ringtone click: %{public}s', musicAfter);
      expect(musicAfter).assertEqual('ic_pause_no');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0008 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_0900
     * @tc.name testAudio01Chapter0009
     * @tc.desc Verify testAudio01Chapter0009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0009 start');
      await driver.delayMs(1000);
      const ringtoneState: Component | null = await driver.waitForComponent(ON.id('ringtone_state_text'), 8000);
      const ringtoneBefore: string = await ringtoneState!.getText();
      hilog.info(DOMAIN, TAG, 'ringtone state before click: %{public}s', ringtoneBefore);
      expect(ringtoneBefore).assertEqual('ic_play');
      const ringtoneImg: Component | null = await driver.findComponent(ON.id('ringtone_state_img'));
      await ringtoneImg!.click();
      await driver.delayMs(500);
      const ringtoneAfter: string = await ringtoneState!.getText();
      hilog.info(DOMAIN, TAG, 'ringtone state after click: %{public}s', ringtoneAfter);
      expect(ringtoneAfter).assertEqual('ic_pause_no');
      await driver.delayMs(500);
      const musicState: Component | null = await driver.findComponent(ON.id('music_state_text'));
      const musicAfter: string = await musicState!.getText();
      hilog.info(DOMAIN, TAG, 'music state after click: %{public}s', musicAfter);
      expect(musicAfter).assertEqual('ic_play_no');
      await driver.delayMs(500);
      const backBtn: Component | null = await driver.findComponent(ON.id('back_btn_focus'));
      await driver.pressBack();
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0009 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1000
     * @tc.name testAudio01Chapter0010
     * @tc.desc Verify testAudio01Chapter0010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0010 start');
      await driver.delayMs(500);
      const effectCard: Component | null = await driver.waitForComponent(ON.id('audio_effect_manager_card'), 8000);
      hilog.info(DOMAIN, TAG, 'audio_effect_manager_card exists: %{public}s', String(effectCard !== null));
      expect(effectCard !== null).assertTrue();
      await effectCard!.click();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0010 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1100
     * @tc.name testAudio01Chapter0011
     * @tc.desc Verify testAudio01Chapter0011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0011 start');
      await driver.delayMs(1000);
      const backBtn: Component | null = await driver.waitForComponent(ON.id('back_btn_preset'), 8000);
      hilog.info(DOMAIN, TAG, 'back_btn_preset exists: %{public}s', String(backBtn !== null));
      expect(backBtn !== null).assertTrue();
      const selectContent: Component | null = await driver.findComponent(ON.id('select_content_preset'));
      hilog.info(DOMAIN, TAG, 'select_content_preset exists: %{public}s', String(selectContent !== null));
      expect(selectContent !== null).assertTrue();
      const selectUsage: Component | null = await driver.findComponent(ON.id('select_usage_preset'));
      hilog.info(DOMAIN, TAG, 'select_usage_preset exists: %{public}s', String(selectUsage !== null));
      expect(selectUsage !== null).assertTrue();
      const queryBtn: Component | null = await driver.findComponent(ON.id('query_btn_preset'));
      hilog.info(DOMAIN, TAG, 'query_btn_preset exists: %{public}s', String(queryBtn !== null));
      expect(queryBtn !== null).assertTrue();
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_preset'));
      hilog.info(DOMAIN, TAG, 'query_result_preset exists: %{public}s', String(queryResult !== null));
      expect(queryResult !== null).assertTrue();
      const switchBtn: Component | null = await driver.findComponent(ON.id('switch_btn_preset'));
      hilog.info(DOMAIN, TAG, 'switch_btn_preset exists: %{public}s', String(switchBtn !== null));
      expect(switchBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0011 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1200
     * @tc.name testAudio01Chapter0012
     * @tc.desc Verify testAudio01Chapter0012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0012 start');
      await driver.delayMs(1000);
      const selectContent: Component | null = await driver.waitForComponent(ON.id('select_content_preset'), 8000);
      hilog.info(DOMAIN, TAG, 'select_content_preset exists: %{public}s', String(selectContent !== null));
      expect(selectContent !== null).assertTrue();
      await selectContent!.click();
      await driver.delayMs(500);
      await driver.click(180, 400);
      await driver.delayMs(500);
      const selectUsage: Component | null = await driver.findComponent(ON.id('select_usage_preset'));
      await selectUsage!.click();
      await driver.delayMs(500);
      await driver.click(500, 500);
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0012 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1300
     * @tc.name testAudio01Chapter0013
     * @tc.desc Verify testAudio01Chapter0013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0013 start');
      await driver.delayMs(1000);
      const queryBtn: Component | null = await driver.waitForComponent(ON.id('query_btn_preset'), 8000);
      await queryBtn!.click();
      await driver.delayMs(500);
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_preset'));
      const queryResultText: string = await queryResult!.getText();
      hilog.info(DOMAIN, TAG, 'query result text: %{public}s', queryResultText);
      expect(queryResultText !== '--').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0013 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1400
     * @tc.name testAudio01Chapter0014
     * @tc.desc Verify testAudio01Chapter0014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0014 start');
      await driver.delayMs(1000);
      const selectUsage: Component | null = await driver.waitForComponent(ON.id('select_usage_preset'), 8000);
      await selectUsage!.click();
      await driver.delayMs(500);
      await driver.click(500, 300);
      await driver.delayMs(500);
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_preset'));
      const queryResultText: string = await queryResult!.getText();
      hilog.info(DOMAIN, TAG, 'query result text after usage change: %{public}s', queryResultText);
      expect(queryResultText).assertEqual('--');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0014 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1500
     * @tc.name testAudio01Chapter0015
     * @tc.desc Verify testAudio01Chapter0015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0015 start');
      await driver.delayMs(1000);
      const queryBtn: Component | null = await driver.waitForComponent(ON.id('query_btn_preset'), 8000);
      await queryBtn!.click();
      await driver.delayMs(500);
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_preset'));
      const queryResultText: string = await queryResult!.getText();
      hilog.info(DOMAIN, TAG, 'query result text: %{public}s', queryResultText);
      expect(queryResultText !== '--').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0015 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1600
     * @tc.name testAudio01Chapter0016
     * @tc.desc Verify testAudio01Chapter0016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0016 start');
      await driver.delayMs(500);
      const switchBtn: Component | null = await driver.waitForComponent(ON.id('switch_btn_preset'), 8000);
      hilog.info(DOMAIN, TAG, 'switch_btn_preset exists: %{public}s', String(switchBtn !== null));
      expect(switchBtn !== null).assertTrue();
      await switchBtn!.click();
      await driver.delayMs(500);
      const backBtn: Component | null = await driver.waitForComponent(ON.id('back_btn_realtime'), 8000);
      hilog.info(DOMAIN, TAG, 'back_btn_realtime exists: %{public}s', String(backBtn !== null));
      expect(backBtn !== null).assertTrue();
      const selectContent: Component | null = await driver.findComponent(ON.id('select_content_realtime'));
      hilog.info(DOMAIN, TAG, 'select_content_realtime exists: %{public}s', String(selectContent !== null));
      expect(selectContent !== null).assertTrue();
      const selectUsage: Component | null = await driver.findComponent(ON.id('select_usage_realtime'));
      hilog.info(DOMAIN, TAG, 'select_usage_realtime exists: %{public}s', String(selectUsage !== null));
      expect(selectUsage !== null).assertTrue();
      const playPause: Component | null = await driver.findComponent(ON.id('play_pause_realtime'));
      hilog.info(DOMAIN, TAG, 'play_pause_realtime exists: %{public}s', String(playPause !== null));
      expect(playPause !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0016 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1700
     * @tc.name testAudio01Chapter0017
     * @tc.desc Verify testAudio01Chapter0017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0017 start');
      await driver.delayMs(500);
      const queryBtn: Component | null = await driver.waitForComponent(ON.id('query_btn_realtime'), 8000);
      hilog.info(DOMAIN, TAG, 'query_btn_realtime exists: %{public}s', String(queryBtn !== null));
      expect(queryBtn !== null).assertTrue();
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_realtime'));
      hilog.info(DOMAIN, TAG, 'query_result_realtime exists: %{public}s', String(queryResult !== null));
      expect(queryResult !== null).assertTrue();
      const selectMode: Component | null = await driver.findComponent(ON.id('select_mode_realtime'));
      hilog.info(DOMAIN, TAG, 'select_mode_realtime exists: %{public}s', String(selectMode !== null));
      expect(selectMode !== null).assertTrue();
      const switchBtn: Component | null = await driver.findComponent(ON.id('switch_btn_realtime'));
      hilog.info(DOMAIN, TAG, 'switch_btn_realtime exists: %{public}s', String(switchBtn !== null));
      expect(switchBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0017 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1800
     * @tc.name testAudio01Chapter0018
     * @tc.desc Verify testAudio01Chapter0018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0018 start');
      const selectContent: Component | null = await driver.waitForComponent(ON.id('select_content_realtime'), 8000);
      hilog.info(DOMAIN, TAG, 'select_content_realtime exists: %{public}s', String(selectContent !== null));
      expect(selectContent !== null).assertTrue();
      const selectUsage: Component | null = await driver.findComponent(ON.id('select_usage_realtime'));
      await selectContent!.click();
      await driver.delayMs(500);
      await driver.click(180, 400);
      await driver.delayMs(500);
      await selectUsage!.click();
      await driver.delayMs(500);
      await driver.click(500, 500);
      await driver.delayMs(500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0018 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_1900
     * @tc.name testAudio01Chapter0019
     * @tc.desc Verify testAudio01Chapter0019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0019 start');
      const selectContent: Component | null = await driver.waitForComponent(ON.id('select_content_realtime'), 8000);
      const selectUsage: Component | null = await driver.findComponent(ON.id('select_usage_realtime'));
      const playPause: Component | null = await driver.findComponent(ON.id('play_pause_realtime'));
      await playPause!.click();
      const playState: Component | null = await driver.findComponent(ON.id('audio_play_state'));
      const playStateText: string = await playState!.getText();
      hilog.info(DOMAIN, TAG, 'audio play state: %{public}s', playStateText);
      expect(playStateText).assertEqual('onPlaying');
      const contentEnabled: boolean = await selectContent!.isEnabled();
      hilog.info(DOMAIN, TAG, 'select content enabled: %{public}s', String(contentEnabled));
      expect(contentEnabled).assertFalse();
      const usageEnabled: boolean = await selectUsage!.isEnabled();
      hilog.info(DOMAIN, TAG, 'select usage enabled: %{public}s', String(usageEnabled));
      expect(usageEnabled).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0019 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_2000
     * @tc.name testAudio01Chapter0020
     * @tc.desc Verify testAudio01Chapter0020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0020 start');
      await driver.delayMs(500);
      const queryBtn: Component | null = await driver.waitForComponent(ON.id('query_btn_realtime'), 8000);
      await queryBtn!.click();
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_realtime'));
      const queryResultText: string = await queryResult!.getText();
      hilog.info(DOMAIN, TAG, 'query result text: %{public}s', queryResultText);
      expect(queryResultText !== '--').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0020 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_2100
     * @tc.name testAudio01Chapter0021
     * @tc.desc Verify testAudio01Chapter0021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0021 start');
      await driver.delayMs(500);
      const playPause: Component | null = await driver.waitForComponent(ON.id('play_pause_realtime'), 8000);
      await playPause!.click();
      const playState: Component | null = await driver.findComponent(ON.id('audio_play_state'));
      const playStateText: string = await playState!.getText();
      hilog.info(DOMAIN, TAG, 'audio play state: %{public}s', playStateText);
      expect(playStateText).assertEqual('notPlaying');
      const selectContent: Component | null = await driver.findComponent(ON.id('select_content_realtime'));
      const contentEnabled: boolean = await selectContent!.isEnabled();
      hilog.info(DOMAIN, TAG, 'select content enabled: %{public}s', String(contentEnabled));
      expect(contentEnabled).assertTrue();
      const selectUsage: Component | null = await driver.findComponent(ON.id('select_usage_realtime'));
      const usageEnabled: boolean = await selectUsage!.isEnabled();
      hilog.info(DOMAIN, TAG, 'select usage enabled: %{public}s', String(usageEnabled));
      expect(usageEnabled).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0021 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_2200
     * @tc.name testAudio01Chapter0022
     * @tc.desc Verify testAudio01Chapter0022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0022 start');
      const selectContent: Component | null = await driver.waitForComponent(ON.id('select_content_realtime'), 8000);
      await selectContent!.click();
      await driver.delayMs(500);
      await driver.click(180, 500);
      await driver.delayMs(500);
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_realtime'));
      const queryResultText: string = await queryResult!.getText();
      hilog.info(DOMAIN, TAG, 'query result text after content change: %{public}s', queryResultText);
      expect(queryResultText).assertEqual('--');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0022 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_2300
     * @tc.name testAudio01Chapter0023
     * @tc.desc Verify testAudio01Chapter0023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0023 start');
      const playPause: Component | null = await driver.waitForComponent(ON.id('play_pause_realtime'), 8000);
      await playPause!.click();
      const playState: Component | null = await driver.findComponent(ON.id('audio_play_state'));
      const playStateText: string = await playState!.getText();
      hilog.info(DOMAIN, TAG, 'audio play state: %{public}s', playStateText);
      expect(playStateText).assertEqual('onPlaying');
      const queryBtn: Component | null = await driver.findComponent(ON.id('query_btn_realtime'));
      await queryBtn!.click();
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_realtime'));
      const queryResultText: string = await queryResult!.getText();
      hilog.info(DOMAIN, TAG, 'query result text: %{public}s', queryResultText);
      expect(queryResultText !== '--').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0023 end');
      done();
    });

    /**
     * @tc.number SUB_AUDIOTEST01_TEST_2400
     * @tc.name testAudio01Chapter0024
     * @tc.desc Verify testAudio01Chapter0024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAudio01Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0024 start');
      const selectMode: Component | null = await driver.waitForComponent(ON.id('select_mode_realtime'), 8000);
      await selectMode!.click();
      await driver.delayMs(500);
      await driver.click(600, 500);
      const queryBtn: Component | null = await driver.findComponent(ON.id('query_btn_realtime'));
      await queryBtn!.click();
      const queryResult: Component | null = await driver.findComponent(ON.id('query_result_realtime'));
      const selectModeName: Component | null = await driver.findComponent(ON.id('select_mode_name_realtime'));
      const selectModeText: string = await selectModeName!.getText();
      hilog.info(DOMAIN, TAG, 'select mode text: %{public}s', selectModeText);
      const queryResultText: string = await queryResult!.getText();
      hilog.info(DOMAIN, TAG, 'query result text: %{public}s', queryResultText);
      expect(queryResultText === selectModeText).assertTrue();
      await driver.click(100, 100);
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudio01Chapter0024 end');
      done();
    });
  });
}
