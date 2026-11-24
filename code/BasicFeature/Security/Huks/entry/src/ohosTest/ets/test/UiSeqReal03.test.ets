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

// UiSeq 补充场景套件三：手写用例，覆盖 主流程 / 边界 / 异常 / 状态 四类。
import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Huks]';
const BUNDLE: string = 'com.samples.huks';
const ABILITY: string = 'EntryAbility';
const HOME_ID: string = 'new_key';

// SM2 密文为 DER 编码 SEQUENCE{INTEGER x, INTEGER y, OCTET STRING hash, OCTET STRING 明文}，
// 外框与两坐标 DER 头合计 107~109 字节；坐标出现前导零字节时最少再减 2 字节。
const SM2_OVERHEAD_MIN: number = 105;
const SM2_OVERHEAD_MAX: number = 109;

function sm2Base64LenOk(base64Len: number, plainLen: number): boolean {
  return base64Len % 4 === 0 &&
    base64Len >= Math.ceil((SM2_OVERHEAD_MIN + plainLen) / 3) * 4 &&
    base64Len <= Math.ceil((SM2_OVERHEAD_MAX + plainLen) / 3) * 4;
}

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

// 存在性判断走 assertComponentExist + try/catch，找不到返回 false 不抛错。
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
  if (!component) {
    return '';
  }
  return await component.getText();
}

// 轮询等待 id 文本等于期望值，避免用长 sleep 猜时序。
async function waitForTextIs(driver: Driver, id: string, expected: string, attempts: number): Promise<boolean> {
  for (let i: number = 0; i < attempts; i++) {
    if (await textOf(driver, id) === expected) {
      return true;
    }
    await delay(300);
  }
  return false;
}

// 轮询等待 id 文本非空，返回最终文本。
async function waitForTextNotEmpty(driver: Driver, id: string, attempts: number): Promise<string> {
  for (let i: number = 0; i < attempts; i++) {
    const text: string = await textOf(driver, id);
    if (text !== '') {
      return text;
    }
    await delay(300);
  }
  return '';
}

// 轮询等待 id 文本不再等于 previous，超时返回 previous（不等式断言安全降级）。
async function waitForTextDifferent(driver: Driver, id: string, previous: string, attempts: number): Promise<string> {
  for (let i: number = 0; i < attempts; i++) {
    const text: string = await textOf(driver, id);
    if (text !== previous) {
      return text;
    }
    await delay(300);
  }
  return previous;
}

// 点击只执行一次，结果存 const 后再喂给断言。
async function tap(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  if (!component) {
    return false;
  }
  await component.click();
  await delay(300);
  return true;
}

async function inputTextTo(driver: Driver, id: string, text: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  if (!component) {
    return false;
  }
  await component.inputText(text);
  await delay(300);
  // 输入会拉起输入法并压缩窗口，收起后再点下方控件，否则点击落在窗口外。
  await driver.pressBack();
  await delay(500);
  return true;
}

async function unlockIfNeeded(driver: Driver): Promise<void> {
  if (await existsByText(driver, 'Swipe up to unlock') || await existsByText(driver, '向上滑动解锁')) {
    await driver.swipe(360, 1100, 360, 300, 600);
    await delay(1000);
    hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'unlocked lock screen');
  }
}

async function dismissDialogs(driver: Driver): Promise<void> {
  const texts: string[] = ['Allow', 'Allow all', 'Always allow', 'While using the app', 'Only this time',
    '允许', '始终允许'];
  for (let round: number = 0; round < 3; round++) {
    let clicked: boolean = false;
    for (let i: number = 0; i < texts.length; i++) {
      if (await existsByText(driver, texts[i])) {
        const button: Component | null = await driver.findComponent(ON.text(texts[i]));
        if (button) {
          await button.click();
          await delay(400);
          clicked = true;
          break;
        }
      }
    }
    if (!clicked) {
      return;
    }
  }
}

async function launchApp(driver: Driver): Promise<boolean> {
  await unlockIfNeeded(driver);
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  for (let i: number = 0; i < 5; i++) {
    const want: Want = { bundleName: BUNDLE, abilityName: ABILITY };
    await delegator.startAbility(want);
    await delay(1500);
    await dismissDialogs(driver);
    if (await waitForId(driver, HOME_ID, 4)) {
      return true;
    }
    hilog.info(LOG_DOMAIN, LOG_TAG, 'launchApp retry %{public}d', i);
  }
  return false;
}

// 每例结束回到 Index 入口，保证用例间零依赖；已在 Index 时不按返回键（避免退出应用）。
async function backToIndex(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 6; i++) {
    if (await existsById(driver, HOME_ID)) {
      return true;
    }
    await driver.pressBack();
    await delay(500);
  }
  return await existsById(driver, HOME_ID);
}

export default function uiSeqReal03Test() {
  describe('UiSeqReal03', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      const launched: boolean = await launchApp(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'launched=%{public}s expected=true', String(launched));
      expect(launched).assertTrue();
    });

    afterEach(async () => {
      const atHome: boolean = await backToIndex(driver);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'atHome=%{public}s expected=true', String(atHome));
      expect(atHome).assertTrue();
    });

    /**
     * @tc.name   testUiSeq0348
     * @tc.number SUB_Huks_UISEQ_0348
     * @tc.desc   边界：旧密钥页输入 abcde 加密得 24 字符密文，导入后解密原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0348 begin');
      const plain: string = 'abcde';
      const tappedOld: boolean = await tap(driver, 'old_key');
      const importVisible: boolean = await waitForId(driver, 'importKeyBtn', 4);
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', plain);
      const tappedEncrypt: boolean = await tap(driver, 'encryptionBtn');
      const cipherText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const tappedImport: boolean = await tap(driver, 'importKeyBtn');
      const tappedDecrypt: boolean = await tap(driver, 'decryptionBtn');
      const decrypted: boolean = await waitForTextIs(driver, 'decryptionInfo', plain, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedOld), String(true));
      expect(tappedOld).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(importVisible), String(true));
      expect(importVisible).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed), String(true));
      expect(typed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedEncrypt), String(true));
      expect(tappedEncrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText.length), String(24));
      expect(cipherText.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedImport), String(true));
      expect(tappedImport).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedDecrypt), String(true));
      expect(tappedDecrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(decrypted), String(true));
      expect(decrypted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0348 end');
    });

    /**
     * @tc.name   testUiSeq0349
     * @tc.number SUB_Huks_UISEQ_0349
     * @tc.desc   主流程：新密钥页输入 main-ui 加密得 36 字符密文，解密原文恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0349 begin');
      const plain: string = 'main-ui';
      const tappedNew: boolean = await tap(driver, 'new_key');
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', plain);
      const tappedEncrypt: boolean = await tap(driver, 'encryptionBtn');
      const cipherText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const tappedDecrypt: boolean = await tap(driver, 'decryptionBtn');
      const decrypted: boolean = await waitForTextIs(driver, 'decryptionInfo', plain, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedNew), String(true));
      expect(tappedNew).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed), String(true));
      expect(typed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedEncrypt), String(true));
      expect(tappedEncrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText.length), String(36));
      expect(cipherText.length).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedDecrypt), String(true));
      expect(tappedDecrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(decrypted), String(true));
      expect(decrypted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0349 end');
    });

    /**
     * @tc.name   testUiSeq0350
     * @tc.number SUB_Huks_UISEQ_0350
     * @tc.desc   异常路径：旧密钥页输入感叹号加密得 24 字符密文，导入后解密还原
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0350 begin');
      const plain: string = '!';
      const tappedOld: boolean = await tap(driver, 'old_key');
      const importVisible: boolean = await waitForId(driver, 'importKeyBtn', 4);
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', plain);
      const tappedEncrypt: boolean = await tap(driver, 'encryptionBtn');
      const cipherText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const tappedImport: boolean = await tap(driver, 'importKeyBtn');
      const tappedDecrypt: boolean = await tap(driver, 'decryptionBtn');
      const decrypted: boolean = await waitForTextIs(driver, 'decryptionInfo', plain, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedOld), String(true));
      expect(tappedOld).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(importVisible), String(true));
      expect(importVisible).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed), String(true));
      expect(typed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedEncrypt), String(true));
      expect(tappedEncrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText.length), String(24));
      expect(cipherText.length).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedImport), String(true));
      expect(tappedImport).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedDecrypt), String(true));
      expect(tappedDecrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(decrypted), String(true));
      expect(decrypted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0350 end');
    });

    /**
     * @tc.name   testUiSeq0351
     * @tc.number SUB_Huks_UISEQ_0351
     * @tc.desc   状态：未提交输入跨页面不保留，随后输入 st4t 加密得 28 字符密文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0351 begin');
      const plain: string = 'st4t';
      const tappedNew1: boolean = await tap(driver, 'new_key');
      const typed1: boolean = await inputTextTo(driver, 'encryptionInput', plain);
      const atHome: boolean = await backToIndex(driver);
      const tappedNew2: boolean = await tap(driver, 'new_key');
      const input2: string = await textOf(driver, 'encryptionInput');
      const typed2: boolean = await inputTextTo(driver, 'encryptionInput', plain);
      const tappedEncrypt: boolean = await tap(driver, 'encryptionBtn');
      const cipherText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const tappedDecrypt: boolean = await tap(driver, 'decryptionBtn');
      const decrypted: boolean = await waitForTextIs(driver, 'decryptionInfo', plain, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedNew1), String(true));
      expect(tappedNew1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed1), String(true));
      expect(typed1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(atHome), String(true));
      expect(atHome).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedNew2), String(true));
      expect(tappedNew2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', input2, String(''));
      expect(input2 === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed2), String(true));
      expect(typed2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedEncrypt), String(true));
      expect(tappedEncrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText.length), String(28));
      expect(cipherText.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedDecrypt), String(true));
      expect(tappedDecrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(decrypted), String(true));
      expect(decrypted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0351 end');
    });

    /**
     * @tc.name   testUiSeq0352
     * @tc.number SUB_Huks_UISEQ_0352
     * @tc.desc   边界：最小访问控制页保存 emoji 密码，密文为合法 DER 长度且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0352 begin');
      const tappedMin: boolean = await tap(driver, 'min_access_control');
      const passwordVisible: boolean = await waitForId(driver, 'passwordInput', 4);
      const typed: boolean = await inputTextTo(driver, 'passwordInput', '😀');
      const tappedSave: boolean = await tap(driver, 'save_password');
      const cipherText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedMin), String(true));
      expect(tappedMin).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(passwordVisible), String(true));
      expect(passwordVisible).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed), String(true));
      expect(typed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedSave), String(true));
      expect(tappedSave).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText.length), String(132));
      expect(sm2Base64LenOk(cipherText.length, 2)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText !== ''), String(true));
      expect(cipherText !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0352 end');
    });

    /**
     * @tc.name   testUiSeq0353
     * @tc.number SUB_Huks_UISEQ_0353
     * @tc.desc   主流程：最小访问控制页锁图标密码两次保存，密文长度合法且两轮不同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0353 begin');
      const tappedMin: boolean = await tap(driver, 'min_access_control');
      const passwordVisible: boolean = await waitForId(driver, 'passwordInput', 4);
      const typed: boolean = await inputTextTo(driver, 'passwordInput', '🔐');
      const tappedSave1: boolean = await tap(driver, 'save_password');
      const cipher1: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const tappedSave2: boolean = await tap(driver, 'save_password');
      const cipher2: string = await waitForTextDifferent(driver, 'cipherTextinfo', cipher1, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedMin), String(true));
      expect(tappedMin).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(passwordVisible), String(true));
      expect(passwordVisible).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed), String(true));
      expect(typed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedSave1), String(true));
      expect(tappedSave1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher1.length), String(132));
      expect(sm2Base64LenOk(cipher1.length, 2)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedSave2), String(true));
      expect(tappedSave2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipher2.length), String(132));
      expect(sm2Base64LenOk(cipher2.length, 2)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipher1 !== cipher2), String(true));
      expect(cipher1 !== cipher2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0353 end');
    });

    /**
     * @tc.name   testUiSeq0354
     * @tc.number SUB_Huks_UISEQ_0354
     * @tc.desc   异常路径：最小访问控制页保存两个空格密码，密文为合法 DER 长度且非空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0354 begin');
      const tappedMin: boolean = await tap(driver, 'min_access_control');
      const passwordVisible: boolean = await waitForId(driver, 'passwordInput', 4);
      const typed: boolean = await inputTextTo(driver, 'passwordInput', '  ');
      const tappedSave: boolean = await tap(driver, 'save_password');
      const cipherText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedMin), String(true));
      expect(tappedMin).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(passwordVisible), String(true));
      expect(passwordVisible).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed), String(true));
      expect(typed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedSave), String(true));
      expect(tappedSave).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText.length), String(132));
      expect(sm2Base64LenOk(cipherText.length, 2)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText !== ''), String(true));
      expect(cipherText !== '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0354 end');
    });

    /**
     * @tc.name   testUiSeq0355
     * @tc.number SUB_Huks_UISEQ_0355
     * @tc.desc   状态：新密钥旧密钥交替导航后输入 final 加密得 28 字符密文，解密恢复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0355 begin');
      const plain: string = 'final';
      const tappedNew1: boolean = await tap(driver, 'new_key');
      const newInput: boolean = await waitForId(driver, 'encryptionInput', 4);
      const back1: boolean = await backToIndex(driver);
      const tappedOld: boolean = await tap(driver, 'old_key');
      const oldImport: boolean = await waitForId(driver, 'importKeyBtn', 4);
      const back2: boolean = await backToIndex(driver);
      const tappedNew2: boolean = await tap(driver, 'new_key');
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', plain);
      const tappedEncrypt: boolean = await tap(driver, 'encryptionBtn');
      const cipherText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const tappedDecrypt: boolean = await tap(driver, 'decryptionBtn');
      const decrypted: boolean = await waitForTextIs(driver, 'decryptionInfo', plain, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedNew1), String(true));
      expect(tappedNew1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(newInput), String(true));
      expect(newInput).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back1), String(true));
      expect(back1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedOld), String(true));
      expect(tappedOld).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(oldImport), String(true));
      expect(oldImport).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(back2), String(true));
      expect(back2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedNew2), String(true));
      expect(tappedNew2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed), String(true));
      expect(typed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedEncrypt), String(true));
      expect(tappedEncrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(cipherText.length), String(28));
      expect(cipherText.length).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedDecrypt), String(true));
      expect(tappedDecrypt).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(decrypted), String(true));
      expect(decrypted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0355 end');
    });

  });
}
