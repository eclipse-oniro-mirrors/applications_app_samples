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
import { describe, it, expect } from '@ohos/hypium';
import { bounds, click, inside, waitText } from './SharedDriver';
import { bottomFollowsRow, openHistory, sameRect, slotCounts } from './HistoryDriver';

export default function layoutHistoryTests(): void {
  describe('LayoutHistoryTest', () => {
    it('LayoutHistory_widthRoundTripPreservesSlotStateAndRestoresBounds', 0, async () => {
      await openHistory('slots');
      const original = await bounds('slots-card-container');
      const originalRow = await bounds('slots-card-row');
      await click('slots-label');
      await slotCounts(1, 0, 0, 0);
      await click('slots-toggle-width');
      const narrow = await bounds('slots-card-container');
      expect(Math.abs((narrow.right - narrow.left) - (original.right - original.left) * 0.64) <= 3).assertTrue();
      inside(await bounds('slots-card-row'), narrow);
      inside(await bounds('slots-bottom'), narrow);
      await click('slots-bottom');
      await slotCounts(1, 1, 0, 0);
      await click('slots-toggle-width');
      sameRect(await bounds('slots-card-container'), original);
      sameRect(await bounds('slots-card-row'), originalRow);
      await slotCounts(1, 1, 0, 0);
    });

    it('LayoutHistory_alignmentCycleReturnsToCenterWithoutReplacingCallbacks', 0, async () => {
      await openHistory('slots');
      const original = await bounds('slots-label');
      await click('slots-label');
      await slotCounts(1, 0, 0, 0);
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      expect(Math.abs((await bounds('slots-label')).top - (await bounds('slots-detail-text')).top) <= 2).assertTrue();
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      expect(Math.abs((await bounds('slots-label')).bottom - (await bounds('slots-detail-text')).bottom) <= 2).assertTrue();
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      sameRect(await bounds('slots-label'), original);
      await click('slots-label');
      await slotCounts(2, 0, 0, 0);
      await bottomFollowsRow();
    });

    it('LayoutHistory_labelBecomesTallestChildAndDetailTracksAlignment', 0, async () => {
      await openHistory('slots');
      const originalRow = await bounds('slots-card-row');
      await click('slots-grow-label');
      const label = await bounds('slots-label');
      const detail = await bounds('slots-detail-text');
      expect(label.bottom - label.top > detail.bottom - detail.top).assertTrue();
      expect(Math.abs(label.top + label.bottom - detail.top - detail.bottom) <= 2).assertTrue();
      await click('slots-align');
      await waitText('slots-alignment', 'Top');
      expect(Math.abs((await bounds('slots-label')).top - (await bounds('slots-detail-text')).top) <= 2).assertTrue();
      await click('slots-align');
      await waitText('slots-alignment', 'Bottom');
      expect(Math.abs((await bounds('slots-label')).bottom - (await bounds('slots-detail-text')).bottom) <= 2).assertTrue();
      expect((await bounds('slots-detail-text')).top > (await bounds('slots-label')).top).assertTrue();
      await bottomFollowsRow();
      await click('slots-grow-label');
      await click('slots-align');
      await waitText('slots-alignment', 'Center');
      sameRect(await bounds('slots-card-row'), originalRow);
    });

    it('LayoutHistory_nestedCardReflowsWithinChangingOuterWidth', 0, async () => {
      await openHistory('slots');
      await click('slots-use-nested');
      await waitText('slots-inner-detail', 'Inner detail');
      const originalInner = await bounds('slots-inner-container');
      const originalOuter = await bounds('slots-card-row');
      await click('slots-toggle-width');
      const narrowInner = await bounds('slots-inner-container');
      const narrowOuter = await bounds('slots-card-row');
      expect(narrowInner.right - narrowInner.left < originalInner.right - originalInner.left).assertTrue();
      inside(narrowInner, narrowOuter);
      inside(await bounds('slots-inner-label'), await bounds('slots-inner-row'));
      inside(await bounds('slots-inner-detail'), await bounds('slots-inner-row'));
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-toggle-width');
      sameRect(await bounds('slots-inner-container'), originalInner);
      sameRect(await bounds('slots-card-row'), originalOuter);
      await slotCounts(0, 0, 0, 1);
    });
  });
}
