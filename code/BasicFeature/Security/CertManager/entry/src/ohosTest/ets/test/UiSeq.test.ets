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

// UI 层序列主题：以展示复位收尾的按钮操作序列用例。


import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, MatchPattern, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CertManager]';
const BUNDLE: string = 'com.samples.certmanager';
const ABILITY: string = 'EntryAbility';
const HOME_ID: string = 'dispalyButton';
const CERT_FRAGMENT: string = 'AgIIAA==';
const ORIGIN_FRAGMENT: string = 'on Sunday at the Central Garden';
const STAIN_ORIGIN_FRAGMENT: string = 'on Monday at the lakeside garden';
const CERT_COUNTER: string = '4020/100';
const ORIGIN_COUNTER: string = '72/100';
const STAIN_ORIGIN_COUNTER: string = '82/100';
const SIGN_COUNTER: string = '344/100';
const STAIN_SIG_COUNTER: string = '172/100';
const EMPTY_SIG_COUNTER: string = '0/100';
const ZH_INSTALL_SUCCESS: string = '安装成功';
const ZH_SIGN_SUCCESS: string = '签名通过';
const ZH_VERIFY_SUCCESS: string = '校验通过';
const ZH_VERIFY_FAIL: string = '校验失败';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

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

async function existsByTextContains(driver: Driver, text: string): Promise<boolean> {
  try {
    await driver.assertComponentExist(ON.text(text, MatchPattern.CONTAINS));
    return true;
  } catch (err) {
    return false;
  }
}

async function waitForId(driver: Driver, id: string, attempts: number): Promise<boolean> {
  for (let i = 0; i < attempts; i++) {
    if (await existsById(driver, id)) {
      return true;
    }
    await delay(200);
  }
  return false;
}

async function waitForText(driver: Driver, text: string, attempts: number): Promise<boolean> {
  for (let i = 0; i < attempts; i++) {
    if (await existsByText(driver, text)) {
      return true;
    }
    await delay(200);
  }
  return false;
}

// UI 文案走 $r 资源，渲染值随设备语言变化；同一语义同时匹配中英文，两种语言环境断言都成立。
async function waitForAnyText(driver: Driver, texts: string[], attempts: number): Promise<boolean> {
  for (let i = 0; i < attempts; i++) {
    for (let j = 0; j < texts.length; j++) {
      if (await existsByText(driver, texts[j])) {
        return true;
      }
    }
    await delay(200);
  }
  return false;
}

async function waitForTextContains(driver: Driver, text: string, attempts: number): Promise<boolean> {
  for (let i = 0; i < attempts; i++) {
    if (await existsByTextContains(driver, text)) {
      return true;
    }
    await delay(200);
  }
  return false;
}

async function findById(driver: Driver, id: string): Promise<Component | null> {
  if (!await waitForId(driver, id, 10)) {
    return null;
  }
  return await driver.findComponent(ON.id(id));
}

async function tapById(driver: Driver, id: string): Promise<boolean> {
  const component: Component | null = await findById(driver, id);
  if (!component) {
    return false;
  }
  await component.click();
  await delay(300);
  return true;
}

async function unlockIfNeeded(driver: Driver): Promise<void> {
  if (await existsByText(driver, 'Swipe up to unlock') || await existsByText(driver, '向上滑动解锁')) {
    await driver.swipe(360, 1100, 360, 300, 600);
    await delay(1000);
    log('unlocked lock screen');
  }
}

async function dismissDialogs(driver: Driver): Promise<void> {
  const texts: string[] = ['Allow', 'Allow all', 'Always allow', 'While using the app', 'Only this time',
    '允许', '始终允许'];
  for (let round = 0; round < 3; round++) {
    let clicked: boolean = false;
    for (let i = 0; i < texts.length; i++) {
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

async function ensureHome(driver: Driver): Promise<boolean> {
  const tapped: boolean = await tapById(driver, HOME_ID);
  await delay(1600);
  return tapped && await existsById(driver, HOME_ID);
}

async function launchApp(driver: Driver): Promise<boolean> {
  await unlockIfNeeded(driver);
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  for (let i = 0; i < 5; i++) {
    const want: Want = { bundleName: BUNDLE, abilityName: ABILITY };
    await delegator.startAbility(want);
    await delay(1500);
    await dismissDialogs(driver);
    if (await waitForId(driver, HOME_ID, 4)) {
      return true;
    }
    log('launchApp retry ' + i);
  }
  return false;
}

function checkTrue(value: boolean): void {
  hilog.info(DOMAIN, TAG, 'value=%{public}s', String(value));
  expect(value).assertTrue();
}

export default function uiSeq() {
  describe('CertManagerUiSeq', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      checkTrue(await launchApp(driver));
    });

    afterEach(async () => {
      checkTrue(await ensureHome(driver));
    });

    /**
     * @tc.number SUB_CertManager_UISEQ_0001
     * @tc.name testUiSeq0001
     * @tc.desc 按钮操作序列：展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0001 begin');
      const t1: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0001 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0002
     * @tc.name testUiSeq0002
     * @tc.desc 按钮操作序列：展示-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0002 begin');
      const t1: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0002 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0003
     * @tc.name testUiSeq0003
     * @tc.desc 按钮操作序列：签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0003 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0003 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0004
     * @tc.name testUiSeq0004
     * @tc.desc 按钮操作序列：校验-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0004 begin');
      const t1: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0004 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0005
     * @tc.name testUiSeq0005
     * @tc.desc 按钮操作序列：安装-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0005 begin');
      const t1: boolean = await tapById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Install Success', ZH_INSTALL_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsById(driver, HOME_ID);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0005 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0006
     * @tc.name testUiSeq0006
     * @tc.desc 按钮操作序列：改原始-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0006 begin');
      const t1: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0006 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0007
     * @tc.name testUiSeq0007
     * @tc.desc 按钮操作序列：改签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0007 begin');
      const t1: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0007 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0008
     * @tc.name testUiSeq0008
     * @tc.desc 按钮操作序列：改原始-签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0008 begin');
      const t1: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0008 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0009
     * @tc.name testUiSeq0009
     * @tc.desc 按钮操作序列：改签名-签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0009 begin');
      const t1: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0009 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0010
     * @tc.name testUiSeq0010
     * @tc.desc 按钮操作序列：签名-改原始-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0010 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0010 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0011
     * @tc.name testUiSeq0011
     * @tc.desc 按钮操作序列：签名-改签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0011 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, STAIN_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0011 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0012
     * @tc.name testUiSeq0012
     * @tc.desc 按钮操作序列：签名-校验-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0012 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0012 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0013
     * @tc.name testUiSeq0013
     * @tc.desc 按钮操作序列：校验-校验-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0013 begin');
      const t1: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0013 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0014
     * @tc.name testUiSeq0014
     * @tc.desc 按钮操作序列：签名-签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0014 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m5: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0014 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0015
     * @tc.name testUiSeq0015
     * @tc.desc 按钮操作序列：安装-签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0015 begin');
      const t1: boolean = await tapById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Install Success', ZH_INSTALL_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsById(driver, HOME_ID);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0015 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0016
     * @tc.name testUiSeq0016
     * @tc.desc 按钮操作序列：签名-安装-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0016 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await waitForAnyText(driver, ['Install Success', ZH_INSTALL_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await existsById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsById(driver, HOME_ID);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0016 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0017
     * @tc.name testUiSeq0017
     * @tc.desc 按钮操作序列：安装-校验-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0017 begin');
      const t1: boolean = await tapById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Install Success', ZH_INSTALL_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsById(driver, HOME_ID);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0017 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0018
     * @tc.name testUiSeq0018
     * @tc.desc 按钮操作序列：校验-安装-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0018 begin');
      const t1: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Install Success', ZH_INSTALL_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsById(driver, 'installButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsById(driver, HOME_ID);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0018 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0019
     * @tc.name testUiSeq0019
     * @tc.desc 按钮操作序列：改原始-改签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0019 begin');
      const t1: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0019 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0020
     * @tc.name testUiSeq0020
     * @tc.desc 按钮操作序列：改签名-改原始-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0020 begin');
      const t1: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0020 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0021
     * @tc.name testUiSeq0021
     * @tc.desc 按钮操作序列：展示-改原始-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0021 begin');
      const t1: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0021 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0022
     * @tc.name testUiSeq0022
     * @tc.desc 按钮操作序列：展示-改签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0022 begin');
      const t1: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0022 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0023
     * @tc.name testUiSeq0023
     * @tc.desc 按钮操作序列：改原始-校验-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0023 begin');
      const t1: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0023 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0024
     * @tc.name testUiSeq0024
     * @tc.desc 按钮操作序列：改签名-校验-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0024 begin');
      const t1: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const m6: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const t3: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m7: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0024 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0025
     * @tc.name testUiSeq0025
     * @tc.desc 按钮操作序列：签名-改原始-签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0025 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const t4: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t4));
      expect(t4).assertTrue();
      const m8: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      const m11: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m11));
      expect(m11).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0025 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0026
     * @tc.name testUiSeq0026
     * @tc.desc 按钮操作序列：签名-改签名-签名-展示，以展示复位收尾并逐步断言界面状态
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0026 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, STAIN_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const t4: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t4));
      expect(t4).assertTrue();
      const m8: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const m9: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      const m11: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m11));
      expect(m11).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0026 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0027
     * @tc.name testUiSeq0027
     * @tc.desc 改原始-签名-改签名-校验失败-展示复位负路径
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0027 begin');
      const t1: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const m3: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const t2: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m4: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'modifySignatureButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsByText(driver, STAIN_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const t4: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t4));
      expect(t4).assertTrue();
      const m9: boolean = await waitForAnyText(driver, ['Verify Fail', ZH_VERIFY_FAIL], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, STAIN_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      const m11: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m11));
      expect(m11).assertTrue();
      const t5: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t5));
      expect(t5).assertTrue();
      const m12: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m12));
      expect(m12).assertTrue();
      const m13: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m13));
      expect(m13).assertTrue();
      const m14: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m14));
      expect(m14).assertTrue();
      const m15: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m15));
      expect(m15).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0027 end');
    })

    /**
     * @tc.number SUB_CertManager_UISEQ_0028
     * @tc.name testUiSeq0028
     * @tc.desc 签名-改原始-校验失败-展示复位负路径
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUiSeq0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0028 begin');
      const t1: boolean = await tapById(driver, 'signButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t1));
      expect(t1).assertTrue();
      const m1: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m1));
      expect(m1).assertTrue();
      const m2: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m2));
      expect(m2).assertTrue();
      const t2: boolean = await tapById(driver, 'modifyOriginButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t2));
      expect(t2).assertTrue();
      const m3: boolean = await existsByText(driver, STAIN_ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m3));
      expect(m3).assertTrue();
      const m4: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m4));
      expect(m4).assertTrue();
      const m5: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m5));
      expect(m5).assertTrue();
      const t3: boolean = await tapById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t3));
      expect(t3).assertTrue();
      const m6: boolean = await waitForAnyText(driver, ['Verify Fail', ZH_VERIFY_FAIL], 12);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m6));
      expect(m6).assertTrue();
      const m7: boolean = await existsByText(driver, SIGN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m7));
      expect(m7).assertTrue();
      const m8: boolean = await existsById(driver, 'verifyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m8));
      expect(m8).assertTrue();
      const t4: boolean = await tapById(driver, 'dispalyButton');
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(t4));
      expect(t4).assertTrue();
      const m9: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m9));
      expect(m9).assertTrue();
      const m10: boolean = await existsByText(driver, CERT_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m10));
      expect(m10).assertTrue();
      const m11: boolean = await existsByText(driver, ORIGIN_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m11));
      expect(m11).assertTrue();
      const m12: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      hilog.info(DOMAIN, TAG, 'value=%{public}s', String(m12));
      expect(m12).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiSeq0028 end');
    })

  })
}
