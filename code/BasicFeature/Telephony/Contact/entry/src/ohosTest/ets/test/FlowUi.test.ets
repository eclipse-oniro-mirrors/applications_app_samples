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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Component, Driver, ON } from '@ohos.UiTest';
import { resourceManager } from '@kit.LocalizationKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inputMethod from '@ohos.inputMethod';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Contact]';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

async function getResourceString(resource: Resource): Promise<string> {
  let resMgr: resourceManager.ResourceManager = abilityDelegator.getAppContext().resourceManager;
  let text: string = await resMgr.getStringValue(resource);
  return text;
}

async function launchHome(driver: Driver): Promise<void> {
  await abilityDelegator.startAbility({
    bundleName: 'ohos.samples.contact',
    abilityName: 'EntryAbility'
  });
  await driver.delayMs(1000);
  try {
    let allow: Component = await driver.findComponent(ON.text(await getResourceString($r('app.string.allow'))));
    await allow.click();
    await driver.delayMs(800);
  } catch (e) {
    // 权限已授予，无授权弹窗
  }
  // 上次用例失败可能停留在子页面或非联系人 tab：先处理权限弹窗，其次点回 tab1，最后按返回键
  for (let i = 0; i < 5; i++) {
    if (await countById(driver, 'add') > 0) {
      break;
    }
    try {
      let allow: Component = await driver.findComponent(ON.text(await getResourceString($r('app.string.allow'))));
      await allow.click();
      await driver.delayMs(800);
      continue;
    } catch (e) {
      // 无授权弹窗，继续恢复
    }
    if (await countById(driver, 'tab1') > 0) {
      let tab1: Component = await driver.findComponent(ON.id('tab1'));
      await tab1.click();
      await driver.delayMs(500);
      continue;
    }
    try {
      await driver.pressBack();
      await driver.delayMs(500);
    } catch (e) {
      break;
    }
  }
  await driver.assertComponentExist(ON.id('add'));
  await driver.assertComponentExist(ON.id('setting'));
}

async function waitForHome(driver: Driver): Promise<void> {
  let deadline: number = Date.now() + 5000;
  while (Date.now() < deadline) {
    if (await countById(driver, 'add') > 0 && await countById(driver, 'setting') > 0) {
      return;
    }
    await driver.delayMs(500);
  }
}

async function countById(driver: Driver, id: string): Promise<number> {
  let comps: Component[] | null = await driver.findComponents(ON.id(id));
  return comps === null ? 0 : comps.length;
}

async function countByText(driver: Driver, text: string): Promise<number> {
  let comps: Component[] | null = await driver.findComponents(ON.text(text));
  return comps === null ? 0 : comps.length;
}

async function inputField(driver: Driver, id: string, text: string): Promise<string> {
  await driver.assertComponentExist(ON.id(id));
  let field: Component = await driver.findComponent(ON.id(id));
  await field.inputText(text);
  inputMethod.getController().stopInputSession();
  await driver.delayMs(500);
  let refreshed: Component = await driver.findComponent(ON.id(id));
  let value: string = await refreshed.getText();
  return value;
}

async function queryAndEnter(driver: Driver, text: string): Promise<void> {
  await driver.assertComponentExist(ON.id('inputContact'));
  let inputContact: Component = await driver.findComponent(ON.id('inputContact'));
  await inputContact.inputText(text);
  inputMethod.getController().stopInputSession();
  await driver.delayMs(500);
  // stopInputSession 后输入框失焦：点击恢复焦点再按回车触发 onSubmit
  let refreshed: Component = await driver.findComponent(ON.id('inputContact'));
  await refreshed.click();
  await driver.delayMs(300);
  await driver.triggerKey(2054);
  await driver.delayMs(1000);
}

export default function flowUiTest() {
  describe('FlowUiTest', () => {

    /**
     * @tc.name   testFlow1036
     * @tc.number SUB_Contact_UIFLOW_1036
     * @tc.desc   状态：启动后主页控件齐备（add/setting/tab1 各一次）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1036 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'tab1')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1036 end');
    });

    /**
     * @tc.name   testFlow1037
     * @tc.number SUB_Contact_UIFLOW_1037
     * @tc.desc   状态：点击 tab0 电话页，联系人页头部控件（添加/设置）不显示，切回 tab1 后恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1037 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let tab0: Component = await driver.findComponent(ON.id('tab0'));
      await tab0.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'add')).assertEqual(0);
      expect(await countById(driver, 'setting')).assertEqual(0);
      expect(await countById(driver, 'tab0')).assertEqual(1);
      let tab1: Component = await driver.findComponent(ON.id('tab1'));
      await tab1.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1037 end');
    });

    /**
     * @tc.name   testFlow1038
     * @tc.number SUB_Contact_UIFLOW_1038
     * @tc.desc   状态：点击 tab2 收藏页，联系人页头部控件（添加/设置）不显示，切回 tab1 后恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1038 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let tab2: Component = await driver.findComponent(ON.id('tab2'));
      await tab2.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'add')).assertEqual(0);
      expect(await countById(driver, 'setting')).assertEqual(0);
      expect(await countById(driver, 'tab2')).assertEqual(1);
      let tab1: Component = await driver.findComponent(ON.id('tab1'));
      await tab1.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1038 end');
    });

    /**
     * @tc.name   testFlow1039
     * @tc.number SUB_Contact_UIFLOW_1039
     * @tc.desc   状态：点击 tab1 联系人页，查询输入框出现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1039 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let tab1: Component = await driver.findComponent(ON.id('tab1'));
      await tab1.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1039 end');
    });

    /**
     * @tc.name   testFlow1040
     * @tc.number SUB_Contact_UIFLOW_1040
     * @tc.desc   状态：快速切换 tab0→tab2→tab1 后查询框与主页控件正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1040 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let tab0: Component = await driver.findComponent(ON.id('tab0'));
      await tab0.click();
      await driver.delayMs(500);
      let tab2: Component = await driver.findComponent(ON.id('tab2'));
      await tab2.click();
      await driver.delayMs(500);
      let tab1: Component = await driver.findComponent(ON.id('tab1'));
      await tab1.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1040 end');
    });

    /**
     * @tc.name   testFlow1041
     * @tc.number SUB_Contact_UIFLOW_1041
     * @tc.desc   状态：重复点击 tab1 两次，页面保持稳定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1041 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let tab1: Component = await driver.findComponent(ON.id('tab1'));
      await tab1.click();
      await driver.delayMs(500);
      await tab1.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1041 end');
    });

    /**
     * @tc.name   testFlow1042
     * @tc.number SUB_Contact_UIFLOW_1042
     * @tc.desc   合法：查询框输入 15321143568 后回读一致，长度 11 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1042 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let queryValue: string = await inputField(driver, 'inputContact', '15321143568');
      expect(queryValue).assertEqual('15321143568');
      expect(queryValue.length).assertEqual(11);
      expect(queryValue === '').assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1042 end');
    });

    /**
     * @tc.name   testFlow1043
     * @tc.number SUB_Contact_UIFLOW_1043
     * @tc.desc   合法：查询存在的号码回车后跳转名片详情页，再返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1043 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await queryAndEnter(driver, '15321143568');
      expect(await countById(driver, 'back')).assertEqual(1);
      expect(await countById(driver, 'editContact')).assertEqual(1);
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1043 end');
    });

    /**
     * @tc.name   testFlow1044
     * @tc.number SUB_Contact_UIFLOW_1044
     * @tc.desc   非法：查询不存在的号码回车后停留主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1044 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await queryAndEnter(driver, '19999999999');
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1044 end');
    });

    /**
     * @tc.name   testFlow1045
     * @tc.number SUB_Contact_UIFLOW_1045
     * @tc.desc   边界：查询框为空时回车，空串前缀匹配全部联系人并进入匹配到的联系人名片页，返回后回到主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1045 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await queryAndEnter(driver, '');
      expect(await countById(driver, 'back')).assertEqual(1);
      expect(await countById(driver, 'inputContact')).assertEqual(0);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await waitForHome(driver);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1045 end');
    });

    /**
     * @tc.name   testFlow1046
     * @tc.number SUB_Contact_UIFLOW_1046
     * @tc.desc   边界：查询 10 位号码回车后停留主页（无匹配联系人）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1046 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await queryAndEnter(driver, '1300000000');
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1046 end');
    });

    /**
     * @tc.name   testFlow1047
     * @tc.number SUB_Contact_UIFLOW_1047
     * @tc.desc   边界：查询 12 位号码回车后停留主页（无匹配联系人）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1047 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await queryAndEnter(driver, '153211435681');
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1047 end');
    });

    /**
     * @tc.name   testFlow1048
     * @tc.number SUB_Contact_UIFLOW_1048
     * @tc.desc   非法：查询特殊字符串回车后停留主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1048 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await queryAndEnter(driver, '@#15321');
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1048 end');
    });

    /**
     * @tc.name   testFlow1049
     * @tc.number SUB_Contact_UIFLOW_1049
     * @tc.desc   状态：点击 setting 进入设置页，四个入口控件各出现一次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1049 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'addBack')).assertEqual(1);
      expect(await countById(driver, 'addContact')).assertEqual(1);
      expect(await countById(driver, 'importFile')).assertEqual(1);
      expect(await countById(driver, 'exportFile')).assertEqual(1);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1049 end');
    });

    /**
     * @tc.name   testFlow1050
     * @tc.number SUB_Contact_UIFLOW_1050
     * @tc.desc   状态：设置页点击导入文件，页面停留且其余入口不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1050 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let importFile: Component = await driver.findComponent(ON.id('importFile'));
      await importFile.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'addBack')).assertEqual(1);
      expect(await countById(driver, 'addContact')).assertEqual(1);
      expect(await countById(driver, 'exportFile')).assertEqual(1);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1050 end');
    });

    /**
     * @tc.name   testFlow1051
     * @tc.number SUB_Contact_UIFLOW_1051
     * @tc.desc   状态：设置页点击导出文件，页面停留且其余入口不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1051 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let exportFile: Component = await driver.findComponent(ON.id('exportFile'));
      await exportFile.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'addBack')).assertEqual(1);
      expect(await countById(driver, 'addContact')).assertEqual(1);
      expect(await countById(driver, 'importFile')).assertEqual(1);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1051 end');
    });

    /**
     * @tc.name   testFlow1052
     * @tc.number SUB_Contact_UIFLOW_1052
     * @tc.desc   状态：设置页点击新建联系人进入新建表单
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1052 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let addNewContact: Component = await driver.findComponent(ON.id('addContact'));
      await addNewContact.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      expect(await countById(driver, 'inputName')).assertEqual(1);
      let btnCancel: Component = await driver.findComponent(ON.id('cancel'));
      await btnCancel.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1052 end');
    });

    /**
     * @tc.name   testFlow1053
     * @tc.number SUB_Contact_UIFLOW_1053
     * @tc.desc   状态：新建表单点取消返回设置页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1053 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let addNewContact: Component = await driver.findComponent(ON.id('addContact'));
      await addNewContact.click();
      await driver.delayMs(1000);
      let btnCancel: Component = await driver.findComponent(ON.id('cancel'));
      await btnCancel.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'addBack')).assertEqual(1);
      expect(await countById(driver, 'addContact')).assertEqual(1);
      expect(await countById(driver, 'exportFile')).assertEqual(1);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1053 end');
    });

    /**
     * @tc.name   testFlow1054
     * @tc.number SUB_Contact_UIFLOW_1054
     * @tc.desc   合法：设置页入口新建联系人填姓名与合法电话后保存返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1054 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let addNewContact: Component = await driver.findComponent(ON.id('addContact'));
      await addNewContact.click();
      await driver.delayMs(1000);
      await inputField(driver, 'inputName', 'liyi');
      await inputField(driver, 'inputTelephone', '17322305685');
      let btnConfirm: Component = await driver.findComponent(ON.id('confirm'));
      await btnConfirm.click();
      await waitForHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1054 end');
    });

    /**
     * @tc.name   testFlow1055
     * @tc.number SUB_Contact_UIFLOW_1055
     * @tc.desc   非法：设置页入口新建联系人填非法号码点确认，停留表单页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1055 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let addNewContact: Component = await driver.findComponent(ON.id('addContact'));
      await addNewContact.click();
      await driver.delayMs(1000);
      let phoneValue: string = await inputField(driver, 'inputTelephone', '12695874569');
      let btnConfirm: Component = await driver.findComponent(ON.id('confirm'));
      await btnConfirm.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      expect(phoneValue).assertEqual('12695874569');
      let btnCancel: Component = await driver.findComponent(ON.id('cancel'));
      await btnCancel.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1055 end');
    });

    /**
     * @tc.name   testFlow1056
     * @tc.number SUB_Contact_UIFLOW_1056
     * @tc.desc   状态：设置页返回按钮回到主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1056 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1056 end');
    });

    /**
     * @tc.name   testFlow1057
     * @tc.number SUB_Contact_UIFLOW_1057
     * @tc.desc   状态：点击联系人列表进入详情页后返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1057 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'back')).assertEqual(1);
      expect(await countById(driver, 'editContact')).assertEqual(1);
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1057 end');
    });

    /**
     * @tc.name   testFlow1058
     * @tc.number SUB_Contact_UIFLOW_1058
     * @tc.desc   状态：点删除弹出确认弹窗（确认与取消文本均出现），取消后返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1058 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let deleteContact: Component = await driver.findComponent(ON.id('deleteContact'));
      await deleteContact.click();
      await driver.delayMs(1000);
      let confirmText: string = await getResourceString($r('app.string.confirm'));
      let cancelText: string = await getResourceString($r('app.string.cancel'));
      expect(await countByText(driver, confirmText)).assertLarger(0);
      expect(await countByText(driver, cancelText)).assertLarger(0);
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      let btnCancel: Component = await driver.findComponent(ON.text(cancelText));
      await btnCancel.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1058 end');
    });

    /**
     * @tc.name   testFlow1059
     * @tc.number SUB_Contact_UIFLOW_1059
     * @tc.desc   状态：删除弹窗点取消后弹窗消失，详情页控件保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1059 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let deleteContact: Component = await driver.findComponent(ON.id('deleteContact'));
      await deleteContact.click();
      await driver.delayMs(1000);
      let confirmText: string = await getResourceString($r('app.string.confirm'));
      let cancelText: string = await getResourceString($r('app.string.cancel'));
      let btnCancel: Component = await driver.findComponent(ON.text(cancelText));
      await btnCancel.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'editContact')).assertEqual(1);
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      expect(await countByText(driver, confirmText)).assertEqual(0);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1059 end');
    });

    /**
     * @tc.name   testFlow1060
     * @tc.number SUB_Contact_UIFLOW_1060
     * @tc.desc   组合：删除弹窗点确认删除联系人并返回主页，弹窗文本消失
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1060 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let deleteContact: Component = await driver.findComponent(ON.id('deleteContact'));
      await deleteContact.click();
      await driver.delayMs(1000);
      let confirmText: string = await getResourceString($r('app.string.confirm'));
      let btnConfirm: Component = await driver.findComponent(ON.text(confirmText));
      await btnConfirm.click();
      await waitForHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countByText(driver, confirmText)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1060 end');
    });

    /**
     * @tc.name   testFlow1061
     * @tc.number SUB_Contact_UIFLOW_1061
     * @tc.desc   状态：删除后查询被删号码回车，停留主页不跳转
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1061 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await queryAndEnter(driver, '15321143568');
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1061 end');
    });

    /**
     * @tc.name   testFlow1062
     * @tc.number SUB_Contact_UIFLOW_1062
     * @tc.desc   状态：删除一条后列表仍有条目可进入详情页，再返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1062 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'back')).assertEqual(1);
      expect(await countById(driver, 'editContact')).assertEqual(1);
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1062 end');
    });

    /**
     * @tc.name   testFlow1063
     * @tc.number SUB_Contact_UIFLOW_1063
     * @tc.desc   状态：取消后再次进入新建表单，姓名框为空串（新实例）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1063 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnAdd: Component = await driver.findComponent(ON.id('add'));
      await btnAdd.click();
      await driver.delayMs(1000);
      await inputField(driver, 'inputName', 'first');
      let btnCancel: Component = await driver.findComponent(ON.id('cancel'));
      await btnCancel.click();
      await driver.delayMs(1000);
      await btnAdd.click();
      await driver.delayMs(1000);
      let name: Component = await driver.findComponent(ON.id('inputName'));
      expect(await name.getText()).assertEqual('');
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      let btnCancelAfter: Component = await driver.findComponent(ON.id('cancel'));
      await btnCancelAfter.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1063 end');
    });

    /**
     * @tc.name   testFlow1064
     * @tc.number SUB_Contact_UIFLOW_1064
     * @tc.desc   状态：设置页往返一次后主页控件正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1064 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1064 end');
    });

    /**
     * @tc.name   testFlow1065
     * @tc.number SUB_Contact_UIFLOW_1065
     * @tc.desc   状态：设置页→新建表单→取消→返回设置→返回主页全链路回到主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1065 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let addNewContact: Component = await driver.findComponent(ON.id('addContact'));
      await addNewContact.click();
      await driver.delayMs(1000);
      let btnCancel: Component = await driver.findComponent(ON.id('cancel'));
      await btnCancel.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('addBack'));
      await btnBack.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1065 end');
    });

    /**
     * @tc.name   testFlow1066
     * @tc.number SUB_Contact_UIFLOW_1066
     * @tc.desc   状态：详情页点编辑进入编辑表单（cancelEdit/confirmEdit/updateName 出现）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1066 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancelEdit')).assertEqual(1);
      expect(await countById(driver, 'confirmEdit')).assertEqual(1);
      expect(await countById(driver, 'updateName')).assertEqual(1);
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1066 end');
    });

    /**
     * @tc.name   testFlow1067
     * @tc.number SUB_Contact_UIFLOW_1067
     * @tc.desc   合法：编辑表单姓名输入 wangwu 后回读一致，取消不保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1067 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      let nameValue: string = await inputField(driver, 'updateName', 'wangwu');
      expect(nameValue).assertEqual('wangwu');
      expect(nameValue.length).assertEqual(6);
      expect(await countById(driver, 'cancelEdit')).assertEqual(1);
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1067 end');
    });

    /**
     * @tc.name   testFlow1068
     * @tc.number SUB_Contact_UIFLOW_1068
     * @tc.desc   合法：编辑表单电话输入 15321143568 后回读一致，取消不保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1068 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      let phoneValue: string = await inputField(driver, 'updateTelephone', '15321143568');
      expect(phoneValue).assertEqual('15321143568');
      expect(phoneValue.length).assertEqual(11);
      expect(await countById(driver, 'cancelEdit')).assertEqual(1);
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1068 end');
    });

    /**
     * @tc.name   testFlow1069
     * @tc.number SUB_Contact_UIFLOW_1069
     * @tc.desc   非法：编辑表单电话改为非法号码后点确认，停留编辑页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1069 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      let phoneValue: string = await inputField(driver, 'updateTelephone', '12326421968');
      let btnConfirm: Component = await driver.findComponent(ON.id('confirmEdit'));
      await btnConfirm.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancelEdit')).assertEqual(1);
      expect(await countById(driver, 'confirmEdit')).assertEqual(1);
      expect(phoneValue).assertEqual('12326421968');
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1069 end');
    });

    /**
     * @tc.name   testFlow1070
     * @tc.number SUB_Contact_UIFLOW_1070
     * @tc.desc   状态：全流程结束后主页控件与三个 tab 均正常（终态）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlow1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1070 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'tab0')).assertEqual(1);
      expect(await countById(driver, 'tab2')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlow1070 end');
    });

  });
}
