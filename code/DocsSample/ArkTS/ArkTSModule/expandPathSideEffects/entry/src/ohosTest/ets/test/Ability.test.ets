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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';
const QUERY_TIMEOUT_MS: number = 3000;
const SETTLE_MS: number = 1500;
const POLL_MS: number = 200;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const driver: Driver = Driver.create();

async function waitForText(text: string): Promise<Component | null> {
  const deadline: number = Date.now() + QUERY_TIMEOUT_MS;
  while (Date.now() < deadline) {
    const component: Component | null = await driver.findComponent(ON.text(text));
    if (component !== null) {
      return component;
    }
    await driver.delayMs(POLL_MS);
  }
  return null;
}

async function waitForId(id: string): Promise<Component | null> {
  const deadline: number = Date.now() + QUERY_TIMEOUT_MS;
  while (Date.now() < deadline) {
    const component: Component | null = await driver.findComponent(ON.id(id));
    if (component !== null) {
      return component;
    }
    await driver.delayMs(POLL_MS);
  }
  return null;
}

async function ensureAppStarted(): Promise<void> {
  const top: UIAbility | undefined = await delegator.getCurrentTopAbility();
  if (top === undefined || top.context.abilityInfo.name !== 'EntryAbility') {
    const want: Want = {
      bundleName: bundleName,
      abilityName: 'EntryAbility'
    };
    await delegator.startAbility(want);
    await driver.delayMs(SETTLE_MS);
  }
}

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_0100
     * @tc.name      testStartAbilityTop0001
     * @tc.desc      EntryAbility can be started and becomes the current top ability
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartAbilityTop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartAbilityTop0001 begin');
      await ensureAppStarted();
      const top: UIAbility | undefined = await delegator.getCurrentTopAbility();
      expect(top !== undefined).assertTrue();
      if (top !== undefined) {
        expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartAbilityTop0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_0200
     * @tc.name      testInitialTextVisible0002
     * @tc.desc      The Index page shows the initial Hello World text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInitialTextVisible0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitialTextVisible0002 begin');
      await ensureAppStarted();
      const text: Component | null = await waitForText('Hello World');
      expect(text !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitialTextVisible0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_0300
     * @tc.name      testTextComponentHasId0003
     * @tc.desc      The greeting Text node keeps the documented HelloWorld component id
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testTextComponentHasId0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextComponentHasId0003 begin');
      await ensureAppStarted();
      const component: Component | null = await waitForId('HelloWorld');
      expect(component !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTextComponentHasId0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_0400
     * @tc.name      testClickSwitchesToWelcome0004
     * @tc.desc      Clicking the greeting switches the visible text from Hello World to Welcome
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClickSwitchesToWelcome0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickSwitchesToWelcome0004 begin');
      await ensureAppStarted();
      const text: Component | null = await waitForText('Hello World');
      expect(text !== null).assertTrue();
      if (text !== null) {
        await text.click();
        await driver.delayMs(500);
      }
      const welcome: Component | null = await waitForText('Welcome');
      expect(welcome !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClickSwitchesToWelcome0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_0500
     * @tc.name      testWelcomeTextValue0005
     * @tc.desc      The switched text node reports exactly Welcome
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testWelcomeTextValue0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWelcomeTextValue0005 begin');
      await ensureAppStarted();
      const welcome: Component | null = await waitForText('Welcome');
      expect(welcome !== null).assertTrue();
      if (welcome !== null) {
        expect(await welcome.getText()).assertEqual('Welcome');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWelcomeTextValue0005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_0600
     * @tc.name      testInitialTextGoneAfterClick0006
     * @tc.desc      After the switch the initial Hello World text is no longer present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testInitialTextGoneAfterClick0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitialTextGoneAfterClick0006 begin');
      await ensureAppStarted();
      await driver.delayMs(500);
      const initial: Component | null = await driver.findComponent(ON.text('Hello World'));
      expect(initial === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInitialTextGoneAfterClick0006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_0700
     * @tc.name      testSecondClickKeepsWelcome0007
     * @tc.desc      Clicking the Welcome text again keeps the page on Welcome
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testSecondClickKeepsWelcome0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSecondClickKeepsWelcome0007 begin');
      await ensureAppStarted();
      const welcome: Component | null = await waitForText('Welcome');
      expect(welcome !== null).assertTrue();
      if (welcome !== null) {
        await welcome.click();
        await driver.delayMs(500);
        expect(await welcome.getText()).assertEqual('Welcome');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSecondClickKeepsWelcome0007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_0800
     * @tc.name      testTopAbilityAfterInteractions0008
     * @tc.desc      After all text interactions EntryAbility is still the top ability
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testTopAbilityAfterInteractions0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTopAbilityAfterInteractions0008 begin');
      await ensureAppStarted();
      const top: UIAbility | undefined = await delegator.getCurrentTopAbility();
      expect(top !== undefined).assertTrue();
      if (top !== undefined) {
        expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTopAbilityAfterInteractions0008 end');
    })

  })
}
