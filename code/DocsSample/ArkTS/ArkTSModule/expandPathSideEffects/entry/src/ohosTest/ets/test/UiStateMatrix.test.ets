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

async function ensureWelcome(): Promise<void> {
  await ensureAppStarted();
  const welcome: Component | null = await driver.findComponent(ON.text('Welcome'));
  if (welcome === null) {
    const initial: Component | null = await waitForText('Hello World');
    if (initial !== null) {
      await initial.click();
      await driver.delayMs(500);
    }
  }
}

export default function uiStateMatrixTest(): void {
  describe('UiStateMatrixTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_STATE_0100
     * @tc.name      testUnknownTextAbsent0001
     * @tc.desc      A text that the page never renders is not found
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUnknownTextAbsent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnknownTextAbsent0001 begin');
      await ensureWelcome();
      const unknown: Component | null = await driver.findComponent(ON.text('NoSuchText__'));
      expect(unknown === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnknownTextAbsent0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_STATE_0200
     * @tc.name      testUnknownIdAbsent0002
     * @tc.desc      A component id that the page never assigns is not found
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testUnknownIdAbsent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnknownIdAbsent0002 begin');
      await ensureWelcome();
      const unknown: Component | null = await driver.findComponent(ON.id('NoSuchId__'));
      expect(unknown === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUnknownIdAbsent0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_STATE_0300
     * @tc.name      testKnownIdReportsWelcome0003
     * @tc.desc      The HelloWorld component id resolves to a node whose text is Welcome after the switch
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testKnownIdReportsWelcome0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKnownIdReportsWelcome0003 begin');
      await ensureWelcome();
      const component: Component | null = await waitForId('HelloWorld');
      expect(component !== null).assertTrue();
      if (component !== null) {
        expect(await component.getText()).assertEqual('Welcome');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKnownIdReportsWelcome0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_STATE_0400
     * @tc.name      testRestartKeepsWelcome0004
     * @tc.desc      Starting EntryAbility again keeps the switched Welcome text instead of resetting it
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRestartKeepsWelcome0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRestartKeepsWelcome0004 begin');
      await ensureWelcome();
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await driver.delayMs(SETTLE_MS);
      const welcome: Component | null = await waitForText('Welcome');
      expect(welcome !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRestartKeepsWelcome0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_UI_STATE_0500
     * @tc.name      testTopAbilityAfterRestart0005
     * @tc.desc      After a restart EntryAbility remains the current top ability
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testTopAbilityAfterRestart0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTopAbilityAfterRestart0005 begin');
      await ensureAppStarted();
      const top: UIAbility | undefined = await delegator.getCurrentTopAbility();
      expect(top !== undefined).assertTrue();
      if (top !== undefined) {
        expect(top.context.abilityInfo.name).assertEqual('EntryAbility');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTopAbilityAfterRestart0005 end');
    })

  })
}
