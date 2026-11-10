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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import {
  SHOW_ID,
  BUTTON_IDS,
  getDriver,
  entryWant,
  clickAndExpect,
  clickAndExpectLast,
  readShowText
} from './StationaryUiSupport';

async function relaunch(driver: Driver): Promise<boolean> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const want: Want = entryWant();
  try {
    await delegator.startAbility(want);
  } catch (err) {
  }
  await driver.delayMs(900);
  return await driver.waitForComponent(ON.id('button1'), 6000) !== null;
}

/**
 * 应用重启/恢复维度
 *
 * 通过重复拉起 EntryAbility 模拟应用恢复，校验页面控件可恢复、动作在恢复后
 * 仍可用、状态文本仍按最后一次动作更新。
 */
export default function StationaryLifecycleTest() {
  describe('StationaryLifecycleTest', () => {
    beforeAll(async () => {
      const driver: Driver = getDriver();
      await relaunch(driver);
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0100
     * @tc.name testStationaryLife0001
     * @tc.desc Verify relaunching the ability restores all page controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await relaunch(driver)).assertTrue();
      let found: number = 0;
      for (const id of BUTTON_IDS) {
        if (await driver.findComponent(ON.id(id)) !== null) {
          found++;
        }
      }
      expect(found).assertEqual(BUTTON_IDS.length);
      expect(await driver.findComponent(ON.id(SHOW_ID)) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0200
     * @tc.name testStationaryLife0002
     * @tc.desc Verify a relaunch after an action still restores the action buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpect(driver, 0)).assertTrue();
      expect(await relaunch(driver)).assertTrue();
      expect(await driver.findComponent(ON.id('button1')) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0300
     * @tc.name testStationaryLife0003
     * @tc.desc Verify three consecutive relaunches keep the page reachable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await relaunch(driver)).assertTrue();
      }
      expect(await driver.findComponent(ON.id(SHOW_ID)) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0400
     * @tc.name testStationaryLife0004
     * @tc.desc Verify a one-shot query still updates the status text after a relaunch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await relaunch(driver)).assertTrue();
      expect(await clickAndExpect(driver, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0500
     * @tc.name testStationaryLife0005
     * @tc.desc Verify all three buttons remain present after a relaunch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await relaunch(driver)).assertTrue();
      for (const id of BUTTON_IDS) {
        expect(await driver.findComponent(ON.id(id)) !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0600
     * @tc.name testStationaryLife0006
     * @tc.desc Verify unsubscribe after a relaunch updates the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await relaunch(driver)).assertTrue();
      expect(await clickAndExpect(driver, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0700
     * @tc.name testStationaryLife0007
     * @tc.desc Verify a two-action sequence still ends on the last action after a relaunch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await relaunch(driver)).assertTrue();
      expect(await clickAndExpectLast(driver, ['button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0800
     * @tc.name testStationaryLife0008
     * @tc.desc Verify the status text stays readable across three consecutive relaunches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await relaunch(driver)).assertTrue();
        expect((await readShowText(driver)).length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STATIONARY_LIFE_0900
     * @tc.name testStationaryLife0009
     * @tc.desc Verify actions keep working after a relaunch that follows every action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryLife0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let index = 0; index < BUTTON_IDS.length; index++) {
        expect(await clickAndExpect(driver, index)).assertTrue();
        expect(await relaunch(driver)).assertTrue();
      }
      for (const id of BUTTON_IDS) {
        expect(await driver.findComponent(ON.id(id)) !== null).assertTrue();
      }
    });
  });
}
