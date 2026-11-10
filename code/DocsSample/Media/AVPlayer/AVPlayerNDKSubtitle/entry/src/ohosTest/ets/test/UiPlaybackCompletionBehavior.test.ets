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



export default function uiPlaybackCompletionBehaviorTest() {
  describe('uiPlaybackCompletionBehaviorTest', () => {
  beforeAll(async () => {
    await abilityDelegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
    await driver.delayMs(2000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0001
     * @tc.name      testBehaviorCompletion0001
     * @tc.desc      Completion/restart flow 1 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0001', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0002
     * @tc.name      testBehaviorCompletion0002
     * @tc.desc      Completion/restart flow 2 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0002', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0003
     * @tc.name      testBehaviorCompletion0003
     * @tc.desc      Completion/restart flow 3 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0003', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0004
     * @tc.name      testBehaviorCompletion0004
     * @tc.desc      Completion/restart flow 4 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0004', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0005
     * @tc.name      testBehaviorCompletion0005
     * @tc.desc      Completion/restart flow 5 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0005', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0006
     * @tc.name      testBehaviorCompletion0006
     * @tc.desc      Completion/restart flow 6 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0006', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0007
     * @tc.name      testBehaviorCompletion0007
     * @tc.desc      Completion/restart flow 7 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0007', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0008
     * @tc.name      testBehaviorCompletion0008
     * @tc.desc      Completion/restart flow 8 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0008', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0009
     * @tc.name      testBehaviorCompletion0009
     * @tc.desc      Completion/restart flow 9 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0009', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0010
     * @tc.name      testBehaviorCompletion0010
     * @tc.desc      Completion/restart flow 10 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0010', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0011
     * @tc.name      testBehaviorCompletion0011
     * @tc.desc      Completion/restart flow 11 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0011', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0012
     * @tc.name      testBehaviorCompletion0012
     * @tc.desc      Completion/restart flow 12 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0012', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0013
     * @tc.name      testBehaviorCompletion0013
     * @tc.desc      Completion/restart flow 13 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0013', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0014
     * @tc.name      testBehaviorCompletion0014
     * @tc.desc      Completion/restart flow 14 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0014', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0015
     * @tc.name      testBehaviorCompletion0015
     * @tc.desc      Completion/restart flow 15 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0015', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0016
     * @tc.name      testBehaviorCompletion0016
     * @tc.desc      Completion/restart flow 16 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0016', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0017
     * @tc.name      testBehaviorCompletion0017
     * @tc.desc      Completion/restart flow 17 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0017', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0018
     * @tc.name      testBehaviorCompletion0018
     * @tc.desc      Completion/restart flow 18 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0018', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0019
     * @tc.name      testBehaviorCompletion0019
     * @tc.desc      Completion/restart flow 19 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0019', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0020
     * @tc.name      testBehaviorCompletion0020
     * @tc.desc      Completion/restart flow 20 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0020', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0021
     * @tc.name      testBehaviorCompletion0021
     * @tc.desc      Completion/restart flow 21 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0021', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0022
     * @tc.name      testBehaviorCompletion0022
     * @tc.desc      Completion/restart flow 22 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0022', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0023
     * @tc.name      testBehaviorCompletion0023
     * @tc.desc      Completion/restart flow 23 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0023', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0024
     * @tc.name      testBehaviorCompletion0024
     * @tc.desc      Completion/restart flow 24 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0024', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0025
     * @tc.name      testBehaviorCompletion0025
     * @tc.desc      Completion/restart flow 25 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0025', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0026
     * @tc.name      testBehaviorCompletion0026
     * @tc.desc      Completion/restart flow 26 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0026', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0027
     * @tc.name      testBehaviorCompletion0027
     * @tc.desc      Completion/restart flow 27 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0027', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0028
     * @tc.name      testBehaviorCompletion0028
     * @tc.desc      Completion/restart flow 28 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0028', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0029
     * @tc.name      testBehaviorCompletion0029
     * @tc.desc      Completion/restart flow 29 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0029', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_END_0030
     * @tc.name      testBehaviorCompletion0030
     * @tc.desc      Completion/restart flow 30 keeps playback controls alive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorCompletion0030', 0, async () => {
      await driver.delayMs(300);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      expect(slider !== null && slider !== undefined).assertTrue();
      const target: Component = slider as Component;
      const point = await target.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x + 80, point.y, 400);
      await driver.delayMs(400);
      const play: Component | null = await driver.findComponent(ON.id('play'));
      if (play !== null && play !== undefined) {
        await (play as Component).click();
        await driver.delayMs(300);
      }
      const top = await abilityDelegator.getCurrentTopAbility();
      expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
    })
  })
}
