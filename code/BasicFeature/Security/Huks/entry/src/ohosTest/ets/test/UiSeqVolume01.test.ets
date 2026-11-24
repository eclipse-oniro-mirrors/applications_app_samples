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


export default function uiSeqVolume01Test() {
  describe('UiSeqVolume01', () => {
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
     * @tc.name   testUiSeq0001
     * @tc.number SUB_Huks_UISEQ_0001
     * @tc.desc   状态序列 01：进入新密钥页后出现加密输入框
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0001 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0001 end');
    });

    /**
     * @tc.name   testUiSeq0002
     * @tc.number SUB_Huks_UISEQ_0002
     * @tc.desc   状态序列 02：进入旧密钥页后出现导入密钥按钮
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0002 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0002 end');
    });

    /**
     * @tc.name   testUiSeq0003
     * @tc.number SUB_Huks_UISEQ_0003
     * @tc.desc   状态序列 03：进入最小访问控制页后出现密码输入框
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0003 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0003 end');
    });

    /**
     * @tc.name   testUiSeq0004
     * @tc.number SUB_Huks_UISEQ_0004
     * @tc.desc   状态序列 04：新密钥页不出现旧密钥页的导入按钮
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0004 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0004 end');
    });

    /**
     * @tc.name   testUiSeq0005
     * @tc.number SUB_Huks_UISEQ_0005
     * @tc.desc   状态序列 05：旧密钥页不出现最小访问控制的密码框
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0005 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0005 end');
    });

    /**
     * @tc.name   testUiSeq0006
     * @tc.number SUB_Huks_UISEQ_0006
     * @tc.desc   状态序列 06：最小访问控制页不出现新密钥页的输入框
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0006 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0006 end');
    });

    /**
     * @tc.name   testUiSeq0007
     * @tc.number SUB_Huks_UISEQ_0007
     * @tc.desc   状态序列 07：新密钥页组件互斥再验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0007 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0007 end');
    });

    /**
     * @tc.name   testUiSeq0008
     * @tc.number SUB_Huks_UISEQ_0008
     * @tc.desc   状态序列 08：旧密钥页组件互斥再验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0008 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0008 end');
    });

    /**
     * @tc.name   testUiSeq0009
     * @tc.number SUB_Huks_UISEQ_0009
     * @tc.desc   状态序列 09：最小访问控制页组件互斥再验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0009 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0009 end');
    });

    /**
     * @tc.name   testUiSeq0010
     * @tc.number SUB_Huks_UISEQ_0010
     * @tc.desc   状态序列 10：新密钥页入口稳定可复现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0010 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0010 end');
    });

    /**
     * @tc.name   testUiSeq0011
     * @tc.number SUB_Huks_UISEQ_0011
     * @tc.desc   状态序列 11：旧密钥页入口稳定可复现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0011 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0011 end');
    });

    /**
     * @tc.name   testUiSeq0012
     * @tc.number SUB_Huks_UISEQ_0012
     * @tc.desc   状态序列 12：最小访问控制页入口稳定可复现
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0012 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0012 end');
    });

    /**
     * @tc.name   testUiSeq0013
     * @tc.number SUB_Huks_UISEQ_0013
     * @tc.desc   状态序列 13：新密钥页标识元素第三轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0013 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0013 end');
    });

    /**
     * @tc.name   testUiSeq0014
     * @tc.number SUB_Huks_UISEQ_0014
     * @tc.desc   状态序列 14：旧密钥页标识元素第三轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0014 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0014 end');
    });

    /**
     * @tc.name   testUiSeq0015
     * @tc.number SUB_Huks_UISEQ_0015
     * @tc.desc   状态序列 15：最小访问控制页标识元素第三轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0015 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0015 end');
    });

    /**
     * @tc.name   testUiSeq0016
     * @tc.number SUB_Huks_UISEQ_0016
     * @tc.desc   状态序列 16：新密钥页标识元素第四轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0016 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0016 end');
    });

    /**
     * @tc.name   testUiSeq0017
     * @tc.number SUB_Huks_UISEQ_0017
     * @tc.desc   状态序列 17：旧密钥页标识元素第四轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0017 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0017 end');
    });

    /**
     * @tc.name   testUiSeq0018
     * @tc.number SUB_Huks_UISEQ_0018
     * @tc.desc   状态序列 18：最小访问控制页标识元素第四轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0018 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0018 end');
    });

    /**
     * @tc.name   testUiSeq0019
     * @tc.number SUB_Huks_UISEQ_0019
     * @tc.desc   状态序列 19：新密钥页标识元素第五轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0019 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0019 end');
    });

    /**
     * @tc.name   testUiSeq0020
     * @tc.number SUB_Huks_UISEQ_0020
     * @tc.desc   状态序列 20：旧密钥页标识元素第五轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0020 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0020 end');
    });

    /**
     * @tc.name   testUiSeq0021
     * @tc.number SUB_Huks_UISEQ_0021
     * @tc.desc   状态序列 21：最小访问控制页标识元素第五轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0021 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0021 end');
    });

    /**
     * @tc.name   testUiSeq0022
     * @tc.number SUB_Huks_UISEQ_0022
     * @tc.desc   状态序列 22：新密钥页标识元素第六轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0022 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0022 end');
    });

    /**
     * @tc.name   testUiSeq0023
     * @tc.number SUB_Huks_UISEQ_0023
     * @tc.desc   状态序列 23：旧密钥页标识元素第六轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0023 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0023 end');
    });

    /**
     * @tc.name   testUiSeq0024
     * @tc.number SUB_Huks_UISEQ_0024
     * @tc.desc   状态序列 24：最小访问控制页标识元素第六轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0024 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0024 end');
    });

    /**
     * @tc.name   testUiSeq0025
     * @tc.number SUB_Huks_UISEQ_0025
     * @tc.desc   状态序列 25：新密钥页标识元素第七轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0025 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0025 end');
    });

    /**
     * @tc.name   testUiSeq0026
     * @tc.number SUB_Huks_UISEQ_0026
     * @tc.desc   状态序列 26：旧密钥页标识元素第七轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0026 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0026 end');
    });

    /**
     * @tc.name   testUiSeq0027
     * @tc.number SUB_Huks_UISEQ_0027
     * @tc.desc   状态序列 27：最小访问控制页标识元素第七轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0027 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0027 end');
    });

    /**
     * @tc.name   testUiSeq0028
     * @tc.number SUB_Huks_UISEQ_0028
     * @tc.desc   状态序列 28：新密钥页标识元素第八轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0028 begin');
      const tapped: boolean = await tap(driver, 'new_key');
      const result: boolean = await waitForId(driver, 'encryptionInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'importKeyBtn');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0028 end');
    });

    /**
     * @tc.name   testUiSeq0029
     * @tc.number SUB_Huks_UISEQ_0029
     * @tc.desc   状态序列 29：旧密钥页标识元素第八轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0029 begin');
      const tapped: boolean = await tap(driver, 'old_key');
      const result: boolean = await waitForId(driver, 'importKeyBtn', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'passwordInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0029 end');
    });

    /**
     * @tc.name   testUiSeq0030
     * @tc.number SUB_Huks_UISEQ_0030
     * @tc.desc   状态序列 30：最小访问控制页标识元素第八轮核对
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0030 begin');
      const tapped: boolean = await tap(driver, 'min_access_control');
      const result: boolean = await waitForId(driver, 'passwordInput', 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tapped));
      expect(tapped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result));
      expect(result).assertTrue();
      const absentCheck: boolean = await existsById(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(absentCheck), String(false));
      expect(absentCheck).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0030 end');
    });


    /**
     * @tc.name   testUiSeq0031
     * @tc.number SUB_Huks_UISEQ_0031
     * @tc.desc   新密钥页输入文本后返回首页再进旧密钥页，输入框为空不残留状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiSeq0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0031 begin');
      const tappedNew: boolean = await tap(driver, 'new_key');
      const typed: boolean = await inputTextTo(driver, 'encryptionInput', 'anchor-state');
      const atHome: boolean = await backToIndex(driver);
      const tappedOld: boolean = await tap(driver, 'old_key');
      const oldInput: string = await textOf(driver, 'encryptionInput');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedNew), String(true));
      expect(tappedNew).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(typed), String(true));
      expect(typed).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(atHome), String(true));
      expect(atHome).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tappedOld), String(true));
      expect(tappedOld).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(oldInput), String(''));
      expect(oldInput === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUiSeq0031 end');
    });

  });
}
