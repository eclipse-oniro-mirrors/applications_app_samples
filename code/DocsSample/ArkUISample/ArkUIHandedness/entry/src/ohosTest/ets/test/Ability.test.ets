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

import { describe, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ArkUIHandedness]';
const BUNDLE: string = 'ArkUIHandedness_';
const HALF_SECOND: number = 500;
const ONE_SECOND: number = 1000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

async function ensureOnIndex(driver: Driver): Promise<void> {
  // 确保当前位于主界面，若前序用例残留弹窗或页面，通过系统返回键逐层退出
  for (let i = 0; i < 4; i++) {
    const entryButton = await driver.findComponent(ON.id('entry_follow_anchor_dialog'));
    if (entryButton !== null) {
      return;
    }
    await driver.pressBack();
    await sleep(HALF_SECOND);
  }
}

export default function abilityTest() {
  describe('ArkUIHandednessTest', () => {
    /**
     * 启动应用，校验EntryAbility正常拉起
     */
    it(BUNDLE + 'StartAbility_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(ONE_SECOND);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      // 校验当前Ability名称
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, ability name: ' + ability.context.abilityInfo.name);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, end');
      done();
    });

    /**
     * 进入指向性跟手AlertDialog页面，点击按钮后弹窗弹出，点击确定按钮关闭弹窗，系统返回键回到主界面
     */
    it(BUNDLE + 'FollowAnchorDialog_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorDialog_001, begin');
      const driver = Driver.create();
      await driver.delayMs(ONE_SECOND);
      await ensureOnIndex(driver);
      const entryButton = await driver.findComponent(ON.id('entry_follow_anchor_dialog'));
      // 校验主界面入口按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorDialog_001, assert entry button exists');
      expect(entryButton !== null).assertTrue();
      await entryButton!.click();
      await driver.delayMs(ONE_SECOND);
      const alertDialogButton = await driver.findComponent(ON.id('anchor_dialog_btn'));
      // 校验AlertDialog按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorDialog_001, assert alert dialog button exists');
      expect(alertDialogButton !== null).assertTrue();
      await alertDialogButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 点击确定按钮关闭弹窗
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorDialog_001, try to close dialog');
      const confirmButton = await driver.findComponent(ON.text('确定'));
      expect(confirmButton !== null).assertTrue();
      await confirmButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 系统返回键回到主界面
      await driver.pressBack();
      await driver.delayMs(ONE_SECOND);
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorDialog_001, end');
      done();
    });

    /**
     * 进入指向性跟手bindSheet页面，点击左侧按钮后半模态弹出，系统返回键依次关闭半模态并回到主界面
     */
    it(BUNDLE + 'FollowAnchorSheet_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorSheet_001, begin');
      const driver = Driver.create();
      await driver.delayMs(ONE_SECOND);
      await ensureOnIndex(driver);
      const entryButton = await driver.findComponent(ON.id('entry_follow_anchor_sheet'));
      // 校验主界面入口按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorSheet_001, assert entry button exists');
      expect(entryButton !== null).assertTrue();
      await entryButton!.click();
      await driver.delayMs(ONE_SECOND);
      const sheetButton = await driver.findComponent(ON.id('anchor_sheet_left'));
      // 校验sheet按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorSheet_001, assert sheet button exists');
      expect(sheetButton !== null).assertTrue();
      await sheetButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 第一次系统返回键关闭半模态
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorSheet_001, try to close sheet');
      await driver.pressBack();
      await sleep(HALF_SECOND);
      // 第二次系统返回键回到主界面
      await driver.pressBack();
      await driver.delayMs(ONE_SECOND);
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowAnchorSheet_001, end');
      done();
    });

    /**
     * 进入智感握姿跟手AlertDialog页面，点击按钮后弹窗弹出，点击取消按钮关闭弹窗，系统返回键回到主界面
     */
    it(BUNDLE + 'FollowGripHandDialog_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandDialog_001, begin');
      const driver = Driver.create();
      await driver.delayMs(ONE_SECOND);
      await ensureOnIndex(driver);
      const entryButton = await driver.findComponent(ON.id('entry_follow_grip_hand_dialog'));
      // 校验主界面入口按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandDialog_001, assert entry button exists');
      expect(entryButton !== null).assertTrue();
      await entryButton!.click();
      await driver.delayMs(ONE_SECOND);
      const alertDialogButton = await driver.findComponent(ON.id('grip_hand_dialog_btn'));
      // 校验AlertDialog按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandDialog_001, assert alert dialog button exists');
      expect(alertDialogButton !== null).assertTrue();
      await alertDialogButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 点击取消按钮关闭弹窗
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandDialog_001, try to close dialog');
      const cancelButton = await driver.findComponent(ON.text('取消'));
      expect(cancelButton !== null).assertTrue();
      await cancelButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 系统返回键回到主界面
      await driver.pressBack();
      await driver.delayMs(ONE_SECOND);
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandDialog_001, end');
      done();
    });

    /**
     * 进入智感握姿跟手bindSheet页面，点击右侧按钮后半模态弹出，系统返回键依次关闭半模态并回到主界面
     */
    it(BUNDLE + 'FollowGripHandSheet_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandSheet_001, begin');
      const driver = Driver.create();
      await driver.delayMs(ONE_SECOND);
      await ensureOnIndex(driver);
      const entryButton = await driver.findComponent(ON.id('entry_follow_grip_hand_sheet'));
      // 校验主界面入口按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandSheet_001, assert entry button exists');
      expect(entryButton !== null).assertTrue();
      await entryButton!.click();
      await driver.delayMs(ONE_SECOND);
      const sheetButton = await driver.findComponent(ON.id('grip_hand_sheet_right'));
      // 校验sheet按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandSheet_001, assert sheet button exists');
      expect(sheetButton !== null).assertTrue();
      await sheetButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 第一次系统返回键关闭半模态
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandSheet_001, try to close sheet');
      await driver.pressBack();
      await sleep(HALF_SECOND);
      // 第二次系统返回键回到主界面
      await driver.pressBack();
      await driver.delayMs(ONE_SECOND);
      hilog.info(DOMAIN, TAG, BUNDLE + 'FollowGripHandSheet_001, end');
      done();
    });

    /**
     * 进入不跟手AlertDialog页面，点击按钮后弹窗弹出，点击确定按钮关闭弹窗，系统返回键回到主界面
     */
    it(BUNDLE + 'NoFollowDialog_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowDialog_001, begin');
      const driver = Driver.create();
      await driver.delayMs(ONE_SECOND);
      await ensureOnIndex(driver);
      const entryButton = await driver.findComponent(ON.id('entry_no_follow_dialog'));
      // 校验主界面入口按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowDialog_001, assert entry button exists');
      expect(entryButton !== null).assertTrue();
      await entryButton!.click();
      await driver.delayMs(ONE_SECOND);
      const alertDialogButton = await driver.findComponent(ON.id('no_follow_dialog_btn'));
      // 校验AlertDialog按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowDialog_001, assert alert dialog button exists');
      expect(alertDialogButton !== null).assertTrue();
      await alertDialogButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 点击确定按钮关闭弹窗
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowDialog_001, try to close dialog');
      const confirmButton = await driver.findComponent(ON.text('确定'));
      expect(confirmButton !== null).assertTrue();
      await confirmButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 系统返回键回到主界面
      await driver.pressBack();
      await driver.delayMs(ONE_SECOND);
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowDialog_001, end');
      done();
    });

    /**
     * 进入不跟手bindSheet页面，点击左侧按钮后半模态弹出，系统返回键依次关闭半模态并回到主界面
     */
    it(BUNDLE + 'NoFollowSheet_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowSheet_001, begin');
      const driver = Driver.create();
      await driver.delayMs(ONE_SECOND);
      await ensureOnIndex(driver);
      const entryButton = await driver.findComponent(ON.id('entry_no_follow_sheet'));
      // 校验主界面入口按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowSheet_001, assert entry button exists');
      expect(entryButton !== null).assertTrue();
      await entryButton!.click();
      await driver.delayMs(ONE_SECOND);
      const sheetButton = await driver.findComponent(ON.id('no_follow_sheet_left'));
      // 校验sheet按钮存在
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowSheet_001, assert sheet button exists');
      expect(sheetButton !== null).assertTrue();
      await sheetButton!.click();
      await driver.delayMs(ONE_SECOND);
      // 第一次系统返回键关闭半模态
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowSheet_001, try to close sheet');
      await driver.pressBack();
      await sleep(HALF_SECOND);
      // 第二次系统返回键回到主界面
      await driver.pressBack();
      await driver.delayMs(ONE_SECOND);
      hilog.info(DOMAIN, TAG, BUNDLE + 'NoFollowSheet_001, end');
      done();
    });
  });
}
