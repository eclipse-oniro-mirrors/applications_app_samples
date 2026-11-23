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

// Reference: ets/test/Validation/FocusManagerValidation.test.ets (1178 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptOwnerFooterTests(): void {
  describe('AdaptOwnerFooterTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('owners');
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0001
    // @tc.name AdaptOwnerFooter_0001
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":false,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0001', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0002
    // @tc.name AdaptOwnerFooter_0002
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":false,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0002', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0003
    // @tc.name AdaptOwnerFooter_0003
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":true,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0003', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0004
    // @tc.name AdaptOwnerFooter_0004
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":true,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0004', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0005
    // @tc.name AdaptOwnerFooter_0005
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":true,"coordinates":false,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0005', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0006
    // @tc.name AdaptOwnerFooter_0006
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":true,"coordinates":false,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0006', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0007
    // @tc.name AdaptOwnerFooter_0007
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":true,"coordinates":true,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0007', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0008
    // @tc.name AdaptOwnerFooter_0008
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":true,"coordinates":true,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0008', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0009
    // @tc.name AdaptOwnerFooter_0009
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":false,"coordinates":false,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0009', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0010
    // @tc.name AdaptOwnerFooter_0010
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":false,"coordinates":false,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0010', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0011
    // @tc.name AdaptOwnerFooter_0011
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":false,"coordinates":true,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0011', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0012
    // @tc.name AdaptOwnerFooter_0012
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":false,"coordinates":true,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0012', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0013
    // @tc.name AdaptOwnerFooter_0013
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":true,"coordinates":false,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0013', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0014
    // @tc.name AdaptOwnerFooter_0014
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":true,"coordinates":false,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0014', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0015
    // @tc.name AdaptOwnerFooter_0015
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":true,"coordinates":true,"before":1,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0015', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0016
    // @tc.name AdaptOwnerFooter_0016
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":true,"coordinates":true,"before":1,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0016', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0017
    // @tc.name AdaptOwnerFooter_0017
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0017', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0018
    // @tc.name AdaptOwnerFooter_0018
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0018', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0019
    // @tc.name AdaptOwnerFooter_0019
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0019', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0020
    // @tc.name AdaptOwnerFooter_0020
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0020', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0021
    // @tc.name AdaptOwnerFooter_0021
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":true,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0021', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0022
    // @tc.name AdaptOwnerFooter_0022
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":true,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0022', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0023
    // @tc.name AdaptOwnerFooter_0023
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":true,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0023', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0024
    // @tc.name AdaptOwnerFooter_0024
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":true,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0024', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0025
    // @tc.name AdaptOwnerFooter_0025
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":false,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0025', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0026
    // @tc.name AdaptOwnerFooter_0026
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":false,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0026', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0027
    // @tc.name AdaptOwnerFooter_0027
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":false,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0027', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0028
    // @tc.name AdaptOwnerFooter_0028
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":false,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0028', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 2, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0029
    // @tc.name AdaptOwnerFooter_0029
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":true,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0029', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0030
    // @tc.name AdaptOwnerFooter_0030
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":true,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0030', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0031
    // @tc.name AdaptOwnerFooter_0031
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":true,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0031', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0032
    // @tc.name AdaptOwnerFooter_0032
    // @tc.desc Verify owners {"mode":"Footer","renamed":true,"remount":true,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0032', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0033
    // @tc.name AdaptOwnerFooter_0033
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":false,"before":3,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0033', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 3, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 4, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0034
    // @tc.name AdaptOwnerFooter_0034
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":false,"before":3,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0034', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 3, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 3, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 4, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERFOOTER_0035
    // @tc.name AdaptOwnerFooter_0035
    // @tc.desc Verify owners {"mode":"Footer","renamed":false,"remount":false,"coordinates":true,"before":3,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerFooter_0035', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 2, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 0, footers: 3, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 3, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 4, event: 'Primary owner:footer' },
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
