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

// Reference: ets/test/Integration/IntegrationTesting.test.ets (353 original lines).
// Explicit parameter cases are retained for independent DevEco selection and failure attribution.
export default function adaptSlotCenterTextTallLabelShortDetailWideTests(): void {
  describe('AdaptSlotCenterTextTallLabelShortDetailWideTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await openHistory('slots');
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0001
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0001
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0001', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0002
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0002
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":true,"extraFooter":true,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0002', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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
      await assertSlotScene(scene);
      await slotCounts(1, 1, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await activateSlot('slots-label', true);
      await slotCounts(2, 1, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0003
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0003
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":false,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0003', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0004
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0004
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":false,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0004', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0005
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0005
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":false,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0005', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      await assertSlotScene(scene);
      await slotCounts(0, 0, 0, 0);
      assertRectClose(await bounds('slots-card-container'), containerBefore);
      assertRectClose(await bounds('slots-card-row'), rowBefore);
      await assertUniqueId('slots-card-container');
      await assertUniqueId('slots-card-row');
      await slotCounts(0, 0, 0, 0);
    });

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0006
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0006
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":true,"footer":false,"extraFooter":false,"operation":"Resume"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0006', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0007
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0007
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":false,"operation":"Observe"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0007', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0008
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0008
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":false,"footer":true,"extraFooter":true,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0008', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0009
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0009
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":false,"operation":"WidthRoundTrip"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0009', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0010
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0010
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":true,"detail":false,"footer":true,"extraFooter":true,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0010', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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

    // @tc.number SUB_SAMPLE_ADAPTSLOTCENTERTEXTTALLLABELSHORTDETAILWIDE_0011
    // @tc.name AdaptSlotCenterTextTallLabelShortDetailWide_0011
    // @tc.desc Verify slots {"alignment":"Center","kind":"Text","tallLabel":true,"tallDetail":false,"narrow":false,"label":false,"detail":true,"footer":true,"extraFooter":false,"operation":"AlignmentCycle"}
    // @tc.size MediumTest
    // @tc.type Function
    // @tc.level Level 2
    it('AdaptSlotCenterTextTallLabelShortDetailWide_0011', 0, async (): Promise<void> => {
      const scene: SlotScene = {
        alignment: 'Center', kind: 'Text',
        tallLabel: true, tallDetail: false, narrow: false,
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
  });
}
