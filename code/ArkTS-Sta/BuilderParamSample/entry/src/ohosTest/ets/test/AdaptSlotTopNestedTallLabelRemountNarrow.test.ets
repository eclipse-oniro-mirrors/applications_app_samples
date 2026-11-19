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

// Reference: ets/test/PowerDialog/PowerDialogStress.test.ets (126 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptSlotTopNestedTallLabelRemountNarrowTests(): void {
  describe('AdaptSlotTopNestedTallLabelRemountNarrowTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('slots');
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDTALLLABELREMOUNTNARROW_0001
    // @tc.name AdaptSlotTopNestedTallLabelRemountNarrow_0001
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedTallLabelRemountNarrow_0001', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDTALLLABELREMOUNTNARROW_0002
    // @tc.name AdaptSlotTopNestedTallLabelRemountNarrow_0002
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedTallLabelRemountNarrow_0002', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDTALLLABELREMOUNTNARROW_0003
    // @tc.name AdaptSlotTopNestedTallLabelRemountNarrow_0003
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedTallLabelRemountNarrow_0003', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDTALLLABELREMOUNTNARROW_0004
    // @tc.name AdaptSlotTopNestedTallLabelRemountNarrow_0004
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedTallLabelRemountNarrow_0004', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: true, tallDetail: false, narrow: true,
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
      assertWidthRatio(resized, surfaceBefore, 1);
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
  });
}
