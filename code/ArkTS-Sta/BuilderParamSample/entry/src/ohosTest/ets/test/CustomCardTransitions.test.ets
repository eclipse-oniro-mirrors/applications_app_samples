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
import { bounds, click, exists, positive, text, waitClearedText, waitText } from './SharedDriver';
import { openHistory, sameRect, siblingPropsUnchanged } from './HistoryDriver';

export default function customCardTransitionsTests(): void {
  describe('CustomCardTransitionsTest', () => {
    it('CustomCardTransitions_independentFieldWritesDoNotRebindTheSibling', 0, async () => {
      await openHistory('props');
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await siblingPropsUnchanged();
      await click('props-sibling');
      await waitText('props-sibling-title', 'Changed sibling');
      expect(await text('props-sibling-description')).assertEqual('Changed sibling description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Changed title');
      expect(await text('props-sibling-title')).assertEqual('Changed sibling');
      expect(await text('props-sibling-description')).assertEqual('Changed sibling description');
    });

    it('CustomCardTransitions_emptyTitlePreservesDescriptionAndLabelSlot', 0, async () => {
      await openHistory('props');
      await click('props-clear-title');
      await waitClearedText('props-primary-title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      positive(await bounds('props-primary-label'));
      positive(await bounds('props-primary-symbol'));
      expect((await bounds('props-primary-divider')).top >= (await bounds('props-primary-row')).bottom - 1).assertTrue();
      await siblingPropsUnchanged();
      await click('props-title');
      await waitText('props-primary-title', 'Changed title');
      expect(await text('props-primary-description')).assertEqual('Primary description');
      expect((await bounds('props-primary-title')).bottom <= (await bounds('props-primary-description')).top + 1).assertTrue();
    });

    it('CustomCardTransitions_emptyDescriptionPreservesTitleAndRecoversItsOwnBinding', 0, async () => {
      await openHistory('props');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      positive(await bounds('props-primary-detail'));
      positive(await bounds('props-primary-label'));
      await siblingPropsUnchanged();
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-primary-title')).assertEqual('Primary title');
      positive(await bounds('props-primary-description'));
    });

    it('CustomCardTransitions_resourceStringEmptyAndStringReuseTheSameProp', 0, async () => {
      const expected = abilityDelegatorRegistry.getAbilityDelegator().getAppContext()
        .resourceManager.getStringSync($r('sys.string.general_copy').id);
      expect(expected.length > 0).assertTrue();
      await openHistory('props');
      await waitText('props-resource-reference', expected);
      await click('props-resource');
      await waitText('props-primary-description', expected);
      positive(await bounds('props-primary-description'));
      expect(await text('props-primary-title')).assertEqual('Primary title');
      await click('props-clear-description');
      await waitClearedText('props-primary-description');
      await click('props-resource');
      await waitText('props-primary-description', expected);
      await click('props-description');
      await waitText('props-primary-description', 'Changed description');
      expect(await text('props-resource-reference')).assertEqual(expected);
      await siblingPropsUnchanged();
    });

    it('CustomCardTransitions_changedIdPropRebindsAllBuilderDescendants', 0, async () => {
      await openHistory('props');
      await click('props-title');
      await click('props-rekey');
      await waitText('props-renamed-title', 'Changed title');
      expect(await text('props-renamed-description')).assertEqual('Primary description');
      const suffixes = ['container', 'row', 'detail', 'title', 'description', 'label', 'symbol', 'divider'];
      for (const suffix of suffixes) {
        expect(await exists('props-primary-' + suffix)).assertFalse();
        expect(await exists('props-renamed-' + suffix)).assertTrue();
      }
      await click('props-description');
      await waitText('props-renamed-description', 'Changed description');
      expect(await exists('props-primary-description')).assertFalse();
      positive(await bounds('props-renamed-label'));
      await siblingPropsUnchanged();
    });

    it('CustomCardTransitions_multilineReflowMovesSiblingAndRestoresGeometry', 0, async () => {
      await openHistory('props');
      const originalRow = await bounds('props-primary-row');
      const originalDescription = await bounds('props-primary-description');
      const originalSibling = await bounds('props-sibling-container');
      await click('props-multiline');
      await waitText('props-primary-description', 'First line\nSecond line\nThird line');
      const multiline = await bounds('props-primary-description');
      expect(multiline.bottom - multiline.top > originalDescription.bottom - originalDescription.top).assertTrue();
      expect((await bounds('props-primary-row')).bottom > originalRow.bottom).assertTrue();
      expect((await bounds('props-sibling-container')).top > originalSibling.top).assertTrue();
      expect((await bounds('props-primary-divider')).top >= (await bounds('props-primary-row')).bottom - 1).assertTrue();
      await siblingPropsUnchanged();
      await click('props-reset');
      await waitText('props-primary-description', 'Primary description');
      sameRect(await bounds('props-primary-row'), originalRow);
      sameRect(await bounds('props-sibling-container'), originalSibling);
    });
  });
}
