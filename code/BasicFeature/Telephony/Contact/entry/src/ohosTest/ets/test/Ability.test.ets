/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

export default function abilityTest() {
  describe('AbilityTest', () => {

    /**
     * @tc.name   testMain0001
     * @tc.number SUB_Contact_MAIN_0001
     * @tc.desc   打开应用：启动 EntryAbility 后主页控件齐备
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0001 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0001 end');
    });

    /**
     * @tc.name   testMain0002
     * @tc.number SUB_Contact_MAIN_0002
     * @tc.desc   获取权限：启动点击允许授权，主页控件正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0002 begin');
      let driver: Driver = Driver.create();
      await abilityDelegator.startAbility({
        bundleName: 'ohos.samples.contact',
        abilityName: 'EntryAbility'
      });
      await driver.delayMs(1000);
      try {
        let allow: Component = await driver.findComponent(ON.text(await getResourceString($r('app.string.allow'))));
        await allow.click();
        await driver.delayMs(500);
      } catch (e) {
        // 权限已授予，无授权弹窗
      }
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'tab0')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0002 end');
    });

    /**
     * @tc.name   testMain0003
     * @tc.number SUB_Contact_MAIN_0003
     * @tc.desc   点击切换tab：电话→收藏→联系人，回到联系人页后主页控件正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0003 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let telephone: Component = await driver.findComponent(ON.id('tab0'));
      await telephone.click();
      await driver.delayMs(1000);
      let collection: Component = await driver.findComponent(ON.id('tab2'));
      await collection.click();
      await driver.delayMs(1000);
      let contact: Component = await driver.findComponent(ON.id('tab1'));
      await contact.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countById(driver, 'inputContact')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0003 end');
    });

    /**
     * @tc.name   testMain0004
     * @tc.number SUB_Contact_MAIN_0004
     * @tc.desc   点击首页添加按钮：进入新建页→取消返回→再次进入
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0004 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnAdd: Component = await driver.findComponent(ON.id('add'));
      await btnAdd.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(await countById(driver, 'confirm')).assertEqual(1);
      let btnCancel: Component = await driver.findComponent(ON.id('cancel'));
      await btnCancel.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'inputName')).assertEqual(0);
      let btnAddAgain: Component = await driver.findComponent(ON.id('add'));
      await btnAddAgain.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'inputName')).assertEqual(1);
      let btnCancelAgain: Component = await driver.findComponent(ON.id('cancel'));
      await btnCancelAgain.click();
      await driver.delayMs(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0004 end');
    });

    /**
     * @tc.name   testMain0005
     * @tc.number SUB_Contact_MAIN_0005
     * @tc.desc   添加联系人：非法号码被拒停留表单，合法号码保存后返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0005 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnAdd: Component = await driver.findComponent(ON.id('add'));
      await btnAdd.click();
      await driver.delayMs(1000);
      let nameValue: string = await inputField(driver, 'inputName', 'zs');
      let addressValue: string = await inputField(driver, 'inputAddress', 'hangzhou');
      let illegalTelephoneValue: string = await inputField(driver, 'inputTelephone', '12321465987');
      let mailValue: string = await inputField(driver, 'inputMail', '1505678900@163.com');
      let btnConfirm: Component = await driver.findComponent(ON.id('confirm'));
      await btnConfirm.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(nameValue).assertEqual('zs');
      expect(addressValue).assertEqual('hangzhou');
      expect(illegalTelephoneValue).assertEqual('12321465987');
      expect(mailValue).assertEqual('1505678900@163.com');
      let legalTelephoneValue: string = await inputField(driver, 'inputTelephone', '15321465987');
      expect(legalTelephoneValue).assertEqual('15321465987');
      let btnConfirmAgain: Component = await driver.findComponent(ON.id('confirm'));
      await btnConfirmAgain.click();
      await waitForHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0005 end');
    });

    /**
     * @tc.name   testMain0006
     * @tc.number SUB_Contact_MAIN_0006
     * @tc.desc   编辑联系人：取消→再次编辑，非法号码被拒，合法号码保存后返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0006 begin');
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
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      let btnEditAgain: Component = await driver.findComponent(ON.id('editContact'));
      await btnEditAgain.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'confirmEdit')).assertEqual(1);
      let nameValue: string = await inputField(driver, 'updateName', 'lisi');
      let addressValue: string = await inputField(driver, 'updateAddress', 'beijing');
      let illegalUpdatePhoneNumber: string = await inputField(driver, 'updateTelephone', '12326421968');
      let mailValue: string = await inputField(driver, 'updateMail', '1506589700@qq.com');
      let btnConfirm: Component = await driver.findComponent(ON.id('confirmEdit'));
      await btnConfirm.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancelEdit')).assertEqual(1);
      expect(nameValue).assertEqual('lisi');
      expect(addressValue).assertEqual('beijing');
      expect(illegalUpdatePhoneNumber).assertEqual('12326421968');
      expect(mailValue).assertEqual('1506589700@qq.com');
      let legalUpdatePhoneNumber: string = await inputField(driver, 'updateTelephone', '15321143568');
      expect(legalUpdatePhoneNumber).assertEqual('15321143568');
      let btnConfirmAgain: Component = await driver.findComponent(ON.id('confirmEdit'));
      await btnConfirmAgain.click();
      await waitForHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0006 end');
    });

    /**
     * @tc.name   testMain0007
     * @tc.number SUB_Contact_MAIN_0007
     * @tc.desc   查询联系人：输入号码回车跳转名片详情页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0007 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let contactInfo: string = await inputField(driver, 'inputContact', '15321143568');
      // stopInputSession 后输入框失焦：点击恢复焦点再按回车触发 onSubmit
      let queryField: Component = await driver.findComponent(ON.id('inputContact'));
      await queryField.click();
      await driver.delayMs(300);
      await driver.triggerKey(2054);
      await driver.delayMs(1000);
      expect(contactInfo).assertEqual('15321143568');
      expect(await countById(driver, 'back')).assertEqual(1);
      expect(await countById(driver, 'editContact')).assertEqual(1);
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0007 end');
    });

    /**
     * @tc.name   testMain0008
     * @tc.number SUB_Contact_MAIN_0008
     * @tc.desc   删除联系人：弹窗取消后停留详情，再次删除确认后返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0008 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      await driver.assertComponentExist(ON.id('contactList'));
      let contactList: Component = await driver.findComponent(ON.id('contactList'));
      await contactList.click();
      await driver.delayMs(1000);
      let confirmText: string = await getResourceString($r('app.string.confirm'));
      let cancelText: string = await getResourceString($r('app.string.cancel'));
      let deleteContact: Component = await driver.findComponent(ON.id('deleteContact'));
      await deleteContact.click();
      await driver.delayMs(1000);
      expect(await countByText(driver, confirmText)).assertLarger(0);
      expect(await countByText(driver, cancelText)).assertLarger(0);
      let btnCancel: Component = await driver.findComponent(ON.text(cancelText));
      await btnCancel.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'editContact')).assertEqual(1);
      expect(await countById(driver, 'deleteContact')).assertEqual(1);
      expect(await countByText(driver, confirmText)).assertEqual(0);
      await deleteContact.click();
      await driver.delayMs(1000);
      let btnConfirm: Component = await driver.findComponent(ON.text(confirmText));
      await btnConfirm.click();
      await waitForHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      expect(await countByText(driver, cancelText)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0008 end');
    });

    /**
     * @tc.name   testMain0009
     * @tc.number SUB_Contact_MAIN_0009
     * @tc.desc   设置：导入导出点击后页面停留，新建联系人非法号码被拒，合法号码保存后返回主页
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMain0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0009 begin');
      let driver: Driver = Driver.create();
      await launchHome(driver);
      let btnSetting: Component = await driver.findComponent(ON.id('setting'));
      await btnSetting.click();
      await driver.delayMs(1000);
      let importFile: Component = await driver.findComponent(ON.id('importFile'));
      await importFile.click();
      await driver.delayMs(500);
      let exportFile: Component = await driver.findComponent(ON.id('exportFile'));
      await exportFile.click();
      await driver.delayMs(500);
      expect(await countById(driver, 'addBack')).assertEqual(1);
      expect(await countById(driver, 'addContact')).assertEqual(1);
      let addNewContact: Component = await driver.findComponent(ON.id('addContact'));
      await addNewContact.click();
      await driver.delayMs(1000);
      let name: string = await inputField(driver, 'inputName', 'liyi');
      let addressValue: string = await inputField(driver, 'inputAddress', 'shanghai');
      let illegalPhoneNumber: string = await inputField(driver, 'inputTelephone', '12695874569');
      let mailValue: string = await inputField(driver, 'inputMail', '1607365260@139.com');
      let btnConfirm: Component = await driver.findComponent(ON.id('confirm'));
      await btnConfirm.click();
      await driver.delayMs(1000);
      expect(await countById(driver, 'cancel')).assertEqual(1);
      expect(name).assertEqual('liyi');
      expect(addressValue).assertEqual('shanghai');
      expect(illegalPhoneNumber).assertEqual('12695874569');
      expect(mailValue).assertEqual('1607365260@139.com');
      let legalPhoneNumber: string = await inputField(driver, 'inputTelephone', '17322305685');
      expect(legalPhoneNumber).assertEqual('17322305685');
      let btnConfirmAgain: Component = await driver.findComponent(ON.id('confirm'));
      await btnConfirmAgain.click();
      await waitForHome(driver);
      expect(await countById(driver, 'add')).assertEqual(1);
      expect(await countById(driver, 'setting')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMain0009 end');
    });

  });
}
