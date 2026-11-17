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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.example.userauth';
const ABILITY: string = 'EntryAbility';
const TAG: string = 'UserAuthTest';
const DOMAIN: number = 0xF811;

const TAB_IDS: string[] = [
  'queryCapability', 'exampleTab1', 'exampleTab2', 'exampleTab3', 'exampleTab5',
  'exampleTab4', 'credentialQueries', 'simulationValidation', 'queryAuthLockState', 'userRecognition'
];

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

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

async function startApp(): Promise<Driver> {
  await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
  await sleep(1500);
  return Driver.create();
}

async function openTab(driver: Driver, tabId: string): Promise<boolean> {
  let tab: Component = await driver.findComponent(ON.id(tabId));
  if (!tab) {
    tab = await driver.waitForComponent(ON.id(tabId), 4000);
  }
  if (!tab) {
    log('tab not found: ' + tabId);
    return false;
  }
  await tab.click();
  await sleep(800);
  return true;
}

async function getText(driver: Driver, id: string): Promise<string> {
  const component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    return '';
  }
  return await component.getText();
}

async function clickId(driver: Driver, id: string): Promise<boolean> {
  let component: Component = await driver.findComponent(ON.id(id));
  if (!component) {
    component = await driver.waitForComponent(ON.id(id), 3000);
  }
  if (!component) {
    log('button not found: ' + id);
    return false;
  }
  await component.click();
  return true;
}

async function waitForResult(driver: Driver, id: string): Promise<string> {
  let text: string = await getText(driver, id);
  for (let i = 0; i < 10 && (text === 'wait' || text.length === 0); i++) {
    await sleep(300);
    text = await getText(driver, id);
  }
  return text;
}

async function checkAuthResult(driver: Driver, tabId: string, buttonId: string,
  resultId: string): Promise<void> {
  expect(await openTab(driver, tabId)).assertTrue();
  expect(await clickId(driver, buttonId)).assertTrue();
  const text: string = await waitForResult(driver, resultId);
  log(resultId + ' = ' + text);
  expect(text.length > 0).assertTrue();
  expect(text === 'wait').assertFalse();
}

export default function userAuthTest() {
  describe('UserAuthTest', () => {
    beforeAll(async () => {
      log('beforeAll');
      await startApp();
      await sleep(800);
    });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0100
     * @tc.name      testLaunchAndTabs0001
     * @tc.desc      Launch the app and verify all ten feature tabs exist.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testLaunchAndTabs0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = await startApp();
          for (let i = 0; i < TAB_IDS.length; i++) {
            const found: Component = await driver.findComponent(ON.id(TAB_IDS[i]));
            expect(await found.getId()).assertEqual(TAB_IDS[i]);
          }
        } catch (err) {
          log('testLaunchAndTabs0001 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0200
     * @tc.name      testQueryCapability0002
     * @tc.desc      Query whether FACE ATL3 is supported; result must be Support or Not Support.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testQueryCapability0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openTab(driver, 'queryCapability')).assertTrue();
          expect(await clickId(driver, 'queryCapabilityBtn')).assertTrue();
          await sleep(800);
          const text: string = await getText(driver, 'capabilityResult');
          log('capability = ' + text);
          expect(text).assertContain('Support');
        } catch (err) {
          log('testQueryCapability0002 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0300
     * @tc.name      testExample1Auth0003
     * @tc.desc      Start authentication example 1 and verify a result code is returned.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testExample1Auth0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          await checkAuthResult(driver, 'exampleTab1', 'example1Btn', 'example1Result');
        } catch (err) {
          log('testExample1Auth0003 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0400
     * @tc.name      testExample2Auth0004
     * @tc.desc      Start authentication example 2 (reuse-unlock) and verify a result code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testExample2Auth0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          await checkAuthResult(driver, 'exampleTab1', 'example2Btn', 'example2Result');
        } catch (err) {
          log('testExample2Auth0004 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0500
     * @tc.name      testExample3Auth0005
     * @tc.desc      Start authentication example 3 (app-irrelevant reuse) and verify a result code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testExample3Auth0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          await checkAuthResult(driver, 'exampleTab2', 'example3Btn', 'example3Result');
        } catch (err) {
          log('testExample3Auth0005 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0600
     * @tc.name      testExample4Auth0006
     * @tc.desc      Start authentication example 4 (model-app mode) and verify a result code.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testExample4Auth0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          await checkAuthResult(driver, 'exampleTab2', 'example4Btn', 'example4Result');
        } catch (err) {
          log('testExample4Auth0006 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0700
     * @tc.name      testCancelAuth0007
     * @tc.desc      Start authentication then cancel it; verify a result code is returned.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCancelAuth0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          await checkAuthResult(driver, 'exampleTab3', 'cancelAuthBtn', 'cancelResult');
        } catch (err) {
          log('testCancelAuth0007 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0800
     * @tc.name      testPerceiveAdjust0008
     * @tc.desc      Start the perceive/adjust flow, wait for its cancel timer, verify no crash.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testPerceiveAdjust0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openTab(driver, 'exampleTab5')).assertTrue();
          expect(await clickId(driver, 'perceiveAdjustBtn')).assertTrue();
          await sleep(3800);
          const button: Component = await driver.findComponent(ON.id('perceiveAdjustBtn'));
          expect(await button.getId()).assertEqual('perceiveAdjustBtn');
          const result: string = await getText(driver, 'perceiveResult');
          log('perceive result = ' + result);
        } catch (err) {
          log('testPerceiveAdjust0008 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_0900
     * @tc.name      testCustomAuth0009
     * @tc.desc      Start custom authentication and verify a result code is returned.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCustomAuth0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          await checkAuthResult(driver, 'exampleTab4', 'customAuthBtn', 'customResult');
        } catch (err) {
          log('testCustomAuth0009 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_1000
     * @tc.name      testCredentialQuery0010
     * @tc.desc      Query enrolled credential digest; verify a non-empty result (digest or Error).
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testCredentialQuery0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openTab(driver, 'credentialQueries')).assertTrue();
          expect(await clickId(driver, 'queryCredentialBtn')).assertTrue();
          await sleep(800);
          const text: string = await getText(driver, 'credentialResult');
          log('credential = ' + text);
          expect(text.length > 0).assertTrue();
        } catch (err) {
          log('testCredentialQuery0010 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_1100
     * @tc.name      testSimulationValidation0011
     * @tc.desc      Refresh support state and credential value in the simulation-validation page.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSimulationValidation0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openTab(driver, 'simulationValidation')).assertTrue();
          expect(await clickId(driver, 'refreshSupportBtn')).assertTrue();
          await sleep(800);
          const supportText: string = await getText(driver, 'supportResult');
          log('support = ' + supportText);
          expect(supportText.length > 0).assertTrue();
          expect(await clickId(driver, 'refreshCredentialBtn')).assertTrue();
          await sleep(800);
          const credentialText: string = await getText(driver, 'credentialValueResult');
          log('credential value = ' + credentialText);
          const button: Component = await driver.findComponent(ON.id('refreshCredentialBtn'));
          expect(await button.getId()).assertEqual('refreshCredentialBtn');
        } catch (err) {
          log('testSimulationValidation0011 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_1200
     * @tc.name      testLockState0012
     * @tc.desc      Query the PIN authentication lock state; verify a JSON or error message.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testLockState0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openTab(driver, 'queryAuthLockState')).assertTrue();
          expect(await clickId(driver, 'queryLockStateBtn')).assertTrue();
          await sleep(1200);
          const text: string = await getText(driver, 'lockStateResult');
          log('lock state = ' + text);
          expect(text.length > 0).assertTrue();
        } catch (err) {
          log('testLockState0012 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_1300
     * @tc.name      testRecognition0013
     * @tc.desc      Query user recognition; API 26 removed the API, verify the explicit message.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testRecognition0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openTab(driver, 'userRecognition')).assertTrue();
          expect(await clickId(driver, 'queryRecognitionBtn')).assertTrue();
          await sleep(600);
          const text: string = await getText(driver, 'recognitionResult');
          log('recognition = ' + text);
          expect(text).assertContain('not supported by current SDK (API 26)');
        } catch (err) {
          log('testRecognition0013 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_1400
     * @tc.name      testTabNavigation0014
     * @tc.desc      Switch through the first five tabs and verify each page's primary button.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testTabNavigation0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          const checks: string[][] = [
            ['queryCapability', 'queryCapabilityBtn'],
            ['exampleTab1', 'example1Btn'],
            ['exampleTab2', 'example3Btn'],
            ['exampleTab3', 'cancelAuthBtn'],
            ['exampleTab5', 'perceiveAdjustBtn']
          ];
          for (let i = 0; i < checks.length; i++) {
            expect(await openTab(driver, checks[i][0])).assertTrue();
            const btn: Component = await driver.findComponent(ON.id(checks[i][1]));
            expect(await btn.getId()).assertEqual(checks[i][1]);
          }
        } catch (err) {
          log('testTabNavigation0014 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_USER_AUTH_UI_1500
     * @tc.name      testTabNavigation0015
     * @tc.desc      Switch through the last five tabs and verify each page's primary button.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testTabNavigation0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          const checks: string[][] = [
            ['exampleTab4', 'customAuthBtn'],
            ['credentialQueries', 'queryCredentialBtn'],
            ['simulationValidation', 'refreshSupportBtn'],
            ['queryAuthLockState', 'queryLockStateBtn'],
            ['userRecognition', 'queryRecognitionBtn']
          ];
          for (let i = 0; i < checks.length; i++) {
            expect(await openTab(driver, checks[i][0])).assertTrue();
            const btn: Component = await driver.findComponent(ON.id(checks[i][1]));
            expect(await btn.getId()).assertEqual(checks[i][1]);
          }
        } catch (err) {
          log('testTabNavigation0015 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });
    /**
     * @tc.number    SUB_USER_AUTH_UI_1600
     * @tc.name      testSimulationLoginEntries0016
     * @tc.desc      Click the custom-login and simple-login entries and verify the page state survives both attempts.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testSimulationLoginEntries0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const driver: Driver = Driver.create();
          expect(await openTab(driver, 'simulationValidation')).assertTrue();
          const custom: Component = await driver.waitForComponent(ON.id('customLoginBtn'), 3000);
          expect(await custom.getId()).assertEqual('customLoginBtn');
          const simple: Component = await driver.waitForComponent(ON.id('simpleLoginBtn'), 3000);
          expect(await simple.getId()).assertEqual('simpleLoginBtn');
          expect(await clickId(driver, 'refreshSupportBtn')).assertTrue();
          const before: string = await getText(driver, 'supportResult');
          expect(before.length > 0).assertTrue();
          await custom.click();
          await sleep(1500);
          await simple.click();
          await sleep(1500);
          const after: string = await getText(driver, 'supportResult');
          expect(after).assertEqual(before);
        } catch (err) {
          log('testSimulationLoginEntries0016 failed: ' + String(err));
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
