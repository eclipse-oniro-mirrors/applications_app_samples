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
  assertContained, assertVerticalAlignment, assertRectClose, assertAbove,
  assertUniqueId, assertIdAbsent, waitForOriginalBounds, backgroundAndRestore } from './SharedDriver';

// Reference: ets/test/Interaction/FocusNavigation.test.ets (1191 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptSlotCenterNestedShortLabelMountedNarrowTests(): void {
  describe('AdaptSlotCenterNestedShortLabelMountedNarrowTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('slots');
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0001
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0001
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0001', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0002
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0002
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0002', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0003
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0003
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0003', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene, true);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(rowBefore);
      await slotCounts(0, 0, 0, 0);
      await assertSlotScene(scene, true);
      await slotCounts(0, 0, 0, 0);
      await assertIdAbsent('slots-card-container');
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0004
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0004
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0004', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 0, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0005
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0005
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0005', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 0, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-inner-label', true);
      await slotCounts(0, 0, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0006
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0006
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0006', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0007
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0007
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0007', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0008
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0008
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0008', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0009
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0009
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0009', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 1, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0010
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0010
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0010', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0011
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0011
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0011', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0012
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0012
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0012', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0013
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0013
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0013', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0014
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0014
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0014', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 1, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0015
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0015
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0015', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene, true);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(rowBefore);
      await slotCounts(0, 0, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-row');
      expect(resized.bottom - resized.top <= 2).assertTrue();
      await assertIdAbsent('slots-card-container');
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
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0016
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0016
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0016', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0017
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0017
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0017', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-inner-label', true);
      await slotCounts(0, 0, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0018
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0018
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0018', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0019
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0019
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0019', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0020
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0020
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0020', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0021
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0021
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0021', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0022
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0022
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0022', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0023
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0023
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0023', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0024
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0024
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0024', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0025
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0025
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0025', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 1, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0026
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0026
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0026', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 1, 0, 1);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      assertVerticalAlignment(await bounds('slots-label'), await bounds(detailId(scene.kind)), 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      assertVerticalAlignment(await bounds('slots-label'), await bounds(detailId(scene.kind)), 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      assertVerticalAlignment(await bounds('slots-label'), await bounds(detailId(scene.kind)), 'Center');
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0027
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0027
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0027', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene, true);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(rowBefore);
      await slotCounts(0, 0, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene, true);
      await slotCounts(0, 0, 0, 0);
      await assertIdAbsent('slots-card-container');
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0028
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0028
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0028', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0029
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0029
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0029', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 0, 0, 1);
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-inner-label', true);
      await slotCounts(0, 0, 0, 2);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0030
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0030
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0030', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: true, footer: false, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(1, 0, 0, 1);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(1, 0, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(1, 0, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 0, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0031
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0031
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0031', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0032
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0032
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0032', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0033
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0033
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0033', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0034
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0034
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0034', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: true, detail: false, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-label', false);
      await slotCounts(1, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(1, 1, 0, 0);
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0035
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0035
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0035', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: true, extraFooter: false
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
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
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERNESTEDSHORTLABELMOUNTEDNARROW_0036
    // @tc.name AdaptSlotCenterNestedShortLabelMountedNarrow_0036
    // @tc.desc Verify slots {"alignment":"Center","kind":"Nested","tallLabel":false,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterNestedShortLabelMountedNarrow_0036', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Nested',
        tallLabel: false, tallDetail: false, narrow: true,
        label: false, detail: true, footer: true, extraFooter: true
      };
      await prepareSlotScene(scene);
      await assertSlotScene(scene);
      expect(await text('slots-alignment')).assertEqual(scene.alignment);
      const containerBefore = await bounds('slots-card-container');
      const rowBefore = await bounds('slots-card-row');
      assertPositiveRect(containerBefore);
      assertContained(rowBefore, containerBefore);
      await slotCounts(0, 0, 0, 0);
      await activateSlot('slots-bottom', false);
      await slotCounts(0, 1, 0, 0);
      await activateSlot('slots-inner-label', false);
      await slotCounts(0, 1, 0, 1);
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertContained(await bounds('slots-card-row'), resized);
      await slotCounts(0, 1, 0, 1);
      await click('slots-toggle-width');
      await waitForOriginalBounds('slots-card-container', containerBefore);
      await assertSlotScene(scene);
      await slotCounts(0, 1, 0, 1);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-bottom', true);
      await slotCounts(0, 2, 0, 1);
    });
  });
}
