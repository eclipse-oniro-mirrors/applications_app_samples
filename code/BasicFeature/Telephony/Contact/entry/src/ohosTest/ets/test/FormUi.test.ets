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

async function enterAddForm(driver: Driver): Promise<void> {
  await driver.assertComponentExist(ON.id('add'));
  let btnAdd: Component = await driver.findComponent(ON.id('add'));
  await btnAdd.click();
  await driver.delayMs(1000);
  await driver.assertComponentExist(ON.id('cancel'));
  await driver.assertComponentExist(ON.id('confirm'));
}

async function backHome(driver: Driver): Promise<void> {
  await driver.assertComponentExist(ON.id('cancel'));
  let btnCancel: Component = await driver.findComponent(ON.id('cancel'));
  await btnCancel.click();
  await driver.delayMs(1000);
  await driver.assertComponentExist(ON.id('add'));
  await driver.assertComponentExist(ON.id('setting'));
}

async function clickConfirm(driver: Driver): Promise<void> {
  await driver.assertComponentExist(ON.id('confirm'));
  let btnConfirm: Component = await driver.findComponent(ON.id('confirm'));
  await btnConfirm.click();
  await driver.delayMs(1000);
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

async function countById(driver: Driver, id: string): Promise<number> {
  let comps: Component[] | null = await driver.findComponents(ON.id(id));
  return comps === null ? 0 : comps.length;
}

export default function formUiTest() {
  describe('FormUiTest', () => {

    /**
     * @tc.name   testForm1001
     * @tc.number SUB_Contact_UIFORM_1001
     * @tc.desc   状态：启动后主页三个关键控件各出现一次（add/setting/tab1）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1001 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'tab1')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1001 end');
    });

    /**
     * @tc.name   testForm1002
     * @tc.number SUB_Contact_UIFORM_1002
     * @tc.desc   状态：点击 add 进入新建表单，取消与确认按钮及姓名输入框出现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1002 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      expect(await countById(driver, 'inputName')).assertEqual(1);
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1002 end');
    });

    /**
     * @tc.name   testForm1003
     * @tc.number SUB_Contact_UIFORM_1003
     * @tc.desc   合法：姓名输入 zs 后回读一致，长度为 2 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1003 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let nameValue: string = await inputField(driver, 'inputName', 'zs');
      expect(nameValue).assertEqual('zs');
      expect(nameValue.length).assertEqual(2);
      expect(nameValue === '').assertFalse();
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1003 end');
    });

    /**
     * @tc.name   testForm1004
     * @tc.number SUB_Contact_UIFORM_1004
     * @tc.desc   合法：地址输入 hangzhou 后回读一致，长度为 8 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1004 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let addressValue: string = await inputField(driver, 'inputAddress', 'hangzhou');
      expect(addressValue).assertEqual('hangzhou');
      expect(addressValue.length).assertEqual(8);
      expect(addressValue === '').assertFalse();
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1004 end');
    });

    /**
     * @tc.name   testForm1005
     * @tc.number SUB_Contact_UIFORM_1005
     * @tc.desc   合法：电话输入 15321465987 后回读一致，长度为 11 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1005 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let phoneValue: string = await inputField(driver, 'inputTelephone', '15321465987');
      expect(phoneValue).assertEqual('15321465987');
      expect(phoneValue.length).assertEqual(11);
      expect(phoneValue === '').assertFalse();
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1005 end');
    });

    /**
     * @tc.name   testForm1006
     * @tc.number SUB_Contact_UIFORM_1006
     * @tc.desc   合法：邮箱输入 1505678900@163.com 后回读一致，长度为 18 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1006 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let mailValue: string = await inputField(driver, 'inputMail', '1505678900@163.com');
      expect(mailValue).assertEqual('1505678900@163.com');
      expect(mailValue.length).assertEqual(18);
      expect(mailValue === '').assertFalse();
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1006 end');
    });

    /**
     * @tc.name   testForm1007
     * @tc.number SUB_Contact_UIFORM_1007
     * @tc.desc   合法：备注输入 my-note 后回读一致，长度为 7 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1007 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let remarkValue: string = await inputField(driver, 'inputRemarks', 'my-note');
      expect(remarkValue).assertEqual('my-note');
      expect(remarkValue.length).assertEqual(7);
      expect(remarkValue === '').assertFalse();
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1007 end');
    });

    /**
     * @tc.name   testForm1008
     * @tc.number SUB_Contact_UIFORM_1008
     * @tc.desc   组合：五项全填后点确认保存，返回主页且表单页关闭
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1008 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', 'zs');
      await inputField(driver, 'inputAddress', 'hangzhou');
      await inputField(driver, 'inputTelephone', '15321465987');
      await inputField(driver, 'inputMail', '1505678900@163.com');
      await inputField(driver, 'inputRemarks', 'my-note');
      await clickConfirm(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'cancel')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1008 end');
    });

    /**
     * @tc.name   testForm1009
     * @tc.number SUB_Contact_UIFORM_1009
     * @tc.desc   非法：不符合规则的号码 12321465987 点确认后停留表单页（toast 不验证）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1009 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let phoneValue: string = await inputField(driver, 'inputTelephone', '12321465987');
      await clickConfirm(driver);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      expect(phoneValue).assertEqual('12321465987');
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1009 end');
    });

    /**
     * @tc.name   testForm1010
     * @tc.number SUB_Contact_UIFORM_1010
     * @tc.desc   边界：电话留空点确认后停留表单页，电话框回读为空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1010 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', 'zs');
      await clickConfirm(driver);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      let phone: Component = await driver.findComponent(ON.id('inputTelephone'));
      expect(await phone.getText()).assertEqual('');
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1010 end');
    });

    /**
     * @tc.name   testForm1011
     * @tc.number SUB_Contact_UIFORM_1011
     * @tc.desc   边界：10 位号码 1300000000 点确认后停留表单页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1011 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let phoneValue: string = await inputField(driver, 'inputTelephone', '1300000000');
      await clickConfirm(driver);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      expect(phoneValue).assertEqual('1300000000');
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1011 end');
    });

    /**
     * @tc.name   testForm1012
     * @tc.number SUB_Contact_UIFORM_1012
     * @tc.desc   边界：11 位号码 13000000000 点确认后保存成功返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1012 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', 'boundary');
      await inputField(driver, 'inputTelephone', '13000000000');
      await clickConfirm(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'cancel')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1012 end');
    });

    /**
     * @tc.name   testForm1013
     * @tc.number SUB_Contact_UIFORM_1013
     * @tc.desc   边界：12 位号码 130000000001 前缀命中校验规则，点确认后返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1013 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', 'longnumber');
      await inputField(driver, 'inputTelephone', '130000000001');
      await clickConfirm(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'cancel')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1013 end');
    });

    /**
     * @tc.name   testForm1014
     * @tc.number SUB_Contact_UIFORM_1014
     * @tc.desc   极值：50 字符姓名输入后回读一致，长度 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1014 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let longName: string = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx';
      let nameValue: string = await inputField(driver, 'inputName', longName);
      expect(nameValue).assertEqual(longName);
      expect(nameValue.length).assertEqual(50);
      expect(nameValue === '').assertFalse();
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1014 end');
    });

    /**
     * @tc.name   testForm1015
     * @tc.number SUB_Contact_UIFORM_1015
     * @tc.desc   极值：40 字符地址输入后回读一致，长度 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1015 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let longAddress: string = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmn';
      let addressValue: string = await inputField(driver, 'inputAddress', longAddress);
      expect(addressValue).assertEqual(longAddress);
      expect(addressValue.length).assertEqual(40);
      expect(addressValue === '').assertFalse();
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1015 end');
    });

    /**
     * @tc.name   testForm1016
     * @tc.number SUB_Contact_UIFORM_1016
     * @tc.desc   极值：60 字符备注输入后回读一致，长度 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1016 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let longRemark: string = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgh';
      let remarkValue: string = await inputField(driver, 'inputRemarks', longRemark);
      expect(remarkValue).assertEqual(longRemark);
      expect(remarkValue.length).assertEqual(60);
      expect(remarkValue === '').assertFalse();
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1016 end');
    });

    /**
     * @tc.name   testForm1017
     * @tc.number SUB_Contact_UIFORM_1017
     * @tc.desc   组合：只填姓名与合法电话点确认后保存成功返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1017 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', 'minpair');
      await inputField(driver, 'inputTelephone', '15321465988');
      await clickConfirm(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'cancel')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1017 end');
    });

    /**
     * @tc.name   testForm1018
     * @tc.number SUB_Contact_UIFORM_1018
     * @tc.desc   组合：只填电话与邮箱点确认后保存成功返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1018 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputTelephone', '15321465989');
      await inputField(driver, 'inputMail', '1505678901@163.com');
      await clickConfirm(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'cancel')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1018 end');
    });

    /**
     * @tc.name   testForm1019
     * @tc.number SUB_Contact_UIFORM_1019
     * @tc.desc   组合：填姓名电话邮箱地址（不填备注）点确认后返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1019 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', 'fourfields');
      await inputField(driver, 'inputTelephone', '15321465990');
      await inputField(driver, 'inputMail', '1505678902@163.com');
      await inputField(driver, 'inputAddress', 'hangzhou');
      await clickConfirm(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'cancel')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1019 end');
    });

    /**
     * @tc.name   testForm1020
     * @tc.number SUB_Contact_UIFORM_1020
     * @tc.desc   状态：空表单点取消直接返回主页，表单控件消失
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1020 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await backHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'inputName')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1020 end');
    });

    /**
     * @tc.name   testForm1021
     * @tc.number SUB_Contact_UIFORM_1021
     * @tc.desc   状态：填过内容再点取消，输入不保存直接返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1021 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', 'discard');
      await backHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'inputName')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1021 end');
    });

    /**
     * @tc.name   testForm1022
     * @tc.number SUB_Contact_UIFORM_1022
     * @tc.desc   状态：取消后再次进入新建表单，姓名框为空串（新实例）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1022 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', 'first');
      await backHome(driver);
      await enterAddForm(driver);
      let name: Component = await driver.findComponent(ON.id('inputName'));
      expect(await name.getText()).assertEqual('');
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1022 end');
    });

    /**
     * @tc.name   testForm1023
     * @tc.number SUB_Contact_UIFORM_1023
     * @tc.desc   非法：前导空格的号码不命中校验，点确认后停留表单页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1023 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let phoneValue: string = await inputField(driver, 'inputTelephone', ' 15321465987');
      await clickConfirm(driver);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      expect(phoneValue).assertEqual(' 15321465987');
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1023 end');
    });

    /**
     * @tc.name   testForm1024
     * @tc.number SUB_Contact_UIFORM_1024
     * @tc.desc   非法：含字母的号码不命中校验，点确认后停留表单页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1024 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      let phoneValue: string = await inputField(driver, 'inputTelephone', 'abc1532146');
      await clickConfirm(driver);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      expect(phoneValue).assertEqual('abc1532146');
      await backHome(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1024 end');
    });

    /**
     * @tc.name   testForm1025
     * @tc.number SUB_Contact_UIFORM_1025
     * @tc.desc   边界：姓名为纯空格、电话合法时保存成功返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1025 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await enterAddForm(driver);
      await inputField(driver, 'inputName', '   ');
      await inputField(driver, 'inputTelephone', '17322305685');
      await clickConfirm(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'cancel')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1025 end');
    });

    /**
     * @tc.name   testForm1026
     * @tc.number SUB_Contact_UIFORM_1026
     * @tc.desc   状态：点击联系人列表项进入名片详情页（back/editContact/deleteContact 出现）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1026 end');
    });

    /**
     * @tc.name   testForm1027
     * @tc.number SUB_Contact_UIFORM_1027
     * @tc.desc   状态：详情页点编辑进入编辑表单（cancelEdit/confirmEdit/updateName 出现）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1027 end');
    });

    /**
     * @tc.name   testForm1028
     * @tc.number SUB_Contact_UIFORM_1028
     * @tc.desc   合法：编辑表单姓名输入 lisi 后回读一致，长度 4 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1028 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      let nameValue: string = await inputField(driver, 'updateName', 'lisi');
      expect(nameValue).assertEqual('lisi');
      expect(nameValue.length).assertEqual(4);
      expect(nameValue === '').assertFalse();
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1028 end');
    });

    /**
     * @tc.name   testForm1029
     * @tc.number SUB_Contact_UIFORM_1029
     * @tc.desc   合法：编辑表单地址输入 beijing 后回读一致，长度 7 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1029 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      let addressValue: string = await inputField(driver, 'updateAddress', 'beijing');
      expect(addressValue).assertEqual('beijing');
      expect(addressValue.length).assertEqual(7);
      expect(addressValue === '').assertFalse();
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1029 end');
    });

    /**
     * @tc.name   testForm1030
     * @tc.number SUB_Contact_UIFORM_1030
     * @tc.desc   合法：编辑表单电话输入 15321143568 后回读一致，长度 11 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1030 begin');
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
      expect(phoneValue === '').assertFalse();
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1030 end');
    });

    /**
     * @tc.name   testForm1031
     * @tc.number SUB_Contact_UIFORM_1031
     * @tc.desc   合法：编辑表单邮箱输入 1506589700@qq.com 后回读一致，长度 17 且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1031 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      let mailValue: string = await inputField(driver, 'updateMail', '1506589700@qq.com');
      expect(mailValue).assertEqual('1506589700@qq.com');
      expect(mailValue.length).assertEqual(17);
      expect(mailValue === '').assertFalse();
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1031 end');
    });

    /**
     * @tc.name   testForm1032
     * @tc.number SUB_Contact_UIFORM_1032
     * @tc.desc   组合：编辑表单更新姓名地址电话邮箱后点确认，保存成功返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1032 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      await inputField(driver, 'updateName', 'lisi');
      await inputField(driver, 'updateAddress', 'beijing');
      await inputField(driver, 'updateTelephone', '15321143568');
      await inputField(driver, 'updateMail', '1506589700@qq.com');
      await driver.assertComponentExist(ON.id('confirmEdit'));
      let btnConfirm: Component = await driver.findComponent(ON.id('confirmEdit'));
      await btnConfirm.click();
      await waitForHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'cancelEdit')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1032 end');
    });

    /**
     * @tc.name   testForm1033
     * @tc.number SUB_Contact_UIFORM_1033
     * @tc.desc   非法：编辑表单电话改为 12326421968 后点确认，停留编辑页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1033 begin');
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
      await driver.assertComponentExist(ON.id('confirmEdit'));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1033 end');
    });

    /**
     * @tc.name   testForm1034
     * @tc.number SUB_Contact_UIFORM_1034
     * @tc.desc   状态：编辑页点取消返回名片详情页，不触发保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1034 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'back')).assertEqual(1);
      expect(await countById(driver, 'editContact')).assertEqual(1);
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1034 end');
    });

    /**
     * @tc.name   testForm1035
     * @tc.number SUB_Contact_UIFORM_1035
     * @tc.desc   边界：编辑表单电话改为短号码 123 后点确认，停留编辑页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForm1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1035 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let btnEdit: Component = await driver.findComponent(ON.id('editContact'));
      await btnEdit.click();
      await driver.delayMs(1000);
      let phoneValue: string = await inputField(driver, 'updateTelephone', '123');
      await driver.assertComponentExist(ON.id('confirmEdit'));
      let btnConfirm: Component = await driver.findComponent(ON.id('confirmEdit'));
      await btnConfirm.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancelEdit')).assertEqual(1);
      expect(await countById(driver, 'confirmEdit')).assertEqual(1);
      expect(phoneValue).assertEqual('123');
      let btnCancelEdit: Component = await driver.findComponent(ON.id('cancelEdit'));
      await btnCancelEdit.click();
      await driver.delayMs(1000);
      let btnBack: Component = await driver.findComponent(ON.id('back'));
      await btnBack.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testForm1035 end');
    });

  });
}
