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
import { afterEach, beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.socket';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'LoginUiStateTest';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return component !== undefined && component !== null;
  } catch (error) {
    log('exists failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function clickId(driver: Driver, id: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return false;
    }
    await component.click();
    await sleep(350);
    return true;
  } catch (error) {
    log('clickId failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function inputTextById(driver: Driver, id: string, text: string): Promise<boolean> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    await component.inputText(text);
    await sleep(350);
    return true;
  } catch (error) {
    log('inputTextById failed: ' + id + ' -> ' + String(error));
    return false;
  }
}

async function getTextById(driver: Driver, id: string): Promise<string> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    return await component.getText();
  } catch (error) {
    log('getTextById failed: ' + id + ' -> ' + String(error));
    return '';
  }
}

async function ensureLoginPage(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, 'localIpText')) {
      return true;
    }
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(1200);
  }
  return await exists(driver, 'localIpText');
}

async function prepare(driver: Driver): Promise<boolean> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1200);
  if (!await ensureLoginPage(driver)) {
    log('prepare: login page is not available');
    return false;
  }
  return true;
}

export default function loginUiStateTest(): void {
  describe('SocketLoginUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      // Login is a single page; re-launch keeps the page in place between cases.
      const actual1: boolean = await ensureLoginPage(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensureLoginPage(driver)=${actual1}`);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0601
     * @tc.name      testLoginUi0601
     * @tc.desc      Verify the login page exposes the ip card components.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0601 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, 'localIpText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'localIpText')=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, 'TextInput1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'TextInput1')=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: boolean = await exists(driver, 'confirmIpButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'confirmIpButton')=${actual5}`);
      expect(actual5).assertTrue();
      log('testLoginUi0601 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0602
     * @tc.name      testLoginUi0602
     * @tc.desc      Verify the login page shows the title bar text.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0602 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const actual7: boolean = await exists(driver, 'loginTitleText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'loginTitleText')=${actual7}`);
      expect(actual7).assertTrue();
      log('testLoginUi0602 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0603
     * @tc.name      testLoginUi0603
     * @tc.desc      Verify the local ip label starts with the expected prefix.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0603 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const label: string = await getTextById(driver, 'localIpText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue label.startsWith('本地IP：')=${label.startsWith('本地IP：')}`);
      expect(label.startsWith('本地IP：')).assertTrue();
      log('testLoginUi0603 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0604
     * @tc.name      testLoginUi0604
     * @tc.desc      Verify the user row shows the default empty user label.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0604 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const label: string = await getTextById(driver, 'userSelectorText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue label.startsWith('用户：')=${label.startsWith('用户：')}`);
      expect(label.startsWith('用户：')).assertTrue();
      log('testLoginUi0604 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0605
     * @tc.name      testLoginUi0605
     * @tc.desc      Verify typing an ipv4 address reads back unchanged.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0605 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const actual11: boolean = await inputTextById(driver, 'TextInput1', '192.168.1.100');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual11}`);
      expect(actual11).assertTrue();
      const value: string = await getTextById(driver, 'TextInput1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='192.168.1.100'`);
      expect(value).assertEqual('192.168.1.100');
      log('testLoginUi0605 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0606
     * @tc.name      testLoginUi0606
     * @tc.desc      Verify typing a Chinese placeholder text reads back unchanged.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0606 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const actual13: boolean = await inputTextById(driver, 'TextInput1', '你好');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inputTextById(driver, 'TextInput1', '你好')=${actual13}`);
      expect(actual13).assertTrue();
      const value: string = await getTextById(driver, 'TextInput1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected='你好'`);
      expect(value).assertEqual('你好');
      log('testLoginUi0606 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0607
     * @tc.name      testLoginUi0607
     * @tc.desc      Verify clearing the input leaves an empty text field.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0607 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const actual15: boolean = await inputTextById(driver, 'TextInput1', 'temp');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inputTextById(driver, 'TextInput1', 'temp')=${actual15}`);
      expect(actual15).assertTrue();
      const actual16: boolean = await inputTextById(driver, 'TextInput1', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inputTextById(driver, 'TextInput1', '')=${actual16}`);
      expect(actual16).assertTrue();
      const value: string = await getTextById(driver, 'TextInput1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=''`);
      expect(value).assertEqual('');
      log('testLoginUi0607 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0608
     * @tc.name      testLoginUi0608
     * @tc.desc      Verify a repeated ability launch keeps the page usable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0608 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual17}`);
      expect(actual17).assertTrue();
      await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      await sleep(1200);
      const actual18: boolean = await exists(driver, 'localIpText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'localIpText')=${actual18}`);
      expect(actual18).assertTrue();
      const actual19: boolean = await exists(driver, 'TextInput1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'TextInput1')=${actual19}`);
      expect(actual19).assertTrue();
      log('testLoginUi0608 end');
    })

    /**
     * @tc.number    SUB_SOCKET_LOGINUI_0609
     * @tc.name      testLoginUi0609
     * @tc.desc      Verify confirming without a user shows the user warning.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testLoginUi0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testLoginUi0609 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await prepare(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue prepare(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const actual21: boolean = await inputTextById(driver, 'TextInput1', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue inputTextById(driver, 'TextInput1', '')=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await clickId(driver, 'confirmIpButton');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue clickId(driver, 'confirmIpButton')=${actual22}`);
      expect(actual22).assertTrue();
      await sleep(500);
      const actual23: boolean = await exists(driver, 'warnText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, 'warnText')=${actual23}`);
      expect(actual23).assertTrue();
      const warn: string = await getTextById(driver, 'warnText');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual warn=${warn}, expected='请先选择用户'`);
      expect(warn).assertEqual('请先选择用户');
      log('testLoginUi0609 end');
    })

  })
}
