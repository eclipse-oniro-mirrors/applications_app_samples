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

async function clickSequence(driver: Driver, ids: string[]): Promise<boolean> {
  for (const id of ids) {
    if (!(await clickButton(driver, id))) {
      return false;
    }
  }
  return true;
}

async function readShowText(driver: Driver): Promise<string> {
  const target: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 3000);
  return target === null ? '' : await target.getText();
}

export default function MotionUiSequenceMatrixTest() {
  describe('MotionUiSequenceMatrixTest', () => {
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
     * @tc.number SUB_MOTION_SEQ_0100
     * @tc.name testSeqPair11
     * @tc.desc Verify sequence button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0200
     * @tc.name testSeqPair12
     * @tc.desc Verify sequence button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0300
     * @tc.name testSeqPair13
     * @tc.desc Verify sequence button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0400
     * @tc.name testSeqPair14
     * @tc.desc Verify sequence button1->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0500
     * @tc.name testSeqPair15
     * @tc.desc Verify sequence button1->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0600
     * @tc.name testSeqPair21
     * @tc.desc Verify sequence button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0700
     * @tc.name testSeqPair22
     * @tc.desc Verify sequence button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0800
     * @tc.name testSeqPair23
     * @tc.desc Verify sequence button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0900
     * @tc.name testSeqPair24
     * @tc.desc Verify sequence button2->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1000
     * @tc.name testSeqPair25
     * @tc.desc Verify sequence button2->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1100
     * @tc.name testSeqPair31
     * @tc.desc Verify sequence button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1200
     * @tc.name testSeqPair32
     * @tc.desc Verify sequence button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1300
     * @tc.name testSeqPair33
     * @tc.desc Verify sequence button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1400
     * @tc.name testSeqPair34
     * @tc.desc Verify sequence button3->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1500
     * @tc.name testSeqPair35
     * @tc.desc Verify sequence button3->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1600
     * @tc.name testSeqPair41
     * @tc.desc Verify sequence button4->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair41', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1700
     * @tc.name testSeqPair42
     * @tc.desc Verify sequence button4->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair42', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1800
     * @tc.name testSeqPair43
     * @tc.desc Verify sequence button4->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair43', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1900
     * @tc.name testSeqPair44
     * @tc.desc Verify sequence button4->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair44', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2000
     * @tc.name testSeqPair45
     * @tc.desc Verify sequence button4->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair45', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2100
     * @tc.name testSeqPair51
     * @tc.desc Verify sequence button5->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair51', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2200
     * @tc.name testSeqPair52
     * @tc.desc Verify sequence button5->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair52', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2300
     * @tc.name testSeqPair53
     * @tc.desc Verify sequence button5->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2400
     * @tc.name testSeqPair54
     * @tc.desc Verify sequence button5->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair54', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2500
     * @tc.name testSeqPair55
     * @tc.desc Verify sequence button5->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair55', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2600
     * @tc.name testSeqTriple123
     * @tc.desc Verify sequence button1->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button2', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2700
     * @tc.name testSeqTriple124
     * @tc.desc Verify sequence button1->button2->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button2', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2800
     * @tc.name testSeqTriple125
     * @tc.desc Verify sequence button1->button2->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button2', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2900
     * @tc.name testSeqTriple132
     * @tc.desc Verify sequence button1->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button3', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3000
     * @tc.name testSeqTriple134
     * @tc.desc Verify sequence button1->button3->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button3', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3100
     * @tc.name testSeqTriple135
     * @tc.desc Verify sequence button1->button3->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button3', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3200
     * @tc.name testSeqTriple142
     * @tc.desc Verify sequence button1->button4->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button4', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3300
     * @tc.name testSeqTriple143
     * @tc.desc Verify sequence button1->button4->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button4', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3400
     * @tc.name testSeqTriple145
     * @tc.desc Verify sequence button1->button4->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button4', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3500
     * @tc.name testSeqTriple152
     * @tc.desc Verify sequence button1->button5->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button5', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3600
     * @tc.name testSeqTriple153
     * @tc.desc Verify sequence button1->button5->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button5', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3700
     * @tc.name testSeqTriple154
     * @tc.desc Verify sequence button1->button5->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button5', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3800
     * @tc.name testSeqTriple213
     * @tc.desc Verify sequence button2->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button1', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3900
     * @tc.name testSeqTriple214
     * @tc.desc Verify sequence button2->button1->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button1', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4000
     * @tc.name testSeqTriple215
     * @tc.desc Verify sequence button2->button1->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button1', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4100
     * @tc.name testSeqTriple231
     * @tc.desc Verify sequence button2->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button3', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4200
     * @tc.name testSeqTriple234
     * @tc.desc Verify sequence button2->button3->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button3', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4300
     * @tc.name testSeqTriple235
     * @tc.desc Verify sequence button2->button3->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button3', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4400
     * @tc.name testSeqTriple241
     * @tc.desc Verify sequence button2->button4->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button4', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4500
     * @tc.name testSeqTriple243
     * @tc.desc Verify sequence button2->button4->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button4', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4600
     * @tc.name testSeqTriple245
     * @tc.desc Verify sequence button2->button4->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button4', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4700
     * @tc.name testSeqTriple251
     * @tc.desc Verify sequence button2->button5->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button5', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4800
     * @tc.name testSeqTriple253
     * @tc.desc Verify sequence button2->button5->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button5', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4900
     * @tc.name testSeqTriple254
     * @tc.desc Verify sequence button2->button5->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button5', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5000
     * @tc.name testSeqTriple312
     * @tc.desc Verify sequence button3->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button1', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5100
     * @tc.name testSeqTriple314
     * @tc.desc Verify sequence button3->button1->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button1', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5200
     * @tc.name testSeqTriple315
     * @tc.desc Verify sequence button3->button1->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button1', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5300
     * @tc.name testSeqTriple321
     * @tc.desc Verify sequence button3->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button2', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5400
     * @tc.name testSeqTriple324
     * @tc.desc Verify sequence button3->button2->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button2', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5500
     * @tc.name testSeqTriple325
     * @tc.desc Verify sequence button3->button2->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button2', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5600
     * @tc.name testSeqTriple341
     * @tc.desc Verify sequence button3->button4->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button4', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5700
     * @tc.name testSeqTriple342
     * @tc.desc Verify sequence button3->button4->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button4', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5800
     * @tc.name testSeqTriple345
     * @tc.desc Verify sequence button3->button4->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button4', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5900
     * @tc.name testSeqTriple351
     * @tc.desc Verify sequence button3->button5->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button5', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6000
     * @tc.name testSeqTriple352
     * @tc.desc Verify sequence button3->button5->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button5', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6100
     * @tc.name testSeqTriple354
     * @tc.desc Verify sequence button3->button5->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button5', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6200
     * @tc.name testSeqTriple412
     * @tc.desc Verify sequence button4->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button1', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6300
     * @tc.name testSeqTriple413
     * @tc.desc Verify sequence button4->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button1', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6400
     * @tc.name testSeqTriple415
     * @tc.desc Verify sequence button4->button1->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button1', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6500
     * @tc.name testSeqTriple421
     * @tc.desc Verify sequence button4->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button2', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6600
     * @tc.name testSeqTriple423
     * @tc.desc Verify sequence button4->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button2', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6700
     * @tc.name testSeqTriple425
     * @tc.desc Verify sequence button4->button2->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button2', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6800
     * @tc.name testSeqTriple431
     * @tc.desc Verify sequence button4->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button3', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6900
     * @tc.name testSeqTriple432
     * @tc.desc Verify sequence button4->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button3', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7000
     * @tc.name testSeqTriple435
     * @tc.desc Verify sequence button4->button3->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button3', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7100
     * @tc.name testSeqTriple451
     * @tc.desc Verify sequence button4->button5->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button5', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7200
     * @tc.name testSeqTriple452
     * @tc.desc Verify sequence button4->button5->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button5', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7300
     * @tc.name testSeqTriple453
     * @tc.desc Verify sequence button4->button5->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button5', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7400
     * @tc.name testSeqTriple512
     * @tc.desc Verify sequence button5->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button1', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7500
     * @tc.name testSeqTriple513
     * @tc.desc Verify sequence button5->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button1', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7600
     * @tc.name testSeqTriple514
     * @tc.desc Verify sequence button5->button1->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button1', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7700
     * @tc.name testSeqTriple521
     * @tc.desc Verify sequence button5->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple521', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button2', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7800
     * @tc.name testSeqTriple523
     * @tc.desc Verify sequence button5->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple523', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button2', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7900
     * @tc.name testSeqTriple524
     * @tc.desc Verify sequence button5->button2->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple524', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button2', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8000
     * @tc.name testSeqTriple531
     * @tc.desc Verify sequence button5->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple531', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button3', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8100
     * @tc.name testSeqTriple532
     * @tc.desc Verify sequence button5->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple532', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button3', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8200
     * @tc.name testSeqTriple534
     * @tc.desc Verify sequence button5->button3->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple534', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button3', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8300
     * @tc.name testSeqTriple541
     * @tc.desc Verify sequence button5->button4->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple541', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button4', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8400
     * @tc.name testSeqTriple542
     * @tc.desc Verify sequence button5->button4->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple542', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button4', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8500
     * @tc.name testSeqTriple543
     * @tc.desc Verify sequence button5->button4->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple543', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button4', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
    });
  });
}
