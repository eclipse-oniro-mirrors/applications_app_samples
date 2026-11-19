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

// Reference: ets/test/Interaction/UIComponentRendering.test.ets (760 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptSlotCenterNestedTallLabelRemountWideTests(): void {
  describe('AdaptSlotCenterNestedTallLabelRemountWideTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('slots');
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0001
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0001
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0001', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0002
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0002
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0002', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0003
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0003
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0003', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0004
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0004
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0004', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0005
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0005
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0005', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0006
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0006
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0006', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0007
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0007
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0007', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0008
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0008
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0008', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0009
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0009
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0009', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0010
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0010
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0010', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0011
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0011
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0011', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0012
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0012
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0012', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0013
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0013
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0013', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0014
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0014
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0014', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0015
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0015
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0015', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0016
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0016
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"AlignmentCycle","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0016', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0017
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0017
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0017', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0018
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0018
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Observe","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0018', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDTALLLABELREMOUNTWIDE_0019
    // @tc.name AdaptSlotCenterNestedTallLabelRemountWide_0019
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip","remount":true}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedTallLabelRemountWide_0019', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
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
  });
}
