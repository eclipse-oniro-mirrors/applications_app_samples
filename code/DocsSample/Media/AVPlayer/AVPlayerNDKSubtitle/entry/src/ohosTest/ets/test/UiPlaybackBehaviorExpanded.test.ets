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
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';

const driver: Driver = Driver.create();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;



export default function uiPlaybackBehaviorExpandedTest() {
  describe('uiPlaybackBehaviorExpandedTest', () => {
  beforeAll(async () => {
    await abilityDelegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
    await driver.delayMs(2000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0001
     * @tc.name      testBehaviorUi0001
     * @tc.desc      Play/pause toggle 1 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0001', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0002
     * @tc.name      testBehaviorUi0002
     * @tc.desc      Speed button cycle 2 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0002', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0003
     * @tc.name      testBehaviorUi0003
     * @tc.desc      Slider drag 3 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0003', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0004
     * @tc.name      testBehaviorUi0004
     * @tc.desc      Video surface and slider 4 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0004', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0005
     * @tc.name      testBehaviorUi0005
     * @tc.desc      Time labels 5 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0005', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0006
     * @tc.name      testBehaviorUi0006
     * @tc.desc      Play/pause toggle 6 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0006', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0007
     * @tc.name      testBehaviorUi0007
     * @tc.desc      Speed button cycle 7 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0007', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0008
     * @tc.name      testBehaviorUi0008
     * @tc.desc      Slider drag 8 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0008', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0009
     * @tc.name      testBehaviorUi0009
     * @tc.desc      Video surface and slider 9 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0009', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0010
     * @tc.name      testBehaviorUi0010
     * @tc.desc      Time labels 10 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0010', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0011
     * @tc.name      testBehaviorUi0011
     * @tc.desc      Play/pause toggle 11 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0011', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0012
     * @tc.name      testBehaviorUi0012
     * @tc.desc      Speed button cycle 12 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0012', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0013
     * @tc.name      testBehaviorUi0013
     * @tc.desc      Slider drag 13 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0013', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0014
     * @tc.name      testBehaviorUi0014
     * @tc.desc      Video surface and slider 14 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0014', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0015
     * @tc.name      testBehaviorUi0015
     * @tc.desc      Time labels 15 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0015', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0016
     * @tc.name      testBehaviorUi0016
     * @tc.desc      Play/pause toggle 16 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0016', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0017
     * @tc.name      testBehaviorUi0017
     * @tc.desc      Speed button cycle 17 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0017', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0018
     * @tc.name      testBehaviorUi0018
     * @tc.desc      Slider drag 18 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0018', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0019
     * @tc.name      testBehaviorUi0019
     * @tc.desc      Video surface and slider 19 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0019', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0020
     * @tc.name      testBehaviorUi0020
     * @tc.desc      Time labels 20 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0020', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0021
     * @tc.name      testBehaviorUi0021
     * @tc.desc      Play/pause toggle 21 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0021', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0022
     * @tc.name      testBehaviorUi0022
     * @tc.desc      Speed button cycle 22 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0022', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0023
     * @tc.name      testBehaviorUi0023
     * @tc.desc      Slider drag 23 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0023', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0024
     * @tc.name      testBehaviorUi0024
     * @tc.desc      Video surface and slider 24 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0024', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0025
     * @tc.name      testBehaviorUi0025
     * @tc.desc      Time labels 25 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0025', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0026
     * @tc.name      testBehaviorUi0026
     * @tc.desc      Play/pause toggle 26 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0026', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0027
     * @tc.name      testBehaviorUi0027
     * @tc.desc      Speed button cycle 27 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0027', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0028
     * @tc.name      testBehaviorUi0028
     * @tc.desc      Slider drag 28 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0028', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0029
     * @tc.name      testBehaviorUi0029
     * @tc.desc      Video surface and slider 29 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0029', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0030
     * @tc.name      testBehaviorUi0030
     * @tc.desc      Time labels 30 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0030', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0031
     * @tc.name      testBehaviorUi0031
     * @tc.desc      Play/pause toggle 31 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0031', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0032
     * @tc.name      testBehaviorUi0032
     * @tc.desc      Speed button cycle 32 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0032', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0033
     * @tc.name      testBehaviorUi0033
     * @tc.desc      Slider drag 33 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0033', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0034
     * @tc.name      testBehaviorUi0034
     * @tc.desc      Video surface and slider 34 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0034', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0035
     * @tc.name      testBehaviorUi0035
     * @tc.desc      Time labels 35 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0035', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0036
     * @tc.name      testBehaviorUi0036
     * @tc.desc      Play/pause toggle 36 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0036', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0037
     * @tc.name      testBehaviorUi0037
     * @tc.desc      Speed button cycle 37 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0037', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0038
     * @tc.name      testBehaviorUi0038
     * @tc.desc      Slider drag 38 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0038', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0039
     * @tc.name      testBehaviorUi0039
     * @tc.desc      Video surface and slider 39 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0039', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0040
     * @tc.name      testBehaviorUi0040
     * @tc.desc      Time labels 40 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0040', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0041
     * @tc.name      testBehaviorUi0041
     * @tc.desc      Play/pause toggle 41 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0041', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0042
     * @tc.name      testBehaviorUi0042
     * @tc.desc      Speed button cycle 42 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0042', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0043
     * @tc.name      testBehaviorUi0043
     * @tc.desc      Slider drag 43 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0043', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0044
     * @tc.name      testBehaviorUi0044
     * @tc.desc      Video surface and slider 44 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0044', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0045
     * @tc.name      testBehaviorUi0045
     * @tc.desc      Time labels 45 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0045', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0046
     * @tc.name      testBehaviorUi0046
     * @tc.desc      Play/pause toggle 46 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0046', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0047
     * @tc.name      testBehaviorUi0047
     * @tc.desc      Speed button cycle 47 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0047', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0048
     * @tc.name      testBehaviorUi0048
     * @tc.desc      Slider drag 48 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0048', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0049
     * @tc.name      testBehaviorUi0049
     * @tc.desc      Video surface and slider 49 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0049', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0050
     * @tc.name      testBehaviorUi0050
     * @tc.desc      Time labels 50 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0050', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0051
     * @tc.name      testBehaviorUi0051
     * @tc.desc      Play/pause toggle 51 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0051', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0052
     * @tc.name      testBehaviorUi0052
     * @tc.desc      Speed button cycle 52 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0052', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0053
     * @tc.name      testBehaviorUi0053
     * @tc.desc      Slider drag 53 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0053', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0054
     * @tc.name      testBehaviorUi0054
     * @tc.desc      Video surface and slider 54 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0054', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0055
     * @tc.name      testBehaviorUi0055
     * @tc.desc      Time labels 55 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0055', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0056
     * @tc.name      testBehaviorUi0056
     * @tc.desc      Play/pause toggle 56 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0056', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0057
     * @tc.name      testBehaviorUi0057
     * @tc.desc      Speed button cycle 57 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0057', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0058
     * @tc.name      testBehaviorUi0058
     * @tc.desc      Slider drag 58 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0058', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0059
     * @tc.name      testBehaviorUi0059
     * @tc.desc      Video surface and slider 59 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0059', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0060
     * @tc.name      testBehaviorUi0060
     * @tc.desc      Time labels 60 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0060', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0061
     * @tc.name      testBehaviorUi0061
     * @tc.desc      Play/pause toggle 61 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0061', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0062
     * @tc.name      testBehaviorUi0062
     * @tc.desc      Speed button cycle 62 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0062', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0063
     * @tc.name      testBehaviorUi0063
     * @tc.desc      Slider drag 63 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0063', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0064
     * @tc.name      testBehaviorUi0064
     * @tc.desc      Video surface and slider 64 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0064', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0065
     * @tc.name      testBehaviorUi0065
     * @tc.desc      Time labels 65 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0065', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0066
     * @tc.name      testBehaviorUi0066
     * @tc.desc      Play/pause toggle 66 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0066', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0067
     * @tc.name      testBehaviorUi0067
     * @tc.desc      Speed button cycle 67 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0067', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0068
     * @tc.name      testBehaviorUi0068
     * @tc.desc      Slider drag 68 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0068', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0069
     * @tc.name      testBehaviorUi0069
     * @tc.desc      Video surface and slider 69 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0069', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0070
     * @tc.name      testBehaviorUi0070
     * @tc.desc      Time labels 70 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0070', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0071
     * @tc.name      testBehaviorUi0071
     * @tc.desc      Play/pause toggle 71 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0071', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0072
     * @tc.name      testBehaviorUi0072
     * @tc.desc      Speed button cycle 72 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0072', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0073
     * @tc.name      testBehaviorUi0073
     * @tc.desc      Slider drag 73 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0073', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0074
     * @tc.name      testBehaviorUi0074
     * @tc.desc      Video surface and slider 74 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0074', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0075
     * @tc.name      testBehaviorUi0075
     * @tc.desc      Time labels 75 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0075', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0076
     * @tc.name      testBehaviorUi0076
     * @tc.desc      Play/pause toggle 76 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0076', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0077
     * @tc.name      testBehaviorUi0077
     * @tc.desc      Speed button cycle 77 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0077', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0078
     * @tc.name      testBehaviorUi0078
     * @tc.desc      Slider drag 78 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0078', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0079
     * @tc.name      testBehaviorUi0079
     * @tc.desc      Video surface and slider 79 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0079', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0080
     * @tc.name      testBehaviorUi0080
     * @tc.desc      Time labels 80 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0080', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0081
     * @tc.name      testBehaviorUi0081
     * @tc.desc      Play/pause toggle 81 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0081', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0082
     * @tc.name      testBehaviorUi0082
     * @tc.desc      Speed button cycle 82 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0082', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0083
     * @tc.name      testBehaviorUi0083
     * @tc.desc      Slider drag 83 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0083', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0084
     * @tc.name      testBehaviorUi0084
     * @tc.desc      Video surface and slider 84 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0084', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0085
     * @tc.name      testBehaviorUi0085
     * @tc.desc      Time labels 85 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0085', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0086
     * @tc.name      testBehaviorUi0086
     * @tc.desc      Play/pause toggle 86 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0086', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0087
     * @tc.name      testBehaviorUi0087
     * @tc.desc      Speed button cycle 87 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0087', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0088
     * @tc.name      testBehaviorUi0088
     * @tc.desc      Slider drag 88 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0088', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0089
     * @tc.name      testBehaviorUi0089
     * @tc.desc      Video surface and slider 89 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0089', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0090
     * @tc.name      testBehaviorUi0090
     * @tc.desc      Time labels 90 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0090', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0091
     * @tc.name      testBehaviorUi0091
     * @tc.desc      Play/pause toggle 91 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0091', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0092
     * @tc.name      testBehaviorUi0092
     * @tc.desc      Speed button cycle 92 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0092', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0093
     * @tc.name      testBehaviorUi0093
     * @tc.desc      Slider drag 93 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0093', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0094
     * @tc.name      testBehaviorUi0094
     * @tc.desc      Video surface and slider 94 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0094', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0095
     * @tc.name      testBehaviorUi0095
     * @tc.desc      Time labels 95 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0095', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0096
     * @tc.name      testBehaviorUi0096
     * @tc.desc      Play/pause toggle 96 keeps the entry page alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0096', 0, async () => {
      await driver.delayMs(200);
      const before: Component | null = await driver.findComponent(ON.id('pause'));
      const after: Component | null = await driver.findComponent(ON.id('play'));
      const target: Component = (before ?? after) as Component;
      expect(target !== null && target !== undefined).assertTrue();
      await target.click();
      await driver.delayMs(300);
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0097
     * @tc.name      testBehaviorUi0097
     * @tc.desc      Speed button cycle 97 keeps a non-empty label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0097', 0, async () => {
      await driver.delayMs(200);
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(speed !== null && speed !== undefined).assertTrue();
      const target: Component = speed as Component;
      const before: string = await target.getText();
      await target.click();
      await driver.delayMs(300);
      const after: string = await target.getText();
      expect(before.length).assertLarger(0);
      expect(after.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0098
     * @tc.name      testBehaviorUi0098
     * @tc.desc      Slider drag 98 keeps the slider available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0098', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x - 30, point.y, point.x + 30, point.y, 300);
      await driver.delayMs(300);
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0099
     * @tc.name      testBehaviorUi0099
     * @tc.desc      Video surface and slider 99 coexist on the page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0099', 0, async () => {
      await driver.delayMs(200);
      const video: Component | null = await driver.findComponent(ON.id('VideoView'));
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(video !== null && video !== undefined).assertTrue();
      expect(slider !== null && slider !== undefined).assertTrue();
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH_UI_0100
     * @tc.name      testBehaviorUi0100
     * @tc.desc      Time labels 100 remain non-empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorUi0100', 0, async () => {
      await driver.delayMs(200);
      const current: Component | null = await driver.findComponent(ON.id('currentTimeText'));
      const duration: Component | null = await driver.findComponent(ON.id('durationTimeText'));
      expect(current !== null && current !== undefined).assertTrue();
      expect(duration !== null && duration !== undefined).assertTrue();
      const currentText: string = await (current as Component).getText();
      const durationText: string = await (duration as Component).getText();
      expect(currentText.length).assertLarger(0);
      expect(durationText.length).assertLarger(0);
    })
  })
}
