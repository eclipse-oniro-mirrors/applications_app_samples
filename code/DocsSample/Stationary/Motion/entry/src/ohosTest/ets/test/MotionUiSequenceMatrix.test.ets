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

const TAG: string = '[Sample_MotionUiSequenceMatrixTest]';
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
     * @tc.name testSeqPair0001
     * @tc.desc Verify sequence button1->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0001 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0001 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0200
     * @tc.name testSeqPair0002
     * @tc.desc Verify sequence button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0002 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0002 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0300
     * @tc.name testSeqPair0003
     * @tc.desc Verify sequence button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0003 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0003 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0400
     * @tc.name testSeqPair0004
     * @tc.desc Verify sequence button1->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0004 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0004 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0500
     * @tc.name testSeqPair0005
     * @tc.desc Verify sequence button1->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0005 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0005 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0600
     * @tc.name testSeqPair0006
     * @tc.desc Verify sequence button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0006 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0006 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0700
     * @tc.name testSeqPair0007
     * @tc.desc Verify sequence button2->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0007 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0007 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0800
     * @tc.name testSeqPair0008
     * @tc.desc Verify sequence button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0008 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0008 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_0900
     * @tc.name testSeqPair0009
     * @tc.desc Verify sequence button2->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0009 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0009 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1000
     * @tc.name testSeqPair0010
     * @tc.desc Verify sequence button2->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0010 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0010 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1100
     * @tc.name testSeqPair0011
     * @tc.desc Verify sequence button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0011 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0011 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1200
     * @tc.name testSeqPair0012
     * @tc.desc Verify sequence button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0012 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0012 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1300
     * @tc.name testSeqPair0013
     * @tc.desc Verify sequence button3->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0013 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0013 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1400
     * @tc.name testSeqPair0014
     * @tc.desc Verify sequence button3->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0014 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0014 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1500
     * @tc.name testSeqPair0015
     * @tc.desc Verify sequence button3->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0015 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0015 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1600
     * @tc.name testSeqPair0016
     * @tc.desc Verify sequence button4->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0016 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0016 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1700
     * @tc.name testSeqPair0017
     * @tc.desc Verify sequence button4->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0017 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0017 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1800
     * @tc.name testSeqPair0018
     * @tc.desc Verify sequence button4->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0018 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0018 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_1900
     * @tc.name testSeqPair0019
     * @tc.desc Verify sequence button4->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0019 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0019 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2000
     * @tc.name testSeqPair0020
     * @tc.desc Verify sequence button4->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0020 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0020 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2100
     * @tc.name testSeqPair0021
     * @tc.desc Verify sequence button5->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0021 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0021 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2200
     * @tc.name testSeqPair0022
     * @tc.desc Verify sequence button5->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0022 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0022 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2300
     * @tc.name testSeqPair0023
     * @tc.desc Verify sequence button5->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0023 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0023 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2400
     * @tc.name testSeqPair0024
     * @tc.desc Verify sequence button5->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0024 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0024 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2500
     * @tc.name testSeqPair0025
     * @tc.desc Verify sequence button5->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqPair0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0025 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqPair0025 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2600
     * @tc.name testSeqTriple0026
     * @tc.desc Verify sequence button1->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0026 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button2', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0026 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2700
     * @tc.name testSeqTriple0027
     * @tc.desc Verify sequence button1->button2->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0027 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button2', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0027 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2800
     * @tc.name testSeqTriple0028
     * @tc.desc Verify sequence button1->button2->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0028 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button2', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0028 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_2900
     * @tc.name testSeqTriple0029
     * @tc.desc Verify sequence button1->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0029 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button3', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0029 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3000
     * @tc.name testSeqTriple0030
     * @tc.desc Verify sequence button1->button3->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0030 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button3', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0030 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3100
     * @tc.name testSeqTriple0031
     * @tc.desc Verify sequence button1->button3->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0031 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button3', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0031 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3200
     * @tc.name testSeqTriple0032
     * @tc.desc Verify sequence button1->button4->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0032 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button4', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0032 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3300
     * @tc.name testSeqTriple0033
     * @tc.desc Verify sequence button1->button4->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0033 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button4', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0033 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3400
     * @tc.name testSeqTriple0034
     * @tc.desc Verify sequence button1->button4->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0034 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button4', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0034 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3500
     * @tc.name testSeqTriple0035
     * @tc.desc Verify sequence button1->button5->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0035 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button5', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0035 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3600
     * @tc.name testSeqTriple0036
     * @tc.desc Verify sequence button1->button5->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0036 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button5', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0036 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3700
     * @tc.name testSeqTriple0037
     * @tc.desc Verify sequence button1->button5->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0037 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button1', 'button5', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0037 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3800
     * @tc.name testSeqTriple0038
     * @tc.desc Verify sequence button2->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0038 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button1', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0038 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_3900
     * @tc.name testSeqTriple0039
     * @tc.desc Verify sequence button2->button1->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0039 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button1', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0039 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4000
     * @tc.name testSeqTriple0040
     * @tc.desc Verify sequence button2->button1->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0040 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button1', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0040 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4100
     * @tc.name testSeqTriple0041
     * @tc.desc Verify sequence button2->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0041 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button3', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0041 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4200
     * @tc.name testSeqTriple0042
     * @tc.desc Verify sequence button2->button3->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0042 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button3', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0042 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4300
     * @tc.name testSeqTriple0043
     * @tc.desc Verify sequence button2->button3->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0043 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button3', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0043 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4400
     * @tc.name testSeqTriple0044
     * @tc.desc Verify sequence button2->button4->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0044 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button4', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0044 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4500
     * @tc.name testSeqTriple0045
     * @tc.desc Verify sequence button2->button4->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0045 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button4', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0045 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4600
     * @tc.name testSeqTriple0046
     * @tc.desc Verify sequence button2->button4->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0046 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button4', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0046 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4700
     * @tc.name testSeqTriple0047
     * @tc.desc Verify sequence button2->button5->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0047 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button5', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0047 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4800
     * @tc.name testSeqTriple0048
     * @tc.desc Verify sequence button2->button5->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0048 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button5', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0048 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_4900
     * @tc.name testSeqTriple0049
     * @tc.desc Verify sequence button2->button5->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0049 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button2', 'button5', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0049 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5000
     * @tc.name testSeqTriple0050
     * @tc.desc Verify sequence button3->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0050 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button1', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0050 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5100
     * @tc.name testSeqTriple0051
     * @tc.desc Verify sequence button3->button1->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0051 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button1', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0051 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5200
     * @tc.name testSeqTriple0052
     * @tc.desc Verify sequence button3->button1->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0052 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button1', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0052 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5300
     * @tc.name testSeqTriple0053
     * @tc.desc Verify sequence button3->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0053 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button2', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0053 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5400
     * @tc.name testSeqTriple0054
     * @tc.desc Verify sequence button3->button2->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0054 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button2', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0054 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5500
     * @tc.name testSeqTriple0055
     * @tc.desc Verify sequence button3->button2->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0055 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button2', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0055 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5600
     * @tc.name testSeqTriple0056
     * @tc.desc Verify sequence button3->button4->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0056 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button4', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0056 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5700
     * @tc.name testSeqTriple0057
     * @tc.desc Verify sequence button3->button4->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0057 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button4', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0057 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5800
     * @tc.name testSeqTriple0058
     * @tc.desc Verify sequence button3->button4->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0058 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button4', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0058 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_5900
     * @tc.name testSeqTriple0059
     * @tc.desc Verify sequence button3->button5->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0059 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button5', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0059 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6000
     * @tc.name testSeqTriple0060
     * @tc.desc Verify sequence button3->button5->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0060 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button5', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0060 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6100
     * @tc.name testSeqTriple0061
     * @tc.desc Verify sequence button3->button5->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0061 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button3', 'button5', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0061 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6200
     * @tc.name testSeqTriple0062
     * @tc.desc Verify sequence button4->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0062 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button1', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0062 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6300
     * @tc.name testSeqTriple0063
     * @tc.desc Verify sequence button4->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0063 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button1', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0063 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6400
     * @tc.name testSeqTriple0064
     * @tc.desc Verify sequence button4->button1->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0064 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button1', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0064 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6500
     * @tc.name testSeqTriple0065
     * @tc.desc Verify sequence button4->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0065 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button2', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0065 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6600
     * @tc.name testSeqTriple0066
     * @tc.desc Verify sequence button4->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0066 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button2', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0066 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6700
     * @tc.name testSeqTriple0067
     * @tc.desc Verify sequence button4->button2->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0067 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button2', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0067 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6800
     * @tc.name testSeqTriple0068
     * @tc.desc Verify sequence button4->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0068 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button3', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0068 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_6900
     * @tc.name testSeqTriple0069
     * @tc.desc Verify sequence button4->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0069 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button3', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0069 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7000
     * @tc.name testSeqTriple0070
     * @tc.desc Verify sequence button4->button3->button5 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0070 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button3', 'button5'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0070 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7100
     * @tc.name testSeqTriple0071
     * @tc.desc Verify sequence button4->button5->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0071 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button5', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0071 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7200
     * @tc.name testSeqTriple0072
     * @tc.desc Verify sequence button4->button5->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0072 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button5', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0072 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7300
     * @tc.name testSeqTriple0073
     * @tc.desc Verify sequence button4->button5->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0073 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button4', 'button5', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0073 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7400
     * @tc.name testSeqTriple0074
     * @tc.desc Verify sequence button5->button1->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0074 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button1', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0074 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7500
     * @tc.name testSeqTriple0075
     * @tc.desc Verify sequence button5->button1->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0075 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button1', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0075 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7600
     * @tc.name testSeqTriple0076
     * @tc.desc Verify sequence button5->button1->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0076 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button1', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0076 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7700
     * @tc.name testSeqTriple0077
     * @tc.desc Verify sequence button5->button2->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0077 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button2', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0077 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7800
     * @tc.name testSeqTriple0078
     * @tc.desc Verify sequence button5->button2->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0078 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button2', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0078 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_7900
     * @tc.name testSeqTriple0079
     * @tc.desc Verify sequence button5->button2->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0079 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button2', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0079 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8000
     * @tc.name testSeqTriple0080
     * @tc.desc Verify sequence button5->button3->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0080 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button3', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0080 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8100
     * @tc.name testSeqTriple0081
     * @tc.desc Verify sequence button5->button3->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0081 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button3', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0081 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8200
     * @tc.name testSeqTriple0082
     * @tc.desc Verify sequence button5->button3->button4 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0082 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button3', 'button4'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0082 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8300
     * @tc.name testSeqTriple0083
     * @tc.desc Verify sequence button5->button4->button1 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0083 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button4', 'button1'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0083 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8400
     * @tc.name testSeqTriple0084
     * @tc.desc Verify sequence button5->button4->button2 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0084 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button4', 'button2'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0084 end');
    });

    /**
     * @tc.number SUB_MOTION_SEQ_8500
     * @tc.name testSeqTriple0085
     * @tc.desc Verify sequence button5->button4->button3 ends on the last action text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testSeqTriple0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0085 begin');
      const driver: Driver = getDriver();
      expect(await clickSequence(driver, ['button5', 'button4', 'button3'])).assertTrue();
      expect(await readShowText(driver)).assertEqual(EXPECTED_TEXT[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSeqTriple0085 end');
    });
  });
}
