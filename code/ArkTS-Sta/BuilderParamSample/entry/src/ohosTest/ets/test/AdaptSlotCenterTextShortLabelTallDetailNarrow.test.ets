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

// Reference: ets/test/Integration/DeviceCompatibility.test.ets (88 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptSlotCenterTextShortLabelTallDetailNarrowTests(): void {
  describe('AdaptSlotCenterTextShortLabelTallDetailNarrowTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('slots');
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTSHORTLABELTALLDETAILNARROW_0001
    // @tc.name AdaptSlotCenterTextShortLabelTallDetailNarrow_0001
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":false,"tallDetail":true,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextShortLabelTallDetailNarrow_0001', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: false, tallDetail: true, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTSHORTLABELTALLDETAILNARROW_0002
    // @tc.name AdaptSlotCenterTextShortLabelTallDetailNarrow_0002
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":false,"tallDetail":true,"narrow":true,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextShortLabelTallDetailNarrow_0002', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: false, tallDetail: true, narrow: true,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTSHORTLABELTALLDETAILNARROW_0003
    // @tc.name AdaptSlotCenterTextShortLabelTallDetailNarrow_0003
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":false,"tallDetail":true,"narrow":true,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextShortLabelTallDetailNarrow_0003', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: false, tallDetail: true, narrow: true,
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
  });
}
