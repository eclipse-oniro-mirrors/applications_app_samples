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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const TAG: string = '[Sample_MotionStateTransitionTest]';
const DOMAIN: number = 0xF815;

const SHOW_ID: string = 'show';
const BUTTON_IDS: string[] = ['button1', 'button2', 'button3', 'button4', 'button5'];
const RESULT_TEXTS: string[] = [
  'motion subscribeOperating',
  'motion unsubscribeOperating',
  'motion getOperating',
  'motion subscribeHolding',
  'motion unsubscribeHolding'
];
const INITIAL_MESSAGE: string = 'motion';
const SETTLE_MS: number = 600;

let sharedDriver: Driver | null = null;

function getDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

async function clickButton(driver: Driver, id: string): Promise<boolean> {
  const button: Component | null = await driver.waitForComponent(ON.id(id), 4000);
  if (button === null) {
    return false;
  }
  await button.click();
  await driver.delayMs(SETTLE_MS);
  return true;
}

async function readMessage(driver: Driver): Promise<string> {
  const text: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 3000);
  return text === null ? '' : await text.getText();
}

async function clickSequence(driver: Driver, ids: string[]): Promise<void> {
  for (const id of ids) {
    await clickButton(driver, id);
  }
}

/**
 * 状态迁移矩阵（需要前台页面）。
 *
 * 按钮的动作在成功与异常分支下写入同一段文案，因此“点击后展示文本”是
 * 一个与设备能力无关的稳定观测点。本套件用 5 个动作的不同排列覆盖
 * 前置状态 -> 动作 -> 期望文案的迁移关系，并校验反复迁移后页面仍可用。
 */
export default function MotionStateTransitionTest(): void {
  describe('MotionStateTransitionTest', () => {
    beforeAll(async () => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const want: Want = {
        bundleName: abilityDelegatorRegistry.getArguments().bundleName,
        abilityName: 'EntryAbility'
      };
      try {
        await delegator.startAbility(want);
      } catch (err) {
        hilog.error(DOMAIN, TAG, 'startAbility failed: ' + JSON.stringify(err));
      }
      const driver: Driver = getDriver();
      await driver.delayMs(1000);
      await driver.waitForComponent(ON.id(BUTTON_IDS[0]), 8000);
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0100
     * @tc.name      testMotionState0001
     * @tc.desc      Verify initial page shows the default message before any action
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0001 begin');
      const driver: Driver = getDriver();
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message.length > 0).assertTrue();
      expect(typeof message).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0001 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0200
     * @tc.name      testMotionState0002
     * @tc.desc      Verify single step subscribe-operating migrates text to its result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0002 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickButton(driver, BUTTON_IDS[0]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ' message=' + message);
      expect(clicked).assertTrue();
      expect(message).assertEqual(RESULT_TEXTS[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0002 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0300
     * @tc.name      testMotionState0003
     * @tc.desc      Verify single step unsubscribe-operating migrates text to its result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0003 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickButton(driver, BUTTON_IDS[1]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ' message=' + message);
      expect(clicked).assertTrue();
      expect(message).assertEqual(RESULT_TEXTS[1]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0003 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0400
     * @tc.name      testMotionState0004
     * @tc.desc      Verify single step get-operating migrates text to its result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0004 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickButton(driver, BUTTON_IDS[2]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ' message=' + message);
      expect(clicked).assertTrue();
      expect(message).assertEqual(RESULT_TEXTS[2]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0004 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0500
     * @tc.name      testMotionState0005
     * @tc.desc      Verify single step subscribe-holding migrates text to its result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0005 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickButton(driver, BUTTON_IDS[3]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ' message=' + message);
      expect(clicked).assertTrue();
      expect(message).assertEqual(RESULT_TEXTS[3]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0005 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0600
     * @tc.name      testMotionState0006
     * @tc.desc      Verify single step unsubscribe-holding migrates text to its result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0006 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickButton(driver, BUTTON_IDS[4]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ' message=' + message);
      expect(clicked).assertTrue();
      expect(message).assertEqual(RESULT_TEXTS[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0006 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0700
     * @tc.name      testMotionState0007
     * @tc.desc      Verify subscribe then unsubscribe operating leaves unsubscribe text observable
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0007 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[0], BUTTON_IDS[1]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[1]);
      expect(message !== RESULT_TEXTS[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0007 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0800
     * @tc.name      testMotionState0008
     * @tc.desc      Verify unsubscribe then subscribe operating leaves subscribe text observable
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0008 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[1], BUTTON_IDS[0]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[0]);
      expect(message !== RESULT_TEXTS[1]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0008 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_0900
     * @tc.name      testMotionState0009
     * @tc.desc      Verify subscribe then unsubscribe holding leaves unsubscribe text observable
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0009 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[3], BUTTON_IDS[4]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[4]);
      expect(message !== RESULT_TEXTS[3]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0009 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1000
     * @tc.name      testMotionState0010
     * @tc.desc      Verify unsubscribe then subscribe holding leaves subscribe text observable
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0010 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[4], BUTTON_IDS[3]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[3]);
      expect(message !== RESULT_TEXTS[4]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0010 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1100
     * @tc.name      testMotionState0011
     * @tc.desc      Verify operating then holding subscribe keeps holding text as the tail state
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0011 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[0], BUTTON_IDS[3]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[3]);
      expect(message.startsWith('motion ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0011 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1200
     * @tc.name      testMotionState0012
     * @tc.desc      Verify holding then operating subscribe keeps operating text as the tail state
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0012 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[3], BUTTON_IDS[0]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[0]);
      expect(message.endsWith('subscribeOperating')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0012 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1300
     * @tc.name      testMotionState0013
     * @tc.desc      Verify full forward sweep ends on the last action text
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0013 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, BUTTON_IDS);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[RESULT_TEXTS.length - 1]);
      expect(message).assertEqual('motion unsubscribeHolding');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0013 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1400
     * @tc.name      testMotionState0014
     * @tc.desc      Verify full reverse sweep ends on the first action text
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0014 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[4], BUTTON_IDS[3], BUTTON_IDS[2], BUTTON_IDS[1], BUTTON_IDS[0]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[0]);
      expect(message).assertEqual('motion subscribeOperating');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0014 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1500
     * @tc.name      testMotionState0015
     * @tc.desc      Verify subscribe/unsubscribe pair repeated three times stays on unsubscribe text
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0015 begin');
      const driver: Driver = getDriver();
      for (let i = 0; i < 3; i++) {
        await clickButton(driver, BUTTON_IDS[0]);
        await clickButton(driver, BUTTON_IDS[1]);
      }
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[1]);
      expect(message).assertEqual('motion unsubscribeOperating');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0015 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1600
     * @tc.name      testMotionState0016
     * @tc.desc      Verify query interleaved with subscribes does not corrupt the tail state
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0016 begin');
      const driver: Driver = getDriver();
      await clickButton(driver, BUTTON_IDS[0]);
      await clickButton(driver, BUTTON_IDS[2]);
      await clickButton(driver, BUTTON_IDS[3]);
      await clickButton(driver, BUTTON_IDS[2]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[2]);
      expect(message).assertEqual('motion getOperating');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0016 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1700
     * @tc.name      testMotionState0017
     * @tc.desc      Verify every action text after a mixed sequence matches one documented tail
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0017 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[3], BUTTON_IDS[1], BUTTON_IDS[0], BUTTON_IDS[4]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(RESULT_TEXTS.indexOf(message) >= 0).assertTrue();
      expect(message).assertEqual(RESULT_TEXTS[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0017 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1800
     * @tc.name      testMotionState0018
     * @tc.desc      Verify the message never regresses to the initial default after actions
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0018 begin');
      const driver: Driver = getDriver();
      let regressed: number = 0;
      for (const id of BUTTON_IDS) {
        await clickButton(driver, id);
        const message: string = await readMessage(driver);
        if (message === INITIAL_MESSAGE) {
          regressed++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'regressed=' + regressed);
      expect(regressed).assertEqual(0);
      expect(regressed < BUTTON_IDS.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0018 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_1900
     * @tc.name      testMotionState0019
     * @tc.desc      Verify the message text stays within the documented result set after each action
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0019 begin');
      const driver: Driver = getDriver();
      let matched: number = 0;
      for (const id of BUTTON_IDS) {
        await clickButton(driver, id);
        const message: string = await readMessage(driver);
        if (RESULT_TEXTS.indexOf(message) >= 0) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'matched=' + matched);
      expect(matched).assertEqual(BUTTON_IDS.length);
      expect(matched).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0019 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_2000
     * @tc.name      testMotionState0020
     * @tc.desc      Verify alternating operating and holding subscribe pairs keeps a valid tail
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0020 begin');
      const driver: Driver = getDriver();
      await clickSequence(driver, [BUTTON_IDS[0], BUTTON_IDS[3], BUTTON_IDS[1], BUTTON_IDS[4], BUTTON_IDS[3]]);
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'message=' + message);
      expect(message).assertEqual(RESULT_TEXTS[3]);
      expect(message.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0020 end');
    });

    /**
     * @tc.number    SUB_MOTION_STATE_2100
     * @tc.name      testMotionState0021
     * @tc.desc      Verify repeated unsubscribe on both events keeps the page responsive
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0021 begin');
      const driver: Driver = getDriver();
      let clicked: number = 0;
      for (let i = 0; i < 3; i++) {
        if (await clickButton(driver, BUTTON_IDS[1])) {
          clicked++;
        }
        if (await clickButton(driver, BUTTON_IDS[4])) {
          clicked++;
        }
      }
      const message: string = await readMessage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ' message=' + message);
      expect(clicked).assertEqual(6);
      expect(message).assertEqual(RESULT_TEXTS[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionState0021 end');
    });
  });
}
