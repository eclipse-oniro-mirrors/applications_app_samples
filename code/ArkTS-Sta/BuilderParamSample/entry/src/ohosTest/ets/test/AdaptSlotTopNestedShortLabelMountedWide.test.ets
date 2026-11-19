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

// Reference: ets/test/PerformanceStability/PowerPerformance.test.ets (794 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptSlotTopNestedShortLabelMountedWideTests(): void {
  describe('AdaptSlotTopNestedShortLabelMountedWideTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('slots');
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0001
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0001
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0001', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0002
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0002
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0002', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0003
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0003
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0003', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene, true);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(rowBefore);
      assertContained(rowBefore, surfaceBefore);
      await slotCounts(0, 0, 0, 0);
      await assertSlotScene(scene, true);
      await slotCounts(0, 0, 0, 0);
      await assertIdAbsent('slots-card-container');
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0004
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0004
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0004', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 0, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0005
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0005
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0005', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 0, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-inner-label', true);
      await slotCounts(0, 0, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0006
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0006
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0006', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-inner-label', false);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0007
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0007
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0007', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0008
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0008
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0008', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0009
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0009
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0009', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 1, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0010
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0010
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0010', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0011
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0011
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0011', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0012
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0012
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0012', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 1);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0013
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0013
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0013', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0014
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0014
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0014', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0015
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0015
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0015', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene, true);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(rowBefore);
      assertContained(rowBefore, surfaceBefore);
      await slotCounts(0, 0, 0, 0);
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
      await slotCounts(0, 0, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-row', rowBefore);
      await assertSlotScene(scene, true);
      await slotCounts(0, 0, 0, 0);
      await assertIdAbsent('slots-card-container');
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0016
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0016
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0016', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0017
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0017
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0017', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 0, 0, 1);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-inner-label', true);
      await slotCounts(0, 0, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0018
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0018
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0018', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 0, 0, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0019
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0019
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0019', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 0.64);
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0020
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0020
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0020', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0021
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0021
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0021', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0022
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0022
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0022', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: true, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0023
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0023
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0023', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 1);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTTOPNESTEDSHORTLABELMOUNTEDWIDE_0024
    // @tc.name AdaptSlotTopNestedShortLabelMountedWide_0024
    // @tc.desc Verify slots {"alignment":"Top","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotTopNestedShortLabelMountedWide_0024', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Top', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: false,
        label: false, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      const surfaceBefore = await bounds('slots-surface');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
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
  });
}
