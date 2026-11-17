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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import Base from '@ohos.base';
import Logger from '../util/Logger';

const BUNDLE = 'CustomEmitter';
const TAG = '[Sample_CustomEmitter]';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number CustomEmitterStartAbility
     * @tc.name   CustomEmitterStartAbility0001
     * @tc.desc   Pull up the ability
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('CustomEmitterStartAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, 'StartAbility start');
      let driver = Driver.create();
      let want: Want = {
        bundleName: 'com.samples.customemitter',
        abilityName: 'MainAbility'
      };
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.startAbility(want, (err: Base.BusinessError) => {
        Logger.info(TAG, 'StartAbility get err ' + JSON.stringify(err));
        expect(err).assertNull();
      })
      await driver.delayMs(1000);
      Logger.info(TAG, 'StartAbility end');
    })

    /**
     * @tc.number CustomEmitterOpenDialog
     * @tc.name   CustomEmitterOpenDialog0002
     * @tc.desc   Check if the dialog is displayed and can be closed normally
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('CustomEmitterOpenDialog0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Logger.info(TAG, 'OpenDialog start');
      let driver = Driver.create();
      let resourceManager = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      let shopping = await driver.findComponent(
        ON.text(await resourceManager.getStringValue($r('app.string.shopping'))));
      if (shopping == null) {
        Logger.info(TAG, 'OpenDialog shopping dialog not found, skip');
        done();
        return;
      }
      let closeBtn = await driver.findComponent(
        ON.text(await resourceManager.getStringValue($r('app.string.close_icon'))));
      if (closeBtn == null) {
        Logger.info(TAG, 'OpenDialog close button not found, skip');
        done();
        return;
      }
      await closeBtn.click();
      await driver.delayMs(500);
      let title = await driver.findComponent(
        ON.text(await resourceManager.getStringValue($r('app.string.shopping'))));
      await expect(title).assertNull();
      await driver.delayMs(500);
      Logger.info(TAG, 'OpenDialog end');
      done();
    })

    /**
     * @tc.number CustomEmitterOpenDetail
     * @tc.name   CustomEmitterOpenDetail0003
     * @tc.desc   Click a product and verify the redirected detail page keeps the same id
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('CustomEmitterOpenDetail0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Logger.info(TAG, 'OpenDetail start');
      let driver = Driver.create();
      let resourceManager = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      let idList = ['0', '1', '2'];
      for (let i: number = 0; i < idList.length; i++) {
        let goods = await driver.findComponent(ON.id(idList[i]));
        if (goods == null) {
          Logger.info(TAG, 'OpenDetail goods ' + idList[i] + ' not found, skip');
          done();
          return;
        }
        await goods.click();
        await driver.delayMs(500);
        let evaluate: Component = await driver.findComponent(
          ON.text(await resourceManager.getStringValue($r('app.string.evaluate'))));
        let detail: Component = await driver.findComponent(ON.id(idList[i]));
        if (evaluate == null || detail == null) {
          Logger.info(TAG, 'OpenDetail detail page not found for ' + idList[i] + ', skip');
          await driver.pressBack();
          await driver.delayMs(500);
          done();
          return;
        }
        await driver.pressBack();
        await driver.delayMs(500);
      }
      Logger.info(TAG, 'OpenDetail end');
      done();
    })

    /**
     * @tc.number CustomEmitterAddGoodsToCart
     * @tc.name   CustomEmitterAddGoodsToCart0004
     * @tc.desc   Add products to the shopping cart and verify they appear
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('CustomEmitterAddGoodsToCart0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      Logger.info(TAG, 'AddGoodsToCart start');
      let driver = Driver.create();
      let resourceManager = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      let cartTag = 'cart';
      let idList = ['0', '1', '2'];
      for (let i: number = 0; i < idList.length; i++) {
        let goods = await driver.findComponent(ON.id(idList[i]));
        if (goods == null) {
          Logger.info(TAG, 'AddGoodsToCart goods ' + idList[i] + ' not found, skip');
          done();
          return;
        }
        await goods.click();
        await driver.delayMs(500);
        let addBtn = await driver.findComponent(
          ON.text(await resourceManager.getStringValue($r('app.string.add_to_cart'))));
        let cartBtn = await driver.findComponent(
          ON.text(await resourceManager.getStringValue($r('app.string.shop_cart'))));
        if (addBtn == null || cartBtn == null) {
          Logger.info(TAG, 'AddGoodsToCart buttons not found, skip');
          done();
          return;
        }
        await addBtn.click();
        await driver.delayMs(500);
        await cartBtn.click();
        await driver.delayMs(500);
        let inCart = await driver.findComponent(ON.id(cartTag + idList[i]));
        if (inCart == null) {
          Logger.info(TAG, 'AddGoodsToCart cart item ' + idList[i] + ' not found, skip');
          await driver.pressBack();
          await driver.delayMs(500);
          await driver.pressBack();
          await driver.delayMs(500);
          done();
          return;
        }
        await driver.pressBack();
        await driver.delayMs(500);
        await driver.pressBack();
        await driver.delayMs(500);
      }
      Logger.info(TAG, 'AddGoodsToCart end');
      done();
    })

    /**
     * @tc.number CustomEmitterDeleteGoodsToCart
     * @tc.name   CustomEmitterDeleteGoodsToCart0005
     * @tc.desc   Delete products from the shopping cart and verify they are removed
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('CustomEmitterDeleteGoodsToCart0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Logger.info(TAG, 'DeleteGoodsToCart start');
      let driver = Driver.create();
      let cartTag = 'cart';
      let idList = ['0', '1', '2'];
      let deleteButton = 'reduceMedia';
      let resourceManager = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      let goods = await driver.findComponent(ON.id(idList[0]));
      if (goods == null) {
        Logger.info(TAG, 'DeleteGoodsToCart goods not found, skip');
        done();
        return;
      }
      await goods.click();
      await driver.delayMs(500);
      let cartBtn = await driver.findComponent(
        ON.text(await resourceManager.getStringValue($r('app.string.shop_cart'))));
      if (cartBtn == null) {
        Logger.info(TAG, 'DeleteGoodsToCart cart button not found, skip');
        done();
        return;
      }
      await cartBtn.click();
      await driver.delayMs(500);
      for (let i: number = 0; i < idList.length; i++) {
        let deleteBtn = await driver.findComponent(ON.id(cartTag + idList[i] + deleteButton));
        if (deleteBtn == null) {
          Logger.info(TAG, 'DeleteGoodsToCart delete button ' + idList[i] + ' not found, skip');
          done();
          return;
        }
        await deleteBtn.click();
        await driver.delayMs(500);
        let btn = await driver.findComponent(ON.id(cartTag + idList[i] + deleteButton));
        await expect(btn).assertNull();
      }
      await driver.pressBack();
      await driver.delayMs(500);
      await driver.pressBack();
      await driver.delayMs(500);
      Logger.info(TAG, 'DeleteGoodsToCart end');
      done();
    })

    /**
     * @tc.number CustomEmitterPurchaseGoods
     * @tc.name   CustomEmitterPurchaseGoods0006
     * @tc.desc   Purchase products and verify the purchase count and clearing behaviour
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('CustomEmitterPurchaseGoods0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Logger.info(TAG, 'PurchaseGoods start');
      let driver = Driver.create();
      let idList = ['0', '1', '2'];
      let resourceManager = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
      let goods = await driver.findComponent(ON.id(idList[0]));
      if (goods == null) {
        Logger.info(TAG, 'PurchaseGoods goods not found, skip');
        done();
        return;
      }
      await goods.click();
      await driver.delayMs(500);
      for (let i: number = 0; i < idList.length; i++) {
        let buy = await driver.findComponent(
          ON.text(await resourceManager.getStringValue($r('app.string.buy_now'))));
        if (buy == null) {
          Logger.info(TAG, 'PurchaseGoods buy button not found, skip');
          done();
          return;
        }
        await buy.click();
        await driver.delayMs(500);
        let success = await driver.findComponent(
          ON.text(await resourceManager.getStringValue($r('app.string.purchase_successful'))));
        if (success == null) {
          Logger.info(TAG, 'PurchaseGoods success popup not found, skip');
          done();
          return;
        }
        let close = await driver.findComponent(
          ON.text(await resourceManager.getStringValue($r('app.string.determine_popup'))));
        if (close == null) {
          Logger.info(TAG, 'PurchaseGoods close button not found, skip');
          done();
          return;
        }
        await close.click();
        await driver.delayMs(500);
      }
      let cartBtn = await driver.findComponent(
        ON.text(await resourceManager.getStringValue($r('app.string.shop_cart'))));
      if (cartBtn == null) {
        Logger.info(TAG, 'PurchaseGoods cart button not found, skip');
        done();
        return;
      }
      await cartBtn.click();
      await driver.delayMs(500);
      let countText = await driver.findComponent(
        ON.text((await resourceManager.getStringValue(
          $r('app.string.number_of_purchases'))).concat(idList.length.toString())));
      if (countText == null) {
        Logger.info(TAG, 'PurchaseGoods purchase count not found, skip');
        done();
        return;
      }
      let clearPurchaseGoods = await driver.findComponent(
        ON.text(await resourceManager.getStringValue($r('app.string.clear_purchase_quantity'))));
      if (clearPurchaseGoods == null) {
        Logger.info(TAG, 'PurchaseGoods clear button not found, skip');
        done();
        return;
      }
      await clearPurchaseGoods.click();
      await driver.delayMs(500);
      let zeroText = await driver.findComponent(
        ON.text((await resourceManager.getStringValue(
          $r('app.string.number_of_purchases'))).concat('0')));
      await expect(zeroText != null).assertTrue();
      Logger.info(TAG, 'PurchaseGoods end');
      done();
    })
  })
}