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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const TAG: string = '[Sample_MotionUiRepeatTest]';
const DOMAIN: number = 0xF815;

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
     * @tc.name testRepeatSingle0001
     * @tc.desc Verify clicking button1 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0001 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0001 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0200
     * @tc.name testRepeatSingle0002
     * @tc.desc Verify clicking button2 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0002 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button2')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0002 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0300
     * @tc.name testRepeatSingle0003
     * @tc.desc Verify clicking button3 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0003 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button3')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0003 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0400
     * @tc.name testRepeatSingle0004
     * @tc.desc Verify clicking button4 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0004 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button4')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0004 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0500
     * @tc.name testRepeatSingle0005
     * @tc.desc Verify clicking button5 three times keeps the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatSingle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0005 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 3; round++) {
        expect(await clickButton(driver, 'button5')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatSingle0005 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0600
     * @tc.name testRepeatEightClicks0006
     * @tc.desc Verify eight clicks on subscribe-operating keep the same status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatEightClicks0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatEightClicks0006 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 8; round++) {
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatEightClicks0006 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0700
     * @tc.name testRepeatAlternate0007
     * @tc.desc Verify alternating button1/button2 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0007 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await clickButton(driver, 'button2')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0007 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0800
     * @tc.name testRepeatAlternate0008
     * @tc.desc Verify alternating button2/button1 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0008 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button2')).assertTrue();
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0008 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_0900
     * @tc.name testRepeatAlternate0009
     * @tc.desc Verify alternating button3/button4 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0009 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button3')).assertTrue();
        expect(await clickButton(driver, 'button4')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0009 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_1000
     * @tc.name testRepeatAlternate0010
     * @tc.desc Verify alternating button4/button5 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0010 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button4')).assertTrue();
        expect(await clickButton(driver, 'button5')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0010 end');
    });

    /**
     * @tc.number SUB_MOTION_REPEAT_1100
     * @tc.name testRepeatAlternate0011
     * @tc.desc Verify alternating button5/button1 five rounds always ends on the second action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRepeatAlternate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0011 begin');
      const driver: Driver = getDriver();
      for (let round = 0; round < 5; round++) {
        expect(await clickButton(driver, 'button5')).assertTrue();
        expect(await clickButton(driver, 'button1')).assertTrue();
        expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatAlternate0011 end');
    });
  });
}
