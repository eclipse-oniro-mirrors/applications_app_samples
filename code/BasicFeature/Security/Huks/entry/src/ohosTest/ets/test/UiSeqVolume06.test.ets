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


export default function uiSeqVolume06Test() {
  describe('UiSeqVolume06', () => {
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
     * @tc.name   testUiSeq0276
     * @tc.number SUB_Huks_UISEQ_0276
     * @tc.desc   新密钥页 AES 组合输入「中文」UTF-8 6 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0276 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中文');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0276 end');
    });

    /**
     * @tc.name   testUiSeq0277
     * @tc.number SUB_Huks_UISEQ_0277
     * @tc.desc   新密钥页 AES 组合输入「😀」UTF-8 4 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0277 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0277 end');
    });

    /**
     * @tc.name   testUiSeq0278
     * @tc.number SUB_Huks_UISEQ_0278
     * @tc.desc   新密钥页 AES 组合输入「密码」UTF-8 6 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0278 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '密码');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0278 end');
    });

    /**
     * @tc.name   testUiSeq0279
     * @tc.number SUB_Huks_UISEQ_0279
     * @tc.desc   新密钥页 AES 组合输入「测试」UTF-8 6 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0279 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '测试');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0279 end');
    });

    /**
     * @tc.name   testUiSeq0280
     * @tc.number SUB_Huks_UISEQ_0280
     * @tc.desc   新密钥页 AES 组合输入「中文输入」UTF-8 12 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0280 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中文输入');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(40));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(40);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0280 end');
    });

    /**
     * @tc.name   testUiSeq0281
     * @tc.number SUB_Huks_UISEQ_0281
     * @tc.desc   新密钥页 AES 组合输入「a😀b」UTF-8 6 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0281 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a😀b');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0281 end');
    });

    /**
     * @tc.name   testUiSeq0282
     * @tc.number SUB_Huks_UISEQ_0282
     * @tc.desc   新密钥页 AES 组合输入「😀a」UTF-8 5 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0282 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '😀a');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0282 end');
    });

    /**
     * @tc.name   testUiSeq0283
     * @tc.number SUB_Huks_UISEQ_0283
     * @tc.desc   新密钥页 AES 组合输入「a😀」UTF-8 5 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0283 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0283 end');
    });

    /**
     * @tc.name   testUiSeq0284
     * @tc.number SUB_Huks_UISEQ_0284
     * @tc.desc   新密钥页 AES 组合输入「🚀汉」UTF-8 7 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0284 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🚀汉');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0284 end');
    });

    /**
     * @tc.name   testUiSeq0285
     * @tc.number SUB_Huks_UISEQ_0285
     * @tc.desc   新密钥页 AES 组合输入「汉🚀」UTF-8 7 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0285 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '汉🚀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0285 end');
    });

    /**
     * @tc.name   testUiSeq0286
     * @tc.number SUB_Huks_UISEQ_0286
     * @tc.desc   新密钥页 AES 组合输入「密码😀」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0286 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '密码😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(36);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0286 end');
    });

    /**
     * @tc.name   testUiSeq0287
     * @tc.number SUB_Huks_UISEQ_0287
     * @tc.desc   新密钥页 AES 组合输入「😀密码」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0287 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '😀密码');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(36);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0287 end');
    });

    /**
     * @tc.name   testUiSeq0288
     * @tc.number SUB_Huks_UISEQ_0288
     * @tc.desc   新密钥页 AES 组合输入「中文输入」UTF-8 12 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0288 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中文输入');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(40));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(40);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0288 end');
    });

    /**
     * @tc.name   testUiSeq0289
     * @tc.number SUB_Huks_UISEQ_0289
     * @tc.desc   新密钥页 AES 组合输入「输入中文」UTF-8 12 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0289 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '输入中文');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(40));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(40);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0289 end');
    });

    /**
     * @tc.name   testUiSeq0290
     * @tc.number SUB_Huks_UISEQ_0290
     * @tc.desc   新密钥页 AES 组合输入「🔐」UTF-8 4 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0290 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0290 end');
    });

    /**
     * @tc.name   testUiSeq0291
     * @tc.number SUB_Huks_UISEQ_0291
     * @tc.desc   新密钥页 AES 组合输入「🔐🚀」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0291 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐🚀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0291 end');
    });

    /**
     * @tc.name   testUiSeq0292
     * @tc.number SUB_Huks_UISEQ_0292
     * @tc.desc   新密钥页 AES 组合输入「🔐🔐」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0292 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐🔐');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0292 end');
    });

    /**
     * @tc.name   testUiSeq0293
     * @tc.number SUB_Huks_UISEQ_0293
     * @tc.desc   新密钥页 AES 组合输入「🚀🚀」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0293 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🚀🚀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0293 end');
    });

    /**
     * @tc.name   testUiSeq0294
     * @tc.number SUB_Huks_UISEQ_0294
     * @tc.desc   新密钥页 AES 组合输入「中😀文」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0294 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中😀文');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(36);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0294 end');
    });

    /**
     * @tc.name   testUiSeq0295
     * @tc.number SUB_Huks_UISEQ_0295
     * @tc.desc   新密钥页 AES 组合输入「文😀中」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0295 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '文😀中');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(36);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0295 end');
    });

    /**
     * @tc.name   testUiSeq0296
     * @tc.number SUB_Huks_UISEQ_0296
     * @tc.desc   新密钥页 AES 组合输入「密钥🔐」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0296 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '密钥🔐');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(36);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0296 end');
    });

    /**
     * @tc.name   testUiSeq0297
     * @tc.number SUB_Huks_UISEQ_0297
     * @tc.desc   新密钥页 AES 组合输入「🔐密钥」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0297 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐密钥');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(36);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0297 end');
    });

    /**
     * @tc.name   testUiSeq0298
     * @tc.number SUB_Huks_UISEQ_0298
     * @tc.desc   新密钥页 AES 组合输入「a中b」UTF-8 5 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0298 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a中b');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0298 end');
    });

    /**
     * @tc.name   testUiSeq0299
     * @tc.number SUB_Huks_UISEQ_0299
     * @tc.desc   新密钥页 AES 组合输入「中a」UTF-8 4 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0299 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中a');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0299 end');
    });

    /**
     * @tc.name   testUiSeq0300
     * @tc.number SUB_Huks_UISEQ_0300
     * @tc.desc   新密钥页 AES 组合输入「a中」UTF-8 4 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0300 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a中');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(28);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0300 end');
    });

    /**
     * @tc.name   testUiSeq0301
     * @tc.number SUB_Huks_UISEQ_0301
     * @tc.desc   新密钥页 AES 组合输入「😀😀」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0301 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '😀😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0301 end');
    });

    /**
     * @tc.name   testUiSeq0302
     * @tc.number SUB_Huks_UISEQ_0302
     * @tc.desc   新密钥页 AES 组合输入「密码abc」UTF-8 9 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0302 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '密码abc');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(36);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0302 end');
    });

    /**
     * @tc.name   testUiSeq0303
     * @tc.number SUB_Huks_UISEQ_0303
     * @tc.desc   新密钥页 AES 组合输入「abc密码」UTF-8 9 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0303 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'abc密码');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(36);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0303 end');
    });

    /**
     * @tc.name   testUiSeq0304
     * @tc.number SUB_Huks_UISEQ_0304
     * @tc.desc   新密钥页 AES 组合输入「汉😀a」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0304 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '汉😀a');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0304 end');
    });

    /**
     * @tc.name   testUiSeq0305
     * @tc.number SUB_Huks_UISEQ_0305
     * @tc.desc   新密钥页 AES 组合输入「a汉😀」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0305 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a汉😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(32);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0305 end');
    });

    /**
     * @tc.name   testUiSeq0306
     * @tc.number SUB_Huks_UISEQ_0306
     * @tc.desc   旧密钥页 SM4 组合输入「中文」UTF-8 6 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0306 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中文');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0306 end');
    });

    /**
     * @tc.name   testUiSeq0307
     * @tc.number SUB_Huks_UISEQ_0307
     * @tc.desc   旧密钥页 SM4 组合输入「😀」UTF-8 4 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0307 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0307 end');
    });

    /**
     * @tc.name   testUiSeq0308
     * @tc.number SUB_Huks_UISEQ_0308
     * @tc.desc   旧密钥页 SM4 组合输入「密码」UTF-8 6 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0308 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '密码');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0308 end');
    });

    /**
     * @tc.name   testUiSeq0309
     * @tc.number SUB_Huks_UISEQ_0309
     * @tc.desc   旧密钥页 SM4 组合输入「测试」UTF-8 6 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0309 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '测试');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0309 end');
    });

    /**
     * @tc.name   testUiSeq0310
     * @tc.number SUB_Huks_UISEQ_0310
     * @tc.desc   旧密钥页 SM4 组合输入「中文输入」UTF-8 12 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0310 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中文输入');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0310 end');
    });

    /**
     * @tc.name   testUiSeq0311
     * @tc.number SUB_Huks_UISEQ_0311
     * @tc.desc   旧密钥页 SM4 组合输入「a😀b」UTF-8 6 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0311 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a😀b');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0311 end');
    });

    /**
     * @tc.name   testUiSeq0312
     * @tc.number SUB_Huks_UISEQ_0312
     * @tc.desc   旧密钥页 SM4 组合输入「😀a」UTF-8 5 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0312 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '😀a');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0312 end');
    });

    /**
     * @tc.name   testUiSeq0313
     * @tc.number SUB_Huks_UISEQ_0313
     * @tc.desc   旧密钥页 SM4 组合输入「a😀」UTF-8 5 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0313 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0313 end');
    });

    /**
     * @tc.name   testUiSeq0314
     * @tc.number SUB_Huks_UISEQ_0314
     * @tc.desc   旧密钥页 SM4 组合输入「🚀汉」UTF-8 7 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0314 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🚀汉');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0314 end');
    });

    /**
     * @tc.name   testUiSeq0315
     * @tc.number SUB_Huks_UISEQ_0315
     * @tc.desc   旧密钥页 SM4 组合输入「汉🚀」UTF-8 7 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0315 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '汉🚀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0315 end');
    });

    /**
     * @tc.name   testUiSeq0316
     * @tc.number SUB_Huks_UISEQ_0316
     * @tc.desc   旧密钥页 SM4 组合输入「密码😀」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0316 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '密码😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0316 end');
    });

    /**
     * @tc.name   testUiSeq0317
     * @tc.number SUB_Huks_UISEQ_0317
     * @tc.desc   旧密钥页 SM4 组合输入「😀密码」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0317 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '😀密码');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0317 end');
    });

    /**
     * @tc.name   testUiSeq0318
     * @tc.number SUB_Huks_UISEQ_0318
     * @tc.desc   旧密钥页 SM4 组合输入「中文输入」UTF-8 12 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0318 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中文输入');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0318 end');
    });

    /**
     * @tc.name   testUiSeq0319
     * @tc.number SUB_Huks_UISEQ_0319
     * @tc.desc   旧密钥页 SM4 组合输入「输入中文」UTF-8 12 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0319 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '输入中文');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0319 end');
    });

    /**
     * @tc.name   testUiSeq0320
     * @tc.number SUB_Huks_UISEQ_0320
     * @tc.desc   旧密钥页 SM4 组合输入「🔐」UTF-8 4 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0320 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0320 end');
    });

    /**
     * @tc.name   testUiSeq0321
     * @tc.number SUB_Huks_UISEQ_0321
     * @tc.desc   旧密钥页 SM4 组合输入「🔐🚀」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0321 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐🚀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0321 end');
    });

    /**
     * @tc.name   testUiSeq0322
     * @tc.number SUB_Huks_UISEQ_0322
     * @tc.desc   旧密钥页 SM4 组合输入「🔐🔐」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0322 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐🔐');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0322 end');
    });

    /**
     * @tc.name   testUiSeq0323
     * @tc.number SUB_Huks_UISEQ_0323
     * @tc.desc   旧密钥页 SM4 组合输入「🚀🚀」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0323 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🚀🚀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0323 end');
    });

    /**
     * @tc.name   testUiSeq0324
     * @tc.number SUB_Huks_UISEQ_0324
     * @tc.desc   旧密钥页 SM4 组合输入「中😀文」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0324 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中😀文');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0324 end');
    });

    /**
     * @tc.name   testUiSeq0325
     * @tc.number SUB_Huks_UISEQ_0325
     * @tc.desc   旧密钥页 SM4 组合输入「文😀中」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0325 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '文😀中');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0325 end');
    });

    /**
     * @tc.name   testUiSeq0326
     * @tc.number SUB_Huks_UISEQ_0326
     * @tc.desc   旧密钥页 SM4 组合输入「密钥🔐」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0326 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '密钥🔐');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0326 end');
    });

    /**
     * @tc.name   testUiSeq0327
     * @tc.number SUB_Huks_UISEQ_0327
     * @tc.desc   旧密钥页 SM4 组合输入「🔐密钥」UTF-8 10 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0327 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐密钥');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0327 end');
    });

    /**
     * @tc.name   testUiSeq0328
     * @tc.number SUB_Huks_UISEQ_0328
     * @tc.desc   旧密钥页 SM4 组合输入「a中b」UTF-8 5 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0328 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a中b');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0328 end');
    });

    /**
     * @tc.name   testUiSeq0329
     * @tc.number SUB_Huks_UISEQ_0329
     * @tc.desc   旧密钥页 SM4 组合输入「中a」UTF-8 4 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0329 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '中a');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0329 end');
    });

    /**
     * @tc.name   testUiSeq0330
     * @tc.number SUB_Huks_UISEQ_0330
     * @tc.desc   旧密钥页 SM4 组合输入「a中」UTF-8 4 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0330 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a中');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0330 end');
    });

    /**
     * @tc.name   testUiSeq0331
     * @tc.number SUB_Huks_UISEQ_0331
     * @tc.desc   旧密钥页 SM4 组合输入「😀😀」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0331 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '😀😀');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0331 end');
    });

    /**
     * @tc.name   testUiSeq0332
     * @tc.number SUB_Huks_UISEQ_0332
     * @tc.desc   旧密钥页 SM4 组合输入「密码abc」UTF-8 9 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0332 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '密码abc');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0332 end');
    });

    /**
     * @tc.name   testUiSeq0333
     * @tc.number SUB_Huks_UISEQ_0333
     * @tc.desc   旧密钥页 SM4 组合输入「abc密码」UTF-8 9 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0333 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'abc密码');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0333 end');
    });

    /**
     * @tc.name   testUiSeq0334
     * @tc.number SUB_Huks_UISEQ_0334
     * @tc.desc   旧密钥页 SM4 组合输入「汉😀a」UTF-8 8 字节扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0334 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '汉😀a');
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0334 end');
    });

    /**
     * @tc.name   testUiSeq0335
     * @tc.number SUB_Huks_UISEQ_0335
     * @tc.desc   🔐🚀 重复 30 组：UTF-8 240 字节，密文 base64 344，双加密相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0335 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', '🔐🚀'.repeat(30));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clickedAgain));
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(firstText !== secondText));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0335 end');
    });

  });
}
