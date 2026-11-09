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
const EXPECTED_TEXT: string[] = [
  'motion subscribeOperating',
  'motion unsubscribeOperating',
  'motion getOperating',
  'motion subscribeHolding',
  'motion unsubscribeHolding'
];
const SETTLE_MS: number = 600;

let sharedDriver: Driver | null = null;

function getDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

async function clickButton(driver: Driver, id: string): Promise<boolean> {
  const target: Component | null = await driver.waitForComponent(ON.id(id), 4000);
  if (target === null) {
    return false;
  }
  await target.click();
  await driver.delayMs(SETTLE_MS);
  return true;
}

async function readShowText(driver: Driver): Promise<string> {
  const target: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 3000);
  return target === null ? '' : await target.getText();
}

export default function MotionUiRepeatTest() {
  describe('MotionUiRepeatTest', () => {
    beforeAll(async () => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const want: Want = {
        bundleName: abilityDelegatorRegistry.getArguments().bundleName,
        abilityName: 'EntryAbility'
      };
      try {
        await delegator.startAbility(want);
      } catch (err) {
      }
      const driver: Driver = getDriver();
      await driver.delayMs(1000);
      await driver.waitForComponent(ON.id('button1'), 8000);
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0100
     * @tc.name testRepeatSingle1
     * @tc.desc Verify clicking button1 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0200
     * @tc.name testRepeatSingle2
     * @tc.desc Verify clicking button2 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button2')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0300
     * @tc.name testRepeatSingle3
     * @tc.desc Verify clicking button3 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button3')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0400
     * @tc.name testRepeatSingle4
     * @tc.desc Verify clicking button4 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button4')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0500
     * @tc.name testRepeatSingle5
     * @tc.desc Verify clicking button5 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button5')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0600
     * @tc.name testRepeatEightClicks
     * @tc.desc Verify eight clicks on subscribe-operating keep the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatEightClicks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 8; round++) {
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0700
     * @tc.name testRepeatAlternate12
     * @tc.desc Verify alternating button1/button2 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await clickButton(driver, 'button2')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0800
     * @tc.name testRepeatAlternate21
     * @tc.desc Verify alternating button2/button1 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button2')).assertTrue();
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0900
     * @tc.name testRepeatAlternate34
     * @tc.desc Verify alternating button3/button4 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button3')).assertTrue();
        expect(await clickButton(driver, 'button4')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_1000
     * @tc.name testRepeatAlternate45
     * @tc.desc Verify alternating button4/button5 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button4')).assertTrue();
        expect(await clickButton(driver, 'button5')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      }
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_1100
     * @tc.name testRepeatAlternate51
     * @tc.desc Verify alternating button5/button1 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate51', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button5')).assertTrue();
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      }
    });
  });
}
