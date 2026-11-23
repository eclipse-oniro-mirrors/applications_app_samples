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
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { assertSelection, bounds, requireId, resetPage, selectTab, TITLES } from './SharedDriver';

export default function tabSelectionTests(): void {
  describe('TabSelectionTest', () => {
    beforeEach(async () => { await resetPage(); });

    it('TabSelectionTest_clickSecondTabDeselectsHome', 0, async () => {
      await selectTab(1);
      await assertSelection(1);
    });

    it('TabSelectionTest_titleAndIconClicksSelectTheirParents', 0, async () => {
      await (await requireId('tab-title-2')).click();
      await assertSelection(2);
      await (await requireId('tab-icon-3')).click();
      await assertSelection(3);
    });

    it('TabSelectionTest_repeatedSelectionThenReturnHome', 0, async () => {
      await selectTab(1);
      await selectTab(1);
      await assertSelection(1);
      await selectTab(0);
      await assertSelection(0);
    });

    it('TabSelectionTest_switchingKeepsLabelsAndBackgroundPosition', 0, async () => {
      const before = await bounds('background-image-0');
      await selectTab(2);
      const after = await bounds('background-image-0');
      expect(after.top).assertEqual(before.top);
      expect(after.bottom).assertEqual(before.bottom);
      for (let index = 0; index < 4; index++) {
        expect(await (await requireId('tab-title-' + index)).getText()).assertEqual(TITLES[index]);
      }
    });
  });
}
