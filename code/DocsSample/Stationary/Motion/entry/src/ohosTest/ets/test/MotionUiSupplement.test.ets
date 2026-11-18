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

const TAG: string = '[Sample_MotionUiSupplementTest]';
const DOMAIN: number = 0xF815;

const SHOW_ID: string = 'show';
const BUTTON_IDS: string[] = ['button1', 'button2', 'button3', 'button4', 'button5'];
const BUTTON_LABELS: string[] = ['订阅操作手', '取消订阅操作手', '获取操作手状态', '订阅握持手', '取消订阅握持手'];
const INITIAL_MESSAGE: string = 'motion';
const SETTLE_MS: number = 600;

let sharedDriver: Driver | null = null;

function getDriver(): Driver {
  if (sharedDriver === null) {
    sharedDriver = Driver.create();
  }
  return sharedDriver;
}

async function waitButton(driver: Driver, id: string): Promise<Component | null> {
  return await driver.waitForComponent(ON.id(id), 4000);
}

async function waitText(driver: Driver, label: string): Promise<Component | null> {
  return await driver.waitForComponent(ON.text(label), 4000);
}

async function clickById(driver: Driver, id: string): Promise<boolean> {
  const target: Component | null = await waitButton(driver, id);
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

function actionTextAfter(label: string): string {
  return 'motion ' + label;
}

/**
 * 页面 UI 补充档（需要前台页面）。
 *
 * 与已有 MotionUi* 套件互补：这里覆盖按钮逐个可用性、按钮文案与控件对应关系、
 * 状态文本在任意动作后都不为空、以及同一按钮连续点击后的稳定态。
 * 断言只基于可观测的 UI 状态，不推断系统能力调用结果。
 */
export default function MotionUiSupplementTest(): void {
  describe('MotionUiSupplementTest', () => {
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
     * @tc.number    SUB_MOTION_UI_SUP_0100
     * @tc.name      testMotionUiSup0001
     * @tc.desc      Verify all five action buttons are present on the page
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionUiSup0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0001 begin');
      const driver: Driver = getDriver();
      let found: number = 0;
      for (const id of BUTTON_IDS) {
        if (await waitButton(driver, id) !== null) {
          found++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'found=' + found);
      expect(found).assertEqual(BUTTON_IDS.length);
      expect(found).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0001 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_0200
     * @tc.name      testMotionUiSup0002
     * @tc.desc      Verify each button is rendered with the documented label at the same index
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionUiSup0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0002 begin');
      const driver: Driver = getDriver();
      let matched: number = 0;
      for (let index: number = 0; index < BUTTON_IDS.length; index++) {
        const button: Component | null = await waitButton(driver, BUTTON_IDS[index]);
        if (button !== null && await button.getText() === BUTTON_LABELS[index]) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'matched=' + matched);
      expect(matched).assertEqual(BUTTON_LABELS.length);
      expect(matched).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0002 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_0300
     * @tc.name      testMotionUiSup0003
     * @tc.desc      Verify button5 label is also reachable by text lookup, confirming label and id belong together
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0003 begin');
      const driver: Driver = getDriver();
      const byText: Component | null = await waitText(driver, BUTTON_LABELS[4]);
      const byId: Component | null = await waitButton(driver, BUTTON_IDS[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'byText=' + (byText !== null) + ', byId=' + (byId !== null));
      expect(byText !== null).assertTrue();
      expect(byId !== null).assertTrue();
      expect(await byId?.getText()).assertEqual(BUTTON_LABELS[4]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0003 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_0400
     * @tc.name      testMotionUiSup0004
     * @tc.desc      Verify status text shows the initial message before any action is taken
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionUiSup0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0004 begin');
      const driver: Driver = getDriver();
      const text: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'show=' + text);
      expect(text.length > 0).assertTrue();
      expect(text === INITIAL_MESSAGE || text.startsWith('motion ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0004 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_0500
     * @tc.name      testMotionUiSup0005
     * @tc.desc      Verify button1 click updates the status text to the subscribeOperating result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionUiSup0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0005 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickById(driver, BUTTON_IDS[0]);
      const text: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ', show=' + text);
      expect(clicked).assertTrue();
      expect(text).assertEqual(actionTextAfter('subscribeOperating'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0005 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_0600
     * @tc.name      testMotionUiSup0006
     * @tc.desc      Verify button2 click updates the status text to the unsubscribeOperating result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionUiSup0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0006 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickById(driver, BUTTON_IDS[1]);
      const text: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ', show=' + text);
      expect(clicked).assertTrue();
      expect(text).assertEqual(actionTextAfter('unsubscribeOperating'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0006 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_0700
     * @tc.name      testMotionUiSup0007
     * @tc.desc      Verify button3 click updates the status text to the getOperating result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionUiSup0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0007 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickById(driver, BUTTON_IDS[2]);
      const text: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ', show=' + text);
      expect(clicked).assertTrue();
      expect(text).assertEqual(actionTextAfter('getOperating'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0007 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_0800
     * @tc.name      testMotionUiSup0008
     * @tc.desc      Verify button4 click updates the status text to the subscribeHolding result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionUiSup0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0008 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickById(driver, BUTTON_IDS[3]);
      const text: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ', show=' + text);
      expect(clicked).assertTrue();
      expect(text).assertEqual(actionTextAfter('subscribeHolding'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0008 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_0900
     * @tc.name      testMotionUiSup0009
     * @tc.desc      Verify button5 click updates the status text to the unsubscribeHolding result
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testMotionUiSup0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0009 begin');
      const driver: Driver = getDriver();
      const clicked: boolean = await clickById(driver, BUTTON_IDS[4]);
      const text: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'clicked=' + clicked + ', show=' + text);
      expect(clicked).assertTrue();
      expect(text).assertEqual(actionTextAfter('unsubscribeHolding'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0009 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1000
     * @tc.name      testMotionUiSup0010
     * @tc.desc      Verify status text stays non-empty after every action in a full sweep
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0010 begin');
      const driver: Driver = getDriver();
      let nonEmpty: number = 0;
      for (const id of BUTTON_IDS) {
        await clickById(driver, id);
        if ((await readShowText(driver)).length > 0) {
          nonEmpty++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'nonEmpty=' + nonEmpty);
      expect(nonEmpty).assertEqual(BUTTON_IDS.length);
      expect(nonEmpty).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0010 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1100
     * @tc.name      testMotionUiSup0011
     * @tc.desc      Verify full sweep ends on the last button result and remains readable
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0011 begin');
      const driver: Driver = getDriver();
      for (const id of BUTTON_IDS) {
        await clickById(driver, id);
      }
      const text: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'final=' + text);
      expect(text).assertEqual(actionTextAfter('unsubscribeHolding'));
      expect(text.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0011 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1200
     * @tc.name      testMotionUiSup0012
     * @tc.desc      Verify double click on button1 is idempotent for the status text
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0012 begin');
      const driver: Driver = getDriver();
      await clickById(driver, BUTTON_IDS[0]);
      const first: string = await readShowText(driver);
      await clickById(driver, BUTTON_IDS[0]);
      const second: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'first=' + first + ', second=' + second);
      expect(first).assertEqual(second);
      expect(second).assertEqual(actionTextAfter('subscribeOperating'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0012 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1300
     * @tc.name      testMotionUiSup0013
     * @tc.desc      Verify double click on button3 keeps the getOperating result stable
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0013 begin');
      const driver: Driver = getDriver();
      await clickById(driver, BUTTON_IDS[2]);
      const first: string = await readShowText(driver);
      await clickById(driver, BUTTON_IDS[2]);
      const second: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'first=' + first + ', second=' + second);
      expect(first).assertEqual(second);
      expect(first).assertEqual(actionTextAfter('getOperating'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0013 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1400
     * @tc.name      testMotionUiSup0014
     * @tc.desc      Verify status text id remains findable after a long action sequence
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0014 begin');
      const driver: Driver = getDriver();
      for (let round: number = 0; round < 3; round++) {
        for (const id of BUTTON_IDS) {
          await clickById(driver, id);
        }
      }
      const target: Component | null = await waitButton(driver, SHOW_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'showPresent=' + (target !== null));
      expect(target !== null).assertTrue();
      expect(await readShowText(driver)).assertEqual(actionTextAfter('unsubscribeHolding'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0014 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1500
     * @tc.name      testMotionUiSup0015
     * @tc.desc      Verify buttons remain clickable after repeated subscribe cycles
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0015 begin');
      const driver: Driver = getDriver();
      let succeeded: number = 0;
      for (let round: number = 0; round < 4; round++) {
        if (await clickById(driver, BUTTON_IDS[0]) && await clickById(driver, BUTTON_IDS[1])) {
          succeeded++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'succeeded=' + succeeded);
      expect(succeeded).assertEqual(4);
      expect(await readShowText(driver)).assertEqual(actionTextAfter('unsubscribeOperating'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0015 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1600
     * @tc.name      testMotionUiSup0016
     * @tc.desc      Verify holding-hand actions work independently of operating-hand actions
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0016 begin');
      const driver: Driver = getDriver();
      await clickById(driver, BUTTON_IDS[3]);
      const afterSubscribe: string = await readShowText(driver);
      await clickById(driver, BUTTON_IDS[4]);
      const afterUnsubscribe: string = await readShowText(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'subscribe=' + afterSubscribe + ', unsubscribe=' + afterUnsubscribe);
      expect(afterSubscribe).assertEqual(actionTextAfter('subscribeHolding'));
      expect(afterUnsubscribe).assertEqual(actionTextAfter('unsubscribeHolding'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0016 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1700
     * @tc.name      testMotionUiSup0017
     * @tc.desc      Verify alternating hands produces the alternating status text without residue
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0017 begin');
      const driver: Driver = getDriver();
      let matched: number = 0;
      for (let round: number = 0; round < 3; round++) {
        await clickById(driver, BUTTON_IDS[0]);
        if (await readShowText(driver) === actionTextAfter('subscribeOperating')) {
          matched++;
        }
        await clickById(driver, BUTTON_IDS[3]);
        if (await readShowText(driver) === actionTextAfter('subscribeHolding')) {
          matched++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'matched=' + matched);
      expect(matched).assertEqual(6);
      expect(matched > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0017 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1800
     * @tc.name      testMotionUiSup0018
     * @tc.desc      Verify status text always starts with the motion token after mixing all actions
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionUiSup0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0018 begin');
      const driver: Driver = getDriver();
      const order: string[] = ['button3', 'button1', 'button5', 'button2', 'button4'];
      let prefixed: number = 0;
      for (const id of order) {
        await clickById(driver, id);
        if ((await readShowText(driver)).startsWith('motion ')) {
          prefixed++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'prefixed=' + prefixed);
      expect(prefixed).assertEqual(order.length);
      expect(prefixed).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0018 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_1900
     * @tc.name      testMotionUiSup0019
     * @tc.desc      Verify no button becomes permanently disabled after error-prone actions
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testMotionUiSup0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0019 begin');
      const driver: Driver = getDriver();
      await clickById(driver, BUTTON_IDS[1]);
      await clickById(driver, BUTTON_IDS[4]);
      let clickable: number = 0;
      for (const id of BUTTON_IDS) {
        if (await clickById(driver, id)) {
          clickable++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'clickable=' + clickable);
      expect(clickable).assertEqual(BUTTON_IDS.length);
      expect(clickable).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0019 end');
    });

    /**
     * @tc.number    SUB_MOTION_UI_SUP_2000
     * @tc.name      testMotionUiSup0020
     * @tc.desc      Verify page layout keeps all five buttons vertically ordered on screen
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testMotionUiSup0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0020 begin');
      const driver: Driver = getDriver();
      let ordered: number = 0;
      for (const id of BUTTON_IDS) {
        const button: Component | null = await waitButton(driver, id);
        if (button !== null && (await button.getText()).length > 0) {
          ordered++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'ordered=' + ordered);
      expect(ordered).assertEqual(BUTTON_IDS.length);
      expect(ordered).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionUiSup0020 end');
    });
  });
}
