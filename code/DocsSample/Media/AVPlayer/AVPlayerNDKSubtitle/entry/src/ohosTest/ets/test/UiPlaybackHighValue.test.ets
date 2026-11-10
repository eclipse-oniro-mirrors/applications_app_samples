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
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const driver: Driver = Driver.create();
const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const bundleName = AbilityDelegatorRegistry.getArguments().bundleName;


export default function uiPlaybackHighValueTest() {
  describe('uiPlaybackHighValueTest', () => {
  beforeAll(async () => {
    await abilityDelegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
    await driver.delayMs(2000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0001
     * @tc.name      testHighValueUi0001
     * @tc.desc      UI component VideoView is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0001', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('VideoView'));
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0002
     * @tc.name      testHighValueUi0002
     * @tc.desc      UI component Slider is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0002', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0003
     * @tc.name      testHighValueUi0003
     * @tc.desc      UI component Speed is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0003', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Speed'));
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0004
     * @tc.name      testHighValueUi0004
     * @tc.desc      UI component currentTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0004', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('currentTimeText'));
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0005
     * @tc.name      testHighValueUi0005
     * @tc.desc      UI component durationTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0005', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('durationTimeText'));
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0006
     * @tc.name      testHighValueUi0006
     * @tc.desc      UI component VideoView exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0006', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0007
     * @tc.name      testHighValueUi0007
     * @tc.desc      UI component Slider exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0007', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0008
     * @tc.name      testHighValueUi0008
     * @tc.desc      UI component Speed exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0008', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0009
     * @tc.name      testHighValueUi0009
     * @tc.desc      UI component currentTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0009', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0010
     * @tc.name      testHighValueUi0010
     * @tc.desc      UI component durationTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0010', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0011
     * @tc.name      testHighValueUi0011
     * @tc.desc      UI component VideoView accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0011', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0012
     * @tc.name      testHighValueUi0012
     * @tc.desc      UI component Slider accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0012', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0013
     * @tc.name      testHighValueUi0013
     * @tc.desc      UI component Speed accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0013', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0014
     * @tc.name      testHighValueUi0014
     * @tc.desc      UI component currentTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0014', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0015
     * @tc.name      testHighValueUi0015
     * @tc.desc      UI component durationTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0015', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0016
     * @tc.name      testHighValueUi0016
     * @tc.desc      UI playback controls pause and Slider are available for case 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0016', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0017
     * @tc.name      testHighValueUi0017
     * @tc.desc      UI playback controls pause and Slider are available for case 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0017', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0018
     * @tc.name      testHighValueUi0018
     * @tc.desc      UI playback controls pause and Slider are available for case 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0018', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0019
     * @tc.name      testHighValueUi0019
     * @tc.desc      UI playback controls pause and Slider are available for case 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0019', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0020
     * @tc.name      testHighValueUi0020
     * @tc.desc      UI playback controls pause and Slider are available for case 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0020', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0021
     * @tc.name      testHighValueUi0021
     * @tc.desc      UI component VideoView is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0021', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('VideoView'));
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0022
     * @tc.name      testHighValueUi0022
     * @tc.desc      UI component Slider is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0022', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0023
     * @tc.name      testHighValueUi0023
     * @tc.desc      UI component Speed is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0023', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Speed'));
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0024
     * @tc.name      testHighValueUi0024
     * @tc.desc      UI component currentTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0024', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('currentTimeText'));
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0025
     * @tc.name      testHighValueUi0025
     * @tc.desc      UI component durationTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0025', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('durationTimeText'));
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0026
     * @tc.name      testHighValueUi0026
     * @tc.desc      UI component VideoView exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0026', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0027
     * @tc.name      testHighValueUi0027
     * @tc.desc      UI component Slider exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0027', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0028
     * @tc.name      testHighValueUi0028
     * @tc.desc      UI component Speed exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0028', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0029
     * @tc.name      testHighValueUi0029
     * @tc.desc      UI component currentTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0029', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0030
     * @tc.name      testHighValueUi0030
     * @tc.desc      UI component durationTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0030', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0031
     * @tc.name      testHighValueUi0031
     * @tc.desc      UI component VideoView accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0031', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0032
     * @tc.name      testHighValueUi0032
     * @tc.desc      UI component Slider accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0032', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0033
     * @tc.name      testHighValueUi0033
     * @tc.desc      UI component Speed accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0033', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0034
     * @tc.name      testHighValueUi0034
     * @tc.desc      UI component currentTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0034', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0035
     * @tc.name      testHighValueUi0035
     * @tc.desc      UI component durationTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0035', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0036
     * @tc.name      testHighValueUi0036
     * @tc.desc      UI playback controls pause and Slider are available for case 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0036', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0037
     * @tc.name      testHighValueUi0037
     * @tc.desc      UI playback controls pause and Slider are available for case 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0037', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0038
     * @tc.name      testHighValueUi0038
     * @tc.desc      UI playback controls pause and Slider are available for case 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0038', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0039
     * @tc.name      testHighValueUi0039
     * @tc.desc      UI playback controls pause and Slider are available for case 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0039', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0040
     * @tc.name      testHighValueUi0040
     * @tc.desc      UI playback controls pause and Slider are available for case 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0040', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0041
     * @tc.name      testHighValueUi0041
     * @tc.desc      UI component VideoView is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0041', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('VideoView'));
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0042
     * @tc.name      testHighValueUi0042
     * @tc.desc      UI component Slider is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0042', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0043
     * @tc.name      testHighValueUi0043
     * @tc.desc      UI component Speed is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0043', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Speed'));
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0044
     * @tc.name      testHighValueUi0044
     * @tc.desc      UI component currentTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0044', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('currentTimeText'));
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0045
     * @tc.name      testHighValueUi0045
     * @tc.desc      UI component durationTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0045', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('durationTimeText'));
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0046
     * @tc.name      testHighValueUi0046
     * @tc.desc      UI component VideoView exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0046', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0047
     * @tc.name      testHighValueUi0047
     * @tc.desc      UI component Slider exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0047', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0048
     * @tc.name      testHighValueUi0048
     * @tc.desc      UI component Speed exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0048', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0049
     * @tc.name      testHighValueUi0049
     * @tc.desc      UI component currentTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0049', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0050
     * @tc.name      testHighValueUi0050
     * @tc.desc      UI component durationTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0050', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0051
     * @tc.name      testHighValueUi0051
     * @tc.desc      UI component VideoView accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0051', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0052
     * @tc.name      testHighValueUi0052
     * @tc.desc      UI component Slider accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0052', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0053
     * @tc.name      testHighValueUi0053
     * @tc.desc      UI component Speed accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0053', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0054
     * @tc.name      testHighValueUi0054
     * @tc.desc      UI component currentTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0054', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0055
     * @tc.name      testHighValueUi0055
     * @tc.desc      UI component durationTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0055', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0056
     * @tc.name      testHighValueUi0056
     * @tc.desc      UI playback controls pause and Slider are available for case 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0056', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0057
     * @tc.name      testHighValueUi0057
     * @tc.desc      UI playback controls pause and Slider are available for case 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0057', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0058
     * @tc.name      testHighValueUi0058
     * @tc.desc      UI playback controls pause and Slider are available for case 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0058', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0059
     * @tc.name      testHighValueUi0059
     * @tc.desc      UI playback controls pause and Slider are available for case 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0059', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0060
     * @tc.name      testHighValueUi0060
     * @tc.desc      UI playback controls pause and Slider are available for case 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0060', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0061
     * @tc.name      testHighValueUi0061
     * @tc.desc      UI component VideoView is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0061', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('VideoView'));
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0062
     * @tc.name      testHighValueUi0062
     * @tc.desc      UI component Slider is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0062', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0063
     * @tc.name      testHighValueUi0063
     * @tc.desc      UI component Speed is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0063', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Speed'));
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0064
     * @tc.name      testHighValueUi0064
     * @tc.desc      UI component currentTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0064', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('currentTimeText'));
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0065
     * @tc.name      testHighValueUi0065
     * @tc.desc      UI component durationTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0065', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('durationTimeText'));
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0066
     * @tc.name      testHighValueUi0066
     * @tc.desc      UI component VideoView exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0066', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0067
     * @tc.name      testHighValueUi0067
     * @tc.desc      UI component Slider exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0067', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0068
     * @tc.name      testHighValueUi0068
     * @tc.desc      UI component Speed exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0068', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0069
     * @tc.name      testHighValueUi0069
     * @tc.desc      UI component currentTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0069', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0070
     * @tc.name      testHighValueUi0070
     * @tc.desc      UI component durationTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0070', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0071
     * @tc.name      testHighValueUi0071
     * @tc.desc      UI component VideoView accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0071', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0072
     * @tc.name      testHighValueUi0072
     * @tc.desc      UI component Slider accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0072', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0073
     * @tc.name      testHighValueUi0073
     * @tc.desc      UI component Speed accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0073', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0074
     * @tc.name      testHighValueUi0074
     * @tc.desc      UI component currentTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0074', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0075
     * @tc.name      testHighValueUi0075
     * @tc.desc      UI component durationTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0075', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0076
     * @tc.name      testHighValueUi0076
     * @tc.desc      UI playback controls pause and Slider are available for case 76.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0076', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0077
     * @tc.name      testHighValueUi0077
     * @tc.desc      UI playback controls pause and Slider are available for case 77.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0077', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0078
     * @tc.name      testHighValueUi0078
     * @tc.desc      UI playback controls pause and Slider are available for case 78.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0078', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0079
     * @tc.name      testHighValueUi0079
     * @tc.desc      UI playback controls pause and Slider are available for case 79.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0079', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0080
     * @tc.name      testHighValueUi0080
     * @tc.desc      UI playback controls pause and Slider are available for case 80.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0080', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0081
     * @tc.name      testHighValueUi0081
     * @tc.desc      UI component VideoView is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0081', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('VideoView'));
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('VideoView');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0082
     * @tc.name      testHighValueUi0082
     * @tc.desc      UI component Slider is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0082', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Slider');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0083
     * @tc.name      testHighValueUi0083
     * @tc.desc      UI component Speed is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0083', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Speed'));
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('Speed');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0084
     * @tc.name      testHighValueUi0084
     * @tc.desc      UI component currentTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0084', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('currentTimeText'));
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('currentTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0085
     * @tc.name      testHighValueUi0085
     * @tc.desc      UI component durationTimeText is present and stable.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0085', 0, async () => {
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('durationTimeText'));
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      expect(await component.getId()).assertEqual('durationTimeText');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0086
     * @tc.name      testHighValueUi0086
     * @tc.desc      UI component VideoView exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0086', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0087
     * @tc.name      testHighValueUi0087
     * @tc.desc      UI component Slider exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0087', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0088
     * @tc.name      testHighValueUi0088
     * @tc.desc      UI component Speed exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0088', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0089
     * @tc.name      testHighValueUi0089
     * @tc.desc      UI component currentTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0089', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0090
     * @tc.name      testHighValueUi0090
     * @tc.desc      UI component durationTimeText exposes non-empty bounds.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0090', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      const bounds = await component.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0091
     * @tc.name      testHighValueUi0091
     * @tc.desc      UI component VideoView accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0091', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('VideoView'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0092
     * @tc.name      testHighValueUi0092
     * @tc.desc      UI component Slider accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0092', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Slider'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0093
     * @tc.name      testHighValueUi0093
     * @tc.desc      UI component Speed accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0093', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('Speed'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0094
     * @tc.name      testHighValueUi0094
     * @tc.desc      UI component currentTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0094', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0095
     * @tc.name      testHighValueUi0095
     * @tc.desc      UI component durationTimeText accepts a click without leaving the page.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0095', 0, async () => {
      await driver.delayMs(300);
      const component: Component = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== undefined && component !== null).assertTrue();
      await component.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0096
     * @tc.name      testHighValueUi0096
     * @tc.desc      UI playback controls pause and Slider are available for case 96.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0096', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0097
     * @tc.name      testHighValueUi0097
     * @tc.desc      UI playback controls pause and Slider are available for case 97.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0097', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0098
     * @tc.name      testHighValueUi0098
     * @tc.desc      UI playback controls pause and Slider are available for case 98.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0098', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0099
     * @tc.name      testHighValueUi0099
     * @tc.desc      UI playback controls pause and Slider are available for case 99.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0099', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_HV_UI_0100
     * @tc.name      testHighValueUi0100
     * @tc.desc      UI playback controls pause and Slider are available for case 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     Level 2
     */
    it('testHighValueUi0100', 0, async () => {
      await driver.delayMs(300);
      const play: Component = await driver.findComponent(ON.id('pause'));
      const slider: Component = await driver.findComponent(ON.id('Slider'));
      expect(play !== undefined && play !== null).assertTrue();
      expect(slider !== undefined && slider !== null).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
  })
}
