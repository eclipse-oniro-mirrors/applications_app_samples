/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import { getDriver } from './Shared/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.systemrouter';
const ENTRY_ABILITY: string = 'EntryAbility';
const HOME_TITLE: string = 'NavIndex';
const NAV_DELAY_MS: number = 1000;

let abilityDelegatorRegistry = AbilityDelegatorRegistry.getAbilityDelegator();

async function clickAndCheckTitle(driver: Driver, buttonText: string, titleText: string): Promise<boolean> {
  let btnItem = await driver.findComponent(ON.text(buttonText));
  if (btnItem === null) {
    return false;
  }
  await btnItem.click();
  await driver.delayMs(NAV_DELAY_MS);
  let title = await driver.findComponent(ON.text(titleText));
  return title !== null;
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * Launch the SystemRouter application.
     */
    it(`StartAbility_001`, 0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0xF811, 'testTag', 'StartAbility_001 begin');
      try {
        await abilityDelegatorRegistry.startAbility({
          bundleName: BUNDLE_NAME,
          abilityName: ENTRY_ABILITY
        });
        done();
      } catch (err) {
        expect(0).assertEqual(err.code);
        done();
      }
      hilog.info(0xF811, 'testTag', 'StartAbility_001 end');
    })
    /**
     * Navigate from home to entry-pageOne.
     */
    it('TestCase_001', 0, async () => {
      let driver = getDriver();
      await driver.delayMs(NAV_DELAY_MS);
      let navResult = await clickAndCheckTitle(driver, 'toEntryPageOne', 'entry-pageOne');
      expect(navResult).assertTrue();
      await driver.delayMs(NAV_DELAY_MS);
    })
    /**
     * Navigate from entry-pageOne back to home.
     */
    it('TestCase_002', 0, async () => {
      let driver = getDriver();
      await driver.delayMs(NAV_DELAY_MS);
      let navResult = await clickAndCheckTitle(driver, 'toIndex', HOME_TITLE);
      expect(navResult).assertTrue();
      await driver.delayMs(NAV_DELAY_MS);
    })
    /**
     * Navigate from home to entry-pageTwo.
     */
    it('TestCase_003', 0, async () => {
      let driver = getDriver();
      await driver.delayMs(NAV_DELAY_MS);
      let navResult = await clickAndCheckTitle(driver, 'toEntryPageTwo', 'entry-pageTwo');
      expect(navResult).assertTrue();
      await driver.delayMs(NAV_DELAY_MS);
    })
    /**
     * Navigate from entry-pageTwo back to home.
     */
    it('TestCase_004', 0, async () => {
      let driver = getDriver();
      await driver.delayMs(NAV_DELAY_MS);
      let navResult = await clickAndCheckTitle(driver, 'toIndex', HOME_TITLE);
      expect(navResult).assertTrue();
      await driver.delayMs(NAV_DELAY_MS);
    })
    /**
     * Navigate from home to harA-pageOne.
     */
    it('TestCase_005', 0, async () => {
      let driver = getDriver();
      await driver.delayMs(NAV_DELAY_MS);
      let navResult = await clickAndCheckTitle(driver, 'toHarAPageOne', 'harA-pageOne');
      expect(navResult).assertTrue();
      await driver.delayMs(NAV_DELAY_MS);
    })
    /**
     * Navigate from home to harA-pageTwo.
     */

    /**
     * Navigate from home to hspA-pageOne.
     */

    /**
     * Navigate from home to hspA-pageTwo.
     */

    /**
     * Navigate from hspA-pageTwo back to home.
     */

  })
}
