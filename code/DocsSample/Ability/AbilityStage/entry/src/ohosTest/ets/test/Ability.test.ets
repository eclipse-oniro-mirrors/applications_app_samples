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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  getDriver,
  ensureIndexPageInitial,
  getBundleName,
  buildEntryWant,
  launchEntryAbility,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  pageComponentCount,
  getAbilityDelegator,
  logInfo,
  logError,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_PAGE_RENDER,
  PAGE_TEXT_INITIAL,
  ENTRY_ABILITY_NAME,
  BUNDLE_NAME,
  measureElapsed,
  isWithinBudget,
  isNonEmptyString
} from './Shared/SharedDriver';

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('ActsAbilityTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver);
      await ensureIndexPageInitial(driver);
      logInfo('ActsAbilityTest: beforeAll finished');
    })

    beforeEach(async () => {
      await driver.delayMs(100);
    })

    afterEach(async () => {
      await driver.delayMs(100);
    })

    afterAll(async () => {
      logInfo('ActsAbilityTest: afterAll start');
      await driver.delayMs(100);
      logInfo('ActsAbilityTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITY_0100
     * @tc.name testAbilityStartup
     * @tc.desc Verify EntryAbility can be started by AbilityDelegator: start request -> application launched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityStartup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const startTime: number = Date.now();
      try {
        await launchEntryAbility();
        const elapsed: number = measureElapsed(startTime);
        logInfo(`testAbilityStartup: launch finished in ${elapsed} ms`);
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH)).assertTrue();
      } catch (error) {
        logError(`testAbilityStartup failed: ${error}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITY_0200
     * @tc.name testAbilityDelegatorAvailable
     * @tc.desc Verify AbilityDelegator instance is reachable and carries the running bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityDelegatorAvailable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
        expect(delegator !== null).assertTrue();
        const bundleName: string = getBundleName();
        expect(isNonEmptyString(bundleName)).assertTrue();
        logInfo(`testAbilityDelegatorAvailable: bundle name is ${bundleName}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITY_0300
     * @tc.name testEntryWantBuiltWithBundleName
     * @tc.desc Verify buildEntryWant fills bundleName from delegator arguments and abilityName EntryAbility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEntryWantBuiltWithBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const want = buildEntryWant();
        expect(want.abilityName).assertEqual(ENTRY_ABILITY_NAME);
        const wantBundle: string = getBundleName();
        expect(isNonEmptyString(wantBundle)).assertTrue();
        logInfo(`testEntryWantBuiltWithBundleName: want bundle ${wantBundle} ability ${want.abilityName}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITY_0400
     * @tc.name testIndexPageVisibleAfterStart
     * @tc.desc Verify index page renders after startup: text Hello World or Welcome is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexPageVisibleAfterStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITY_0500
     * @tc.name testIndexPageTextContent
     * @tc.desc Verify index page exposes the HelloWorld text component with expected copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexPageTextContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const hasInitialText: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const hasClickedText: boolean = await checkTextContent(driver, 'Welcome');
        expect(hasInitialText || hasClickedText).assertTrue();
        logInfo(`testIndexPageTextContent: initial ${hasInitialText} clicked ${hasClickedText}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITY_0600
     * @tc.name testIndexPageComponentCount
     * @tc.desc Verify index page renders at least one component node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexPageComponentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        logInfo(`testIndexPageComponentCount: component count ${count}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITY_0700
     * @tc.name testStartabilityRepeatedly
     * @tc.desc Verify repeated startAbility calls keep the application reachable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartabilityRepeatedly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await launchEntryAbility();
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
      } catch (error) {
        logError(`testStartabilityRepeatedly failed: ${error}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITY_0800
     * @tc.name testBundleNameMatchesConfiguration
     * @tc.desc Verify running bundle name equals configured com.samples.abilitystage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBundleNameMatchesConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        expect(bundleName).assertEqual(BUNDLE_NAME);
      } finally {
        done();
      }
    })
  })
}
