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

// 轮询等待 id 文本变为与 previous 不同的非空值，返回新文本；超时返回 previous。
async function waitForTextDifferent(driver: Driver, id: string, previous: string, attempts: number): Promise<string> {
  for (let i: number = 0; i < attempts; i++) {
    const text: string = await textOf(driver, id);
    if (text !== '' && text !== previous) {
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

async function launchApp(driver: Driver): Promise<boolean> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  for (let i: number = 0; i < 5; i++) {
    const want: Want = { bundleName: BUNDLE, abilityName: ABILITY };
    await delegator.startAbility(want);
    await delay(1500);
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


export default function uiSeqVolume05Test() {
  describe('UiSeqVolume05', () => {
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
     * @tc.name   testUiSeq0216
     * @tc.number SUB_Huks_UISEQ_0216
     * @tc.desc   新密钥页 空输入：toast 提示且密文区保持空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0216 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const infoText: string = await textOf(driver, 'encryptionInfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(infoText), '');
      expect(infoText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0216 end');
    });

    /**
     * @tc.name   testUiSeq0217
     * @tc.number SUB_Huks_UISEQ_0217
     * @tc.desc   新密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0217 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', ' ');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0217 end');
    });

    /**
     * @tc.name   testUiSeq0218
     * @tc.number SUB_Huks_UISEQ_0218
     * @tc.desc   新密钥页 特殊输入 2 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0218 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '  ');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0218 end');
    });

    /**
     * @tc.name   testUiSeq0219
     * @tc.number SUB_Huks_UISEQ_0219
     * @tc.desc   新密钥页 特殊输入 3 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0219 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '   ');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0219 end');
    });

    /**
     * @tc.name   testUiSeq0220
     * @tc.number SUB_Huks_UISEQ_0220
     * @tc.desc   新密钥页 特殊输入 4 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0220 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '    ');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0220 end');
    });

    /**
     * @tc.name   testUiSeq0221
     * @tc.number SUB_Huks_UISEQ_0221
     * @tc.desc   新密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0221 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0221 end');
    });

    /**
     * @tc.name   testUiSeq0222
     * @tc.number SUB_Huks_UISEQ_0222
     * @tc.desc   新密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0222 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'z');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0222 end');
    });

    /**
     * @tc.name   testUiSeq0223
     * @tc.number SUB_Huks_UISEQ_0223
     * @tc.desc   新密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0223 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'A');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0223 end');
    });

    /**
     * @tc.name   testUiSeq0224
     * @tc.number SUB_Huks_UISEQ_0224
     * @tc.desc   新密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0224 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '0');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0224 end');
    });

    /**
     * @tc.name   testUiSeq0225
     * @tc.number SUB_Huks_UISEQ_0225
     * @tc.desc   新密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0225 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '9');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0225 end');
    });

    /**
     * @tc.name   testUiSeq0226
     * @tc.number SUB_Huks_UISEQ_0226
     * @tc.desc   新密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0226 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '!');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0226 end');
    });

    /**
     * @tc.name   testUiSeq0227
     * @tc.number SUB_Huks_UISEQ_0227
     * @tc.desc   新密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0227 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '~');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0227 end');
    });

    /**
     * @tc.name   testUiSeq0228
     * @tc.number SUB_Huks_UISEQ_0228
     * @tc.desc   新密钥页 特殊输入 58 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0228 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(58));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(100));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0228 end');
    });

    /**
     * @tc.name   testUiSeq0229
     * @tc.number SUB_Huks_UISEQ_0229
     * @tc.desc   新密钥页 特殊输入 59 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0229 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(59));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(100));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0229 end');
    });

    /**
     * @tc.name   testUiSeq0230
     * @tc.number SUB_Huks_UISEQ_0230
     * @tc.desc   新密钥页 特殊输入 60 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0230 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(60));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(104));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0230 end');
    });

    /**
     * @tc.name   testUiSeq0231
     * @tc.number SUB_Huks_UISEQ_0231
     * @tc.desc   新密钥页 特殊输入 61 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0231 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(61));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(104));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0231 end');
    });

    /**
     * @tc.name   testUiSeq0232
     * @tc.number SUB_Huks_UISEQ_0232
     * @tc.desc   新密钥页 特殊输入 120 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0232 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(120));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(184));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(184);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0232 end');
    });

    /**
     * @tc.name   testUiSeq0233
     * @tc.number SUB_Huks_UISEQ_0233
     * @tc.desc   新密钥页 特殊输入 127 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0233 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(127));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(192));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(192);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0233 end');
    });

    /**
     * @tc.name   testUiSeq0234
     * @tc.number SUB_Huks_UISEQ_0234
     * @tc.desc   新密钥页 特殊输入 255 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0234 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(255));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(364));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0234 end');
    });

    /**
     * @tc.name   testUiSeq0235
     * @tc.number SUB_Huks_UISEQ_0235
     * @tc.desc   新密钥页 特殊输入 256 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0235 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(256));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(364));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0235 end');
    });

    /**
     * @tc.name   testUiSeq0236
     * @tc.number SUB_Huks_UISEQ_0236
     * @tc.desc   旧密钥页 空输入：toast 提示且密文区保持空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0236 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const infoText: string = await textOf(driver, 'encryptionInfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(infoText), '');
      expect(infoText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0236 end');
    });

    /**
     * @tc.name   testUiSeq0237
     * @tc.number SUB_Huks_UISEQ_0237
     * @tc.desc   旧密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0237 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', ' ');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0237 end');
    });

    /**
     * @tc.name   testUiSeq0238
     * @tc.number SUB_Huks_UISEQ_0238
     * @tc.desc   旧密钥页 特殊输入 2 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0238 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '  ');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0238 end');
    });

    /**
     * @tc.name   testUiSeq0239
     * @tc.number SUB_Huks_UISEQ_0239
     * @tc.desc   旧密钥页 特殊输入 3 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0239 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '   ');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0239 end');
    });

    /**
     * @tc.name   testUiSeq0240
     * @tc.number SUB_Huks_UISEQ_0240
     * @tc.desc   旧密钥页 特殊输入 4 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0240 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '    ');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0240 end');
    });

    /**
     * @tc.name   testUiSeq0241
     * @tc.number SUB_Huks_UISEQ_0241
     * @tc.desc   旧密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0241 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0241 end');
    });

    /**
     * @tc.name   testUiSeq0242
     * @tc.number SUB_Huks_UISEQ_0242
     * @tc.desc   旧密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0242 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'z');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0242 end');
    });

    /**
     * @tc.name   testUiSeq0243
     * @tc.number SUB_Huks_UISEQ_0243
     * @tc.desc   旧密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0243 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'A');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0243 end');
    });

    /**
     * @tc.name   testUiSeq0244
     * @tc.number SUB_Huks_UISEQ_0244
     * @tc.desc   旧密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0244 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '0');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0244 end');
    });

    /**
     * @tc.name   testUiSeq0245
     * @tc.number SUB_Huks_UISEQ_0245
     * @tc.desc   旧密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0245 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '9');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0245 end');
    });

    /**
     * @tc.name   testUiSeq0246
     * @tc.number SUB_Huks_UISEQ_0246
     * @tc.desc   旧密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0246 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '!');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0246 end');
    });

    /**
     * @tc.name   testUiSeq0247
     * @tc.number SUB_Huks_UISEQ_0247
     * @tc.desc   旧密钥页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0247 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '~');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0247 end');
    });

    /**
     * @tc.name   testUiSeq0248
     * @tc.number SUB_Huks_UISEQ_0248
     * @tc.desc   旧密钥页 特殊输入 58 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0248 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(58));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0248 end');
    });

    /**
     * @tc.name   testUiSeq0249
     * @tc.number SUB_Huks_UISEQ_0249
     * @tc.desc   旧密钥页 特殊输入 59 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0249 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(59));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0249 end');
    });

    /**
     * @tc.name   testUiSeq0250
     * @tc.number SUB_Huks_UISEQ_0250
     * @tc.desc   旧密钥页 特殊输入 60 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0250 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(60));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0250 end');
    });

    /**
     * @tc.name   testUiSeq0251
     * @tc.number SUB_Huks_UISEQ_0251
     * @tc.desc   旧密钥页 特殊输入 61 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0251 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(61));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0251 end');
    });

    /**
     * @tc.name   testUiSeq0252
     * @tc.number SUB_Huks_UISEQ_0252
     * @tc.desc   旧密钥页 特殊输入 120 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0252 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(120));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(172));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0252 end');
    });

    /**
     * @tc.name   testUiSeq0253
     * @tc.number SUB_Huks_UISEQ_0253
     * @tc.desc   旧密钥页 特殊输入 127 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0253 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(127));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(172));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(172);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0253 end');
    });

    /**
     * @tc.name   testUiSeq0254
     * @tc.number SUB_Huks_UISEQ_0254
     * @tc.desc   旧密钥页 特殊输入 255 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0254 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(255));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(344));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0254 end');
    });

    /**
     * @tc.name   testUiSeq0255
     * @tc.number SUB_Huks_UISEQ_0255
     * @tc.desc   旧密钥页 特殊输入 256 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0255 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(256));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(364));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0255 end');
    });

    /**
     * @tc.name   testUiSeq0256
     * @tc.number SUB_Huks_UISEQ_0256
     * @tc.desc   最小访问控制页 空输入：toast 提示且密文区保持空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0256 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const clicked: boolean = await tap(driver, 'save_password');
      const infoText: string = await textOf(driver, 'cipherTextinfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(infoText), '');
      expect(infoText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0256 end');
    });

    /**
     * @tc.name   testUiSeq0257
     * @tc.number SUB_Huks_UISEQ_0257
     * @tc.desc   最小访问控制页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0257 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', ' ');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0257 end');
    });

    /**
     * @tc.name   testUiSeq0258
     * @tc.number SUB_Huks_UISEQ_0258
     * @tc.desc   最小访问控制页 特殊输入 2 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0258 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', '  ');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(2));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 2)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0258 end');
    });

    /**
     * @tc.name   testUiSeq0259
     * @tc.number SUB_Huks_UISEQ_0259
     * @tc.desc   最小访问控制页 特殊输入 3 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0259 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', '   ');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(3));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 3)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0259 end');
    });

    /**
     * @tc.name   testUiSeq0260
     * @tc.number SUB_Huks_UISEQ_0260
     * @tc.desc   最小访问控制页 特殊输入 4 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0260 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', '    ');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(4));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 4)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0260 end');
    });

    /**
     * @tc.name   testUiSeq0261
     * @tc.number SUB_Huks_UISEQ_0261
     * @tc.desc   最小访问控制页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0261 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'a');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0261 end');
    });

    /**
     * @tc.name   testUiSeq0262
     * @tc.number SUB_Huks_UISEQ_0262
     * @tc.desc   最小访问控制页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0262 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'z');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0262 end');
    });

    /**
     * @tc.name   testUiSeq0263
     * @tc.number SUB_Huks_UISEQ_0263
     * @tc.desc   最小访问控制页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0263 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'A');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0263 end');
    });

    /**
     * @tc.name   testUiSeq0264
     * @tc.number SUB_Huks_UISEQ_0264
     * @tc.desc   最小访问控制页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0264 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', '0');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0264 end');
    });

    /**
     * @tc.name   testUiSeq0265
     * @tc.number SUB_Huks_UISEQ_0265
     * @tc.desc   最小访问控制页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0265 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', '9');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0265 end');
    });

    /**
     * @tc.name   testUiSeq0266
     * @tc.number SUB_Huks_UISEQ_0266
     * @tc.desc   最小访问控制页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0266 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', '!');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0266 end');
    });

    /**
     * @tc.name   testUiSeq0267
     * @tc.number SUB_Huks_UISEQ_0267
     * @tc.desc   最小访问控制页 特殊输入 1 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0267 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', '~');
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0267 end');
    });

    /**
     * @tc.name   testUiSeq0268
     * @tc.number SUB_Huks_UISEQ_0268
     * @tc.desc   最小访问控制页 特殊输入 58 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0268 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'a'.repeat(58));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(58));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 58)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0268 end');
    });

    /**
     * @tc.name   testUiSeq0269
     * @tc.number SUB_Huks_UISEQ_0269
     * @tc.desc   最小访问控制页 特殊输入 59 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0269 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'a'.repeat(59));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(59));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 59)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0269 end');
    });

    /**
     * @tc.name   testUiSeq0270
     * @tc.number SUB_Huks_UISEQ_0270
     * @tc.desc   最小访问控制页 特殊输入 60 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0270 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'a'.repeat(60));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(60));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 60)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0270 end');
    });

    /**
     * @tc.name   testUiSeq0271
     * @tc.number SUB_Huks_UISEQ_0271
     * @tc.desc   最小访问控制页 特殊输入 61 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0271 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'a'.repeat(61));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(61));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 61)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0271 end');
    });

    /**
     * @tc.name   testUiSeq0272
     * @tc.number SUB_Huks_UISEQ_0272
     * @tc.desc   最小访问控制页 特殊输入 120 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0272 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'a'.repeat(120));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(120));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 120)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0272 end');
    });

    /**
     * @tc.name   testUiSeq0273
     * @tc.number SUB_Huks_UISEQ_0273
     * @tc.desc   最小访问控制页 特殊输入 127 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0273 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'a'.repeat(127));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(127));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 127)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0273 end');
    });

    /**
     * @tc.name   testUiSeq0274
     * @tc.number SUB_Huks_UISEQ_0274
     * @tc.desc   最小访问控制页 特殊输入 255 字符扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0274 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'a'.repeat(255));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(255));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 255)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0274 end');
    });

    /**
     * @tc.name   testUiSeq0275
     * @tc.number SUB_Huks_UISEQ_0275
     * @tc.desc   三页连续空输入：新/旧密钥页与最小访问控制页密文区均保持空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0275 begin');
      const tappedNew: boolean = await tap(driver, 'new_key');
      const clickedNew: boolean = await tap(driver, 'encryptionBtn');
      const newText: string = await textOf(driver, 'encryptionInfo');
      const back1: boolean = await backToIndex(driver);
      const tappedOld: boolean = await tap(driver, 'old_key');
      const clickedOld: boolean = await tap(driver, 'encryptionBtn');
      const oldText: string = await textOf(driver, 'encryptionInfo');
      const back2: boolean = await backToIndex(driver);
      const tappedMin: boolean = await tap(driver, 'min_access_control');
      const clickedMin: boolean = await tap(driver, 'save_password');
      const minText: string = await textOf(driver, 'cipherTextinfo');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tappedNew));
      expect(tappedNew).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clickedNew));
      expect(clickedNew).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back1));
      expect(back1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(newText), '');
      expect(newText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tappedOld));
      expect(tappedOld).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clickedOld));
      expect(clickedOld).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(back2));
      expect(back2).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(oldText), '');
      expect(oldText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tappedMin));
      expect(tappedMin).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clickedMin));
      expect(clickedMin).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(minText), '');
      expect(minText).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0275 end');
    });

  });
}
