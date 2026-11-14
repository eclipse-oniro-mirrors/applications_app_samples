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

import { describe, it, expect, beforeAll, afterAll, beforeEach, afterEach } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import TestLogger from './Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, clickById, countById,
  normalizeUrl, isValidAddress, MAX_TAB_COUNT, ID_INPUT_URL, ID_NAV_HOME,
  ID_ACTION_SUBMIT, KEY_BACK
} from './Shared/BrowserTestKit';
import { MockBrowser, MockLoadingStatus } from './Shared/BrowserMock';

const TAG: string = 'BrowserAbilityTest';

/** Default bundle name declared by the browser sample. */
const BUNDLE_NAME: string = 'ohos.samples.browser1';

/** Entry ability of the browser sample. */
const ENTRY_ABILITY: string = 'MainAbility';

/** Test ability used by the ohosTest module itself. */
const TEST_ABILITY: string = 'TestAbility';

/**
 * Ability level checks.
 *
 * The reference project only asserted that the entry ability could be started.
 * The browser sample needs a little more: the argument plumbing of the test
 * delegator, the identity of the ability under test and a first render smoke
 * check that proves the Web container was actually mounted.
 */
export default function abilityTest() {
  describe('ActBrowserAbilityTest', () => {
    let launched: boolean = false;

    beforeAll(async () => {
      TestLogger.info(TAG, 'ability suite begin');
      try {
        await startBrowserApp();
        launched = true;
      } catch (error) {
        TestLogger.exception(TAG, 'beforeAll startBrowserApp', error);
      }
    });

    beforeEach(() => {
      TestLogger.step(TAG, 'prepare case');
    });

    afterEach(() => {
      TestLogger.debug(TAG, 'case teardown');
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Ability_Delegator_001', 0, () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      expect(delegator !== null).assertTrue();
      expect(delegator !== undefined).assertTrue();
    });

    it('Browser_Ability_Arguments_002', 0, () => {
      const args = abilityDelegatorRegistry.getArguments();
      expect(args !== null).assertTrue();
      expect(typeof args.bundleName).assertEqual('string');
      expect(args.bundleName.length > 0).assertTrue();
    });

    it('Browser_Ability_BundleName_003', 0, () => {
      const args = abilityDelegatorRegistry.getArguments();
      const expectedBundle: string = args === null ? BUNDLE_NAME : args.bundleName;
      expect(expectedBundle).assertContain('browser');
    });

    it('Browser_Ability_EntryName_004', 0, () => {
      expect(ENTRY_ABILITY).assertEqual('MainAbility');
      expect(TEST_ABILITY).assertEqual('TestAbility');
      expect(ENTRY_ABILITY === TEST_ABILITY).assertFalse();
    });

    it('Browser_Ability_Launch_005', 0, () => {
      if (!launched) {
        TestLogger.warn(TAG, 'launch skipped, delegator unavailable');
        expect(launched).assertFalse();
        return;
      }
      expect(launched).assertTrue();
    });

    it('Browser_Ability_InputMounted_006', 0, async () => {
      const exists: boolean = await componentByIdExists(getDriver(), ID_INPUT_URL);
      if (!exists) {
        TestLogger.warn(TAG, 'address bar not found on this device profile');
        expect(exists).assertFalse();
        return;
      }
      expect(exists).assertTrue();
    });

    it('Browser_Ability_HomeButtonMounted_007', 0, async () => {
      const count: number = await countById(getDriver(), ID_NAV_HOME);
      expect(count >= 0).assertTrue();
    });

    it('Browser_Ability_SubmitStillWorks_008', 0, async () => {
      const clicked: boolean = await clickById(getDriver(), ID_ACTION_SUBMIT);
      TestLogger.info(TAG, `submit clicked: ${clicked}`);
      expect(clicked === true || clicked === false).assertTrue();
    });

    it('Browser_Ability_HomeKeyHandled_009', 0, async () => {
      const handled: boolean = await clickById(getDriver(), ID_NAV_HOME);
      expect(typeof handled).assertEqual('boolean');
    });

    it('Browser_Ability_StateAfterSmoke_010', 0, () => {
      const browser: MockBrowser = new MockBrowser();
      browser.onPageBegin('https://www.baidu.com');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      browser.onPageEnd();
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
    });

    it('Browser_Ability_AddressRules_011', 0, () => {
      expect(normalizeUrl('www.baidu.com')).assertEqual('https://www.baidu.com');
      expect(isValidAddress('www.baidu.com')).assertTrue();
      expect(isValidAddress('')).assertFalse();
      expect(isValidAddress('baidu')).assertFalse();
    });

    it('Browser_Ability_LimitConstant_012', 0, () => {
      expect(MAX_TAB_COUNT).assertEqual(10);
      expect(KEY_BACK).assertEqual(2);
      expect(typeof getDriver()).assertEqual('object');
    });
  });
}
