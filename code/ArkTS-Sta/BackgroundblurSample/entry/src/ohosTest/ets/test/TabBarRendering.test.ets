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
import { beforeAll, describe, expect, it } from '@ohos/hypium';
import { ON } from '@ohos.UiTest';
import { assertSelection, bounds, captureScreenshot, driver, positive, requireId, waitReady, TITLES } from './SharedDriver';

export default function tabBarRenderingTests(): void {
  describe('TabBarRenderingTest', () => {
    beforeAll(async () => { await waitReady(); });

    it('TabBarRenderingTest_homeIsSoleInitialSelection', 0, async () => {
      await assertSelection(0);
      await captureScreenshot('backgroundblur-initial');
    });

    it('TabBarRenderingTest_labelsMatchResourceOrder', 0, async () => {
      for (let index = 0; index < TITLES.length; index++) {
        expect(await (await requireId('tab-title-' + index)).getText()).assertEqual(TITLES[index]);
      }
    });

    it('TabBarRenderingTest_eachTabHasOneIconAndTitle', 0, async () => {
      for (let index = 0; index < 4; index++) {
        expect((await driver().findComponents(ON.id('tab-item-' + index))).length).assertEqual(1);
        expect(positive(await bounds('tab-icon-' + index))).assertTrue();
        expect(positive(await bounds('tab-title-' + index))).assertTrue();
      }
    });

    it('TabBarRenderingTest_tabsAreOrderedWithoutHorizontalOverlap', 0, async () => {
      const bar = await bounds('blur-tab-bar');
      let right = bar.left;
      for (let index = 0; index < 4; index++) {
        const tab = await bounds('tab-item-' + index);
        expect(positive(tab)).assertTrue();
        expect(tab.left >= right - 1).assertTrue();
        expect(tab.right <= bar.right + 1).assertTrue();
        right = tab.right;
      }
    });

    it('TabBarRenderingTest_titlesBelowIconsStayWithinBar', 0, async () => {
      const bar = await bounds('blur-tab-bar');
      for (let index = 0; index < 4; index++) {
        const icon = await bounds('tab-icon-' + index);
        const title = await bounds('tab-title-' + index);
        expect(title.top >= icon.bottom).assertTrue();
        expect(title.bottom <= bar.bottom + 1).assertTrue();
        expect(icon.top >= bar.top).assertTrue();
      }
    });

    it('TabBarRenderingTest_barOverlaysBottomOfBackground', 0, async () => {
      const list = await bounds('background-list');
      const bar = await bounds('blur-tab-bar');
      expect(positive(list)).assertTrue();
      expect(bar.top > (list.top + list.bottom) / 2).assertTrue();
      expect(bar.bottom <= list.bottom + 1).assertTrue();
      expect(bar.left >= list.left).assertTrue();
      expect(bar.right <= list.right).assertTrue();
    });

    it('TabBarRenderingTest_backgroundRowsHaveOrderedPositiveImages', 0, async () => {
      const first = await bounds('background-image-0');
      const second = await bounds('background-image-1');
      expect(positive(first)).assertTrue();
      expect(positive(second)).assertTrue();
      expect(first.left).assertEqual(second.left);
      expect(first.right).assertEqual(second.right);
      expect(second.top >= first.bottom - 1).assertTrue();
    });
  });
}
