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
  assertSlotLayout, assertEmptySlotLayout, assertSlotScene, activateSlot } from './AdaptationMatrixDriver';
import { openHistory, slotCounts, ownerState } from './HistoryDriver';
import { bounds, click, exists, text, node, waitText, waitClearedText, assertPositiveRect,
  assertContained, assertWidthRatio, assertVerticalAlignment, assertRectClose, assertAbove,
  assertUniqueId, assertIdAbsent, waitForOriginalBounds, backgroundAndRestore } from './SharedDriver';

// Reference: ets/test/Validation/CommonEventUtilValidation.test.ets (1224 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptSlotBottomNestedTallLabelRemountWideTests(): void {
  describe('AdaptSlotBottomNestedTallLabelRemountWideTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('slots');
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0001
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0001
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0001', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 2);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0002
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0002
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0002', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 2);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0003
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0003
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0003', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene, true);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(rowBefore);
      assertContained(rowBefore, surfaceBefore);
      await slotCounts(0, 0, 0, 1);
      await assertSlotScene(scene, true);
      await slotCounts(0, 0, 0, 1);
      await assertIdAbsent('slots-card-container');
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0004
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0004
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0004', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 0, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0005
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0005
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0005', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 0, 0, 2);
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-inner-label', true);
      await slotCounts(0, 0, 0, 3);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0006
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0006
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0006', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 0, 0, 2);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0007
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0007
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0007', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 1);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0008
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0008
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0008', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 1);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(0, 1, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0009
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0009
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0009', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 1, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0010
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0010
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0010', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0011
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0011
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0011', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 2);
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0012
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0012
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0012', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 2);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0013
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0013
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0013', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 2);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0014
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0014
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0014', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 2);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 1, 0, 2);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0015
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0015
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0015', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene, true);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(rowBefore);
      assertContained(rowBefore, surfaceBefore);
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-row');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      expect(resized.bottom - resized.top <= 2).assertTrue();
      await assertIdAbsent('slots-card-container');
      assertContained(resized, await bounds('slots-surface'));
      const resizedScene: SlotScene = {
        alignment: scene.alignment, kind: scene.kind,
        tallLabel: scene.tallLabel, tallDetail: scene.tallDetail, narrow: !scene.narrow,
        label: scene.label, detail: scene.detail, footer: scene.footer, extraFooter: scene.extraFooter
      };
      await assertEmptySlotLayout(resizedScene);
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-row', rowBefore);
      await assertSlotScene(scene, true);
      await slotCounts(0, 0, 0, 1);
      await assertIdAbsent('slots-card-container');
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0016
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0016
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0016', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0017
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0017
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0017', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 0, 0, 2);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-inner-label', true);
      await slotCounts(0, 0, 0, 3);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0018
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0018
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0018', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 0, 0, 2);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0019
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0019
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0019', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 1);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(0, 1, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0020
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0020
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0020', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0021
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0021
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0021', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0022
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0022
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0022', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0023
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0023
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0023', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 2);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0024
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0024
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0024', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 2);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0025
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0025
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0025', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 2);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 1, 0, 2);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0026
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0026
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0026', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 2);
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      assertVerticalAlignment(await bounds('slots-label'), await bounds(detailId(scene.kind)), 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      assertVerticalAlignment(await bounds('slots-label'), await bounds(detailId(scene.kind)), 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      assertVerticalAlignment(await bounds('slots-label'), await bounds(detailId(scene.kind)), 'Bottom');
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0027
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0027
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0027', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene, true);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(rowBefore);
      assertContained(rowBefore, surfaceBefore);
      await slotCounts(0, 0, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene, true);
      await slotCounts(0, 0, 0, 1);
      await assertIdAbsent('slots-card-container');
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0028
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0028
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0028', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-toggle-detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0029
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0029
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0029', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: false, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 0, 0, 2);
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-inner-label', true);
      await slotCounts(0, 0, 0, 3);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMNESTEDTALLLABELREMOUNTWIDE_0030
    // @tc.name AdaptSlotBottomNestedTallLabelRemountWide_0030
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomNestedTallLabelRemountWide_0030', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: false,
        label: true, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await waitText('slots-inner-detail', 'Inner detail');
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-detail');
      expect(await exists('slots-inner-container')).assertFalse();
      await click('slots-toggle-detail');
      await waitText('slots-inner-detail', 'Inner detail');
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 1);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 1);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 0, 0, 2);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 0, 0, 2);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 2);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 2);
    });
  });
}
