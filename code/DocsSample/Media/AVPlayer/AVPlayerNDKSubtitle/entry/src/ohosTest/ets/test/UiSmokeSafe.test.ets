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
import { Component, Driver, ON } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const driver: Driver = Driver.create();
const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const bundleName = AbilityDelegatorRegistry.getArguments().bundleName;


export default function uiSmokeSafeTest() {
  describe('uiSmokeSafeTest', () => {
  beforeAll(async () => {
    await abilityDelegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
    await driver.delayMs(2000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0001
     * @tc.name      testSafeUiSmoke0001
     * @tc.desc      UI smoke check 1 finds VideoView.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0001', 0, async () => {
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('VideoView'));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0002
     * @tc.name      testSafeUiSmoke0002
     * @tc.desc      UI smoke check 2 finds Slider.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0002', 0, async () => {
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0003
     * @tc.name      testSafeUiSmoke0003
     * @tc.desc      UI smoke check 3 finds Speed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0003', 0, async () => {
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0004
     * @tc.name      testSafeUiSmoke0004
     * @tc.desc      UI smoke check 4 finds currentTimeText.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0004', 0, async () => {
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0005
     * @tc.name      testSafeUiSmoke0005
     * @tc.desc      UI smoke check 5 finds durationTimeText.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0005', 0, async () => {
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0006
     * @tc.name      testSafeUiSmoke0006
     * @tc.desc      UI smoke check 6 finds pause.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0006', 0, async () => {
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('pause'));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0007
     * @tc.name      testSafeUiSmoke0007
     * @tc.desc      UI smoke check 7 finds VideoView.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0007', 0, async () => {
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('VideoView'));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_UI_0008
     * @tc.name      testSafeUiSmoke0008
     * @tc.desc      UI smoke check 8 finds Slider.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeUiSmoke0008', 0, async () => {
      await driver.delayMs(300);
      const component: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(component !== null && component !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
  })
}
