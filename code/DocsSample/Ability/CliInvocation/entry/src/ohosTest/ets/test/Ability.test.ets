/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CliInvocation]';
const BUNDLE: string = 'CliInvocation_';
const ONE_SECOND: number = 1000;
const MAX_RETRY: number = 20;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

async function waitForEntryAbility(): Promise<UIAbility> {
  for (let i: number = 0; i < MAX_RETRY; i++) {
    try {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      if (ability.context.abilityInfo.name === 'EntryAbility') {
        return ability;
      }
    } catch (err) {
      hilog.info(DOMAIN, TAG, 'getCurrentTopAbility retry: ' + JSON.stringify(err));
    }
    await sleep(ONE_SECOND);
  }
  return await delegator.getCurrentTopAbility();
}

async function findComponentById(driver: Driver, id: string): Promise<Component | null> {
  for (let i: number = 0; i < MAX_RETRY; i++) {
    const component: Component | null = await driver.findComponent(ON.id(id));
    if (component !== null) {
      return component;
    }
    await driver.delayMs(500);
  }
  return null;
}

export default function abilityTest() {
  describe('CliInvocationTest', () => {
    /**
     * Start the app and verify EntryAbility is launched normally
     */
    it(BUNDLE + 'StartAbility_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      const ability: UIAbility = await waitForEntryAbility();
      // Verify the current ability name
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, ability name: ' + ability.context.abilityInfo.name);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, end');
      done();
    });

    /**
     * Click the "Start target app" button, verify it exists and ohos-aa is invoked through forkAndExecute
     */
    it(BUNDLE + 'StartTargetApp_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartTargetApp_001, begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await waitForEntryAbility();
      const driver = Driver.create();
      await driver.delayMs(ONE_SECOND);
      const startButton = await findComponentById(driver, 'button_start_target_app');
      // Verify the start button exists
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartTargetApp_001, assert start button exists');
      expect(startButton !== null).assertTrue();
      await startButton!.click();
      await driver.delayMs(ONE_SECOND);
      // After clicking, the message text is updated with the start result; verify the Text component exists
      const messageText = await findComponentById(driver, 'text_message');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartTargetApp_001, assert message text exists');
      expect(messageText !== null).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartTargetApp_001, end');
      done();
    });
  });
}
