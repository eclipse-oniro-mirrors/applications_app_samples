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

// Reference: ets/test/PowerDialog/PowerOperationCatalog.test.ets (1045 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptSlotBottomTextTallLabelShortDetailNarrowTests(): void {
  describe('AdaptSlotBottomTextTallLabelShortDetailNarrowTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('slots');
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0001
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0001
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0001', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0002
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0002
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0002', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0003
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0003
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0003', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0004
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0004
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0004', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      assertWidthRatio(resized, surfaceBefore, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0005
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0005
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0005', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0006
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0006
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0006', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0007
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0007
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0007', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0008
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0008
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0008', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      assertWidthRatio(resized, surfaceBefore, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0009
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0009
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0009', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      assertWidthRatio(resized, surfaceBefore, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0010
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0010
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0010', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0011
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0011
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0011', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0012
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0012
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0012', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0013
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0013
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0013', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0014
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0014
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0014', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0015
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0015
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0015', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      assertWidthRatio(resized, surfaceBefore, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0016
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0016
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0016', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0017
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0017
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0017', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0018
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0018
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0018', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0019
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0019
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0019', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      assertWidthRatio(resized, surfaceBefore, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0020
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0020
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0020', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0021
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0021
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0021', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0022
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0022
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0022', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0023
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0023
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0023', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0024
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0024
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0024', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0025
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0025
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0025', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0026
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0026
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0026', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0027
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0027
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0027', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await assertSlotScene(scene, true);
      await slotCounts(0, 0, 0, 0);
      await assertIdAbsent('slots-card-container');
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0028
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0028
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0028', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0029
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0029
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0029', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      assertRectClose(await bounds('slots-surface'), surfaceBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0030
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0030
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0030', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await click('slots-toggle-width');
      const resized = await bounds('slots-card-container');
      assertWidthRatio(resized, surfaceBefore, 1);
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0031
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0031
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0031', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTBOTTOMTEXTTALLLABELSHORTDETAILNARROW_0032
    // @tc.name AdaptSlotBottomTextTallLabelShortDetailNarrow_0032
    // @tc.desc Verify slots {"alignment":"Bottom","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":true,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotBottomTextTallLabelShortDetailNarrow_0032', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Bottom', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: true,
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
      await backgroundAndRestore('FixtureAbility', 'slots-alignment', scene.alignment);
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
  });
}
