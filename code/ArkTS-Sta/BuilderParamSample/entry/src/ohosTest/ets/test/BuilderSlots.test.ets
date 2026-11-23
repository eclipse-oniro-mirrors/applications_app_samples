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
import { openFixture, text, bounds, exists, click, inside } from './SharedDriver';

export default function builderSlotsTests(): void {
  describe('BuilderSlotsTest', () => {
    it('BuilderSlots_explicitThreeBuildersKeepTheirOwnPositions', 0, async () => {
      await openFixture('explicit');
      expect(await text('fixture-label')).assertEqual('Label');
      expect(await text('fixture-detail')).assertEqual('Initial detail');
      expect(await text('fixture-bottom')).assertEqual('Bottom');
      const row = await bounds('fixture-card-row');
      inside(await bounds('fixture-label'), row);
      inside(await bounds('fixture-detail'), row);
      expect((await bounds('fixture-bottom')).top >= row.bottom - 1).assertTrue();
    });

    it('BuilderSlots_trailingClosureFillsLabelWithoutReplacingOtherBuilders', 0, async () => {
      await openFixture('trailing');
      expect(await text('fixture-label')).assertEqual('Label');
      expect(await text('fixture-detail')).assertEqual('Initial detail');
      expect(await text('fixture-bottom')).assertEqual('Bottom');
      expect((await bounds('fixture-label')).right <= (await bounds('fixture-detail')).left + 1).assertTrue();
    });

    it('BuilderSlots_emptyBottomProducesNoPlaceholder', 0, async () => {
      await openFixture('empty');
      expect(await exists('fixture-bottom')).assertFalse();
      expect(await text('fixture-label')).assertEqual('Label');
      expect(await text('fixture-detail')).assertEqual('Initial detail');
      const container = await bounds('fixture-card-container');
      const row = await bounds('fixture-card-row');
      expect(Math.abs(container.bottom - row.bottom) <= 1).assertTrue();
    });

    it('BuilderSlots_defaultCenterAlignsUnequalHeightBuilders', 0, async () => {
      await openFixture('explicit');
      const label = await bounds('fixture-label');
      const detail = await bounds('fixture-detail');
      expect(detail.bottom - detail.top > label.bottom - label.top).assertTrue();
      expect(Math.abs((label.top + label.bottom) - (detail.top + detail.bottom)) <= 2).assertTrue();
    });

    it('BuilderSlots_topAlignmentPropUpdatesTheRealRow', 0, async () => {
      await openFixture('trailing');
      await click('align-top');
      expect(Math.abs((await bounds('fixture-label')).top - (await bounds('fixture-detail')).top) <= 2).assertTrue();
      expect((await bounds('fixture-bottom')).top >= (await bounds('fixture-card-row')).bottom - 1).assertTrue();
    });

    it('BuilderSlots_bottomAlignmentPropUpdatesTheRealRow', 0, async () => {
      await openFixture('trailing');
      await click('align-bottom');
      expect(Math.abs((await bounds('fixture-label')).bottom - (await bounds('fixture-detail')).bottom) <= 2).assertTrue();
      expect((await bounds('fixture-label')).top > (await bounds('fixture-detail')).top).assertTrue();
    });

    it('BuilderSlots_generalWidthAppliesToWholeCardIncludingBottomSlot', 0, async () => {
      await openFixture('explicit');
      const row = await bounds('fixture-card-row');
      const container = await bounds('fixture-card-container');
      expect(Math.abs(row.left - container.left) <= 1).assertTrue();
      expect(Math.abs(row.right - container.right) <= 1).assertTrue();
      inside(await bounds('fixture-bottom'), container);
      expect((await bounds('fixture-bottom')).bottom > row.bottom).assertTrue();
    });
  });
}
