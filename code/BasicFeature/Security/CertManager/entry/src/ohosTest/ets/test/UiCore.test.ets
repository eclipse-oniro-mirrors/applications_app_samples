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

// UI 层主题：迁移旧 Ability.test.ets 的 10 条主流程并新增 10 条界面状态用例。
// 只用语义 id（ON.id）与文案（ON.text）定位；期望值来源：string.json 规格文案
// 与冻结基线（证书尾串 AgIIAA==、篡改签名尾串 RxHxRAA=、计数器 4020/72/82/344/172/0）。
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
const STAIN_SIG_FRAGMENT: string = 'RxHxRAA=';
const CERT_COUNTER: string = '4020/100';
const ORIGIN_COUNTER: string = '72/100';
const STAIN_ORIGIN_COUNTER: string = '82/100';
const SIGN_COUNTER: string = '344/100';
const EMPTY_SIG_COUNTER: string = '0/100';
const ZH_TITLE: string = '证书管理';
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

// findComponent 找不到时返回 null 而不抛错；存在性判断必须走 assertComponentExist。
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

async function waitForTextContains(driver: Driver, text: string, attempts: number): Promise<boolean> {
  for (let i = 0; i < attempts; i++) {
    if (await existsByTextContains(driver, text)) {
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

async function existsByAnyTextContains(driver: Driver, texts: string[]): Promise<boolean> {
  for (let i = 0; i < texts.length; i++) {
    if (await existsByTextContains(driver, texts[i])) {
      return true;
    }
  }
  return false;
}

async function findById(driver: Driver, id: string): Promise<Component | null> {
  if (!await waitForId(driver, id, 10)) {
    return null;
  }
  return await driver.findComponent(ON.id(id));
}

// 有副作用的操作只在这里执行一次，调用方把返回值存 const 后再喂给日志和断言。
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

// 每例结尾点展示按钮复位模型状态（证书 4020 / 原始 72 / 签名清空），并留足 toast 消散时间。
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

// 一条断言一处求值：先 log actual/expected 再 assert，失败时日志可直接定位。
function checkTrue(value: boolean): void {
  hilog.info(DOMAIN, TAG, 'value=%{public}s', String(value));
  expect(value).assertTrue();
}

export default function uiCore() {
  describe('CertManagerUi', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = Driver.create();
      checkTrue(await launchApp(driver));
    });

    afterEach(async () => {
      checkTrue(await ensureHome(driver));
    });

    /**
     * @tc.number SUB_CertManager_UI_1001
     * @tc.name testUi1001
     * @tc.desc 拉起应用后首页展示按钮与签名按钮可见
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1001 begin');
      const started: boolean = await launchApp(driver);
      expect(started).assertTrue();
      const homeOk: boolean = await existsById(driver, HOME_ID);
      expect(homeOk).assertTrue();
      const signOk: boolean = await existsById(driver, 'signButton');
      expect(signOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1001 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1002
     * @tc.name testUi1002
     * @tc.desc 点击安装证书按钮弹出安装成功提示，按钮保持可见
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1002 begin');
      const tapped: boolean = await tapById(driver, 'installButton');
      expect(tapped).assertTrue();
      const toast: boolean = await waitForAnyText(driver, ['Install Success', ZH_INSTALL_SUCCESS], 12);
      expect(toast).assertTrue();
      const installOk: boolean = await existsById(driver, 'installButton');
      expect(installOk).assertTrue();
      const homeOk: boolean = await existsById(driver, HOME_ID);
      expect(homeOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1002 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1003
     * @tc.name testUi1003
     * @tc.desc 点击数据展示后显示证书、原始数据与证书计数器 4020/100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1003 begin');
      const tapped: boolean = await tapById(driver, HOME_ID);
      expect(tapped).assertTrue();
      const certShown: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      expect(certShown).assertTrue();
      const originShown: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      expect(originShown).assertTrue();
      const counter: boolean = await existsByText(driver, CERT_COUNTER);
      expect(counter).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1003 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1004
     * @tc.name testUi1004
     * @tc.desc 点击签名按钮弹出签名成功提示，签名计数器为 344/100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1004 begin');
      const tapped: boolean = await tapById(driver, 'signButton');
      expect(tapped).assertTrue();
      const toast: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      expect(toast).assertTrue();
      const counter: boolean = await existsByText(driver, SIGN_COUNTER);
      expect(counter).assertTrue();
      const signOk: boolean = await existsById(driver, 'signButton');
      expect(signOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1004 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1005
     * @tc.name testUi1005
     * @tc.desc 点击校验按钮自动签名后弹出校验成功提示，签名计数器为 344/100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1005 begin');
      const tapped: boolean = await tapById(driver, 'verifyButton');
      expect(tapped).assertTrue();
      const toast: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      expect(toast).assertTrue();
      const counter: boolean = await existsByText(driver, SIGN_COUNTER);
      expect(counter).assertTrue();
      const verifyOk: boolean = await existsById(driver, 'verifyButton');
      expect(verifyOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1005 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1006
     * @tc.name testUi1006
     * @tc.desc 签名后修改原始数据，界面显示篡改文本且不再包含规格文本
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1006 begin');
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const modified: boolean = await tapById(driver, 'modifyOriginButton');
      expect(modified).assertTrue();
      const stained: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      expect(stained).assertTrue();
      const pristineGone: boolean = await existsByTextContains(driver, 'Central Garden');
      expect(pristineGone).assertFalse();
      const certShown: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      expect(certShown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1006 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1007
     * @tc.name testUi1007
     * @tc.desc 签名后修改签名数据，界面显示篡改签名尾串且原始数据保持规格值
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1007 begin');
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const modified: boolean = await tapById(driver, 'modifySignatureButton');
      expect(modified).assertTrue();
      const stainSig: boolean = await waitForTextContains(driver, STAIN_SIG_FRAGMENT, 8);
      expect(stainSig).assertTrue();
      const pristineOrigin: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      expect(pristineOrigin).assertTrue();
      const certShown: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      expect(certShown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1007 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1008
     * @tc.name testUi1008
     * @tc.desc 恢复初始数据-签名-改原始数据-再校验，弹出校验失败提示
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1008 begin');
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const modified: boolean = await tapById(driver, 'modifyOriginButton');
      expect(modified).assertTrue();
      const verified: boolean = await tapById(driver, 'verifyButton');
      expect(verified).assertTrue();
      const toast: boolean = await waitForAnyText(driver, ['Verify Fail', ZH_VERIFY_FAIL], 12);
      expect(toast).assertTrue();
      const stained: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      expect(stained).assertTrue();
      const verifyOk: boolean = await existsById(driver, 'verifyButton');
      expect(verifyOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1008 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1009
     * @tc.name testUi1009
     * @tc.desc 恢复初始数据-签名-改签名数据-再校验，弹出校验失败提示
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1009 begin');
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const modified: boolean = await tapById(driver, 'modifySignatureButton');
      expect(modified).assertTrue();
      const verified: boolean = await tapById(driver, 'verifyButton');
      expect(verified).assertTrue();
      const toast: boolean = await waitForAnyText(driver, ['Verify Fail', ZH_VERIFY_FAIL], 12);
      expect(toast).assertTrue();
      const stainSig: boolean = await waitForTextContains(driver, STAIN_SIG_FRAGMENT, 8);
      expect(stainSig).assertTrue();
      const pristineOrigin: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      expect(pristineOrigin).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1009 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1010
     * @tc.name testUi1010
     * @tc.desc 恢复正确数据后校验，弹出校验成功提示且证书数据展示正常
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1010 begin');
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const verified: boolean = await tapById(driver, 'verifyButton');
      expect(verified).assertTrue();
      const toast: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      expect(toast).assertTrue();
      const certShown: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      expect(certShown).assertTrue();
      const verifyOk: boolean = await existsById(driver, 'verifyButton');
      expect(verifyOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1010 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1011
     * @tc.name testUi1011
     * @tc.desc 首页六个语义按钮全部可见，标题为 Certificate Manager
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level1
     */
    it('testUi1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1011 begin');
      const homeShown: boolean = await existsById(driver, HOME_ID);
      const signShown: boolean = await existsById(driver, 'signButton');
      const topRow: boolean = homeShown && signShown;
      expect(topRow).assertTrue();
      const installShown: boolean = await existsById(driver, 'installButton');
      const verifyShown: boolean = await existsById(driver, 'verifyButton');
      const actionRow: boolean = installShown && verifyShown;
      expect(actionRow).assertTrue();
      const originModShown: boolean = await existsById(driver, 'modifyOriginButton');
      const sigModShown: boolean = await existsById(driver, 'modifySignatureButton');
      const modifyRow: boolean = originModShown && sigModShown;
      expect(modifyRow).assertTrue();
      const title: boolean = await existsByAnyTextContains(driver, ['Certificate Manager', ZH_TITLE]);
      expect(title).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1011 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1012
     * @tc.name testUi1012
     * @tc.desc 展示后原始数据计数 72/100，改原始数据后变 82/100 且证书计数不变
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1012 begin');
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const pristine: boolean = await existsByText(driver, ORIGIN_COUNTER);
      expect(pristine).assertTrue();
      const modified: boolean = await tapById(driver, 'modifyOriginButton');
      expect(modified).assertTrue();
      const stained: boolean = await waitForText(driver, STAIN_ORIGIN_COUNTER, 8);
      expect(stained).assertTrue();
      const certKept: boolean = await existsByText(driver, CERT_COUNTER);
      expect(certKept).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1012 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1013
     * @tc.name testUi1013
     * @tc.desc 连续两次展示数据，证书计数 4020/100 与原始计数 72/100 保持稳定
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1013 begin');
      const first: boolean = await tapById(driver, HOME_ID);
      expect(first).assertTrue();
      const second: boolean = await tapById(driver, HOME_ID);
      expect(second).assertTrue();
      const certCounter: boolean = await existsByText(driver, CERT_COUNTER);
      expect(certCounter).assertTrue();
      const originCounter: boolean = await existsByText(driver, ORIGIN_COUNTER);
      expect(originCounter).assertTrue();
      const certShown: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      expect(certShown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1013 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1014
     * @tc.name testUi1014
     * @tc.desc 签名后改原始数据，签名计数保持 344/100、原始计数变 82/100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1014 begin');
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const modified: boolean = await tapById(driver, 'modifyOriginButton');
      expect(modified).assertTrue();
      const sigKept: boolean = await existsByText(driver, SIGN_COUNTER);
      expect(sigKept).assertTrue();
      const stained: boolean = await waitForText(driver, STAIN_ORIGIN_COUNTER, 8);
      expect(stained).assertTrue();
      const stainedText: boolean = await waitForTextContains(driver, STAIN_ORIGIN_FRAGMENT, 8);
      expect(stainedText).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1014 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1015
     * @tc.name testUi1015
     * @tc.desc 签名后再安装证书，安装成功提示弹出且签名计数保持 344/100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1015 begin');
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const installed: boolean = await tapById(driver, 'installButton');
      expect(installed).assertTrue();
      const toast: boolean = await waitForAnyText(driver, ['Install Success', ZH_INSTALL_SUCCESS], 12);
      expect(toast).assertTrue();
      const sigKept: boolean = await existsByText(driver, SIGN_COUNTER);
      expect(sigKept).assertTrue();
      const installOk: boolean = await existsById(driver, 'installButton');
      expect(installOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1015 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1016
     * @tc.name testUi1016
     * @tc.desc 签名-改原始-展示后，数据复位为规格值且签名计数 0/100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1016 begin');
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const modified: boolean = await tapById(driver, 'modifyOriginButton');
      expect(modified).assertTrue();
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const pristineOrigin: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      expect(pristineOrigin).assertTrue();
      const certShown: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      expect(certShown).assertTrue();
      const sigCleared: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      expect(sigCleared).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1016 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1017
     * @tc.name testUi1017
     * @tc.desc 全流程操作后六个按钮仍可见，展示按钮仍可复位数据
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1017 begin');
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const modified: boolean = await tapById(driver, 'modifyOriginButton');
      expect(modified).assertTrue();
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const homeShown: boolean = await existsById(driver, HOME_ID);
      const signShown: boolean = await existsById(driver, 'signButton');
      const topRow: boolean = homeShown && signShown;
      expect(topRow).assertTrue();
      const installShown: boolean = await existsById(driver, 'installButton');
      const verifyShown: boolean = await existsById(driver, 'verifyButton');
      const actionRow: boolean = installShown && verifyShown;
      expect(actionRow).assertTrue();
      const originModShown: boolean = await existsById(driver, 'modifyOriginButton');
      const sigModShown: boolean = await existsById(driver, 'modifySignatureButton');
      const modifyRow: boolean = originModShown && sigModShown;
      expect(modifyRow).assertTrue();
      const certShown: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      expect(certShown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1017 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1018
     * @tc.name testUi1018
     * @tc.desc 签名-改签名-校验失败后，展示复位再校验成功，两轮提示先后弹出
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1018 begin');
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const modified: boolean = await tapById(driver, 'modifySignatureButton');
      expect(modified).assertTrue();
      const failVerify: boolean = await tapById(driver, 'verifyButton');
      expect(failVerify).assertTrue();
      const failToast: boolean = await waitForAnyText(driver, ['Verify Fail', ZH_VERIFY_FAIL], 12);
      expect(failToast).assertTrue();
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const passVerify: boolean = await tapById(driver, 'verifyButton');
      expect(passVerify).assertTrue();
      const passToast: boolean = await waitForAnyText(driver, ['Verify Success', ZH_VERIFY_SUCCESS], 12);
      expect(passToast).assertTrue();
      const verifyOk: boolean = await existsById(driver, 'verifyButton');
      expect(verifyOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1018 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1019
     * @tc.name testUi1019
     * @tc.desc 校验自动签名后再签名，签名成功提示弹出且计数 344/100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1019 begin');
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const verified: boolean = await tapById(driver, 'verifyButton');
      expect(verified).assertTrue();
      const signed: boolean = await tapById(driver, 'signButton');
      expect(signed).assertTrue();
      const toast: boolean = await waitForAnyText(driver, ['Sign Success', ZH_SIGN_SUCCESS], 12);
      expect(toast).assertTrue();
      const counter: boolean = await existsByText(driver, SIGN_COUNTER);
      expect(counter).assertTrue();
      const signOk: boolean = await existsById(driver, 'signButton');
      expect(signOk).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1019 end');
    });

    /**
     * @tc.number SUB_CertManager_UI_1020
     * @tc.name testUi1020
     * @tc.desc 双重篡改后展示复位，原始数据为规格值、签名计数 0/100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level2
     */
    it('testUi1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1020 begin');
      const originTapped: boolean = await tapById(driver, 'modifyOriginButton');
      expect(originTapped).assertTrue();
      const sigTapped: boolean = await tapById(driver, 'modifySignatureButton');
      expect(sigTapped).assertTrue();
      const displayed: boolean = await tapById(driver, HOME_ID);
      expect(displayed).assertTrue();
      const pristineOrigin: boolean = await waitForTextContains(driver, ORIGIN_FRAGMENT, 8);
      expect(pristineOrigin).assertTrue();
      const sigCleared: boolean = await existsByText(driver, EMPTY_SIG_COUNTER);
      expect(sigCleared).assertTrue();
      const certShown: boolean = await waitForTextContains(driver, CERT_FRAGMENT, 8);
      expect(certShown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUi1020 end');
    });
  });
}
