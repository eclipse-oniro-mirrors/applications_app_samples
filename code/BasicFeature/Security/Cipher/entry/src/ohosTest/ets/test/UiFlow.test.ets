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

// UI 流程套件（页面层）：入口导航 / 加密页 / 解密页。只用 ON.id()/ON.text() 定位，不写坐标。
// 期望值来源：spec 常量（冻结基线密文与 result 文案）+ 状态推演（重置/重进/往返）。
import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inputMethod from '@ohos.inputMethod';
import Logger from '../../../main/ets/model/Logger';

const TAG: string = '[Sample_Cipher]';
const BUNDLE: string = 'ohos.samples.cipher';
const ABILITY: string = 'EntryAbility';
const AES_BASELINE: string = 'ZtJpi1Z5BwPPXqXYRHGthQ==';
const ENC_BASE_RESULT: string = 'Encryption result is :  ZtJpi1Z5BwPPXqXYRHGthQ==';
const ENC_ERROR_RESULT: string = 'Encryption result is :  Error!';
const DEC_BASE_RESULT: string = 'Decrypt result is :  a';
const DEC_ERROR_RESULT: string = 'Decrypt result is :  Error!';

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

async function existsById(driver: Driver, id: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.id(id));
    return true;
  } catch (err) {
    return false;
  }
}

async function existsByText(driver: Driver, text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text));
    return true;
  } catch (err) {
    return false;
  }
}

async function waitForId(driver: Driver, id: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    if (await existsById(driver, id)) {
      return true;
    }
    await delay(300);
  }
  return false;
}

async function findById(driver: Driver, id: string): Promise<Component | null> {
  if (!await waitForId(driver, id, 10)) {
    return null;
  }
  return await driver.findComponent(ON.id(id));
}

async function textOf(driver: Driver, id: string): Promise<string> {
  const component: Component | null = await findById(driver, id);
  if (component === null) {
    return '';
  }
  return await component.getText();
}

async function tapById(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  if (component === null) {
    return false;
  }
  await component.click();
  await delay(300);
  return true;
}

async function tapByText(driver: Driver, text: string): Promise<boolean> {
  const component: Component | null = await driver.findComponent(ON.text(text));
  if (component === null) {
    return false;
  }
  await component.click();
  await delay(300);
  return true;
}

async function inputTextTo(driver: Driver, id: string, text: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  if (component === null) {
    return false;
  }
  await component.inputText(text);
  const controller: inputMethod.InputMethodController = inputMethod.getController();
  controller.stopInputSession();
  await delay(300);
  return true;
}

async function waitForText(driver: Driver, id: string, expected: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    const current: string = await textOf(driver, id);
    if (current === expected) {
      return true;
    }
    await delay(300);
  }
  return false;
}

async function waitForNonEmpty(driver: Driver, id: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    const current: string = await textOf(driver, id);
    if (current !== '') {
      return true;
    }
    await delay(300);
  }
  return false;
}

async function ensureHome(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 4; i++) {
    if (await existsById(driver, 'encryption')) {
      return true;
    }
    if (await existsById(driver, 'back')) {
      await tapById(driver, 'back');
    }
    await delay(500);
  }
  return false;
}

async function launchApp(driver: Driver): Promise<boolean> {
  const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  for (let i: number = 0; i < 5; i++) {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await delay(1200);
    if (await waitForId(driver, 'encryption', 4)) {
      return true;
    }
    // The ability may resume on a sub-page left by an earlier suite; walk back to home.
    for (let j: number = 0; j < 3; j++) {
      if (!await existsById(driver, 'back')) {
        break;
      }
      await tapById(driver, 'back');
      await delay(500);
    }
    if (await waitForId(driver, 'encryption', 4)) {
      return true;
    }
    Logger.info(TAG, `launchApp retry ${i}`);
  }
  return false;
}

async function openEncryptPage(driver: Driver): Promise<boolean> {
  if (!await tapById(driver, 'encryption')) {
    return false;
  }
  return await waitForId(driver, 'encryptionBtn', 8);
}

async function openDecryptPage(driver: Driver): Promise<boolean> {
  if (!await tapById(driver, 'decrypt')) {
    return false;
  }
  return await waitForId(driver, 'decryptBtn', 8);
}

export default function uiFlowTest() {
  describe('UiFlowTest', () => {
    let driver: Driver = Driver.create();

    beforeAll(async () => {
      const launched: boolean = await launchApp(driver);
      expect(launched).assertTrue();
    });

    afterEach(async () => {
      const atHome: boolean = await ensureHome(driver);
      expect(atHome).assertTrue();
    });

    /**
     * @tc.number SUB_CIPHER_UI_1001
     * @tc.name testUi1001
     * @tc.desc 入口：首页两个入口按钮均存在且可点入解密页
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1001 begin');
      const homeBtn: boolean = await existsById(driver, 'encryption');
      expect(homeBtn).assertTrue();
      const decryptBtn: boolean = await existsById(driver, 'decrypt');
      expect(decryptBtn).assertTrue();
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      Logger.info(TAG, 'testUi1001 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1002
     * @tc.name testUi1002
     * @tc.desc 入口：加密按钮可进入加密页且输入框与结果框均可见
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1002 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const inputVisible: boolean = await existsById(driver, 'encryptionInput');
      expect(inputVisible).assertTrue();
      const infoVisible: boolean = await existsById(driver, 'encryptionInfo');
      expect(infoVisible).assertTrue();
      Logger.info(TAG, 'testUi1002 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1003
     * @tc.name testUi1003
     * @tc.desc 入口：解密页算法选择与重置按钮均存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1003 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const selectVisible: boolean = await existsById(driver, 'decryptAlgorithm');
      expect(selectVisible).assertTrue();
      const resetVisible: boolean = await existsById(driver, 'decryptResetBtn');
      expect(resetVisible).assertTrue();
      Logger.info(TAG, 'testUi1003 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1004
     * @tc.name testUi1004
     * @tc.desc 入口：加密页点击返回按钮回到首页
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1004 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const backTapped: boolean = await tapById(driver, 'back');
      expect(backTapped).assertTrue();
      const homeBack: boolean = await waitForId(driver, 'encryption', 8);
      expect(homeBack).assertTrue();
      Logger.info(TAG, 'testUi1004 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1005
     * @tc.name testUi1005
     * @tc.desc 入口：解密页点击返回按钮回到首页
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1005 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const backTapped: boolean = await tapById(driver, 'back');
      expect(backTapped).assertTrue();
      const homeBack: boolean = await waitForId(driver, 'decrypt', 8);
      expect(homeBack).assertTrue();
      Logger.info(TAG, 'testUi1005 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1006
     * @tc.name testUi1006
     * @tc.desc 入口：加密页顶部标题控件与返回控件存在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1006 begin');
      const entered: boolean = await waitForId(driver, 'encryptAndDecrypt', 4);
      const encryptOpened: boolean = entered || await openEncryptPage(driver);
      expect(encryptOpened).assertTrue();
      const backVisible: boolean = await existsById(driver, 'back');
      expect(backVisible).assertTrue();
      const titleVisible: boolean = await existsById(driver, 'encryptAndDecrypt');
      expect(titleVisible).assertTrue();
      Logger.info(TAG, 'testUi1006 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1007
     * @tc.name testUi1007
     * @tc.desc 加密页：空输入点击加密不更新结果框（仅 toast 提示）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1007 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      await delay(500);
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText).assertEqual('');
      Logger.info(TAG, 'testUi1007 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1008
     * @tc.name testUi1008
     * @tc.desc 加密页：默认算法输入 a 得到冻结基线结果
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1008 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'encryptionInfo', ENC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText.length).assertEqual(48);
      Logger.info(TAG, 'testUi1008 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1009
     * @tc.name testUi1009
     * @tc.desc 加密页：显式选择 AES 后加密同样命中基线
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1009 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const selectTapped: boolean = await tapById(driver, 'encryptionAlgorithm');
      expect(selectTapped).assertTrue();
      const optionTapped: boolean = await tapByText(driver, 'AES');
      expect(optionTapped).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'encryptionInfo', ENC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      Logger.info(TAG, 'testUi1009 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1010
     * @tc.name testUi1010
     * @tc.desc 加密页：选择 RSA 后加密结果 196 字符且异于 AES 基线
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1010 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const selectTapped: boolean = await tapById(driver, 'encryptionAlgorithm');
      expect(selectTapped).assertTrue();
      const optionTapped: boolean = await tapByText(driver, 'RSA');
      expect(optionTapped).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForNonEmpty(driver, 'encryptionInfo', 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText.length).assertEqual(196);
      expect(infoText === ENC_BASE_RESULT).assertFalse();
      Logger.info(TAG, 'testUi1010 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1011
     * @tc.name testUi1011
     * @tc.desc 加密页：点击重置后结果框清空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1011 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'encryptionInfo', ENC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const resetTapped: boolean = await tapById(driver, 'encryptionResetBtn');
      expect(resetTapped).assertTrue();
      await delay(500);
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText).assertEqual('');
      Logger.info(TAG, 'testUi1011 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1012
     * @tc.name testUi1012
     * @tc.desc 加密页：重置只清结果不清输入框
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1012 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'encryptionInfo', ENC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const resetTapped: boolean = await tapById(driver, 'encryptionResetBtn');
      expect(resetTapped).assertTrue();
      await delay(300);
      const inputText: string = await textOf(driver, 'encryptionInput');
      expect(inputText).assertEqual('a');
      Logger.info(TAG, 'testUi1012 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1013
     * @tc.name testUi1013
     * @tc.desc 加密页：空白串加密走 AES 得到 48 字符带前缀结果
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1013 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', '   ');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForNonEmpty(driver, 'encryptionInfo', 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText.length).assertEqual(48);
      expect(infoText.indexOf('Encryption result is :  ') === 0).assertTrue();
      Logger.info(TAG, 'testUi1013 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1014
     * @tc.name testUi1014
     * @tc.desc 加密页：16 字符输入走 AES 得到 48 字符带前缀结果（设备无补块）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1014 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'abcdefghijklmnop');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForNonEmpty(driver, 'encryptionInfo', 10);
      expect(shown).assertTrue();
      const resultText: string = await textOf(driver, 'encryptionInfo');
      expect(resultText.length).assertEqual(48);
      expect(resultText !== '').assertTrue();
      expect(resultText.indexOf('Encryption result is :  ') === 0).assertTrue();
      Logger.info(TAG, 'testUi1014 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1015
     * @tc.name testUi1015
     * @tc.desc 加密页：中文输入加密结果带前缀且异于 a 的基线
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1015 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', '中文');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForNonEmpty(driver, 'encryptionInfo', 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText === ENC_BASE_RESULT).assertFalse();
      expect(infoText.indexOf('Encryption result is :  ') === 0).assertTrue();
      expect(infoText !== '').assertTrue();
      Logger.info(TAG, 'testUi1015 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1016
     * @tc.name testUi1016
     * @tc.desc 加密页：RSA 63 字符超限输入显示 Error! 结果
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1016 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const selectTapped: boolean = await tapById(driver, 'encryptionAlgorithm');
      expect(selectTapped).assertTrue();
      const optionTapped: boolean = await tapByText(driver, 'RSA');
      expect(optionTapped).assertTrue();
      let long63: string = '';
      for (let i: number = 0; i < 63; i++) {
        long63 += 'c';
      }
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', long63);
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'encryptionInfo', ENC_ERROR_RESULT, 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText).assertEqual(ENC_ERROR_RESULT);
      Logger.info(TAG, 'testUi1016 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1017
     * @tc.name testUi1017
     * @tc.desc 加密页：重进页面输入 b 结果 48 字符且异于 a 的基线
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1017 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'b');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForNonEmpty(driver, 'encryptionInfo', 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText.length).assertEqual(48);
      expect(infoText === ENC_BASE_RESULT).assertFalse();
      Logger.info(TAG, 'testUi1017 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1018
     * @tc.name testUi1018
     * @tc.desc 加密页：重新进入页面输入框与结果框均为初始空态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1018 begin');
      const entered: boolean = await openEncryptPage(driver);
      expect(entered).assertTrue();
      const inputText: string = await textOf(driver, 'encryptionInput');
      expect(inputText).assertEqual('');
      const infoText: string = await textOf(driver, 'encryptionInfo');
      expect(infoText).assertEqual('');
      Logger.info(TAG, 'testUi1018 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1019
     * @tc.name testUi1019
     * @tc.desc 解密页：空输入点击解密不更新结果框（仅 toast 提示）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1019 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      await delay(500);
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText).assertEqual('');
      Logger.info(TAG, 'testUi1019 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1020
     * @tc.name testUi1020
     * @tc.desc 解密页：AES 基线密文解密显示 a 且长度 22
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1020 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const selectTapped: boolean = await tapById(driver, 'decryptAlgorithm');
      expect(selectTapped).assertTrue();
      const optionTapped: boolean = await tapByText(driver, 'AES');
      expect(optionTapped).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'decryptInput', AES_BASELINE);
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText.length).assertEqual(22);
      Logger.info(TAG, 'testUi1020 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1021
     * @tc.name testUi1021
     * @tc.desc 解密页：默认算法（未选择）解密基线密文同样命中
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      Logger.info(TAG, 'testUi1021 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'decryptInput', AES_BASELINE);
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText).assertEqual(DEC_BASE_RESULT);
      Logger.info(TAG, 'testUi1021 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1022
     * @tc.name testUi1022
     * @tc.desc 解密页：RSA 模式下非密文输入显示 Error! 结果
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1022 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const selectTapped: boolean = await tapById(driver, 'decryptAlgorithm');
      expect(selectTapped).assertTrue();
      const optionTapped: boolean = await tapByText(driver, 'RSA');
      expect(optionTapped).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'decryptInput', 'hello');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_ERROR_RESULT, 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText).assertEqual(DEC_ERROR_RESULT);
      Logger.info(TAG, 'testUi1022 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1023
     * @tc.name testUi1023
     * @tc.desc 解密页：AES 模式下乱串输入显示 Error! 结果
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1023 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'decryptInput', '###');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_ERROR_RESULT, 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText).assertEqual(DEC_ERROR_RESULT);
      Logger.info(TAG, 'testUi1023 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1024
     * @tc.name testUi1024
     * @tc.desc 解密页：点击重置后结果框清空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1024 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'decryptInput', AES_BASELINE);
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const resetTapped: boolean = await tapById(driver, 'decryptResetBtn');
      expect(resetTapped).assertTrue();
      await delay(500);
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText).assertEqual('');
      Logger.info(TAG, 'testUi1024 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1025
     * @tc.name testUi1025
     * @tc.desc 解密页：连续两次解密同一密文结果一致
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1025 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'decryptInput', AES_BASELINE);
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const clickedAgain: boolean = await tapById(driver, 'decryptBtn');
      expect(clickedAgain).assertTrue();
      await delay(500);
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText).assertEqual(DEC_BASE_RESULT);
      Logger.info(TAG, 'testUi1025 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1026
     * @tc.name testUi1026
     * @tc.desc 解密页：RSA 模式下 AES 密文解密失败显示 Error!
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1026 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const selectTapped: boolean = await tapById(driver, 'decryptAlgorithm');
      expect(selectTapped).assertTrue();
      const optionTapped: boolean = await tapByText(driver, 'RSA');
      expect(optionTapped).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'decryptInput', AES_BASELINE);
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_ERROR_RESULT, 10);
      expect(shown).assertTrue();
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText).assertEqual(DEC_ERROR_RESULT);
      Logger.info(TAG, 'testUi1026 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1027
     * @tc.name testUi1027
     * @tc.desc 解密页：重置后再解密仍得到正确结果
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1027 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'decryptInput', AES_BASELINE);
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const resetTapped: boolean = await tapById(driver, 'decryptResetBtn');
      expect(resetTapped).assertTrue();
      const clickedAgain: boolean = await tapById(driver, 'decryptBtn');
      expect(clickedAgain).assertTrue();
      const shownAgain: boolean = await waitForText(driver, 'decryptInfo', DEC_BASE_RESULT, 10);
      expect(shownAgain).assertTrue();
      Logger.info(TAG, 'testUi1027 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1028
     * @tc.name testUi1028
     * @tc.desc 解密页：RSA 模式 172 字符超长输入解密失败显示 Error!
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1028 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const selectTapped: boolean = await tapById(driver, 'decryptAlgorithm');
      expect(selectTapped).assertTrue();
      const optionTapped: boolean = await tapByText(driver, 'RSA');
      expect(optionTapped).assertTrue();
      let long172: string = '';
      for (let i: number = 0; i < 172; i++) {
        long172 += 'A';
      }
      const typed: boolean = await inputTextTo(driver, 'decryptInput', long172);
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'decryptBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'decryptInfo', DEC_ERROR_RESULT, 10);
      expect(shown).assertTrue();
      Logger.info(TAG, 'testUi1028 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1029
     * @tc.name testUi1029
     * @tc.desc 解密页：重新进入页面输入框与结果框均为初始空态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1029 begin');
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const inputText: string = await textOf(driver, 'decryptInput');
      expect(inputText).assertEqual('');
      const infoText: string = await textOf(driver, 'decryptInfo');
      expect(infoText).assertEqual('');
      Logger.info(TAG, 'testUi1029 end');
    });

    /**
     * @tc.number SUB_CIPHER_UI_1030
     * @tc.name testUi1030
     * @tc.desc 解密页：加密页产出密文直接用于解密页完整还原 UI 往返
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      Logger.info(TAG, 'testUi1030 begin');
      const opened: boolean = await openEncryptPage(driver);
      expect(opened).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      expect(typed).assertTrue();
      const clicked: boolean = await tapById(driver, 'encryptionBtn');
      expect(clicked).assertTrue();
      const shown: boolean = await waitForText(driver, 'encryptionInfo', ENC_BASE_RESULT, 10);
      expect(shown).assertTrue();
      const backTapped: boolean = await tapById(driver, 'back');
      expect(backTapped).assertTrue();
      const homeBack: boolean = await waitForId(driver, 'decrypt', 8);
      expect(homeBack).assertTrue();
      const entered: boolean = await openDecryptPage(driver);
      expect(entered).assertTrue();
      const typedDec: boolean = await inputTextTo(driver, 'decryptInput', AES_BASELINE);
      expect(typedDec).assertTrue();
      const clickedDec: boolean = await tapById(driver, 'decryptBtn');
      expect(clickedDec).assertTrue();
      const shownDec: boolean = await waitForText(driver, 'decryptInfo', DEC_BASE_RESULT, 10);
      expect(shownDec).assertTrue();
      Logger.info(TAG, 'testUi1030 end');
    });
  });
}
