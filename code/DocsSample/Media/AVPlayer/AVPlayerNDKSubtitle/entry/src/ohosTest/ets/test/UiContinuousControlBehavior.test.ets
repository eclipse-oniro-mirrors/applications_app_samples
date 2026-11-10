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


export default function uiContinuousControlBehaviorTest() {
  describe('uiContinuousControlBehaviorTest', () => {
  beforeAll(async () => {
    await abilityDelegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
    await driver.delayMs(2000);
  });

    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0001
     * @tc.name      testBehaviorContinuousControl0001
     * @tc.desc      Continuous seek/speed/pause cycle 1 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0001', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0002
     * @tc.name      testBehaviorContinuousControl0002
     * @tc.desc      Continuous seek/speed/pause cycle 2 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0002', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0003
     * @tc.name      testBehaviorContinuousControl0003
     * @tc.desc      Continuous seek/speed/pause cycle 3 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0003', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0004
     * @tc.name      testBehaviorContinuousControl0004
     * @tc.desc      Continuous seek/speed/pause cycle 4 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0004', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0005
     * @tc.name      testBehaviorContinuousControl0005
     * @tc.desc      Continuous seek/speed/pause cycle 5 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0005', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0006
     * @tc.name      testBehaviorContinuousControl0006
     * @tc.desc      Continuous seek/speed/pause cycle 6 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0006', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0007
     * @tc.name      testBehaviorContinuousControl0007
     * @tc.desc      Continuous seek/speed/pause cycle 7 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0007', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0008
     * @tc.name      testBehaviorContinuousControl0008
     * @tc.desc      Continuous seek/speed/pause cycle 8 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0008', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0009
     * @tc.name      testBehaviorContinuousControl0009
     * @tc.desc      Continuous seek/speed/pause cycle 9 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0009', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0010
     * @tc.name      testBehaviorContinuousControl0010
     * @tc.desc      Continuous seek/speed/pause cycle 10 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0010', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0011
     * @tc.name      testBehaviorContinuousControl0011
     * @tc.desc      Continuous seek/speed/pause cycle 11 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0011', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0012
     * @tc.name      testBehaviorContinuousControl0012
     * @tc.desc      Continuous seek/speed/pause cycle 12 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0012', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0013
     * @tc.name      testBehaviorContinuousControl0013
     * @tc.desc      Continuous seek/speed/pause cycle 13 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0013', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0014
     * @tc.name      testBehaviorContinuousControl0014
     * @tc.desc      Continuous seek/speed/pause cycle 14 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0014', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0015
     * @tc.name      testBehaviorContinuousControl0015
     * @tc.desc      Continuous seek/speed/pause cycle 15 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0015', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0016
     * @tc.name      testBehaviorContinuousControl0016
     * @tc.desc      Continuous seek/speed/pause cycle 16 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0016', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0017
     * @tc.name      testBehaviorContinuousControl0017
     * @tc.desc      Continuous seek/speed/pause cycle 17 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0017', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0018
     * @tc.name      testBehaviorContinuousControl0018
     * @tc.desc      Continuous seek/speed/pause cycle 18 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0018', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0019
     * @tc.name      testBehaviorContinuousControl0019
     * @tc.desc      Continuous seek/speed/pause cycle 19 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0019', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0020
     * @tc.name      testBehaviorContinuousControl0020
     * @tc.desc      Continuous seek/speed/pause cycle 20 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0020', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0021
     * @tc.name      testBehaviorContinuousControl0021
     * @tc.desc      Continuous seek/speed/pause cycle 21 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0021', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0022
     * @tc.name      testBehaviorContinuousControl0022
     * @tc.desc      Continuous seek/speed/pause cycle 22 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0022', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0023
     * @tc.name      testBehaviorContinuousControl0023
     * @tc.desc      Continuous seek/speed/pause cycle 23 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0023', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0024
     * @tc.name      testBehaviorContinuousControl0024
     * @tc.desc      Continuous seek/speed/pause cycle 24 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0024', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0025
     * @tc.name      testBehaviorContinuousControl0025
     * @tc.desc      Continuous seek/speed/pause cycle 25 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0025', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0026
     * @tc.name      testBehaviorContinuousControl0026
     * @tc.desc      Continuous seek/speed/pause cycle 26 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0026', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0027
     * @tc.name      testBehaviorContinuousControl0027
     * @tc.desc      Continuous seek/speed/pause cycle 27 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0027', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0028
     * @tc.name      testBehaviorContinuousControl0028
     * @tc.desc      Continuous seek/speed/pause cycle 28 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0028', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0029
     * @tc.name      testBehaviorContinuousControl0029
     * @tc.desc      Continuous seek/speed/pause cycle 29 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0029', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0030
     * @tc.name      testBehaviorContinuousControl0030
     * @tc.desc      Continuous seek/speed/pause cycle 30 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0030', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0031
     * @tc.name      testBehaviorContinuousControl0031
     * @tc.desc      Continuous seek/speed/pause cycle 31 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0031', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0032
     * @tc.name      testBehaviorContinuousControl0032
     * @tc.desc      Continuous seek/speed/pause cycle 32 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0032', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0033
     * @tc.name      testBehaviorContinuousControl0033
     * @tc.desc      Continuous seek/speed/pause cycle 33 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0033', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0034
     * @tc.name      testBehaviorContinuousControl0034
     * @tc.desc      Continuous seek/speed/pause cycle 34 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0034', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0035
     * @tc.name      testBehaviorContinuousControl0035
     * @tc.desc      Continuous seek/speed/pause cycle 35 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0035', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0036
     * @tc.name      testBehaviorContinuousControl0036
     * @tc.desc      Continuous seek/speed/pause cycle 36 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0036', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0037
     * @tc.name      testBehaviorContinuousControl0037
     * @tc.desc      Continuous seek/speed/pause cycle 37 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0037', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0038
     * @tc.name      testBehaviorContinuousControl0038
     * @tc.desc      Continuous seek/speed/pause cycle 38 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0038', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0039
     * @tc.name      testBehaviorContinuousControl0039
     * @tc.desc      Continuous seek/speed/pause cycle 39 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0039', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_CTRL_0040
     * @tc.name      testBehaviorContinuousControl0040
     * @tc.desc      Continuous seek/speed/pause cycle 40 keeps controls responsive.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorContinuousControl0040', 0, async () => {
      await driver.delayMs(200);
      const slider: Component | null = await driver.findComponent(ON.id('Slider'));
      const speed: Component | null = await driver.findComponent(ON.id('Speed'));
      expect(slider !== null && slider !== undefined).assertTrue();
      expect(speed !== null && speed !== undefined).assertTrue();
      const track: Component = slider as Component;
      const point = await track.getBoundsCenter();
      for (let round: number = 0; round < 3; round++) {
        await driver.drag(point.x, point.y, point.x + 20, point.y, 200);
        await (speed as Component).click();
        const toggle: Component | null = await driver.findComponent(ON.id('pause'));
        if (toggle !== null && toggle !== undefined) {
          await (toggle as Component).click();
        }
        await driver.delayMs(150);
      }
      await driver.assertComponentExist(ON.id('Slider'));
    })
  })
}
