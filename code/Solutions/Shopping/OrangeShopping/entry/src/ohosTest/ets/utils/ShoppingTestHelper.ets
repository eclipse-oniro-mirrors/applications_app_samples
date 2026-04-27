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

import Want from '@ohos.app.ability.Want';
import { abilityDelegatorRegistry, Driver, MatchPattern, ON } from '@kit.TestKit';
import { expect } from '@ohos/hypium';
import Logger from './Logger';

const BUNDLE_NAME = 'ohos.samples.orangeshopping';
const ABILITY_NAME = 'MainAbility';
const DEFAULT_DELAY = 500;

export class TextMatcher {
  value: string;
  pattern: MatchPattern;

  constructor(value: string, pattern: MatchPattern = MatchPattern.EQUALS) {
    this.value = value;
    this.pattern = pattern;
  }
}

export class ShoppingTestHelper {
  private driver: Driver;
  private tag: string;

  constructor(driver: Driver, tag: string) {
    this.driver = driver;
    this.tag = tag;
  }

  async startMainAbility(): Promise<void> {
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ABILITY_NAME
    };
    let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    await abilityDelegator.startAbility(want, (err) => {
      Logger.info(this.tag, 'startMainAbility err ' + JSON.stringify(err));
      expect(err).assertNull();
    });
    await this.wait(1200);
    await this.closeStartupDialogs();
  }

  async closeStartupDialogs(): Promise<void> {
    await this.clickTextIfExists(await this.getResourceString($r('app.string.allow')));
    await this.clickTextIfExists(await this.getResourceString($r('app.string.allow')));
    await this.clickTextIfExists(await this.getResourceString($r('app.string.allow')));
    await this.clickTextIfExists(await this.getResourceString($r('app.string.close')));
    await this.clickTextIfExists(await this.getResourceString($r('app.string.update')));
  }

  async wait(time: number = DEFAULT_DELAY): Promise<void> {
    await this.driver.delayMs(time);
  }

  async getResourceString(resource: Resource): Promise<string> {
    let resourceManager = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager;
    return await resourceManager.getStringValue(resource);
  }

  async clickId(id: string, waitTime: number = DEFAULT_DELAY): Promise<void> {
    Logger.info(this.tag, 'clickId ' + id);
    await this.driver.assertComponentExist(ON.id(id));
    let component = await this.driver.findComponent(ON.id(id));
    await component.click();
    await this.wait(waitTime);
  }

  async clickText(text: string, waitTime: number = DEFAULT_DELAY): Promise<void> {
    Logger.info(this.tag, 'clickText ' + text);
    await this.driver.assertComponentExist(ON.text(text));
    let component = await this.driver.findComponent(ON.text(text));
    await component.click();
    await this.wait(waitTime);
  }

  async clickTextContains(text: string, waitTime: number = DEFAULT_DELAY): Promise<void> {
    Logger.info(this.tag, 'clickTextContains ' + text);
    await this.driver.assertComponentExist(ON.text(text, MatchPattern.CONTAINS));
    let component = await this.driver.findComponent(ON.text(text, MatchPattern.CONTAINS));
    await component.click();
    await this.wait(waitTime);
  }

  async clickIdIfExists(id: string, waitTime: number = DEFAULT_DELAY): Promise<boolean> {
    if (await this.existsId(id)) {
      await this.clickId(id, waitTime);
      return true;
    }
    Logger.info(this.tag, 'clickIdIfExists skipped ' + id);
    return false;
  }

  async clickTextIfExists(text: string, waitTime: number = DEFAULT_DELAY): Promise<boolean> {
    if (await this.existsText(text)) {
      await this.clickText(text, waitTime);
      return true;
    }
    Logger.info(this.tag, 'clickTextIfExists skipped ' + text);
    return false;
  }

  async existsId(id: string): Promise<boolean> {
    try {
      let component = await this.driver.findComponent(ON.id(id));
      return component !== null && component !== undefined;
    } catch (error) {
      Logger.info(this.tag, 'existsId false ' + id + ', ' + JSON.stringify(error));
      return false;
    }
  }

  async existsText(text: string): Promise<boolean> {
    try {
      let component = await this.driver.findComponent(ON.text(text));
      return component !== null && component !== undefined;
    } catch (error) {
      Logger.info(this.tag, 'existsText false ' + text + ', ' + JSON.stringify(error));
      return false;
    }
  }

  async existsTextContains(text: string): Promise<boolean> {
    try {
      let component = await this.driver.findComponent(ON.text(text, MatchPattern.CONTAINS));
      return component !== null && component !== undefined;
    } catch (error) {
      Logger.info(this.tag, 'existsTextContains false ' + text + ', ' + JSON.stringify(error));
      return false;
    }
  }

  async assertId(id: string, message: string = ''): Promise<void> {
    Logger.info(this.tag, 'assertId ' + id + ' ' + message);
    await this.driver.assertComponentExist(ON.id(id));
  }

  async assertText(text: string, message: string = ''): Promise<void> {
    Logger.info(this.tag, 'assertText ' + text + ' ' + message);
    await this.driver.assertComponentExist(ON.text(text));
  }

  async assertTextContains(text: string, message: string = ''): Promise<void> {
    Logger.info(this.tag, 'assertTextContains ' + text + ' ' + message);
    await this.driver.assertComponentExist(ON.text(text, MatchPattern.CONTAINS));
  }

  async assertAnyText(texts: TextMatcher[], message: string): Promise<void> {
    for (let index = 0; index < texts.length; index++) {
      let item = texts[index];
      if (item.pattern === MatchPattern.CONTAINS && await this.existsTextContains(item.value)) {
        Logger.info(this.tag, 'assertAnyText hit contains ' + item.value + ' ' + message);
        expect(true).assertTrue();
        return;
      }
      if (item.pattern === MatchPattern.EQUALS && await this.existsText(item.value)) {
        Logger.info(this.tag, 'assertAnyText hit equals ' + item.value + ' ' + message);
        expect(true).assertTrue();
        return;
      }
    }
    Logger.error(this.tag, 'assertAnyText failed ' + message);
    expect().assertFail();
  }

  async back(waitTime: number = DEFAULT_DELAY): Promise<void> {
    Logger.info(this.tag, 'pressBack');
    await this.driver.pressBack();
    await this.wait(waitTime);
  }

  async goHome(): Promise<void> {
    Logger.info(this.tag, 'goHome start');
    if (!await this.existsId('homeTab0')) {
      await this.back(300);
    }
    if (!await this.existsId('homeTab0')) {
      await this.back(300);
    }
    if (!await this.existsId('homeTab0')) {
      await this.startMainAbility();
    }
    await this.clickIdIfExists('homeTab0', 700);
    await this.assertId('home_scan_entry', 'home top bar should be visible');
    Logger.info(this.tag, 'goHome end');
  }

  async openGoodsDetail(goodsId: number = 0): Promise<void> {
    Logger.info(this.tag, 'openGoodsDetail ' + goodsId.toString());
    await this.goHome();
    await this.clickId('goods' + goodsId.toString(), 1200);
    await this.assertId('goodsDetail' + goodsId.toString(), 'detail root should be visible');
    await this.assertId('detail_price', 'price should be visible');
    await this.assertId('detail_title', 'title should be visible');
  }

  async switchBottomTab(tabIndex: number): Promise<void> {
    await this.goHome();
    await this.clickId('homeTab' + tabIndex.toString(), 800);
  }

  async scrollDown(distance: number = 800): Promise<void> {
    Logger.info(this.tag, 'scrollDown ' + distance.toString());
    await this.driver.swipe(360, 1100, 360, 1100 - distance, 800);
    await this.wait(600);
  }

  async scrollUp(distance: number = 800): Promise<void> {
    Logger.info(this.tag, 'scrollUp ' + distance.toString());
    await this.driver.swipe(360, 360, 360, 360 + distance, 800);
    await this.wait(600);
  }

  fail(caseName: string, error): void {
    Logger.error(this.tag, caseName + ' failed ' + JSON.stringify(error));
    expect().assertFail();
  }
}
