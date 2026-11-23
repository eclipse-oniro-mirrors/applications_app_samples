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


export default function uiSeqVolume02Test() {
  describe('UiSeqVolume02', () => {
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
     * @tc.name   testUiSeq0036
     * @tc.number SUB_Huks_UISEQ_0036
     * @tc.desc   新密钥页 AES 输入长度 1 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0036 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(1));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0036 end');
    });

    /**
     * @tc.name   testUiSeq0037
     * @tc.number SUB_Huks_UISEQ_0037
     * @tc.desc   新密钥页 AES 输入长度 2 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0037 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(2));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(24);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0037 end');
    });

    /**
     * @tc.name   testUiSeq0038
     * @tc.number SUB_Huks_UISEQ_0038
     * @tc.desc   新密钥页 AES 输入长度 3 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0038 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(3));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0038 end');
    });

    /**
     * @tc.name   testUiSeq0039
     * @tc.number SUB_Huks_UISEQ_0039
     * @tc.desc   新密钥页 AES 输入长度 4 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0039 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(4));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0039 end');
    });

    /**
     * @tc.name   testUiSeq0040
     * @tc.number SUB_Huks_UISEQ_0040
     * @tc.desc   新密钥页 AES 输入长度 5 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0040 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(5));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0040 end');
    });

    /**
     * @tc.name   testUiSeq0041
     * @tc.number SUB_Huks_UISEQ_0041
     * @tc.desc   新密钥页 AES 输入长度 6 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0041 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(6));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0041 end');
    });

    /**
     * @tc.name   testUiSeq0042
     * @tc.number SUB_Huks_UISEQ_0042
     * @tc.desc   新密钥页 AES 输入长度 7 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0042 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(7));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0042 end');
    });

    /**
     * @tc.name   testUiSeq0043
     * @tc.number SUB_Huks_UISEQ_0043
     * @tc.desc   新密钥页 AES 输入长度 8 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0043 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(8));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0043 end');
    });

    /**
     * @tc.name   testUiSeq0044
     * @tc.number SUB_Huks_UISEQ_0044
     * @tc.desc   新密钥页 AES 输入长度 9 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0044 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(9));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0044 end');
    });

    /**
     * @tc.name   testUiSeq0045
     * @tc.number SUB_Huks_UISEQ_0045
     * @tc.desc   新密钥页 AES 输入长度 10 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0045 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(10));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0045 end');
    });

    /**
     * @tc.name   testUiSeq0046
     * @tc.number SUB_Huks_UISEQ_0046
     * @tc.desc   新密钥页 AES 输入长度 11 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0046 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(11));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0046 end');
    });

    /**
     * @tc.name   testUiSeq0047
     * @tc.number SUB_Huks_UISEQ_0047
     * @tc.desc   新密钥页 AES 输入长度 12 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0047 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(12));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0047 end');
    });

    /**
     * @tc.name   testUiSeq0048
     * @tc.number SUB_Huks_UISEQ_0048
     * @tc.desc   新密钥页 AES 输入长度 13 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0048 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(13));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0048 end');
    });

    /**
     * @tc.name   testUiSeq0049
     * @tc.number SUB_Huks_UISEQ_0049
     * @tc.desc   新密钥页 AES 输入长度 14 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0049 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(14));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0049 end');
    });

    /**
     * @tc.name   testUiSeq0050
     * @tc.number SUB_Huks_UISEQ_0050
     * @tc.desc   新密钥页 AES 输入长度 15 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0050 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(15));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0050 end');
    });

    /**
     * @tc.name   testUiSeq0051
     * @tc.number SUB_Huks_UISEQ_0051
     * @tc.desc   新密钥页 AES 输入长度 16 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0051 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(16));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0051 end');
    });

    /**
     * @tc.name   testUiSeq0052
     * @tc.number SUB_Huks_UISEQ_0052
     * @tc.desc   新密钥页 AES 输入长度 17 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0052 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(17));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0052 end');
    });

    /**
     * @tc.name   testUiSeq0053
     * @tc.number SUB_Huks_UISEQ_0053
     * @tc.desc   新密钥页 AES 输入长度 18 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0053 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(18));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(48));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(48);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0053 end');
    });

    /**
     * @tc.name   testUiSeq0054
     * @tc.number SUB_Huks_UISEQ_0054
     * @tc.desc   新密钥页 AES 输入长度 19 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0054 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(19));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(48));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(48);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0054 end');
    });

    /**
     * @tc.name   testUiSeq0055
     * @tc.number SUB_Huks_UISEQ_0055
     * @tc.desc   新密钥页 AES 输入长度 20 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0055 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(20));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(48));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(48);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0055 end');
    });

    /**
     * @tc.name   testUiSeq0056
     * @tc.number SUB_Huks_UISEQ_0056
     * @tc.desc   新密钥页 AES 输入长度 21 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0056 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(21));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(52));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(52);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0056 end');
    });

    /**
     * @tc.name   testUiSeq0057
     * @tc.number SUB_Huks_UISEQ_0057
     * @tc.desc   新密钥页 AES 输入长度 22 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0057 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(22));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(52));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(52);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0057 end');
    });

    /**
     * @tc.name   testUiSeq0058
     * @tc.number SUB_Huks_UISEQ_0058
     * @tc.desc   新密钥页 AES 输入长度 23 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0058 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(23));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(52));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(52);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0058 end');
    });

    /**
     * @tc.name   testUiSeq0059
     * @tc.number SUB_Huks_UISEQ_0059
     * @tc.desc   新密钥页 AES 输入长度 24 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0059 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(24));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(56));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(56);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0059 end');
    });

    /**
     * @tc.name   testUiSeq0060
     * @tc.number SUB_Huks_UISEQ_0060
     * @tc.desc   新密钥页 AES 输入长度 25 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0060 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(25));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(56));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(56);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0060 end');
    });

    /**
     * @tc.name   testUiSeq0061
     * @tc.number SUB_Huks_UISEQ_0061
     * @tc.desc   新密钥页 AES 输入长度 26 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0061 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(26));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(56));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(56);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0061 end');
    });

    /**
     * @tc.name   testUiSeq0062
     * @tc.number SUB_Huks_UISEQ_0062
     * @tc.desc   新密钥页 AES 输入长度 27 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0062 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(27));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(60));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(60);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0062 end');
    });

    /**
     * @tc.name   testUiSeq0063
     * @tc.number SUB_Huks_UISEQ_0063
     * @tc.desc   新密钥页 AES 输入长度 28 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0063 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(28));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(60));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(60);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0063 end');
    });

    /**
     * @tc.name   testUiSeq0064
     * @tc.number SUB_Huks_UISEQ_0064
     * @tc.desc   新密钥页 AES 输入长度 29 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0064 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(29));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(60));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(60);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0064 end');
    });

    /**
     * @tc.name   testUiSeq0065
     * @tc.number SUB_Huks_UISEQ_0065
     * @tc.desc   新密钥页 AES 输入长度 30 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0065 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(30));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0065 end');
    });

    /**
     * @tc.name   testUiSeq0066
     * @tc.number SUB_Huks_UISEQ_0066
     * @tc.desc   新密钥页 AES 输入长度 31 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0066 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(31));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0066 end');
    });

    /**
     * @tc.name   testUiSeq0067
     * @tc.number SUB_Huks_UISEQ_0067
     * @tc.desc   新密钥页 AES 输入长度 32 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0067 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(32));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0067 end');
    });

    /**
     * @tc.name   testUiSeq0068
     * @tc.number SUB_Huks_UISEQ_0068
     * @tc.desc   新密钥页 AES 输入长度 33 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0068 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(33));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(68));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(68);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0068 end');
    });

    /**
     * @tc.name   testUiSeq0069
     * @tc.number SUB_Huks_UISEQ_0069
     * @tc.desc   新密钥页 AES 输入长度 34 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0069 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(34));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(68));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(68);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0069 end');
    });

    /**
     * @tc.name   testUiSeq0070
     * @tc.number SUB_Huks_UISEQ_0070
     * @tc.desc   新密钥页 AES 输入长度 35 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0070 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(35));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(68));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(68);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0070 end');
    });

    /**
     * @tc.name   testUiSeq0071
     * @tc.number SUB_Huks_UISEQ_0071
     * @tc.desc   新密钥页 AES 输入长度 36 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0071 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(36));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(72));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(72);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0071 end');
    });

    /**
     * @tc.name   testUiSeq0072
     * @tc.number SUB_Huks_UISEQ_0072
     * @tc.desc   新密钥页 AES 输入长度 37 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0072 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(37));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(72));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(72);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0072 end');
    });

    /**
     * @tc.name   testUiSeq0073
     * @tc.number SUB_Huks_UISEQ_0073
     * @tc.desc   新密钥页 AES 输入长度 38 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0073 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(38));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(72));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(72);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0073 end');
    });

    /**
     * @tc.name   testUiSeq0074
     * @tc.number SUB_Huks_UISEQ_0074
     * @tc.desc   新密钥页 AES 输入长度 39 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0074 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(39));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(76));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(76);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0074 end');
    });

    /**
     * @tc.name   testUiSeq0075
     * @tc.number SUB_Huks_UISEQ_0075
     * @tc.desc   新密钥页 AES 输入长度 40 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0075 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(40));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(76));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(76);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0075 end');
    });

    /**
     * @tc.name   testUiSeq0076
     * @tc.number SUB_Huks_UISEQ_0076
     * @tc.desc   新密钥页 AES 输入长度 41 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0076 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(41));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(76));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(76);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0076 end');
    });

    /**
     * @tc.name   testUiSeq0077
     * @tc.number SUB_Huks_UISEQ_0077
     * @tc.desc   新密钥页 AES 输入长度 42 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0077 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(42));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(80));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(80);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0077 end');
    });

    /**
     * @tc.name   testUiSeq0078
     * @tc.number SUB_Huks_UISEQ_0078
     * @tc.desc   新密钥页 AES 输入长度 43 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0078 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(43));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(80));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(80);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0078 end');
    });

    /**
     * @tc.name   testUiSeq0079
     * @tc.number SUB_Huks_UISEQ_0079
     * @tc.desc   新密钥页 AES 输入长度 44 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0079 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(44));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(80));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(80);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0079 end');
    });

    /**
     * @tc.name   testUiSeq0080
     * @tc.number SUB_Huks_UISEQ_0080
     * @tc.desc   新密钥页 AES 输入长度 45 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0080 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(45));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(84));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(84);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0080 end');
    });

    /**
     * @tc.name   testUiSeq0081
     * @tc.number SUB_Huks_UISEQ_0081
     * @tc.desc   新密钥页 AES 输入长度 46 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0081 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(46));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(84));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(84);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0081 end');
    });

    /**
     * @tc.name   testUiSeq0082
     * @tc.number SUB_Huks_UISEQ_0082
     * @tc.desc   新密钥页 AES 输入长度 47 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0082 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(47));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(84));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(84);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0082 end');
    });

    /**
     * @tc.name   testUiSeq0083
     * @tc.number SUB_Huks_UISEQ_0083
     * @tc.desc   新密钥页 AES 输入长度 48 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0083 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(48));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0083 end');
    });

    /**
     * @tc.name   testUiSeq0084
     * @tc.number SUB_Huks_UISEQ_0084
     * @tc.desc   新密钥页 AES 输入长度 49 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0084 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(49));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0084 end');
    });

    /**
     * @tc.name   testUiSeq0085
     * @tc.number SUB_Huks_UISEQ_0085
     * @tc.desc   新密钥页 AES 输入长度 50 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0085 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(50));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0085 end');
    });

    /**
     * @tc.name   testUiSeq0086
     * @tc.number SUB_Huks_UISEQ_0086
     * @tc.desc   新密钥页 AES 输入长度 51 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0086 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(51));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(92));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(92);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0086 end');
    });

    /**
     * @tc.name   testUiSeq0087
     * @tc.number SUB_Huks_UISEQ_0087
     * @tc.desc   新密钥页 AES 输入长度 52 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0087 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(52));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(92));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(92);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0087 end');
    });

    /**
     * @tc.name   testUiSeq0088
     * @tc.number SUB_Huks_UISEQ_0088
     * @tc.desc   新密钥页 AES 输入长度 53 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0088 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(53));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(92));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(92);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0088 end');
    });

    /**
     * @tc.name   testUiSeq0089
     * @tc.number SUB_Huks_UISEQ_0089
     * @tc.desc   新密钥页 AES 输入长度 54 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0089 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(54));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(96));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(96);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0089 end');
    });

    /**
     * @tc.name   testUiSeq0090
     * @tc.number SUB_Huks_UISEQ_0090
     * @tc.desc   新密钥页 AES 输入长度 55 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0090 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(55));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(96));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(96);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0090 end');
    });

    /**
     * @tc.name   testUiSeq0091
     * @tc.number SUB_Huks_UISEQ_0091
     * @tc.desc   新密钥页 AES 输入长度 56 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0091 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(56));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(96));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(96);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0091 end');
    });

    /**
     * @tc.name   testUiSeq0092
     * @tc.number SUB_Huks_UISEQ_0092
     * @tc.desc   新密钥页 AES 输入长度 57 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0092 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(57));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(100));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(100);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0092 end');
    });

    /**
     * @tc.name   testUiSeq0093
     * @tc.number SUB_Huks_UISEQ_0093
     * @tc.desc   新密钥页 AES 输入长度 58 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0093 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(58));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(100));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(100);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0093 end');
    });

    /**
     * @tc.name   testUiSeq0094
     * @tc.number SUB_Huks_UISEQ_0094
     * @tc.desc   新密钥页 AES 输入长度 59 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0094 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(59));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextDifferent(driver, 'encryptionInfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(100));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(100);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0094 end');
    });

    /**
     * @tc.name   testUiSeq0095
     * @tc.number SUB_Huks_UISEQ_0095
     * @tc.desc   新密钥页 60 字符边界：密文 base64 104，GCM 随机 IV 下双加密互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0095 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'a'.repeat(60));
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
        String(firstText.length), String(104));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clickedAgain));
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(firstText !== secondText));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0095 end');
    });

  });
}
