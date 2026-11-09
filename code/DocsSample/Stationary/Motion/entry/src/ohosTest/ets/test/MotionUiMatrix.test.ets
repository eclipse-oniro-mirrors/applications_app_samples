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
const SETTLE_MS: number = 700;

let sharedDriver: Driver | null = null;

function getDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

async function readShowText(driver: Driver): Promise<string> {
  const target: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 3000);
  return target === null ? '' : await target.getText();
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

/**
 * Motion 页面控件与文案映射矩阵（UiTest）
 *
 * 每个按钮点击后都会把状态文本改为对应动作名（成功/异常分支都会更新），
 * 因此可在任意设备上稳定校验控件存在、点击后的文本映射、重复点击幂等
 * 以及连续操作“最后一次动作生效”的语义。
 */
export default function MotionUiMatrixTest() {
  describe('MotionUiMatrixTest', () => {
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
     * @tc.number SUB_MOTION_UI_0100
     * @tc.name testMotionUi0001
     * @tc.desc Verify the page exposes the status text and all five action buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await driver.waitForComponent(ON.id(SHOW_ID), 4000) !== null).assertTrue();
      let found: number = 0;
      for (const id of BUTTON_IDS) {
        if (await driver.waitForComponent(ON.id(id), 3000) !== null) {
          found++;
        }
      }
      expect(found).assertEqual(BUTTON_IDS.length);
    });

    /**
     * @tc.number SUB_MOTION_UI_0200
     * @tc.name testMotionUi0002
     * @tc.desc Verify clicking subscribe-operating updates the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button1')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_UI_0300
     * @tc.name testMotionUi0003
     * @tc.desc Verify clicking unsubscribe-operating updates the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button2')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_UI_0400
     * @tc.name testMotionUi0004
     * @tc.desc Verify clicking get-operating updates the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button3')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_UI_0500
     * @tc.name testMotionUi0005
     * @tc.desc Verify clicking subscribe-holding updates the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button4')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_UI_0600
     * @tc.name testMotionUi0006
     * @tc.desc Verify clicking unsubscribe-holding updates the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button5')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_UI_0700
     * @tc.name testMotionUi0007
     * @tc.desc Verify clicking subscribe-operating twice keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button1')).assertTrue();
      const first: string = await readShowText(driver);
      expect(await clickButton(driver, 'button1')).assertTrue();
      const second: string = await readShowText(driver);
      expect(first).assertEqual(EXPECTED_TEXT[0]);
      expect(second).assertEqual(first);
    });

    /**
     * @tc.number SUB_MOTION_UI_0800
     * @tc.name testMotionUi0008
     * @tc.desc Verify the last action wins after subscribe then unsubscribe operating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button1')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      expect(await clickButton(driver, 'button2')).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_UI_0900
     * @tc.name testMotionUi0009
     * @tc.desc Verify a full button cycle ends on the unsubscribe-holding status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let i = 0; i < BUTTON_IDS.length; i++) {
        expect(await clickButton(driver, BUTTON_IDS[i])).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[i]);
      }
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[BUTTON_IDS.length - 1]);
    });

    /**
     * @tc.number SUB_MOTION_UI_1000
     * @tc.name testMotionUi0010
     * @tc.desc Verify all action buttons remain usable after repeated use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickButton(driver, 'button1')).assertTrue();
      expect(await clickButton(driver, 'button5')).assertTrue();
      let found: number = 0;
      for (const id of BUTTON_IDS) {
        if (await driver.findComponent(ON.id(id)) !== null) {
          found++;
        }
      }
      expect(found).assertEqual(BUTTON_IDS.length);
    });
  });
}
