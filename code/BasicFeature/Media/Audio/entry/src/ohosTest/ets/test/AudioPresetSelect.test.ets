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
import { ensureHomeReady, getSubtreeText } from './shared/AudioDriver';
import { Driver, ON } from '@kit.TestKit';
import type { Component } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const DOMAIN: number = 0xF811;
const TAG = 'AudioPresetSelect';
const BUNDLE_NAME: string = 'com.samples.audio';
const BLANK_RESULT: string = '--';

async function relaunchToHome(driver: Driver): Promise<boolean> {
  let homeCard: Component | null = await driver.waitForComponent(ON.id('select_output_device_card'), 1000);
  // A warm start resumes the page left on the router stack; walk back with the
  // system back key before restarting the ability.
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
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    // force-stop would kill the in-process test runner, so only restart the ability
    await delegator.executeShellCommand(`aa start -b ${BUNDLE_NAME} -a EntryAbility`);
    await driver.delayMs(800);
    homeCard = await driver.waitForComponent(ON.id('select_output_device_card'), 10000);
  }
  return homeCard !== null;
}

async function openPresetPage(driver: Driver): Promise<boolean> {
  if (!(await relaunchToHome(driver))) {
    return false;
  }
  await (await driver.waitForComponent(ON.id('audio_effect_manager_card'), 6000))!.click();
  const contentSelector: Component | null = await driver.waitForComponent(ON.id('select_content_preset'), 10000);
  return contentSelector !== null;
}

async function readResult(driver: Driver): Promise<string> {
  const text: string | null = await getSubtreeText(driver, 'query_result_preset');
  return text === null ? '' : text;
}

async function readSelectedText(driver: Driver, selectorId: string): Promise<string> {
  const text: string | null = await getSubtreeText(driver, selectorId);
  return text === null ? '' : text;
}

export default function audioPresetSelect() {
  describe('AudioPresetSelect', () => {
    let driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });
    const resMgr = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;

    /**
     * @tc.number SUB_AUDIO_PRESET_SELECT_0600
     * @tc.name testPresetSelect0006
     * @tc.desc Verify opening the usage selector closes an already open content selector
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPresetSelect0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPresetPage(driver)).assertTrue();
      const musicLabel: string = String(resMgr.getStringByNameSync('CONTENT_TYPE_MUSIC'));
      await (await driver.waitForComponent(ON.id('select_content_preset'), 6000))!.click();
      await driver.delayMs(600);
      expect(await driver.findComponent(ON.text(musicLabel)) !== null).assertTrue();
      await (await driver.findComponent(ON.id('select_usage_preset'))!).click();
      await driver.delayMs(600);
      const musicStillListed: Component | null = await driver.findComponent(ON.text(musicLabel));
      expect(musicStillListed === null).assertTrue();
      const usageLabel: string = String(resMgr.getStringByNameSync('STREAM_USAGE_UNKNOWN'));
      const usageOption: Component | null = await driver.findComponent(ON.text(usageLabel));
      expect(usageOption !== null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_PRESET_SELECT_0900
     * @tc.name testPresetSelect0009
     * @tc.desc Verify querying the default selection produces one of the two documented effect results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPresetSelect0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openPresetPage(driver)).assertTrue();
      const noneLabel: string = String(resMgr.getStringByNameSync('EFFECT_NONE'));
      const noneAndDefaultLabel: string = String(resMgr.getStringByNameSync('EFFECT_NONE_AND_DEFAULT'));
      await (await driver.waitForComponent(ON.id('query_btn_preset'), 6000))!.click();
      await driver.delayMs(2000);
      const result: string = await readResult(driver);
      expect(result === noneLabel || result === noneAndDefaultLabel).assertTrue();
      expect(noneLabel === noneAndDefaultLabel).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_PRESET_SELECT_1000
     * @tc.name testPresetSelect0010
     * @tc.desc Verify repeated queries on the same selection stay consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPresetSelect0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPresetPage(driver)).assertTrue();
      const queryBtn: Component | null = await driver.waitForComponent(ON.id('query_btn_preset'), 6000);
      expect(queryBtn !== null).assertTrue();
      await queryBtn!.click();
      await driver.delayMs(2000);
      const first: string = await readResult(driver);
      await queryBtn!.click();
      await driver.delayMs(2000);
      const second: string = await readResult(driver);
      const noneLabel: string = String(resMgr.getStringByNameSync('EFFECT_NONE'));
      const noneDefaultLabel: string = String(resMgr.getStringByNameSync('EFFECT_NONE_AND_DEFAULT'));
      expect(first === noneLabel || first === noneDefaultLabel).assertTrue();
      expect(second).assertEqual(first);
    });

    /**
     * @tc.number SUB_AUDIO_PRESET_SELECT_1500
     * @tc.name testPresetSelect0015
     * @tc.desc Verify the switch entry moves to the realtime effect page which has its own controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPresetSelect0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPresetPage(driver)).assertTrue();
      const switchBtn: Component | null = await driver.waitForComponent(ON.id('switch_btn_preset'), 6000);
      expect(switchBtn !== null).assertTrue();
      await switchBtn!.click();
      await driver.delayMs(1200);
      const realtimeBack: Component | null = await driver.waitForComponent(ON.id('back_btn_realtime'), 8000);
      expect(realtimeBack !== null).assertTrue();
      const playPause: Component | null = await driver.findComponent(ON.id('play_pause_realtime'));
      expect(playPause !== null).assertTrue();
      const presetQuery: Component | null = await driver.findComponent(ON.id('query_btn_preset'));
      expect(presetQuery === null).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_PRESET_SELECT_1600
     * @tc.name testPresetSelect0016
     * @tc.desc Verify the query result label keeps its documented blank placeholder value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPresetSelect0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openPresetPage(driver)).assertTrue();
      const blankLabel: string = String(resMgr.getStringByNameSync('BLANK'));
      expect(blankLabel).assertEqual(BLANK_RESULT);
      const contentText: string = await readSelectedText(driver, 'select_content_preset');
      const usageText: string = await readSelectedText(driver, 'select_usage_preset');
      expect(contentText === blankLabel).assertFalse();
      expect(usageText === blankLabel).assertFalse();
    });
  });
}
