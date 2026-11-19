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
import { assertSelection, backgroundAndRestore, bounds, requireId, resetPage,
  scrollToLastImage, selectTab, TITLES } from './SharedDriver';
import { assertSameRect } from './InteractionAssertions';

export default function tabStateCompositionTests(): void {
  describe('TabStateCompositionTest', () => {
    beforeEach(async () => { await resetPage(); });

    it('TabStateCompositionTest_resumePreservesNonHomeSelectionAndScrolledContentTogether', 0, async () => {
      await selectTab(2);
      await scrollToLastImage();
      const image = await bounds('background-image-9');
      const bar = await bounds('blur-tab-bar');
      const selected = await bounds('tab-item-2');
      await backgroundAndRestore();
      await assertSelection(2);
      assertSameRect(await bounds('background-image-9'), image);
      assertSameRect(await bounds('blur-tab-bar'), bar);
      assertSameRect(await bounds('tab-item-2'), selected);
      expect(await (await requireId('tab-title-2')).getText()).assertEqual(TITLES[2]);
    });
  });
}
