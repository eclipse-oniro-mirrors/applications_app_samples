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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { SlotScene, detailId, prepareSlotScene, assertSlotPresence, assertSlotTexts,
  assertSlotLayout, activateSlot } from './AdaptationMatrixDriver';
import { openHistory, slotCounts, ownerStates, activateObservedOwner } from './HistoryDriver';
import { bounds, click, exists, text, node, waitText, waitClearedText, assertPositiveRect,
  assertContained, assertWidthRatio, assertVerticalAlignment, assertRectClose, assertAbove,
  assertUniqueId, assertIdAbsent, waitForOriginalBounds, backgroundAndRestore } from './SharedDriver';

import { observeUiLayout } from './UiLayoutObservation';

// Reference: ets/test/Validation/DialogStateManagerValidation.test.ets (1128 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptOwnerLabelTests(): void {
  describe('AdaptOwnerLabelTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('owners');
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0001
    // @tc.name AdaptOwnerLabel_0001
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":false,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0001', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0002
    // @tc.name AdaptOwnerLabel_0002
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":false,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0002', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0003
    // @tc.name AdaptOwnerLabel_0003
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":true,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0003', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0004
    // @tc.name AdaptOwnerLabel_0004
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":true,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0004', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0005
    // @tc.name AdaptOwnerLabel_0005
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":true,"coordinates":false,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0005', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0006
    // @tc.name AdaptOwnerLabel_0006
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":true,"coordinates":false,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0006', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0007
    // @tc.name AdaptOwnerLabel_0007
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":true,"coordinates":true,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0007', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0008
    // @tc.name AdaptOwnerLabel_0008
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":true,"coordinates":true,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0008', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0009
    // @tc.name AdaptOwnerLabel_0009
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":false,"coordinates":false,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0009', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0010
    // @tc.name AdaptOwnerLabel_0010
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":false,"coordinates":false,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0010', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0011
    // @tc.name AdaptOwnerLabel_0011
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":false,"coordinates":true,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0011', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0012
    // @tc.name AdaptOwnerLabel_0012
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":false,"coordinates":true,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0012', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0013
    // @tc.name AdaptOwnerLabel_0013
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":true,"coordinates":false,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0013', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0014
    // @tc.name AdaptOwnerLabel_0014
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":true,"coordinates":false,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0014', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0015
    // @tc.name AdaptOwnerLabel_0015
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":true,"coordinates":true,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0015', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0016
    // @tc.name AdaptOwnerLabel_0016
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":true,"coordinates":true,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0016', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0017
    // @tc.name AdaptOwnerLabel_0017
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0017', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0018
    // @tc.name AdaptOwnerLabel_0018
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0018', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0019
    // @tc.name AdaptOwnerLabel_0019
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0019', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0020
    // @tc.name AdaptOwnerLabel_0020
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0020', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0021
    // @tc.name AdaptOwnerLabel_0021
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":true,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0021', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0022
    // @tc.name AdaptOwnerLabel_0022
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":true,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0022', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0023
    // @tc.name AdaptOwnerLabel_0023
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":true,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0023', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0024
    // @tc.name AdaptOwnerLabel_0024
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":true,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0024', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0025
    // @tc.name AdaptOwnerLabel_0025
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":false,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0025', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0026
    // @tc.name AdaptOwnerLabel_0026
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":false,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0026', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0027
    // @tc.name AdaptOwnerLabel_0027
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":false,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0027', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0028
    // @tc.name AdaptOwnerLabel_0028
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":false,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0028', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0029
    // @tc.name AdaptOwnerLabel_0029
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":true,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0029', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0030
    // @tc.name AdaptOwnerLabel_0030
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":true,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0030', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0031
    // @tc.name AdaptOwnerLabel_0031
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":true,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0031', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0032
    // @tc.name AdaptOwnerLabel_0032
    // @tc.desc Verify owners {"mode":"Label","renamed":true,"remount":true,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0032', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = true;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Removed');
      await assertIdAbsent('owners-primary-container');
      await activateObservedOwner('owners-sibling-label', coordinates, await observeUiLayout());
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      await click('owners-toggle-primary');
      await waitText('owners-primary-state', 'Mounted');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:footer' },
        { prefix: 'owners-sibling', labels: 1, footers: 1, event: 'Sibling owner:label' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Renamed owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERLABEL_0033
    // @tc.name AdaptOwnerLabel_0033
    // @tc.desc Verify owners {"mode":"Label","renamed":false,"remount":false,"coordinates":false,"before":3,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerLabel_0033', 0, async (): Promise<void> => {
      await openHistory('owners');
      const coordinates: boolean = false;
      const initialOwners = await observeUiLayout();
      const siblingCaption = initialOwners.text('owners-sibling-caption');
      const siblingBefore = initialOwners.bounds('owners-sibling-container');
      expect(siblingCaption).assertEqual('Sibling owner');
      let checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 0, event: 'None' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ], initialOwners);
      expect(initialOwners.count('owners-primary-container')).assertEqual(1);
      expect(initialOwners.count('owners-sibling-container')).assertEqual(1);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 0, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 4, footers: 0, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 4, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      const finalOwners = checkedOwners;
      expect(finalOwners.text('owners-sibling-caption')).assertEqual(siblingCaption);
      assertRectClose(finalOwners.bounds('owners-sibling-container'), siblingBefore);
      expect(finalOwners.text('owners-primary-caption')).assertEqual('Primary owner');
      expect(finalOwners.count('owners-primary-label')).assertEqual(1);
      expect(finalOwners.count('owners-primary-footer')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-label')).assertEqual(1);
      expect(finalOwners.count('owners-sibling-footer')).assertEqual(1);
    });
  });
}
