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
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const SHOW_ID: string = 'show';
const BUTTON_IDS: string[] = ['button1', 'button2', 'button3', 'button4', 'button5'];
const EXPECTED: string[] = [
  'motion subscribeOperating',
  'motion unsubscribeOperating',
  'motion getOperating',
  'motion subscribeHolding',
  'motion unsubscribeHolding'
];

let sharedDriver: Driver | null = null;

function getDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

function entryWant(): Want {
  return {
    bundleName: abilityDelegatorRegistry.getArguments().bundleName,
    abilityName: 'EntryAbility'
  };
}

async function relaunch(driver: Driver): Promise<boolean> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  try {
    await delegator.startAbility(entryWant());
  } catch (err) {
  }
  await driver.delayMs(900);
  return await driver.waitForComponent(ON.id('button1'), 6000) !== null;
}

async function clickButton(driver: Driver, id: string): Promise<boolean> {
  const target: Component | null = await driver.waitForComponent(ON.id(id), 4000);
  if (target === null) {
    return false;
  }
  await target.click();
  await driver.delayMs(600);
  return true;
}

async function readShowText(driver: Driver): Promise<string> {
  const target: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 3000);
  return target === null ? '' : await target.getText();
}

/**
 * 应用重启/恢复维度
 *
 * 通过重复拉起 EntryAbility 模拟应用恢复，校验页面控件可恢复、动作在恢复后
 * 仍可用、状态文本仍按最后一次动作更新。
 */
export default function MotionLifecycleTest() {
  describe('MotionLifecycleTest', () => {
    beforeAll(async () => {
      const driver: Driver = getDriver();
      await relaunch(driver);
    });

    /**
     * @tc.number SUB_MOTION_LIFE_0100
     * @tc.name testMotionLife0001
     * @tc.desc Verify relaunching the ability restores all page controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionLife0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
     * @tc.number SUB_MOTION_LIFE_0200
     * @tc.name testMotionLife0002
     * @tc.desc Verify a relaunch after an action still restores the action buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionLife0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button1')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED[0]);
      expect(await relaunch(driver)).assertTrue();
      expect(await driver.findComponent(ON.id('button1')) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_MOTION_LIFE_0300
     * @tc.name testMotionLife0003
     * @tc.desc Verify three consecutive relaunches keep the page reachable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionLife0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await relaunch(driver)).assertTrue();
      }
      expect(await driver.findComponent(ON.id(SHOW_ID)) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_MOTION_LIFE_0400
     * @tc.name testMotionLife0004
     * @tc.desc Verify an action still updates the status text after a relaunch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionLife0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await relaunch(driver)).assertTrue();
      expect(await clickButton(driver, 'button3')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED[2]);
    });

    /**
     * @tc.number SUB_MOTION_LIFE_0500
     * @tc.name testMotionLife0005
     * @tc.desc Verify all five buttons remain present after a relaunch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionLife0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await relaunch(driver)).assertTrue();
      for (const id of BUTTON_IDS) {
        expect(await driver.findComponent(ON.id(id)) !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_MOTION_LIFE_0600
     * @tc.name testMotionLife0006
     * @tc.desc Verify unsubscribe-holding after a relaunch updates the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionLife0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await relaunch(driver)).assertTrue();
      expect(await clickButton(driver, 'button5')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED[4]);
    });
  });
}
