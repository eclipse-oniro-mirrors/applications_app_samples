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

// UI 套件：只用语义 id 定位（ON.id），不写坐标点击；滑动只取控件中心点。
// 期望值来源：main 冻结行为（AES-GCM 密文长度 = utf8Len+16 再 base64；SM4-CBC-PKCS7 固定密钥定长；
// 非 ASCII 解密为确定 mojibake）与逻辑层已审计常量一致。
// 副作用调用（点击/输入/取文本）只求值一次存 const，再喂给日志与内联断言。
import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Huks]';
const BUNDLE: string = 'com.samples.huks';
const ABILITY: string = 'EntryAbility';
const HOME_ID: string = 'new_key';
const PLAIN_20: string = '01234567890123456789';
const MOJIBAKE_ZH_UTF8: string = '\u00E4\u00B8\u00AD\u00E6\u0096\u0087\u00E6\u00B5\u008B\u00E8\u00AF\u0095';
const MOJIBAKE_EMOJI_UTF8: string = '\u00F0\u009F\u0098\u0080';

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
    hilog.info(DOMAIN, TAG, '%{public}s', 'unlocked lock screen');
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
    hilog.info(DOMAIN, TAG, 'launchApp retry %{public}d', i);
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

export default function uiCore() {
  describe('UiCore', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      const launched: boolean = await launchApp(driver);
      hilog.info(DOMAIN, TAG, 'launched=%{public}s expected=true', String(launched));
      expect(launched).assertTrue();
    });

    afterEach(async () => {
      const atHome: boolean = await backToIndex(driver);
      hilog.info(DOMAIN, TAG, 'atHome=%{public}s expected=true', String(atHome));
      expect(atHome).assertTrue();
    });

    /**
     * @tc.number SUB_Huks_UI_1001
     * @tc.name testUi1001
     * @tc.desc 启动应用后首屏三个入口按钮可见，界面为已知入口状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testUi1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1001 begin');
      const hasNewKey: boolean = await existsById(driver, 'new_key');
      hilog.info(DOMAIN, TAG, 'new_key=%{public}s expected=true', String(hasNewKey));
      expect(hasNewKey).assertTrue();
      const hasOldKey: boolean = await existsById(driver, 'old_key');
      hilog.info(DOMAIN, TAG, 'old_key=%{public}s expected=true', String(hasOldKey));
      expect(hasOldKey).assertTrue();
      const hasMinAccess: boolean = await existsById(driver, 'min_access_control');
      hilog.info(DOMAIN, TAG, 'min_access_control=%{public}s expected=true', String(hasMinAccess));
      expect(hasMinAccess).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1001 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1002
     * @tc.name testUi1002
     * @tc.desc 新密钥页输入 hello 加密，密文区出现 28 字符密文且明文区仍为空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testUi1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1002 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'encryptionInput', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'hello');
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 28);
      expect(cipher.length).assertEqual(28);
      const plainText: string = await textOf(driver, 'decryptionInfo');
      hilog.info(DOMAIN, TAG, 'plainEmpty=%{public}s expected=true', String(plainText === ''));
      expect(plainText === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1002 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1003
     * @tc.name testUi1003
     * @tc.desc 新密钥页 hello 加密后解密，明文区恢复 hello 且密文区保持非空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testUi1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1003 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'encryptionInput', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'hello');
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 28);
      expect(cipher.length).assertEqual(28);
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const restored: boolean = await waitForTextIs(driver, 'decryptionInfo', 'hello', 10);
      expect(restored).assertTrue();
      const cipherKept: string = await textOf(driver, 'encryptionInfo');
      hilog.info(DOMAIN, TAG, 'cipherKept=%{public}s expected=nonempty', cipherKept);
      expect(cipherKept !== '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1003 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1004
     * @tc.name testUi1004
     * @tc.desc 旧密钥页 hello 加密后导入密钥再解密，明文区恢复 hello
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testUi1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1004 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'importKeyBtn', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'hello');
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 24);
      expect(cipher.length).assertEqual(24);
      const imported: boolean = await tap(driver, 'importKeyBtn');
      expect(imported).assertTrue();
      await delay(500);
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const restored: boolean = await waitForTextIs(driver, 'decryptionInfo', 'hello', 12);
      expect(restored).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1004 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1005
     * @tc.name testUi1005
     * @tc.desc 最小访问控制页空密码点保存，密文区与明文区保持为空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testUi1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1005 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'passwordInput', 4);
      expect(pageReady).assertTrue();
      const saved: boolean = await tap(driver, 'save_password');
      expect(saved).assertTrue();
      const cipherText: string = await textOf(driver, 'cipherTextinfo');
      hilog.info(DOMAIN, TAG, 'cipher=%{public}s expected=%{public}s', cipherText, '');
      expect(cipherText).assertEqual('');
      const plainText: string = await textOf(driver, 'plainTextinfo');
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=%{public}s', plainText, '');
      expect(plainText).assertEqual('');
      const saveExists: boolean = await existsById(driver, 'save_password');
      expect(saveExists).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1005 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1006
     * @tc.name testUi1006
     * @tc.desc 首页点旧密钥入口进入旧密钥页，导入按钮与解密按钮可见且输入区初始为空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1006 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'importKeyBtn', 4);
      expect(pageReady).assertTrue();
      const decryptBtnExists: boolean = await existsById(driver, 'decryptionBtn');
      expect(decryptBtnExists).assertTrue();
      const inputText: string = await textOf(driver, 'encryptionInput');
      hilog.info(DOMAIN, TAG, 'inputEmpty=%{public}s expected=true', String(inputText === ''));
      expect(inputText === '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1006 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1007
     * @tc.name testUi1007
     * @tc.desc 首页点最小访问控制入口，密码输入区可见且密文区初始为空，页面不含新密钥页控件
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1007 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'passwordInput', 4);
      expect(pageReady).assertTrue();
      const cipherText: string = await textOf(driver, 'cipherTextinfo');
      hilog.info(DOMAIN, TAG, 'cipher=%{public}s expected=%{public}s', cipherText, '');
      expect(cipherText).assertEqual('');
      const newKeyBtnGone: boolean = await existsById(driver, 'encryptionBtn');
      hilog.info(DOMAIN, TAG, 'encryptionBtn=%{public}s expected=false', String(newKeyBtnGone));
      expect(newKeyBtnGone).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1007 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1008
     * @tc.name testUi1008
     * @tc.desc 新密钥页空输入点加密，密文区与明文区保持为空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1008 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'encryptionInput', 4);
      expect(pageReady).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipherEmpty: boolean = await textOf(driver, 'encryptionInfo') === '';
      hilog.info(DOMAIN, TAG, 'cipherEmpty=%{public}s expected=true', String(cipherEmpty));
      expect(cipherEmpty).assertTrue();
      const plainEmpty: boolean = await textOf(driver, 'decryptionInfo') === '';
      hilog.info(DOMAIN, TAG, 'plainEmpty=%{public}s expected=true', String(plainEmpty));
      expect(plainEmpty).assertTrue();
      const btnExists: boolean = await existsById(driver, 'encryptionBtn');
      expect(btnExists).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1008 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1009
     * @tc.name testUi1009
     * @tc.desc 新密钥页空输入点解密，明文区与密文区保持为空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1009 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'encryptionInput', 4);
      expect(pageReady).assertTrue();
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const cipherText: string = await textOf(driver, 'encryptionInfo');
      hilog.info(DOMAIN, TAG, 'cipherEmpty=%{public}s expected=true', String(cipherText === ''));
      expect(cipherText === '').assertTrue();
      const plainText: string = await textOf(driver, 'decryptionInfo');
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=%{public}s', plainText, '');
      expect(plainText).assertEqual('');
      const infoReady: boolean = await waitForId(driver, 'decryptionInfo', 4);
      expect(infoReady).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1009 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1010
     * @tc.name testUi1010
     * @tc.desc 新密钥页单字符 a 加密解密往返，密文 24 字符且明文恢复 a
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1010 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'encryptionInput', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 24);
      expect(cipher.length).assertEqual(24);
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const restored: boolean = await waitForTextIs(driver, 'decryptionInfo', 'a', 10);
      expect(restored).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1010 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1011
     * @tc.name testUi1011
     * @tc.desc 新密钥页 20 字符明文加密解密往返，密文 48 字符且明文完整恢复
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1011 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'encryptionInput', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', PLAIN_20);
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 48);
      expect(cipher.length === 48).assertTrue();
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const restored: boolean = await waitForTextIs(driver, 'decryptionInfo', PLAIN_20, 10);
      expect(restored).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1011 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1012
     * @tc.name testUi1012
     * @tc.desc 新密钥页中文输入加密解密，明文区显示与逻辑层基线一致的确定乱码串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1012 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'encryptionInput', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', '中文测试');
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 40);
      expect(cipher.length === 40).assertTrue();
      hilog.info(DOMAIN, TAG, 'cipherNonEmpty expected=true');
      expect(cipher !== '').assertTrue();
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const restored: boolean = await waitForTextIs(driver, 'decryptionInfo', MOJIBAKE_ZH_UTF8, 10);
      expect(restored).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1012 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1013
     * @tc.name testUi1013
     * @tc.desc 新密钥页 emoji 输入加密解密，明文区显示与逻辑层基线一致的确定乱码串
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1013 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'encryptionInput', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', '😀');
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 28);
      expect(cipher.length).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'cipherEmpty expected=false');
      expect(cipher === '').assertFalse();
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const restored: boolean = await waitForTextIs(driver, 'decryptionInfo', MOJIBAKE_EMOJI_UTF8, 10);
      expect(restored).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1013 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1014
     * @tc.name testUi1014
     * @tc.desc 旧密钥页 10 字符明文加密导入解密往返，密文 24 字符且明文恢复
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1014 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'importKeyBtn', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', '0123456789');
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 24);
      expect(cipher.length === 24).assertTrue();
      const imported: boolean = await tap(driver, 'importKeyBtn');
      expect(imported).assertTrue();
      await delay(500);
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const restored: boolean = await waitForTextIs(driver, 'decryptionInfo', '0123456789', 12);
      expect(restored).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1014 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1015
     * @tc.name testUi1015
     * @tc.desc 旧密钥页 16 字符整块明文加密导入解密往返，密文 44 字符且明文恢复
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1015 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'importKeyBtn', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', '0123456789abcdef');
      expect(typed).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipher: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(DOMAIN, TAG, 'len=%{public}d expected=%{public}d', cipher.length, 44);
      expect(cipher.length).assertEqual(44);
      const imported: boolean = await tap(driver, 'importKeyBtn');
      expect(imported).assertTrue();
      await delay(500);
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      expect(decrypted).assertTrue();
      const restored: boolean = await waitForTextIs(driver, 'decryptionInfo', '0123456789abcdef', 12);
      expect(restored).assertTrue();
      const cipherKept: string = await textOf(driver, 'encryptionInfo');
      hilog.info(DOMAIN, TAG, 'cipherKept=%{public}s expected=nonempty', cipherKept);
      expect(cipherKept !== '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1015 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1016
     * @tc.name testUi1016
     * @tc.desc 旧密钥页空输入点加密，密文区与明文区保持为空且导入按钮可用
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1016 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'importKeyBtn', 4);
      expect(pageReady).assertTrue();
      const encrypted: boolean = await tap(driver, 'encryptionBtn');
      expect(encrypted).assertTrue();
      const cipherEmpty: boolean = await textOf(driver, 'encryptionInfo') === '';
      hilog.info(DOMAIN, TAG, 'cipherEmpty=%{public}s expected=true', String(cipherEmpty));
      expect(cipherEmpty).assertTrue();
      const plainEmpty: boolean = await textOf(driver, 'decryptionInfo') === '';
      hilog.info(DOMAIN, TAG, 'plainEmpty=%{public}s expected=true', String(plainEmpty));
      expect(plainEmpty).assertTrue();
      const importReady: boolean = await waitForId(driver, 'importKeyBtn', 4);
      expect(importReady).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1016 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1017
     * @tc.name testUi1017
     * @tc.desc 最小访问控制页输入密码后输入框回显一致，密文区与明文区初始为空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1017 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'passwordInput', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'passwordInput', 'pw123');
      expect(typed).assertTrue();
      const shown: string = await textOf(driver, 'passwordInput');
      hilog.info(DOMAIN, TAG, 'shown=%{public}s expected=%{public}s', shown, 'pw123');
      expect(shown).assertEqual('pw123');
      const cipherText: string = await textOf(driver, 'cipherTextinfo');
      hilog.info(DOMAIN, TAG, 'cipherEmpty=%{public}s expected=true', String(cipherText === ''));
      expect(cipherText === '').assertTrue();
      const plainText: string = await textOf(driver, 'plainTextinfo');
      hilog.info(DOMAIN, TAG, 'plain=%{public}s expected=%{public}s', plainText, '');
      expect(plainText).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1017 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1018
     * @tc.name testUi1018
     * @tc.desc 最小访问控制页空密码点读取，明文区与密文区保持为空
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1018 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'passwordInput', 4);
      expect(pageReady).assertTrue();
      const read: boolean = await tap(driver, 'read_password');
      expect(read).assertTrue();
      const cipherEmpty: boolean = await textOf(driver, 'cipherTextinfo') === '';
      hilog.info(DOMAIN, TAG, 'cipherEmpty=%{public}s expected=true', String(cipherEmpty));
      expect(cipherEmpty).assertTrue();
      const plainEmpty: boolean = await textOf(driver, 'plainTextinfo') === '';
      hilog.info(DOMAIN, TAG, 'plainEmpty=%{public}s expected=true', String(plainEmpty));
      expect(plainEmpty).assertTrue();
      const readReady: boolean = await waitForId(driver, 'read_password', 4);
      expect(readReady).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1018 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1019
     * @tc.name testUi1019
     * @tc.desc 最小访问控制页短输入回显一致且保存读取按钮均可用
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1019 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      expect(tapped).assertTrue();
      const pageReady: boolean = await waitForId(driver, 'passwordInput', 4);
      expect(pageReady).assertTrue();
      const typed: boolean = await inputTextTo(driver, 'passwordInput', 'ab');
      expect(typed).assertTrue();
      const shownMatches: boolean = await textOf(driver, 'passwordInput') === 'ab';
      hilog.info(DOMAIN, TAG, 'shownMatches=%{public}s expected=true', String(shownMatches));
      expect(shownMatches).assertTrue();
      const saveExists: boolean = await existsById(driver, 'save_password');
      expect(saveExists).assertTrue();
      const readExists: boolean = await existsById(driver, 'read_password');
      expect(readExists).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1019 end');
    });

    /**
     * @tc.number SUB_Huks_UI_1020
     * @tc.name testUi1020
     * @tc.desc 组合遍历：三个入口依次进入并返回首页，各页面标志元素均出现
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1020 begin');
      const toNewKey: boolean = await tap(driver, 'new_key');
      expect(toNewKey).assertTrue();
      const seenNewKey: boolean = await waitForId(driver, 'encryptionInput', 4);
      const backOne: boolean = await backToIndex(driver);
      expect(backOne).assertTrue();
      const toOldKey: boolean = await tap(driver, 'old_key');
      expect(toOldKey).assertTrue();
      const seenOldKey: boolean = await waitForId(driver, 'importKeyBtn', 4);
      const backTwo: boolean = await backToIndex(driver);
      expect(backTwo).assertTrue();
      const toMinAccess: boolean = await tap(driver, 'min_access_control');
      expect(toMinAccess).assertTrue();
      const seenMinAccess: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(DOMAIN, TAG, 'new=%{public}s old=%{public}s min=%{public}s expected=true,true,true',
        String(seenNewKey), String(seenOldKey), String(seenMinAccess));
      expect(seenNewKey).assertTrue();
      expect(seenOldKey).assertTrue();
      expect(seenMinAccess).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1020 end');
    });
  });
}
