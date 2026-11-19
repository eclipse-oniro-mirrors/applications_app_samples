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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { SelectionFixture } from './Shared/SelectionFixture';
import { yieldToEventLoop } from './Shared/TestScheduler';
import { describe, it, expect, beforeAll, beforeEach, afterEach } from '@ohos/hypium';
import { openProductionPage, requireComponentById, requireComponentByText,
  runSerializedUiOperation } from './Shared/SharedDriver';

export default function abilityTest(): void {
  describe('SelectionAbilityPageTest', () => {
    let entryAbility: UIAbility | undefined;
    let testAbility: UIAbility;

    const openEntryPage = async (): Promise<void> => {
      const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      const monitor: AbilityDelegatorRegistry.AbilityMonitor = {
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (ability: UIAbility): void => {
          entryAbility = ability;
        }
      };
      await delegator.addAbilityMonitor(monitor);
      try {
        await delegator.startAbility({
          bundleName: AbilityDelegatorRegistry.getArguments().bundleName,
          moduleName: 'entry',
          abilityName: 'EntryAbility'
        });
        entryAbility = await delegator.waitAbilityMonitor(monitor, 3000);
        if (entryAbility === undefined || entryAbility === null) {
          throw new Error('EntryAbility startup timed out');
        }
        await requireComponentByText('Hello World', 3000);
      } finally {
        await delegator.removeAbilityMonitor(monitor);
      }
    };

    const closeEntryPage = async (): Promise<void> => {
      const ability = entryAbility;
      if (ability === undefined) {
        return;
      }
      const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let destroyed: boolean = false;
      const monitor: AbilityDelegatorRegistry.AbilityMonitor = {
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityDestroy: (): void => {
          destroyed = true;
        }
      };
      await delegator.addAbilityMonitor(monitor);
      try {
        await ability.context.terminateSelf();
        const deadline: number = Date.now() + 3000;
        while (!destroyed && Date.now() < deadline) {
          await yieldToEventLoop();
        }
        if (!destroyed) {
          throw new Error('EntryAbility destruction timed out');
        }
        entryAbility = undefined;
      } finally {
        await delegator.removeAbilityMonitor(monitor);
      }
    };

    const readGreeting = async (): Promise<string> => {
      const component = await requireComponentById('MenuPanelHelloWorld', 3000);
      return await runSerializedUiOperation(async () => component.getText());
    };

    const clickGreeting = async (): Promise<void> => {
      const component = await requireComponentById('MenuPanelHelloWorld', 3000);
      await runSerializedUiOperation(async () => component.click());
      await requireComponentByText('Welcome', 3000);
    };

    beforeAll(async () => {
      testAbility = await AbilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
      if (testAbility === undefined || testAbility === null) {
        throw new Error('TestAbility is unavailable before entry tests');
      }
    });

    beforeEach(async () => {
      await yieldToEventLoop();
    });

    afterEach(async () => {
      try {
        await closeEntryPage();
      } finally {
        await AbilityDelegatorRegistry.getAbilityDelegator().doAbilityForeground(testAbility);
        await yieldToEventLoop();
        await openProductionPage('testability/pages/Index');
      }
    });

    it('SEL_ENTRY_001_initial_greeting', 0, async () => {
      await openEntryPage();
      const actual = await readGreeting();
      expect(actual).assertEqual('Hello World');
    });

    it('SEL_ENTRY_002_click_changes_greeting', 0, async () => {
      await openEntryPage();
      await clickGreeting();
      expect(await readGreeting()).assertEqual('Welcome');
      await clickGreeting();
      expect(await readGreeting()).assertEqual('Welcome');
      await closeEntryPage();
      await openEntryPage();
      expect(await readGreeting()).assertEqual('Hello World');
    });

    it('SEL_ENTRY_003_click_preserves_selection_content', 0, async () => {
      const fixture = new SelectionFixture();
      fixture.install();
      try {
        fixture.model.setSelectionContent('Previously selected text');
        await openEntryPage();
        await clickGreeting();
        expect(await readGreeting()).assertEqual('Welcome');
        expect(fixture.model.getSelectionContent()).assertEqual('Previously selected text');
        expect(fixture.contentCalls).assertEqual(0);
        expect(fixture.creates.length).assertEqual(0);
      } finally {
        fixture.restore();
      }
    });
  });
}
