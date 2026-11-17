/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Component, Driver, ON } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import Logger from '../logger/Logger';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

const TAG = 'ActsAbilityTest';
const DELAY_TIME = 500;
// Unicode escape of the page title text displayed by the sample
const TITLE_TEXT = '\u52a8\u6001\u5206\u4eab\u5305';
const ADD_RESULT = 'result: 3';
const NATIVE_RESULT = 'result: 12';
const MENU_PAGE_TEXT = 'HSP menu page';

let delegator = abilityDelegatorRegistry.getAbilityDelegator();
let resourceManager = delegator.getAppContext().resourceManager;
let driver = Driver.create();

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      await driver.delayMs(DELAY_TIME);
      try {
        await delegator.startAbility({
          bundleName: 'com.samples.hspsample',
          abilityName: 'EntryAbility'
        });
      } catch (err) {
        Logger.info(TAG, 'StartAbility err:' + JSON.stringify(err));
        expect(false).assertFail();
      }
      await driver.delayMs(DELAY_TIME);
    })

    afterAll(async () => {
    })

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ABILITY_0100
     * @tc.name      testHspAbility0001
     * @tc.desc Verify that the page title text exported by HSP is displayed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('testHspAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspAbility0001');
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0100 start');
        let title: Component = await driver.findComponent(ON.text(TITLE_TEXT));
        expect(title !== null).assertTrue();
        expect(await title.getText()).assertEqual(TITLE_TEXT);
        expect(TITLE_TEXT.length > 0).assertTrue();
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0100 end');
        done();
      })

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ABILITY_0200
     * @tc.name      testHspAbility0002
     * @tc.desc Verify that the ts class and method exported by HSP returns the expected computing result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('testHspAbility0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspAbility0002');
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0200 start');
        let button: Component = await driver.findComponent(ON.id('add'));
        expect(button !== null).assertTrue();
        await button.click();
        await driver.delayMs(DELAY_TIME);
        let result: Component = await driver.findComponent(ON.text(ADD_RESULT));
        expect(result !== null).assertTrue();
        expect(await result.getText()).assertEqual(ADD_RESULT);
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0200 end');
        done();
      })

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ABILITY_0300
     * @tc.name      testHspAbility0003
     * @tc.desc Verify that the native method exported by HSP returns the expected computing result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('testHspAbility0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspAbility0003');
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0300 start');
        let button: Component = await driver.findComponent(ON.id('nativeMulti'));
        expect(button !== null).assertTrue();
        await button.click();
        await driver.delayMs(DELAY_TIME);
        let result: Component = await driver.findComponent(ON.text(NATIVE_RESULT));
        expect(result !== null).assertTrue();
        expect(await result.getText()).assertEqual(NATIVE_RESULT);
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0300 end');
        done();
      })

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ABILITY_0400
     * @tc.name      testHspAbility0004
     * @tc.desc Verify that routing to the index page of HSP displays the expected page element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('testHspAbility0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspAbility0004');
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0400 start');
        let button: Component = await driver.findComponent(ON.id('clickToIndex'));
        await button.click();
        await driver.delayMs(DELAY_TIME);
        let pageElement: Component = await driver.findComponent(ON.id('example'));
        expect(pageElement !== null).assertTrue();
        expect(await pageElement.getId()).assertEqual('example');
        await driver.pressBack();
        await driver.delayMs(DELAY_TIME);
        expect(await driver.findComponent(ON.id('add')) !== null).assertTrue();
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0400 end');
        done();
      })

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ABILITY_0500
     * @tc.name      testHspAbility0005
     * @tc.desc Verify that the string resource in HSP is obtained correctly by the module context
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('testHspAbility0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspAbility0005');
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0500 start');
        let button: Component = await driver.findComponent(ON.id('getStringValue'));
        await button.click();
        await driver.delayMs(DELAY_TIME);
        let expected: string = await resourceManager.getStringValue($r('app.string.HSP_value'));
        let result: Component = await driver.findComponent(ON.text(expected));
        expect(result !== null).assertTrue();
        expect(await result.getText()).assertEqual(expected);
        expect(expected.length > 0).assertTrue();
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0500 end');
        done();
      })

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ABILITY_0600
     * @tc.name      testHspAbility0006
     * @tc.desc Verify the routing jump and routing return between the HAP page and the HSP menu page
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('testHspAbility0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspAbility0006');
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0600 start');
        let button: Component = await driver.findComponent(ON.id('clickToMenu'));
        await button.click();
        await driver.delayMs(DELAY_TIME);
        let menuPage: Component = await driver.findComponent(ON.text(MENU_PAGE_TEXT));
        expect(menuPage !== null).assertTrue();
        expect(await menuPage.getText()).assertEqual(MENU_PAGE_TEXT);
        let routerButton: Component = await driver.findComponent(ON.id('menuToBack'));
        await routerButton.click();
        await driver.delayMs(DELAY_TIME);
        let back: Component = await driver.findComponent(ON.id('backToHSP'));
        await back.click();
        await driver.delayMs(DELAY_TIME);
        let backPage: Component = await driver.findComponent(ON.text(MENU_PAGE_TEXT));
        expect(backPage !== null).assertTrue();
        expect(await backPage.getText()).assertEqual(MENU_PAGE_TEXT);
        await driver.pressBack();
        await driver.delayMs(DELAY_TIME);
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0600 end');
        done();
      })

    /**
     * @tc.number    SUB_BUNDLEMANAGER_HSP_ABILITY_0700
     * @tc.name      testHspAbility0007
     * @tc.desc Verify that routing back from the HSP page returns to the HAP index page
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL0
     */
    it('testHspAbility0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testHspAbility0007');
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0700 start');
        let button: Component = await driver.findComponent(ON.id('clickToBack'));
        await button.click();
        await driver.delayMs(DELAY_TIME);
        let back: Component = await driver.findComponent(ON.id('backToHAP'));
        expect(back !== null).assertTrue();
        await back.click();
        await driver.delayMs(DELAY_TIME);
        let expected: string = await resourceManager.getStringValue($r('app.string.HSP_message'));
        let indexPage: Component = await driver.findComponent(ON.text(expected));
        expect(indexPage !== null).assertTrue();
        expect(await indexPage.getText()).assertEqual(expected);
        Logger.info(TAG, 'ACTS_HSP_SAMPLE_FUNCTION_TEST_0700 end');
        done();
      })
  })
}