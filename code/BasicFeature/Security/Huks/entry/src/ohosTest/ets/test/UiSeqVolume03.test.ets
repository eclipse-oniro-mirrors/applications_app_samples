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


export default function uiSeqVolume03Test() {
  describe('UiSeqVolume03', () => {
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
     * @tc.name   testUiSeq0096
     * @tc.number SUB_Huks_UISEQ_0096
     * @tc.desc   旧密钥页 SM4 输入长度 1 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0096 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(1));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0096 end');
    });

    /**
     * @tc.name   testUiSeq0097
     * @tc.number SUB_Huks_UISEQ_0097
     * @tc.desc   旧密钥页 SM4 输入长度 2 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0097 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(2));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0097 end');
    });

    /**
     * @tc.name   testUiSeq0098
     * @tc.number SUB_Huks_UISEQ_0098
     * @tc.desc   旧密钥页 SM4 输入长度 3 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0098 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(3));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0098 end');
    });

    /**
     * @tc.name   testUiSeq0099
     * @tc.number SUB_Huks_UISEQ_0099
     * @tc.desc   旧密钥页 SM4 输入长度 4 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0099 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(4));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0099 end');
    });

    /**
     * @tc.name   testUiSeq0100
     * @tc.number SUB_Huks_UISEQ_0100
     * @tc.desc   旧密钥页 SM4 输入长度 5 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0100 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(5));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0100 end');
    });

    /**
     * @tc.name   testUiSeq0101
     * @tc.number SUB_Huks_UISEQ_0101
     * @tc.desc   旧密钥页 SM4 输入长度 6 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0101 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(6));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0101 end');
    });

    /**
     * @tc.name   testUiSeq0102
     * @tc.number SUB_Huks_UISEQ_0102
     * @tc.desc   旧密钥页 SM4 输入长度 7 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0102 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(7));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0102 end');
    });

    /**
     * @tc.name   testUiSeq0103
     * @tc.number SUB_Huks_UISEQ_0103
     * @tc.desc   旧密钥页 SM4 输入长度 8 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0103 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(8));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0103 end');
    });

    /**
     * @tc.name   testUiSeq0104
     * @tc.number SUB_Huks_UISEQ_0104
     * @tc.desc   旧密钥页 SM4 输入长度 9 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0104 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(9));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0104 end');
    });

    /**
     * @tc.name   testUiSeq0105
     * @tc.number SUB_Huks_UISEQ_0105
     * @tc.desc   旧密钥页 SM4 输入长度 10 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0105 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(10));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0105 end');
    });

    /**
     * @tc.name   testUiSeq0106
     * @tc.number SUB_Huks_UISEQ_0106
     * @tc.desc   旧密钥页 SM4 输入长度 11 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0106 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(11));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0106 end');
    });

    /**
     * @tc.name   testUiSeq0107
     * @tc.number SUB_Huks_UISEQ_0107
     * @tc.desc   旧密钥页 SM4 输入长度 12 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0107 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(12));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0107 end');
    });

    /**
     * @tc.name   testUiSeq0108
     * @tc.number SUB_Huks_UISEQ_0108
     * @tc.desc   旧密钥页 SM4 输入长度 13 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0108 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(13));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0108 end');
    });

    /**
     * @tc.name   testUiSeq0109
     * @tc.number SUB_Huks_UISEQ_0109
     * @tc.desc   旧密钥页 SM4 输入长度 14 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0109 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(14));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0109 end');
    });

    /**
     * @tc.name   testUiSeq0110
     * @tc.number SUB_Huks_UISEQ_0110
     * @tc.desc   旧密钥页 SM4 输入长度 15 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0110 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(15));
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0110 end');
    });

    /**
     * @tc.name   testUiSeq0111
     * @tc.number SUB_Huks_UISEQ_0111
     * @tc.desc   旧密钥页 SM4 输入长度 16 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0111 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(16));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0111 end');
    });

    /**
     * @tc.name   testUiSeq0112
     * @tc.number SUB_Huks_UISEQ_0112
     * @tc.desc   旧密钥页 SM4 输入长度 17 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0112 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(17));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0112 end');
    });

    /**
     * @tc.name   testUiSeq0113
     * @tc.number SUB_Huks_UISEQ_0113
     * @tc.desc   旧密钥页 SM4 输入长度 18 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0113 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(18));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0113 end');
    });

    /**
     * @tc.name   testUiSeq0114
     * @tc.number SUB_Huks_UISEQ_0114
     * @tc.desc   旧密钥页 SM4 输入长度 19 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0114 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(19));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0114 end');
    });

    /**
     * @tc.name   testUiSeq0115
     * @tc.number SUB_Huks_UISEQ_0115
     * @tc.desc   旧密钥页 SM4 输入长度 20 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0115 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(20));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0115 end');
    });

    /**
     * @tc.name   testUiSeq0116
     * @tc.number SUB_Huks_UISEQ_0116
     * @tc.desc   旧密钥页 SM4 输入长度 21 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0116 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(21));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0116 end');
    });

    /**
     * @tc.name   testUiSeq0117
     * @tc.number SUB_Huks_UISEQ_0117
     * @tc.desc   旧密钥页 SM4 输入长度 22 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0117 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(22));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0117 end');
    });

    /**
     * @tc.name   testUiSeq0118
     * @tc.number SUB_Huks_UISEQ_0118
     * @tc.desc   旧密钥页 SM4 输入长度 23 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0118 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(23));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0118 end');
    });

    /**
     * @tc.name   testUiSeq0119
     * @tc.number SUB_Huks_UISEQ_0119
     * @tc.desc   旧密钥页 SM4 输入长度 24 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0119 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(24));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0119 end');
    });

    /**
     * @tc.name   testUiSeq0120
     * @tc.number SUB_Huks_UISEQ_0120
     * @tc.desc   旧密钥页 SM4 输入长度 25 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0120 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(25));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0120 end');
    });

    /**
     * @tc.name   testUiSeq0121
     * @tc.number SUB_Huks_UISEQ_0121
     * @tc.desc   旧密钥页 SM4 输入长度 26 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0121 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(26));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0121 end');
    });

    /**
     * @tc.name   testUiSeq0122
     * @tc.number SUB_Huks_UISEQ_0122
     * @tc.desc   旧密钥页 SM4 输入长度 27 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0122 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(27));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0122 end');
    });

    /**
     * @tc.name   testUiSeq0123
     * @tc.number SUB_Huks_UISEQ_0123
     * @tc.desc   旧密钥页 SM4 输入长度 28 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0123 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(28));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0123 end');
    });

    /**
     * @tc.name   testUiSeq0124
     * @tc.number SUB_Huks_UISEQ_0124
     * @tc.desc   旧密钥页 SM4 输入长度 29 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0124 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(29));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0124 end');
    });

    /**
     * @tc.name   testUiSeq0125
     * @tc.number SUB_Huks_UISEQ_0125
     * @tc.desc   旧密钥页 SM4 输入长度 30 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0125 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(30));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0125 end');
    });

    /**
     * @tc.name   testUiSeq0126
     * @tc.number SUB_Huks_UISEQ_0126
     * @tc.desc   旧密钥页 SM4 输入长度 31 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0126 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(31));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(44);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0126 end');
    });

    /**
     * @tc.name   testUiSeq0127
     * @tc.number SUB_Huks_UISEQ_0127
     * @tc.desc   旧密钥页 SM4 输入长度 32 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0127 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(32));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0127 end');
    });

    /**
     * @tc.name   testUiSeq0128
     * @tc.number SUB_Huks_UISEQ_0128
     * @tc.desc   旧密钥页 SM4 输入长度 33 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0128 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(33));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0128 end');
    });

    /**
     * @tc.name   testUiSeq0129
     * @tc.number SUB_Huks_UISEQ_0129
     * @tc.desc   旧密钥页 SM4 输入长度 34 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0129 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(34));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0129 end');
    });

    /**
     * @tc.name   testUiSeq0130
     * @tc.number SUB_Huks_UISEQ_0130
     * @tc.desc   旧密钥页 SM4 输入长度 35 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0130 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(35));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0130 end');
    });

    /**
     * @tc.name   testUiSeq0131
     * @tc.number SUB_Huks_UISEQ_0131
     * @tc.desc   旧密钥页 SM4 输入长度 36 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0131 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(36));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0131 end');
    });

    /**
     * @tc.name   testUiSeq0132
     * @tc.number SUB_Huks_UISEQ_0132
     * @tc.desc   旧密钥页 SM4 输入长度 37 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0132 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(37));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0132 end');
    });

    /**
     * @tc.name   testUiSeq0133
     * @tc.number SUB_Huks_UISEQ_0133
     * @tc.desc   旧密钥页 SM4 输入长度 38 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0133 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(38));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0133 end');
    });

    /**
     * @tc.name   testUiSeq0134
     * @tc.number SUB_Huks_UISEQ_0134
     * @tc.desc   旧密钥页 SM4 输入长度 39 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0134 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(39));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0134 end');
    });

    /**
     * @tc.name   testUiSeq0135
     * @tc.number SUB_Huks_UISEQ_0135
     * @tc.desc   旧密钥页 SM4 输入长度 40 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0135 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(40));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0135 end');
    });

    /**
     * @tc.name   testUiSeq0136
     * @tc.number SUB_Huks_UISEQ_0136
     * @tc.desc   旧密钥页 SM4 输入长度 41 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0136 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(41));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0136 end');
    });

    /**
     * @tc.name   testUiSeq0137
     * @tc.number SUB_Huks_UISEQ_0137
     * @tc.desc   旧密钥页 SM4 输入长度 42 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0137 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(42));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0137 end');
    });

    /**
     * @tc.name   testUiSeq0138
     * @tc.number SUB_Huks_UISEQ_0138
     * @tc.desc   旧密钥页 SM4 输入长度 43 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0138 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(43));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0138 end');
    });

    /**
     * @tc.name   testUiSeq0139
     * @tc.number SUB_Huks_UISEQ_0139
     * @tc.desc   旧密钥页 SM4 输入长度 44 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0139 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(44));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0139 end');
    });

    /**
     * @tc.name   testUiSeq0140
     * @tc.number SUB_Huks_UISEQ_0140
     * @tc.desc   旧密钥页 SM4 输入长度 45 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0140 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(45));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0140 end');
    });

    /**
     * @tc.name   testUiSeq0141
     * @tc.number SUB_Huks_UISEQ_0141
     * @tc.desc   旧密钥页 SM4 输入长度 46 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0141 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(46));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0141 end');
    });

    /**
     * @tc.name   testUiSeq0142
     * @tc.number SUB_Huks_UISEQ_0142
     * @tc.desc   旧密钥页 SM4 输入长度 47 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0142 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(47));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(64));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(64);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0142 end');
    });

    /**
     * @tc.name   testUiSeq0143
     * @tc.number SUB_Huks_UISEQ_0143
     * @tc.desc   旧密钥页 SM4 输入长度 48 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0143 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(48));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0143 end');
    });

    /**
     * @tc.name   testUiSeq0144
     * @tc.number SUB_Huks_UISEQ_0144
     * @tc.desc   旧密钥页 SM4 输入长度 49 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0144 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(49));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0144 end');
    });

    /**
     * @tc.name   testUiSeq0145
     * @tc.number SUB_Huks_UISEQ_0145
     * @tc.desc   旧密钥页 SM4 输入长度 50 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0145 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(50));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0145 end');
    });

    /**
     * @tc.name   testUiSeq0146
     * @tc.number SUB_Huks_UISEQ_0146
     * @tc.desc   旧密钥页 SM4 输入长度 51 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0146 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(51));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0146 end');
    });

    /**
     * @tc.name   testUiSeq0147
     * @tc.number SUB_Huks_UISEQ_0147
     * @tc.desc   旧密钥页 SM4 输入长度 52 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0147 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(52));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0147 end');
    });

    /**
     * @tc.name   testUiSeq0148
     * @tc.number SUB_Huks_UISEQ_0148
     * @tc.desc   旧密钥页 SM4 输入长度 53 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0148 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(53));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0148 end');
    });

    /**
     * @tc.name   testUiSeq0149
     * @tc.number SUB_Huks_UISEQ_0149
     * @tc.desc   旧密钥页 SM4 输入长度 54 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0149 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(54));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0149 end');
    });

    /**
     * @tc.name   testUiSeq0150
     * @tc.number SUB_Huks_UISEQ_0150
     * @tc.desc   旧密钥页 SM4 输入长度 55 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0150 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(55));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0150 end');
    });

    /**
     * @tc.name   testUiSeq0151
     * @tc.number SUB_Huks_UISEQ_0151
     * @tc.desc   旧密钥页 SM4 输入长度 56 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0151 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(56));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0151 end');
    });

    /**
     * @tc.name   testUiSeq0152
     * @tc.number SUB_Huks_UISEQ_0152
     * @tc.desc   旧密钥页 SM4 输入长度 57 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0152 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(57));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0152 end');
    });

    /**
     * @tc.name   testUiSeq0153
     * @tc.number SUB_Huks_UISEQ_0153
     * @tc.desc   旧密钥页 SM4 输入长度 58 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0153 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(58));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0153 end');
    });

    /**
     * @tc.name   testUiSeq0154
     * @tc.number SUB_Huks_UISEQ_0154
     * @tc.desc   旧密钥页 SM4 输入长度 59 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0154 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', 'b'.repeat(59));
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const firstText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const clickedAgain: boolean = await tap(driver, 'encryptionBtn');
      const secondText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText.length), String(88));
      const textLen: number = firstText.length;
      expect(textLen).assertEqual(88);
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText === secondText), String(true));
      expect(firstText === secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0154 end');
    });

    /**
     * @tc.name   testUiSeq0155
     * @tc.number SUB_Huks_UISEQ_0155
     * @tc.desc   旧密钥页 60 字符边界：密文 base64 88，导入后解密回明文
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0155 begin');
      const plain: string = 'k'.repeat(60);
      const tapped: boolean = await tap(driver, 'old_key');
      const entered: boolean = await inputTextTo(driver, 'encryptionInput', plain);
      const clicked: boolean = await tap(driver, 'encryptionBtn');
      const cipherText: string = await waitForTextNotEmpty(driver, 'encryptionInfo', 10);
      const imported: boolean = await tap(driver, 'importKeyBtn');
      const decrypted: boolean = await tap(driver, 'decryptionBtn');
      const backOk: boolean = await waitForTextIs(driver, 'decryptionInfo', plain, 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(entered));
      expect(entered).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clicked));
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(cipherText.length), String(88));
      const cipherLen: number = cipherText.length;
      expect(cipherLen).assertEqual(88);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(imported));
      expect(imported).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(decrypted));
      expect(decrypted).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(backOk));
      expect(backOk).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0155 end');
    });

  });
}
