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
import { describe, it, expect } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { openFixture, click, text, waitText, waitClearedText, bounds, positive,
  backgroundAndRestore } from './SharedDriver';

export default function bindingUpdatesTests(): void {
  describe('BindingUpdatesTest', () => {
    it('BindingUpdates_explicitDetailBuilderReadsOwnerState', 0, async () => {
      await openFixture('explicit');
      await click('update-detail');
      await waitText('fixture-detail', 'Updated detail');
      expect(await text('fixture-label')).assertEqual('Label');
      expect(await text('fixture-bottom')).assertEqual('Bottom');
    });

    it('BindingUpdates_trailingButtonCallbackMutatesItsOwnerOnly', 0, async () => {
      await openFixture('trailing');
      await click('fixture-label');
      await waitText('label-clicks', 'Label clicks: 1');
      expect(await text('bottom-clicks')).assertEqual('Bottom clicks: 0');
      expect(await text('fixture-detail')).assertEqual('Initial detail');
    });

    it('BindingUpdates_bottomBuilderCallbackIsIndependentOfLabel', 0, async () => {
      await openFixture('explicit');
      await click('fixture-bottom');
      await click('fixture-bottom');
      await waitText('bottom-clicks', 'Bottom clicks: 2');
      expect(await text('label-clicks')).assertEqual('Label clicks: 0');
    });

    it('BindingUpdates_customCardPropReferencesDoNotLeakToSibling', 0, async () => {
      await openFixture('custom');
      await click('update-detail');
      await waitText('custom-first-title', 'Updated card');
      expect(await text('custom-first-description')).assertEqual('Updated description');
      expect(await text('custom-second-title')).assertEqual('Second card');
      expect(await text('custom-second-description')).assertEqual('Second description');
    });

    it('BindingUpdates_emptyTitleAndDescriptionRetainRealCardSlots', 0, async () => {
      await openFixture('custom');
      await waitText('custom-first-title', 'First card');
      expect(await text('custom-first-description')).assertEqual('First description');
      await click('clear-text');
      await waitClearedText('custom-first-title');
      await waitClearedText('custom-first-description');
      positive(await bounds('custom-first-container'));
      const label = await bounds('custom-first-label');
      positive(label);
      expect((await bounds('custom-first-divider')).right > label.right).assertTrue();
      expect(await text('custom-second-title')).assertEqual('Second card');
      expect(await text('custom-second-description')).assertEqual('Second description');
      await click('update-detail');
      await waitText('custom-first-title', 'Updated card');
      expect(await text('custom-first-description')).assertEqual('Updated description');
    });

    it('BindingUpdates_unicodeTitleAndMultilineDescriptionRemainDistinct', 0, async () => {
      await openFixture('custom');
      await click('unicode-text');
      await waitText('custom-first-title', '\u884c\u7a0b \u2708 2026');
      expect(await text('custom-first-description')).assertEqual('Line one\nLine two');
      expect((await bounds('custom-first-description')).top >= (await bounds('custom-first-title')).bottom - 1).assertTrue();
    });

    it('BindingUpdates_systemResourceStringResolvesInCustomCard', 0, async () => {
      const expected = abilityDelegatorRegistry.getAbilityDelegator().getAppContext()
        .resourceManager.getStringSync($r('sys.string.general_copy').id);
      expect(expected.length > 0).assertTrue();
      await openFixture('custom');
      await waitText('fixture-resource-reference', expected);
      expect(await text('custom-resource-title')).assertEqual('Resource card');
      await waitText('custom-resource-description', expected);
      positive(await bounds('custom-resource-description'));
      expect(await text('custom-first-description')).assertEqual('First description');
    });

    it('BindingUpdates_ownerStateSurvivesFixtureBackgroundForeground', 0, async () => {
      await openFixture('trailing');
      await click('fixture-label');
      await click('update-detail');
      await waitText('fixture-detail', 'Updated detail');
      await backgroundAndRestore('FixtureAbility', 'fixture-heading', 'BuilderParam fixture');
      expect(await text('label-clicks')).assertEqual('Label clicks: 1');
      expect(await text('fixture-detail')).assertEqual('Updated detail');
      expect(await text('fixture-bottom')).assertEqual('Bottom');
    });
  });
}
