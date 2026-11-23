/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

// ActsAbilityTest 整改：旧用例补 @tc 元数据并收敛为启动与全链路两例。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inputMethod from '@ohos.inputMethod';
import Logger from '../../../main/ets/model/Logger';

const TAG: string = '[Sample_Cipher]'
const BUNDLE: string = 'Cipher_'
const ENC_BASE_RESULT: string = 'Encryption result is :  ZtJpi1Z5BwPPXqXYRHGthQ=='

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

async function hasComponent(driver: Driver, id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (err) {
    return false;
  }
}

async function hasText(driver: Driver, text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text));
    return true;
  } catch (err) {
    return false;
  }
}

async function waitForComponent(driver: Driver, id: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    if (await hasComponent(driver, id)) {
      return true;
    }
    await delay(300);
  }
  return false;
}

async function clickById(driver: Driver, id: string): Promise<boolean> {
  if (!await waitForComponent(driver, id, 10)) {
    return false;
  }
  const component: Component = await driver.findComponent(ON.id(id));
  await component.click();
  await delay(300);
  return true;
}

async function clickByText(driver: Driver, text: string): Promise<boolean> {
  if (!await hasText(driver, text)) {
    return false;
  }
  const component: Component = await driver.findComponent(ON.text(text));
  await component.click();
  await delay(300);
  return true;
}

async function inputInto(driver: Driver, id: string, text: string): Promise<boolean> {
  if (!await waitForComponent(driver, id, 10)) {
    return false;
  }
  const component: Component = await driver.findComponent(ON.id(id));
  await component.inputText(text);
  const controller: inputMethod.InputMethodController = inputMethod.getController();
  controller.stopInputSession();
  await delay(300);
  return true;
}

async function waitForResultText(driver: Driver, id: string, expected: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    if (!await waitForComponent(driver, id, 3)) {
      return false;
    }
    const component: Component = await driver.findComponent(ON.id(id));
    const current: string = await component.getText();
    if (current === expected) {
      return true;
    }
    await delay(300);
  }
  return false;
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number SUB_CIPHER_ACTS_0001
     * @tc.name testActs0001
     * @tc.desc 拉起应用后首页两个入口按钮均存在且文案非空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testActs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, BUNDLE + 'testActs0001 begin')
      const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      await abilityDelegator.startAbility({
        bundleName: 'ohos.samples.cipher',
        abilityName: 'EntryAbility'
      })
      const driver: Driver = Driver.create()
      await delay(300)
      const encExists: boolean = await hasComponent(driver, 'encryption')
      expect(encExists).assertTrue()
      const decExists: boolean = await hasComponent(driver, 'decrypt')
      expect(decExists).assertTrue()
      const encButton: Component = await driver.findComponent(ON.id('encryption'))
      const encLabel: string = await encButton.getText()
      expect(encLabel.length > 0).assertTrue()
      Logger.info(TAG, BUNDLE + 'testActs0001 end')
    })

    /**
     * @tc.number SUB_CIPHER_ACTS_0002
     * @tc.name testActs0002
     * @tc.desc 选择 AES 加密 a 后结果命中冻结基线密文
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testActs0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      Logger.info(TAG, BUNDLE + 'testActs0002 begin')
      const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      await abilityDelegator.startAbility({
        bundleName: 'ohos.samples.cipher',
        abilityName: 'EntryAbility'
      })
      const driver: Driver = Driver.create()
      await delay(300)
      const navClicked: boolean = await clickById(driver, 'encryption')
      expect(navClicked).assertTrue()
      const selectClicked: boolean = await clickById(driver, 'encryptionAlgorithm')
      expect(selectClicked).assertTrue()
      const aesClicked: boolean = await clickByText(driver, 'AES')
      expect(aesClicked).assertTrue()
      const typed: boolean = await inputInto(driver, 'encryptionInput', 'a')
      expect(typed).assertTrue()
      const encryptClicked: boolean = await clickById(driver, 'encryptionBtn')
      expect(encryptClicked).assertTrue()
      const shown: boolean = await waitForResultText(driver, 'encryptionInfo', ENC_BASE_RESULT, 10)
      expect(shown).assertTrue()
      Logger.info(TAG, BUNDLE + 'testActs0002 end')
    })
  })
}
