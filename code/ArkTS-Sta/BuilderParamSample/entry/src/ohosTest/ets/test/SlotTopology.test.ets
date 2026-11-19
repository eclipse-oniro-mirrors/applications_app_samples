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
import { bounds, click, exists, inside, node, positive, text, waitText } from './SharedDriver';
import { bottomFollowsRow, openHistory, sameRect, slotCounts } from './HistoryDriver';

export default function slotTopologyTests(): void {
  describe('SlotTopologyTest', () => {
    it('SlotTopology_removingLabelReleasesSpaceAndRestoresDetailPosition', 0, async () => {
      await openHistory('slots');
      const original = await bounds('slots-detail-text');
      const label = await bounds('slots-label');
      await click('slots-toggle-label');
      expect(await exists('slots-label')).assertFalse();
      const released = await bounds('slots-detail-text');
      expect(released.left < original.left).assertTrue();
      expect(Math.abs(released.right - original.right) <= 2).assertTrue();
      expect(await text('slots-bottom')).assertEqual('Footer action');
      await click('slots-toggle-label');
      sameRect(await bounds('slots-label'), label);
      sameRect(await bounds('slots-detail-text'), original);
      await click('slots-label');
      await slotCounts(1, 0, 0, 0);
    });

    it('SlotTopology_removingDetailKeepsLabelAndBottomBuildersMounted', 0, async () => {
      await openHistory('slots');
      const row = await bounds('slots-card-row');
      await click('slots-toggle-detail');
      expect(await exists('slots-detail-text')).assertFalse();
      positive(await bounds('slots-label'));
      await click('slots-label');
      await click('slots-bottom');
      await slotCounts(1, 1, 0, 0);
      const reduced = await bounds('slots-card-row');
      expect(reduced.bottom - reduced.top < row.bottom - row.top).assertTrue();
      await bottomFollowsRow();
      await click('slots-toggle-detail');
      await waitText('slots-detail-text', 'Detail text');
      sameRect(await bounds('slots-card-row'), row);
      await slotCounts(1, 1, 0, 0);
    });

    it('SlotTopology_emptyRowBuildersDoNotConsumeTheBottomBuilder', 0, async () => {
      await openHistory('slots');
      await click('slots-toggle-label');
      await click('slots-toggle-detail');
      expect(await exists('slots-label')).assertFalse();
      expect(await exists('slots-detail-text')).assertFalse();
      positive(await bounds('slots-card-row'));
      positive(await bounds('slots-bottom'));
      await bottomFollowsRow();
      await click('slots-bottom');
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-detail');
      await waitText('slots-detail-text', 'Detail text');
      expect(await exists('slots-label')).assertFalse();
      inside(await bounds('slots-detail-text'), await bounds('slots-card-row'));
    });

    it('SlotTopology_restoredBottomCallbackContinuesItsOwnerCounter', 0, async () => {
      await openHistory('slots');
      await click('slots-bottom');
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-bottom');
      expect(await exists('slots-bottom')).assertFalse();
      const row = await bounds('slots-card-row');
      expect(Math.abs((await bounds('slots-card-container')).bottom - row.bottom) <= 2).assertTrue();
      await click('slots-label');
      await slotCounts(1, 1, 0, 0);
      await click('slots-toggle-bottom');
      await waitText('slots-bottom', 'Footer action');
      await click('slots-bottom');
      await slotCounts(1, 2, 0, 0);
      await bottomFollowsRow();
    });

    it('SlotTopology_detailNodeTypeReplacementRemovesTheOldEventTarget', 0, async () => {
      await openHistory('slots');
      expect(await (await node('slots-detail-text')).isClickable()).assertFalse();
      await click('slots-use-button');
      await waitText('slots-detail-button', 'Detail action');
      expect(await exists('slots-detail-text')).assertFalse();
      expect(await (await node('slots-detail-button')).isClickable()).assertTrue();
      await click('slots-detail-button');
      await slotCounts(0, 0, 1, 0);
      await click('slots-use-text');
      await waitText('slots-detail-text', 'Detail text');
      expect(await exists('slots-detail-button')).assertFalse();
      expect(await (await node('slots-detail-text')).isClickable()).assertFalse();
      await click('slots-label');
      await slotCounts(1, 0, 1, 0);
    });

    it('SlotTopology_detailHeightExpansionMovesAndRestoresTheBottomRoot', 0, async () => {
      await openHistory('slots');
      const originalDetail = await bounds('slots-detail-text');
      const originalRow = await bounds('slots-card-row');
      const originalBottom = await bounds('slots-bottom');
      await click('slots-grow-detail');
      const expanded = await bounds('slots-detail-text');
      expect(expanded.bottom - expanded.top > originalDetail.bottom - originalDetail.top).assertTrue();
      expect((await bounds('slots-card-row')).bottom > originalRow.bottom).assertTrue();
      expect((await bounds('slots-bottom')).top > originalBottom.top).assertTrue();
      await bottomFollowsRow();
      await click('slots-grow-detail');
      sameRect(await bounds('slots-detail-text'), originalDetail);
      sameRect(await bounds('slots-card-row'), originalRow);
      sameRect(await bounds('slots-bottom'), originalBottom);
    });

    it('SlotTopology_multipleBottomRootsKeepTheirOrderWithoutAnExtraWrapper', 0, async () => {
      await openHistory('slots');
      const originalContainer = await bounds('slots-card-container');
      const originalBottom = await bounds('slots-bottom');
      await click('slots-toggle-extra');
      await waitText('slots-bottom-extra', 'Second footer root');
      const extra = await bounds('slots-bottom-extra');
      expect(extra.top >= (await bounds('slots-bottom')).bottom - 1).assertTrue();
      inside(extra, await bounds('slots-card-container'));
      sameRect(await bounds('slots-bottom'), originalBottom);
      expect((await bounds('slots-card-container')).bottom > originalContainer.bottom).assertTrue();
      await click('slots-bottom');
      await slotCounts(0, 1, 0, 0);
      await click('slots-toggle-extra');
      expect(await exists('slots-bottom-extra')).assertFalse();
      sameRect(await bounds('slots-card-container'), originalContainer);
    });

    it('SlotTopology_nestedCardKeepsInnerAndOuterCallbacksDistinct', 0, async () => {
      await openHistory('slots');
      await click('slots-use-nested');
      await waitText('slots-inner-detail', 'Inner detail');
      expect(await exists('slots-detail-text')).assertFalse();
      const inner = await bounds('slots-inner-container');
      inside(inner, await bounds('slots-card-row'));
      inside(await bounds('slots-inner-label'), await bounds('slots-inner-row'));
      expect((await bounds('slots-inner-bottom')).top >= (await bounds('slots-inner-row')).bottom - 1).assertTrue();
      await click('slots-inner-label');
      await slotCounts(0, 0, 0, 1);
      await click('slots-label');
      await click('slots-bottom');
      await slotCounts(1, 1, 0, 1);
      expect(await text('slots-inner-bottom')).assertEqual('Inner footer');
      await bottomFollowsRow();
    });
  });
}
