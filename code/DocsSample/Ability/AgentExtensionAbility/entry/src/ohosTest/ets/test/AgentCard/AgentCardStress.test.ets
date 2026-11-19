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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import {
  getDriver, launchEntryAbility, runSerializedUiOperation, serializedDelay,
  waitForTextAppear, getTopAbilityName
} from '../Shared/AgentTestDriver';

export default function agentCardStressTest(): void {
  describe('AgentEntryPageUI', () => {
    let driver: Driver;
    beforeEach(async () => {
      driver = getDriver();
      await launchEntryAbility();
      await serializedDelay(driver, 300);
      expect(await getTopAbilityName()).assertEqual('EntryAbility');
    });
    it('rendersTheRealHelloWorldComponent', 0, async () => {
      await runSerializedUiOperation(async () => {
        const component = await driver.findComponent(ON.id('HelloWorld'));
        expect(component !== null).assertTrue();
        if (component !== null) {
          const text = await component.getText();
          expect(text === 'Hello World' || text === 'Welcome').assertTrue();
        }
      });
    });
    it('clickChangesTheActualPageStateToWelcome', 0, async () => {
      await runSerializedUiOperation(async () => {
        const component = await driver.findComponent(ON.id('HelloWorld'));
        expect(component !== null).assertTrue();
        if (component !== null) {
          await component.click();
        }
      });
      expect(await waitForTextAppear(driver, 'Welcome', 3000)).assertTrue();
    });
    it('repeatedClickKeepsTheWelcomeState', 0, async () => {
      for (let index = 0; index < 3; index++) {
        await runSerializedUiOperation(async () => {
          const component = await driver.findComponent(ON.id('HelloWorld'));
          expect(component !== null).assertTrue();
          if (component !== null) {
            await component.click();
          }
        });
      }
      expect(await waitForTextAppear(driver, 'Welcome', 3000)).assertTrue();
      expect(await getTopAbilityName()).assertEqual('EntryAbility');
    });
    it('serializesConcurrentReadRequestsWithoutRacingUiTest', 0, async () => {
      const first = runSerializedUiOperation(async () => {
        const component = await driver.findComponent(ON.id('HelloWorld'));
        expect(component !== null).assertTrue();
        return component === null ? '' : await component.getText();
      });
      const second = runSerializedUiOperation(async () => {
        const component = await driver.findComponent(ON.id('HelloWorld'));
        expect(component !== null).assertTrue();
        return component === null ? '' : await component.getText();
      });
      const values = await Promise.all([first, second]);
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(values[1]);
      expect(values[0] === 'Hello World' || values[0] === 'Welcome').assertTrue();
    });
    it('foregroundEntryRetainsTheActualPageContract', 0, async () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const ability = await delegator.getCurrentTopAbility();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      expect(ability.context.abilityInfo.moduleName).assertEqual('entry');
      await runSerializedUiOperation(async () => {
        const component = await driver.findComponent(ON.id('HelloWorld'));
        expect(component !== null).assertTrue();
      });
    });
  });
}
