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


export default function uiSeqVolume04Test() {
  describe('UiSeqVolume04', () => {
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
     * @tc.name   testUiSeq0156
     * @tc.number SUB_Huks_UISEQ_0156
     * @tc.desc   最小访问控制页 SM2 输入长度 1 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0156 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(1));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(1));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 1)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0156 end');
    });

    /**
     * @tc.name   testUiSeq0157
     * @tc.number SUB_Huks_UISEQ_0157
     * @tc.desc   最小访问控制页 SM2 输入长度 2 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0157 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(2));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(2));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 2)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0157 end');
    });

    /**
     * @tc.name   testUiSeq0158
     * @tc.number SUB_Huks_UISEQ_0158
     * @tc.desc   最小访问控制页 SM2 输入长度 3 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0158 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(3));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(3));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 3)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0158 end');
    });

    /**
     * @tc.name   testUiSeq0159
     * @tc.number SUB_Huks_UISEQ_0159
     * @tc.desc   最小访问控制页 SM2 输入长度 4 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0159 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(4));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(4));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 4)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0159 end');
    });

    /**
     * @tc.name   testUiSeq0160
     * @tc.number SUB_Huks_UISEQ_0160
     * @tc.desc   最小访问控制页 SM2 输入长度 5 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0160 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(5));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(5));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 5)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0160 end');
    });

    /**
     * @tc.name   testUiSeq0161
     * @tc.number SUB_Huks_UISEQ_0161
     * @tc.desc   最小访问控制页 SM2 输入长度 6 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0161 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(6));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(6));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 6)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0161 end');
    });

    /**
     * @tc.name   testUiSeq0162
     * @tc.number SUB_Huks_UISEQ_0162
     * @tc.desc   最小访问控制页 SM2 输入长度 7 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0162 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(7));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(7));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 7)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0162 end');
    });

    /**
     * @tc.name   testUiSeq0163
     * @tc.number SUB_Huks_UISEQ_0163
     * @tc.desc   最小访问控制页 SM2 输入长度 8 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0163 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(8));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(8));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 8)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0163 end');
    });

    /**
     * @tc.name   testUiSeq0164
     * @tc.number SUB_Huks_UISEQ_0164
     * @tc.desc   最小访问控制页 SM2 输入长度 9 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0164 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(9));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(9));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 9)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0164 end');
    });

    /**
     * @tc.name   testUiSeq0165
     * @tc.number SUB_Huks_UISEQ_0165
     * @tc.desc   最小访问控制页 SM2 输入长度 10 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0165 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(10));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(10));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 10)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0165 end');
    });

    /**
     * @tc.name   testUiSeq0166
     * @tc.number SUB_Huks_UISEQ_0166
     * @tc.desc   最小访问控制页 SM2 输入长度 11 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0166 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(11));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(11));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 11)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0166 end');
    });

    /**
     * @tc.name   testUiSeq0167
     * @tc.number SUB_Huks_UISEQ_0167
     * @tc.desc   最小访问控制页 SM2 输入长度 12 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0167 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(12));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(12));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 12)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0167 end');
    });

    /**
     * @tc.name   testUiSeq0168
     * @tc.number SUB_Huks_UISEQ_0168
     * @tc.desc   最小访问控制页 SM2 输入长度 13 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0168 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(13));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(13));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 13)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0168 end');
    });

    /**
     * @tc.name   testUiSeq0169
     * @tc.number SUB_Huks_UISEQ_0169
     * @tc.desc   最小访问控制页 SM2 输入长度 14 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0169 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(14));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(14));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 14)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0169 end');
    });

    /**
     * @tc.name   testUiSeq0170
     * @tc.number SUB_Huks_UISEQ_0170
     * @tc.desc   最小访问控制页 SM2 输入长度 15 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0170 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(15));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(15));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 15)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0170 end');
    });

    /**
     * @tc.name   testUiSeq0171
     * @tc.number SUB_Huks_UISEQ_0171
     * @tc.desc   最小访问控制页 SM2 输入长度 16 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0171 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(16));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(16));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 16)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0171 end');
    });

    /**
     * @tc.name   testUiSeq0172
     * @tc.number SUB_Huks_UISEQ_0172
     * @tc.desc   最小访问控制页 SM2 输入长度 17 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0172 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(17));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(17));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 17)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0172 end');
    });

    /**
     * @tc.name   testUiSeq0173
     * @tc.number SUB_Huks_UISEQ_0173
     * @tc.desc   最小访问控制页 SM2 输入长度 18 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0173 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(18));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(18));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 18)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0173 end');
    });

    /**
     * @tc.name   testUiSeq0174
     * @tc.number SUB_Huks_UISEQ_0174
     * @tc.desc   最小访问控制页 SM2 输入长度 19 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0174 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(19));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(19));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 19)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0174 end');
    });

    /**
     * @tc.name   testUiSeq0175
     * @tc.number SUB_Huks_UISEQ_0175
     * @tc.desc   最小访问控制页 SM2 输入长度 20 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0175 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(20));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(20));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 20)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0175 end');
    });

    /**
     * @tc.name   testUiSeq0176
     * @tc.number SUB_Huks_UISEQ_0176
     * @tc.desc   最小访问控制页 SM2 输入长度 21 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0176 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(21));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(21));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 21)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0176 end');
    });

    /**
     * @tc.name   testUiSeq0177
     * @tc.number SUB_Huks_UISEQ_0177
     * @tc.desc   最小访问控制页 SM2 输入长度 22 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0177 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(22));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(22));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 22)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0177 end');
    });

    /**
     * @tc.name   testUiSeq0178
     * @tc.number SUB_Huks_UISEQ_0178
     * @tc.desc   最小访问控制页 SM2 输入长度 23 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0178 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(23));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(23));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 23)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0178 end');
    });

    /**
     * @tc.name   testUiSeq0179
     * @tc.number SUB_Huks_UISEQ_0179
     * @tc.desc   最小访问控制页 SM2 输入长度 24 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0179 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(24));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(24));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 24)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0179 end');
    });

    /**
     * @tc.name   testUiSeq0180
     * @tc.number SUB_Huks_UISEQ_0180
     * @tc.desc   最小访问控制页 SM2 输入长度 25 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0180 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(25));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(25));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 25)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0180 end');
    });

    /**
     * @tc.name   testUiSeq0181
     * @tc.number SUB_Huks_UISEQ_0181
     * @tc.desc   最小访问控制页 SM2 输入长度 26 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0181 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(26));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(26));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 26)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0181 end');
    });

    /**
     * @tc.name   testUiSeq0182
     * @tc.number SUB_Huks_UISEQ_0182
     * @tc.desc   最小访问控制页 SM2 输入长度 27 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0182 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(27));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(27));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 27)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0182 end');
    });

    /**
     * @tc.name   testUiSeq0183
     * @tc.number SUB_Huks_UISEQ_0183
     * @tc.desc   最小访问控制页 SM2 输入长度 28 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0183 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(28));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(28));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 28)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0183 end');
    });

    /**
     * @tc.name   testUiSeq0184
     * @tc.number SUB_Huks_UISEQ_0184
     * @tc.desc   最小访问控制页 SM2 输入长度 29 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0184 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(29));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(29));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 29)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0184 end');
    });

    /**
     * @tc.name   testUiSeq0185
     * @tc.number SUB_Huks_UISEQ_0185
     * @tc.desc   最小访问控制页 SM2 输入长度 30 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0185 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(30));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(30));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 30)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0185 end');
    });

    /**
     * @tc.name   testUiSeq0186
     * @tc.number SUB_Huks_UISEQ_0186
     * @tc.desc   最小访问控制页 SM2 输入长度 31 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0186 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(31));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(31));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 31)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0186 end');
    });

    /**
     * @tc.name   testUiSeq0187
     * @tc.number SUB_Huks_UISEQ_0187
     * @tc.desc   最小访问控制页 SM2 输入长度 32 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0187 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(32));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(32));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 32)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0187 end');
    });

    /**
     * @tc.name   testUiSeq0188
     * @tc.number SUB_Huks_UISEQ_0188
     * @tc.desc   最小访问控制页 SM2 输入长度 33 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0188 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(33));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(33));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 33)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0188 end');
    });

    /**
     * @tc.name   testUiSeq0189
     * @tc.number SUB_Huks_UISEQ_0189
     * @tc.desc   最小访问控制页 SM2 输入长度 34 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0189 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(34));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(34));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 34)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0189 end');
    });

    /**
     * @tc.name   testUiSeq0190
     * @tc.number SUB_Huks_UISEQ_0190
     * @tc.desc   最小访问控制页 SM2 输入长度 35 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0190 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(35));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(35));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 35)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0190 end');
    });

    /**
     * @tc.name   testUiSeq0191
     * @tc.number SUB_Huks_UISEQ_0191
     * @tc.desc   最小访问控制页 SM2 输入长度 36 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0191 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(36));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(36));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 36)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0191 end');
    });

    /**
     * @tc.name   testUiSeq0192
     * @tc.number SUB_Huks_UISEQ_0192
     * @tc.desc   最小访问控制页 SM2 输入长度 37 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0192 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(37));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(37));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 37)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0192 end');
    });

    /**
     * @tc.name   testUiSeq0193
     * @tc.number SUB_Huks_UISEQ_0193
     * @tc.desc   最小访问控制页 SM2 输入长度 38 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0193 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(38));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(38));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 38)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0193 end');
    });

    /**
     * @tc.name   testUiSeq0194
     * @tc.number SUB_Huks_UISEQ_0194
     * @tc.desc   最小访问控制页 SM2 输入长度 39 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0194 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(39));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(39));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 39)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0194 end');
    });

    /**
     * @tc.name   testUiSeq0195
     * @tc.number SUB_Huks_UISEQ_0195
     * @tc.desc   最小访问控制页 SM2 输入长度 40 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0195 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(40));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(40));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 40)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0195 end');
    });

    /**
     * @tc.name   testUiSeq0196
     * @tc.number SUB_Huks_UISEQ_0196
     * @tc.desc   最小访问控制页 SM2 输入长度 41 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0196 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(41));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(41));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 41)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0196 end');
    });

    /**
     * @tc.name   testUiSeq0197
     * @tc.number SUB_Huks_UISEQ_0197
     * @tc.desc   最小访问控制页 SM2 输入长度 42 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0197 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(42));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(42));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 42)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0197 end');
    });

    /**
     * @tc.name   testUiSeq0198
     * @tc.number SUB_Huks_UISEQ_0198
     * @tc.desc   最小访问控制页 SM2 输入长度 43 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0198 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(43));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(43));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 43)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0198 end');
    });

    /**
     * @tc.name   testUiSeq0199
     * @tc.number SUB_Huks_UISEQ_0199
     * @tc.desc   最小访问控制页 SM2 输入长度 44 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0199 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(44));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(44));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 44)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0199 end');
    });

    /**
     * @tc.name   testUiSeq0200
     * @tc.number SUB_Huks_UISEQ_0200
     * @tc.desc   最小访问控制页 SM2 输入长度 45 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0200 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(45));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(45));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 45)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0200 end');
    });

    /**
     * @tc.name   testUiSeq0201
     * @tc.number SUB_Huks_UISEQ_0201
     * @tc.desc   最小访问控制页 SM2 输入长度 46 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0201 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(46));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(46));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 46)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0201 end');
    });

    /**
     * @tc.name   testUiSeq0202
     * @tc.number SUB_Huks_UISEQ_0202
     * @tc.desc   最小访问控制页 SM2 输入长度 47 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0202 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(47));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(47));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 47)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0202 end');
    });

    /**
     * @tc.name   testUiSeq0203
     * @tc.number SUB_Huks_UISEQ_0203
     * @tc.desc   最小访问控制页 SM2 输入长度 48 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0203 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(48));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(48));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 48)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0203 end');
    });

    /**
     * @tc.name   testUiSeq0204
     * @tc.number SUB_Huks_UISEQ_0204
     * @tc.desc   最小访问控制页 SM2 输入长度 49 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0204 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(49));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(49));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 49)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0204 end');
    });

    /**
     * @tc.name   testUiSeq0205
     * @tc.number SUB_Huks_UISEQ_0205
     * @tc.desc   最小访问控制页 SM2 输入长度 50 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0205 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(50));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(50));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 50)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0205 end');
    });

    /**
     * @tc.name   testUiSeq0206
     * @tc.number SUB_Huks_UISEQ_0206
     * @tc.desc   最小访问控制页 SM2 输入长度 51 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0206 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(51));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(51));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 51)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0206 end');
    });

    /**
     * @tc.name   testUiSeq0207
     * @tc.number SUB_Huks_UISEQ_0207
     * @tc.desc   最小访问控制页 SM2 输入长度 52 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0207 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(52));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(52));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 52)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0207 end');
    });

    /**
     * @tc.name   testUiSeq0208
     * @tc.number SUB_Huks_UISEQ_0208
     * @tc.desc   最小访问控制页 SM2 输入长度 53 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0208 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(53));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(53));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 53)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0208 end');
    });

    /**
     * @tc.name   testUiSeq0209
     * @tc.number SUB_Huks_UISEQ_0209
     * @tc.desc   最小访问控制页 SM2 输入长度 54 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0209 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(54));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(54));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 54)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0209 end');
    });

    /**
     * @tc.name   testUiSeq0210
     * @tc.number SUB_Huks_UISEQ_0210
     * @tc.desc   最小访问控制页 SM2 输入长度 55 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0210 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(55));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(55));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 55)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0210 end');
    });

    /**
     * @tc.name   testUiSeq0211
     * @tc.number SUB_Huks_UISEQ_0211
     * @tc.desc   最小访问控制页 SM2 输入长度 56 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0211 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(56));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(56));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 56)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0211 end');
    });

    /**
     * @tc.name   testUiSeq0212
     * @tc.number SUB_Huks_UISEQ_0212
     * @tc.desc   最小访问控制页 SM2 输入长度 57 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0212 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(57));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(57));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 57)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0212 end');
    });

    /**
     * @tc.name   testUiSeq0213
     * @tc.number SUB_Huks_UISEQ_0213
     * @tc.desc   最小访问控制页 SM2 输入长度 58 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0213 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(58));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(58));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 58)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0213 end');
    });

    /**
     * @tc.name   testUiSeq0214
     * @tc.number SUB_Huks_UISEQ_0214
     * @tc.desc   最小访问控制页 SM2 输入长度 59 扫描
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0214 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'c'.repeat(59));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
      expect(tapped).assertTrue();
      expect(entered).assertTrue();
      expect(clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s plainLen=%{public}s',
        String(firstText.length), String(59));
      const textLen: number = firstText.length;
      expect(sm2Base64LenOk(textLen, 59)).assertTrue();
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(firstText !== secondText), String(true));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0214 end');
    });

    /**
     * @tc.name   testUiSeq0215
     * @tc.number SUB_Huks_UISEQ_0215
     * @tc.desc   最小访问控制页 60 码元边界：密文为合法 DER 长度，双加密互异
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0215 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const entered: boolean = await inputTextTo(driver, 'passwordInput', 'm'.repeat(60));
      const clicked: boolean = await tap(driver, 'save_password');
      const firstText: string = await waitForTextNotEmpty(driver, 'cipherTextinfo', 10);
      const clickedAgain: boolean = await tap(driver, 'save_password');
      const secondText: string = await waitForTextDifferent(driver, 'cipherTextinfo', firstText, 10);
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(clickedAgain));
      expect(clickedAgain).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(firstText !== secondText));
      expect(firstText !== secondText).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0215 end');
    });

  });
}
