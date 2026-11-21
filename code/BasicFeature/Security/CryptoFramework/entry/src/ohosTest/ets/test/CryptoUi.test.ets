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

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Driver, ON, Component, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CryptoFramework]';
const BUNDLE_NAME: string = 'com.samples.cryptoframework';
const ABILITY_NAME: string = 'EntryAbility';
const TAB_ENCRYPT: string = '0';
const TAB_DECRYPT: string = '1';
const TAB_SIGN: string = '2';
const TAB_VERIFY: string = '3';
const WAIT_TIMEOUT: number = 5000;
const POLL_INTERVAL: number = 200;

async function findOrNull(driver: Driver, by: On): Promise<Component | null> {
  try {
    return await driver.findComponent(by);
  } catch (e) {
    return null;
  }
}

async function waitForComponent(driver: Driver, by: On, timeoutMs: number): Promise<Component | null> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    const comp: Component | null = await findOrNull(driver, by);
    if (comp !== null) {
      return comp;
    }
    await driver.delayMs(POLL_INTERVAL);
  }
  return null;
}

async function launchEntryAbility(): Promise<boolean> {
  const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  try {
    await abilityDelegator.startAbility({
      bundleName: BUNDLE_NAME,
      abilityName: ABILITY_NAME
    });
    return true;
  } catch (e) {
    return false;
  }
}

async function assertClickable(driver: Driver, id: string): Promise<boolean> {
  const comp: Component | null = await waitForComponent(driver, ON.id(id), WAIT_TIMEOUT);
  if (comp === null) {
    return false;
  }
  await comp.click();
  return true;
}

async function pressBackIfPossible(driver: Driver): Promise<void> {
  try {
    await driver.pressBack();
  } catch (e) {
    hilog.info(DOMAIN, TAG, '%{public}s', 'pressBack skipped');
  }
}

async function relaunchAndWait(driver: Driver): Promise<void> {
  const launched: boolean = await launchEntryAbility();
  if (launched) {
    await driver.delayMs(1500);
  }
}

export default function cryptoUi() {
  describe('CryptoUi', () => {
    let driver: Driver = Driver.create();

    beforeAll(async () => {
      driver = Driver.create();
      await driver.delayMs(500);
      const launched: boolean = await launchEntryAbility();
      if (launched) {
        await driver.delayMs(1500);
      }
    });

    afterEach(async () => {
      // 每个用例结束切回加密 tab，保证用例间界面状态独立
      const tab0: Component | null = await findOrNull(driver, ON.id(TAB_ENCRYPT));
      if (tab0 !== null) {
        await tab0.click();
        await driver.delayMs(300);
      } else {
        // tab 栏不可达说明界面被系统弹层占用，按返回并重新拉起恢复已知状态
        await pressBackIfPossible(driver);
        await relaunchAndWait(driver);
      }
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0001
     * @tc.name testCryptoUi0001
     * @tc.desc 启动应用后主界面四个 tab 均可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testCryptoUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0001 begin');
      const tab0: Component | null = await waitForComponent(driver, ON.id(TAB_ENCRYPT), WAIT_TIMEOUT);
      const tab1: Component | null = await waitForComponent(driver, ON.id(TAB_DECRYPT), WAIT_TIMEOUT);
      const tab2: Component | null = await waitForComponent(driver, ON.id(TAB_SIGN), WAIT_TIMEOUT);
      const tab3: Component | null = await waitForComponent(driver, ON.id(TAB_VERIFY), WAIT_TIMEOUT);
      const allFound: boolean = tab0 !== null && tab1 !== null && tab2 !== null && tab3 !== null;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(allFound), 'true');
      expect(allFound).assertTrue();
      expect(tab0 === null).assertFalse();
      expect(tab1 === null).assertFalse();
      expect(tab2 === null).assertFalse();
      expect(tab3 === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0001 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0002
     * @tc.name testCryptoUi0002
     * @tc.desc 初始默认选中加密 tab，加密按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testCryptoUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0002 begin');
      const encryptBtn: Component | null = await waitForComponent(driver, ON.id('encryptionBtn'), WAIT_TIMEOUT);
      const aesGenBtn: Component | null = await waitForComponent(driver, ON.id('encryptAesGenKey'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(encryptBtn !== null && aesGenBtn !== null), 'true');
      expect(encryptBtn === null).assertFalse();
      expect(aesGenBtn === null).assertFalse();
      expect(encryptBtn !== null && aesGenBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0002 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0003
     * @tc.name testCryptoUi0003
     * @tc.desc 点击解密 tab 后解密按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testCryptoUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0003 begin');
      const clicked: boolean = await assertClickable(driver, TAB_DECRYPT);
      const decryptBtn: Component | null = await waitForComponent(driver, ON.id('decryptionBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(clicked && decryptBtn !== null), 'true');
      expect(clicked).assertTrue();
      expect(decryptBtn === null).assertFalse();
      expect(clicked && decryptBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0003 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0004
     * @tc.name testCryptoUi0004
     * @tc.desc 点击签名 tab 后签名按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testCryptoUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0004 begin');
      const clicked: boolean = await assertClickable(driver, TAB_SIGN);
      const signBtn: Component | null = await waitForComponent(driver, ON.id('signBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(clicked && signBtn !== null), 'true');
      expect(clicked).assertTrue();
      expect(signBtn === null).assertFalse();
      expect(clicked && signBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0004 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0005
     * @tc.name testCryptoUi0005
     * @tc.desc 签名页 RSA 密钥生成按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testCryptoUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0005 begin');
      const clicked: boolean = await assertClickable(driver, TAB_SIGN);
      const rsaGenBtn: Component | null = await waitForComponent(driver, ON.id('encryptRsaGenKey'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(clicked && rsaGenBtn !== null), 'true');
      expect(clicked).assertTrue();
      expect(rsaGenBtn === null).assertFalse();
      expect(clicked && rsaGenBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0005 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0006
     * @tc.name testCryptoUi0006
     * @tc.desc 点击验签 tab 后验签按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level0
     */
    it('testCryptoUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0006 begin');
      const clicked: boolean = await assertClickable(driver, TAB_VERIFY);
      const verifyBtn: Component | null = await waitForComponent(driver, ON.id('verifyBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(clicked && verifyBtn !== null), 'true');
      expect(clicked).assertTrue();
      expect(verifyBtn === null).assertFalse();
      expect(clicked && verifyBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0006 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0007
     * @tc.name testCryptoUi0007
     * @tc.desc 未选文本和密钥文件时点击加密按钮，界面不崩溃且按钮仍在（弹窗提示路径）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testCryptoUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0007 begin');
      const encryptBtn: Component | null = await waitForComponent(driver, ON.id('encryptionBtn'), WAIT_TIMEOUT);
      const foundBefore: boolean = encryptBtn !== null;
      if (encryptBtn !== null) {
        await encryptBtn.click();
        await driver.delayMs(500);
      }
      const stillThere: Component | null = await waitForComponent(driver, ON.id('encryptionBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', String(foundBefore && stillThere !== null), 'true');
      expect(foundBefore).assertTrue();
      expect(stillThere === null).assertFalse();
      expect(foundBefore && stillThere !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0007 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0008
     * @tc.name testCryptoUi0008
     * @tc.desc 未选文本和密钥文件时点击解密按钮，界面不崩溃且按钮仍在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testCryptoUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0008 begin');
      const clicked: boolean = await assertClickable(driver, TAB_DECRYPT);
      const decryptBtn: Component | null = await waitForComponent(driver, ON.id('decryptionBtn'), WAIT_TIMEOUT);
      const foundBefore: boolean = decryptBtn !== null;
      if (decryptBtn !== null) {
        await decryptBtn.click();
        await driver.delayMs(500);
      }
      const stillThere: Component | null = await waitForComponent(driver, ON.id('decryptionBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(clicked && foundBefore && stillThere !== null), 'true');
      expect(clicked).assertTrue();
      expect(foundBefore).assertTrue();
      expect(stillThere === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0008 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0009
     * @tc.name testCryptoUi0009
     * @tc.desc 未选文本和密钥文件时点击签名按钮，界面不崩溃且按钮仍在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testCryptoUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0009 begin');
      const clicked: boolean = await assertClickable(driver, TAB_SIGN);
      const signBtn: Component | null = await waitForComponent(driver, ON.id('signBtn'), WAIT_TIMEOUT);
      const foundBefore: boolean = signBtn !== null;
      if (signBtn !== null) {
        await signBtn.click();
        await driver.delayMs(500);
      }
      const stillThere: Component | null = await waitForComponent(driver, ON.id('signBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(clicked && foundBefore && stillThere !== null), 'true');
      expect(clicked).assertTrue();
      expect(foundBefore).assertTrue();
      expect(stillThere === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0009 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0010
     * @tc.name testCryptoUi0010
     * @tc.desc 未选文本、密钥和签名文件时点击验签按钮，界面不崩溃且按钮仍在
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testCryptoUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0010 begin');
      const clicked: boolean = await assertClickable(driver, TAB_VERIFY);
      const verifyBtn: Component | null = await waitForComponent(driver, ON.id('verifyBtn'), WAIT_TIMEOUT);
      const foundBefore: boolean = verifyBtn !== null;
      if (verifyBtn !== null) {
        await verifyBtn.click();
        await driver.delayMs(500);
      }
      const stillThere: Component | null = await waitForComponent(driver, ON.id('verifyBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(clicked && foundBefore && stillThere !== null), 'true');
      expect(clicked).assertTrue();
      expect(foundBefore).assertTrue();
      expect(stillThere === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0010 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0011
     * @tc.name testCryptoUi0011
     * @tc.desc 加密 tab 内 AES 密钥生成按钮点击后界面不崩溃
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testCryptoUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0011 begin');
      const aesGenBtn: Component | null = await waitForComponent(driver, ON.id('encryptAesGenKey'), WAIT_TIMEOUT);
      const foundBefore: boolean = aesGenBtn !== null;
      if (aesGenBtn !== null) {
        await aesGenBtn.click();
        await driver.delayMs(500);
      }
      const stillThere: Component | null = await waitForComponent(driver, ON.id('encryptAesGenKey'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', String(foundBefore && stillThere !== null), 'true');
      expect(foundBefore).assertTrue();
      expect(stillThere === null).assertFalse();
      expect(foundBefore && stillThere !== null).assertTrue();
      // 密钥生成会拉起系统保存选择器（冷启动约 10s）：等待其打开后按返回关闭并重新拉起，避免污染后续用例
      await driver.delayMs(12000);
      await pressBackIfPossible(driver);
      await driver.delayMs(800);
      await relaunchAndWait(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0011 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0012
     * @tc.name testCryptoUi0012
     * @tc.desc 签名 tab 内 RSA 密钥生成按钮点击后界面不崩溃
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testCryptoUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0012 begin');
      const clicked: boolean = await assertClickable(driver, TAB_SIGN);
      const rsaGenBtn: Component | null = await waitForComponent(driver, ON.id('encryptRsaGenKey'), WAIT_TIMEOUT);
      const foundBefore: boolean = rsaGenBtn !== null;
      if (rsaGenBtn !== null) {
        await rsaGenBtn.click();
        await driver.delayMs(500);
      }
      const stillThere: Component | null = await waitForComponent(driver, ON.id('encryptRsaGenKey'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(clicked && foundBefore && stillThere !== null), 'true');
      expect(clicked).assertTrue();
      expect(foundBefore).assertTrue();
      expect(stillThere === null).assertFalse();
      // 密钥生成会拉起系统保存选择器（冷启动约 10s）：等待其打开后按返回关闭并重新拉起，避免污染后续用例
      await driver.delayMs(12000);
      await pressBackIfPossible(driver);
      await driver.delayMs(800);
      await relaunchAndWait(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0012 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0013
     * @tc.name testCryptoUi0013
     * @tc.desc 循环切换四个 tab 后回到加密页，加密按钮仍可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testCryptoUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0013 begin');
      let allClicked: boolean = true;
      const tabs: string[] = [TAB_DECRYPT, TAB_SIGN, TAB_VERIFY, TAB_ENCRYPT];
      for (let i = 0; i < tabs.length; i++) {
        const ok: boolean = await assertClickable(driver, tabs[i]);
        if (!ok) {
          allClicked = false;
        }
      }
      const encryptBtn: Component | null = await waitForComponent(driver, ON.id('encryptionBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', String(allClicked && encryptBtn !== null), 'true');
      expect(allClicked).assertTrue();
      expect(encryptBtn === null).assertFalse();
      expect(allClicked && encryptBtn !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0013 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0014
     * @tc.name testCryptoUi0014
     * @tc.desc 从加密 tab 直接跳到签名 tab（跨页切换），签名按钮可定位
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testCryptoUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0014 begin');
      const clicked: boolean = await assertClickable(driver, TAB_SIGN);
      const signBtn: Component | null = await waitForComponent(driver, ON.id('signBtn'), WAIT_TIMEOUT);
      const rsaGenBtn: Component | null = await waitForComponent(driver, ON.id('encryptRsaGenKey'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(clicked && signBtn !== null && rsaGenBtn !== null), 'true');
      expect(clicked).assertTrue();
      expect(signBtn === null).assertFalse();
      expect(rsaGenBtn === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0014 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0015
     * @tc.name testCryptoUi0015
     * @tc.desc 验签页切回加密页后加密按钮可定位（页面状态恢复）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testCryptoUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0015 begin');
      const toVerify: boolean = await assertClickable(driver, TAB_VERIFY);
      const toEncrypt: boolean = await assertClickable(driver, TAB_ENCRYPT);
      const encryptBtn: Component | null = await waitForComponent(driver, ON.id('encryptionBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(toVerify && toEncrypt && encryptBtn !== null), 'true');
      expect(toVerify).assertTrue();
      expect(toEncrypt).assertTrue();
      expect(encryptBtn === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0015 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0016
     * @tc.name testCryptoUi0016
     * @tc.desc 重复点击加密按钮两次界面不崩溃（重复触发路径）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testCryptoUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0016 begin');
      const encryptBtn: Component | null = await waitForComponent(driver, ON.id('encryptionBtn'), WAIT_TIMEOUT);
      const foundBefore: boolean = encryptBtn !== null;
      if (encryptBtn !== null) {
        await encryptBtn.click();
        await driver.delayMs(300);
        await encryptBtn.click();
        await driver.delayMs(300);
      }
      const stillThere: Component | null = await waitForComponent(driver, ON.id('encryptionBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG,
        'actual=%{public}s expected=%{public}s', String(foundBefore && stillThere !== null), 'true');
      expect(foundBefore).assertTrue();
      expect(stillThere === null).assertFalse();
      expect(foundBefore && stillThere !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0016 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0017
     * @tc.name testCryptoUi0017
     * @tc.desc 签名页重复点击签名按钮两次界面不崩溃
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testCryptoUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0017 begin');
      const clicked: boolean = await assertClickable(driver, TAB_SIGN);
      const signBtn: Component | null = await waitForComponent(driver, ON.id('signBtn'), WAIT_TIMEOUT);
      const foundBefore: boolean = signBtn !== null;
      if (signBtn !== null) {
        await signBtn.click();
        await driver.delayMs(300);
        await signBtn.click();
        await driver.delayMs(300);
      }
      const stillThere: Component | null = await waitForComponent(driver, ON.id('signBtn'), WAIT_TIMEOUT);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s',
        String(clicked && foundBefore && stillThere !== null), 'true');
      expect(clicked).assertTrue();
      expect(foundBefore).assertTrue();
      expect(stillThere === null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0017 end');
    });

    /**
     * @tc.number SUB_CryptoFramework_UI_0018
     * @tc.name testCryptoUi0018
     * @tc.desc 组合：四个 tab 各点击一次主按钮后主界面仍完整（主流程走查）
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testCryptoUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0018 begin');
      const encryptBtn: Component | null = await waitForComponent(driver, ON.id('encryptionBtn'), WAIT_TIMEOUT);
      let clickedAll: boolean = encryptBtn !== null;
      if (encryptBtn !== null) {
        await encryptBtn.click();
        await driver.delayMs(300);
      }
      const toDecrypt: boolean = await assertClickable(driver, TAB_DECRYPT);
      const decryptBtn: Component | null = await waitForComponent(driver, ON.id('decryptionBtn'), WAIT_TIMEOUT);
      if (decryptBtn !== null) {
        await decryptBtn.click();
        await driver.delayMs(300);
      }
      const toSign: boolean = await assertClickable(driver, TAB_SIGN);
      const signBtn: Component | null = await waitForComponent(driver, ON.id('signBtn'), WAIT_TIMEOUT);
      if (signBtn !== null) {
        await signBtn.click();
        await driver.delayMs(300);
      }
      const toVerify: boolean = await assertClickable(driver, TAB_VERIFY);
      const verifyBtn: Component | null = await waitForComponent(driver, ON.id('verifyBtn'), WAIT_TIMEOUT);
      if (verifyBtn !== null) {
        await verifyBtn.click();
        await driver.delayMs(300);
      }
      const allFound: boolean = clickedAll && toDecrypt && toSign && toVerify &&
        decryptBtn !== null && signBtn !== null && verifyBtn !== null;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', String(allFound), 'true');
      expect(clickedAll).assertTrue();
      expect(toDecrypt).assertTrue();
      expect(toSign).assertTrue();
      expect(toVerify).assertTrue();
      expect(allFound).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCryptoUi0018 end');
    });
  });
}
