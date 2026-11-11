/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, Size, Level, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { bundleManager, UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = 'CommonProblemOfApplication01Test';
const BUNDLE_FLAGS: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
const INITIAL_TEXT: string = 'Hello World';
const CLICKED_TEXT: string = 'Welcome';
const NOT_EXIST_BUNDLE: string = 'ohos.app.hap.notexist';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;

const sleep = (time: number): Promise<void> => new Promise<void>((resolve: Function) => setTimeout(resolve, time));

export default function CommonProblem01Test() {
  describe('CommonProblem01Test', () => {
        /**
     * @tc.number    SUB_ABILITY_TEST_0100
     * @tc.name      testCommonProblemOfApplication01Chapter0001
     * @tc.desc      Verify testCommonProblemOfApplication01Chapter0100
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCommonProblemOfApplication01Chapter0001', 0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0100 begin');
        const want: Want = {
          bundleName: bundleName,
          abilityName: 'EntryAbility'
        };
        await delegator.startAbility(want);
        await sleep(1000);
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        const topAbilityName: string = ability.context.abilityInfo.name;
        hilog.info(DOMAIN, TAG, `top ability name: ${topAbilityName}`);
        expect(topAbilityName).assertEqual('EntryAbility');
        done();
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0100 end');
      })

        /**
     * @tc.number    SUB_ABILITY_TEST_0200
     * @tc.name      testCommonProblemOfApplication01Chapter0002
     * @tc.desc      Verify testCommonProblemOfApplication01Chapter0200
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCommonProblemOfApplication01Chapter0002', 0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0200 begin');
        const driver: Driver = Driver.create();
        await driver.delayMs(1000);
        const helloWorld: Component = await driver.findComponent(ON.id('HelloWorld'));
        const helloWorldText: string = await helloWorld.getText();
        hilog.info(DOMAIN, TAG, `HelloWorld text: ${helloWorldText}`);
        expect(helloWorldText).assertEqual(INITIAL_TEXT);
        const getAppIdText: Component = await driver.findComponent(ON.id('GetAppIdHelloWorld'));
        const appIdText: string = await getAppIdText.getText();
        hilog.info(DOMAIN, TAG, `GetAppIdHelloWorld text: ${appIdText}`);
        expect(appIdText).assertEqual(INITIAL_TEXT);
        const getAppIdentifierText: Component = await driver.findComponent(ON.id('GetAppIdentifierHelloWorld'));
        const appIdentifierText: string = await getAppIdentifierText.getText();
        hilog.info(DOMAIN, TAG, `GetAppIdentifierHelloWorld text: ${appIdentifierText}`);
        expect(appIdentifierText).assertEqual(INITIAL_TEXT);
        const getFingerprintText: Component = await driver.findComponent(ON.id('GetFingerprintHelloWorld'));
        const fingerprintText: string = await getFingerprintText.getText();
        hilog.info(DOMAIN, TAG, `GetFingerprintHelloWorld text: ${fingerprintText}`);
        expect(fingerprintText).assertEqual(INITIAL_TEXT);
        done();
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0200 end');
      })

        /**
     * @tc.number    SUB_ABILITY_TEST_0300
     * @tc.name      testCommonProblemOfApplication01Chapter0003
     * @tc.desc      Verify testCommonProblemOfApplication01Chapter0300
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCommonProblemOfApplication01Chapter0003', 0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0300 begin');
        const driver: Driver = Driver.create();
        await driver.delayMs(1000);
        const targetText: Component = await driver.findComponent(ON.id('GetFingerprintHelloWorld'));
        await targetText.click();
        await driver.delayMs(1000);
        const changedText: Component = await driver.findComponent(ON.id('GetFingerprintHelloWorld'));
        const content: string = await changedText.getText();
        hilog.info(DOMAIN, TAG, `GetFingerprintHelloWorld text after click: ${content}`);
        expect(content).assertEqual(CLICKED_TEXT);
        done();
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0300 end');
      })

        /**
     * @tc.number    SUB_ABILITY_TEST_0400
     * @tc.name      testCommonProblemOfApplication01Chapter0004
     * @tc.desc      Verify testCommonProblemOfApplication01Chapter0400
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCommonProblemOfApplication01Chapter0004', 0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0400 begin');
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(BUNDLE_FLAGS);
        const appId: string = bundleInfo.signatureInfo.appId;
        hilog.info(DOMAIN, TAG, `appId: ${appId}`);
        expect(appId).assertContain(bundleName);
        done();
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0400 end');
      })

        /**
     * @tc.number    SUB_ABILITY_TEST_0500
     * @tc.name      testCommonProblemOfApplication01Chapter0005
     * @tc.desc      Verify testCommonProblemOfApplication01Chapter0500
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCommonProblemOfApplication01Chapter0005', 0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0500 begin');
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(BUNDLE_FLAGS);
        const appIdentifier: string = bundleInfo.signatureInfo.appIdentifier;
        hilog.info(DOMAIN, TAG, `appIdentifier: ${appIdentifier}, type: ${typeof appIdentifier}`);
        expect(typeof appIdentifier).assertEqual('string');
        done();
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0500 end');
      })

        /**
     * @tc.number    SUB_ABILITY_TEST_0600
     * @tc.name      testCommonProblemOfApplication01Chapter0006
     * @tc.desc      Verify testCommonProblemOfApplication01Chapter0600
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCommonProblemOfApplication01Chapter0006', 0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0600 begin');
        const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(BUNDLE_FLAGS);
        const fingerprint: string = bundleInfo.signatureInfo.fingerprint;
        hilog.info(DOMAIN, TAG, `fingerprint: ${fingerprint}`);
        expect(fingerprint.length > 0).assertTrue();
        done();
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0600 end');
      })

        /**
     * @tc.number    SUB_ABILITY_TEST_0700
     * @tc.name      testCommonProblemOfApplication01Chapter0007
     * @tc.desc      Verify testCommonProblemOfApplication01Chapter0700
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCommonProblemOfApplication01Chapter0007', 0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0700 begin');
        try {
          const bundleInfo: bundleManager.BundleInfo =
            await bundleManager.getBundleInfo(NOT_EXIST_BUNDLE, BUNDLE_FLAGS);
          hilog.info(DOMAIN, TAG, `unexpected bundle name: ${bundleInfo.name}`);
          expect(bundleInfo.name).assertEqual(NOT_EXIST_BUNDLE);
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, `getBundleInfo error code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
        }
        done();
        hilog.info(DOMAIN, TAG, 'testCommonProblemOfApplication01Chapter0700 end');
      })
  })
}
