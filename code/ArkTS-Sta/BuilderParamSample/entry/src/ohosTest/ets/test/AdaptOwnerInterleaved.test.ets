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

// Reference: ets/test/Validation/InputValidation.test.ets (684 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptOwnerInterleavedTests(): void {
  describe('AdaptOwnerInterleavedTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('owners');
    });

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0001
    // @tc.name AdaptOwnerInterleaved_0001
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":false,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0001', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0002
    // @tc.name AdaptOwnerInterleaved_0002
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":false,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0002', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0003
    // @tc.name AdaptOwnerInterleaved_0003
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":false,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0003', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0004
    // @tc.name AdaptOwnerInterleaved_0004
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":false,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0004', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0005
    // @tc.name AdaptOwnerInterleaved_0005
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":true,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0005', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0006
    // @tc.name AdaptOwnerInterleaved_0006
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":true,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0006', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0007
    // @tc.name AdaptOwnerInterleaved_0007
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":true,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0007', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0008
    // @tc.name AdaptOwnerInterleaved_0008
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":true,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0008', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0009
    // @tc.name AdaptOwnerInterleaved_0009
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":true,"remount":false,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0009', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 2, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0010
    // @tc.name AdaptOwnerInterleaved_0010
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":true,"remount":false,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0010', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 2, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0011
    // @tc.name AdaptOwnerInterleaved_0011
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":true,"remount":false,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0011', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 2, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0012
    // @tc.name AdaptOwnerInterleaved_0012
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":true,"remount":false,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0012', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Renamed owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 2, event: 'Renamed owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0013
    // @tc.name AdaptOwnerInterleaved_0013
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":true,"remount":true,"coordinates":false,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0013', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0014
    // @tc.name AdaptOwnerInterleaved_0014
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":true,"remount":true,"coordinates":false,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0014', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0015
    // @tc.name AdaptOwnerInterleaved_0015
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":true,"remount":true,"coordinates":true,"before":2,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0015', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0016
    // @tc.name AdaptOwnerInterleaved_0016
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":true,"remount":true,"coordinates":true,"before":2,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0016', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await click('owners-rename-primary');
      await waitText('owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Renamed owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0017
    // @tc.name AdaptOwnerInterleaved_0017
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":false,"coordinates":false,"before":3,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0017', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0018
    // @tc.name AdaptOwnerInterleaved_0018
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":false,"coordinates":false,"before":3,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0018', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0019
    // @tc.name AdaptOwnerInterleaved_0019
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":false,"coordinates":true,"before":3,"resume":false}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0019', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 2, event: 'Primary owner:footer' },
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

    // @tc.number SUB_SAMPLE_ADAPTOWNERINTERLEAVED_0020
    // @tc.name AdaptOwnerInterleaved_0020
    // @tc.desc Verify owners {"mode":"Interleaved","renamed":false,"remount":false,"coordinates":true,"before":3,"resume":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptOwnerInterleaved_0020', 0, async (): Promise<void> => {
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
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 1, footers: 1, event: 'Primary owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 0, event: 'None' },
      ]);
      await activateObservedOwner('owners-sibling-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await backgroundAndRestore('FixtureAbility', 'owners-primary-caption', 'Primary owner');
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 2, footers: 1, event: 'Primary owner:label' },
        { prefix: 'owners-sibling', labels: 0, footers: 1, event: 'Sibling owner:footer' },
      ]);
      await activateObservedOwner('owners-primary-label', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 1, event: 'Primary owner:label' },
      ]);
      await activateObservedOwner('owners-primary-footer', coordinates, checkedOwners);
      checkedOwners = await ownerStates([
        { prefix: 'owners-primary', labels: 3, footers: 2, event: 'Primary owner:footer' },
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
