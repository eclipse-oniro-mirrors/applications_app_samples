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
import { openMain, click, node, cardId, TITLES, verifyMainContent, backgroundAndRestore,
  startAbility, waitText, openFixture, abilitySnapshot } from './SharedDriver';

export default function mainInteractionTests(): void {
  describe('MainInteractionTest', () => {
    beforeEach(async () => { await openMain(); });

    it('MainInteraction_labelClicksKeepAllItineraryBindings', 0, async () => {
      for (let index = 0; index < TITLES.length; index++) {
        await click(cardId(index, 'label'));
      }
      await verifyMainContent();
    });

    it('MainInteraction_longPressDoesNotReplaceCardDetails', 0, async () => {
      await (await node(cardId(1, 'description'))).longClick();
      await verifyMainContent();
    });

    it('MainInteraction_backgroundForegroundRestoresOriginalPage', 0, async () => {
      await backgroundAndRestore('EntryAbility', 'trip-heading', '\u884c\u7a0b\u89c4\u5212');
      await verifyMainContent();
    });

    it('MainInteraction_repeatedLaunchKeepsMainAbilityAndContent', 0, async () => {
      const before = await abilitySnapshot('EntryAbility');
      await startAbility('EntryAbility');
      await waitText(cardId(2, 'title'), TITLES[2]);
      const after = await abilitySnapshot('EntryAbility');
      expect(after.state).assertEqual('FOREGROUND');
      expect(after.recordId).assertEqual(before.recordId);
      await verifyMainContent();
    });

    it('MainInteraction_testFixtureDoesNotLeakIntoProductionPage', 0, async () => {
      await openFixture('custom');
      await click('update-detail');
      await waitText('custom-first-title', 'Updated card');
      await startAbility('EntryAbility');
      await waitText(cardId(2, 'title'), TITLES[2]);
      await verifyMainContent();
    });
  });
}
