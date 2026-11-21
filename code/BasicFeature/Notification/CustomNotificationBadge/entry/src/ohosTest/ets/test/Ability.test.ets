/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON, Component, abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';

const TAG: string = '[Sample_CustomNotificationBadge]';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'Badge_';

let ability: UIAbility;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * 打开应用
     */
    it(BUNDLE + 'StartAbility_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 begin');
      try {
        await AbilityDelegatorRegistry.getAbilityDelegator().startAbility({
          bundleName: 'com.samples.customnotificationbadge',
          abilityName: 'EntryAbility'
        });
        done();
      } catch (expection) {
        hilog.info(DOMAIN, TAG,
          'StartAbility end err: ' + JSON.stringify(expection as BusinessError));
        expect(0).assertEqual(expection.code);
        done();
      }
      ability = await AbilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })
    /**
     * 获取权限
     */
    it(BUNDLE + 'RequestPermissionFunction_001', 1, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RequestPermissionFunction_001 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RequestPermissionFunction_001 requestPermission');
      let resMgr: resourceManager.ResourceManager = ability.context.resourceManager;
      let acceptText: string = await resMgr.getStringValue($r('app.string.accept'));
      await driver.assertComponentExist(ON.text(acceptText));
      let btnAccept: Component = await driver.findComponent(ON.text(acceptText));
      await driver.delayMs(200);
      await btnAccept.click();
      await driver.delayMs(200);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RequestPermissionFunction_001 end');
    })
    /**
     * 发送基本类型通知
     */
    it(BUNDLE + 'BasicNotification_001', 1, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'BasicNotification_001 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let resMgr: resourceManager.ResourceManager = ability.context.resourceManager;
      await driver.assertComponentExist(ON.id('tabBar0'));
      await driver.assertComponentExist(ON.id('tabBar1'));
      let messages: Component = await driver.findComponent(ON.id('tabBar0'));
      let notification: Component = await driver.findComponent(ON.id('tabBar1'));

      await driver.delayMs(200);
      await notification.click();
      await driver.delayMs(200);

      let buttonText: string = await resMgr.getStringValue($r('app.string.basic_notification'));
      await driver.assertComponentExist(ON.text(buttonText));
      let btnAccept: Component = await driver.findComponent(ON.text(buttonText));
      await driver.delayMs(200);
      await btnAccept.click();
      await driver.delayMs(200);
      await messages.click();
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'BasicNotification_001 end');
    })
    /**
     * 发送长文本类型通知
     */
    it(BUNDLE + 'LongTextNotification_001', 1, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'LongTextNotification_001 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let resMgr: resourceManager.ResourceManager = ability.context.resourceManager;
      await driver.assertComponentExist(ON.id('tabBar0'));
      await driver.assertComponentExist(ON.id('tabBar1'));
      let messages: Component = await driver.findComponent(ON.id('tabBar0'));
      let notification: Component = await driver.findComponent(ON.id('tabBar1'));

      await driver.delayMs(200);
      await notification.click();
      await driver.delayMs(200);

      let buttonText: string = await resMgr.getStringValue($r('app.string.long_text_notification'));
      await driver.assertComponentExist(ON.text(buttonText));
      let btnAccept: Component = await driver.findComponent(ON.text(buttonText));
      await driver.delayMs(200);
      await btnAccept.click();
      await driver.delayMs(200);
      await messages.click();
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'LongTextNotification_001 end');
    })
    /**
     * 发送多行文本类型通知
     */
    it(BUNDLE + 'MultilineNotification_001', 1, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'MultilineNotification_001 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let resMgr: resourceManager.ResourceManager = ability.context.resourceManager;
      await driver.assertComponentExist(ON.id('tabBar0'));
      await driver.assertComponentExist(ON.id('tabBar1'));
      let messages: Component = await driver.findComponent(ON.id('tabBar0'));
      let notification: Component = await driver.findComponent(ON.id('tabBar1'));

      await driver.delayMs(200);
      await notification.click();
      await driver.delayMs(200);

      let buttonText: string = await resMgr.getStringValue($r('app.string.multiline_notification'));
      await driver.assertComponentExist(ON.text(buttonText));
      let btnAccept: Component = await driver.findComponent(ON.text(buttonText));
      await driver.delayMs(200);
      await btnAccept.click();
      await driver.delayMs(200);
      await messages.click();
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'MultilineNotification_001 end');
    })
    /**
     * 发送图片类型通知
     */
    it(BUNDLE + 'PictureNotification_001', 1, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'PictureNotification_001 begin');
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      let resMgr: resourceManager.ResourceManager = ability.context.resourceManager;
      await driver.assertComponentExist(ON.id('tabBar0'));
      await driver.assertComponentExist(ON.id('tabBar1'));
      let messages: Component = await driver.findComponent(ON.id('tabBar0'));
      let notification: Component = await driver.findComponent(ON.id('tabBar1'));

      await driver.delayMs(200);
      await notification.click();
      await driver.delayMs(200);

      let buttonText: string = await resMgr.getStringValue($r('app.string.picture_notification'));
      await driver.assertComponentExist(ON.text(buttonText));
      let btnAccept: Component = await driver.findComponent(ON.text(buttonText));
      await driver.delayMs(200);
      await btnAccept.click();
      await driver.delayMs(200);
      await messages.click();
      await driver.delayMs(2000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'PictureNotification_001 end');
    })

  })
}
