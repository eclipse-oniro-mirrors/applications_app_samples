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
import { Rect } from '@ohos.UiTest';
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { assertSelection, bounds, driver, resetPage, selectTab } from './SharedDriver';
import { assertSameRect, waitForOriginalRect } from './InteractionAssertions';

export default function tabHitAreaTests(): void {
  describe('TabHitAreaTest', () => {
    beforeEach(async () => { await resetPage(); });

    it('TabHitAreaTest_blankColumnGutterSelectsItsTab', 0, async () => {
      const tab = await bounds('tab-item-3');
      const icon = await bounds('tab-icon-3');
      const title = await bounds('tab-title-3');
      const childLeft = Math.min(icon.left, title.left);
      expect(childLeft - tab.left > 4).assertTrue();
      const x = Math.floor((tab.left + childLeft) / 2);
      const y = Math.floor((icon.top + icon.bottom) / 2);
      expect(x > tab.left && x < childLeft).assertTrue();
      await driver().click(x, y);
      await assertSelection(3);
    });

    it('TabHitAreaTest_backgroundTapCannotActivateOverlayItems', 0, async () => {
      await selectTab(2);
      const image = await bounds('background-image-0');
      const bar = await bounds('blur-tab-bar');
      const y = Math.floor((image.top + Math.min(image.bottom, bar.top)) / 2);
      expect(y < bar.top).assertTrue();
      await driver().click(Math.floor((image.left + image.right) / 2), y);
      await assertSelection(2);
      assertSameRect(await bounds('background-image-0'), image);
    });

    it('TabHitAreaTest_horizontalGesturesDoNotNavigateOrScrollVertically', 0, async () => {
      await selectTab(1);
      const image = await bounds('background-image-0');
      const bar = await bounds('blur-tab-bar');
      const list = await bounds('background-list');
      const backgroundY = Math.floor((list.top + bar.top) / 2);
      await driver().swipe(list.left + 60, backgroundY, list.right - 60, backgroundY, 2000);
      await waitForOriginalRect('background-image-0', image);
      await assertSelection(1);
      const barY = Math.floor((bar.top + bar.bottom) / 2);
      await driver().swipe(bar.right - 40, barY, bar.left + 40, barY, 2000);
      await assertSelection(1);
      assertSameRect(await bounds('blur-tab-bar'), bar);
      assertSameRect(await bounds('background-image-0'), image);
    });

    it('TabHitAreaTest_verticalDragStartingOnOverlayCannotScrollBackground', 0, async () => {
      const image = await bounds('background-image-0');
      const bar = await bounds('blur-tab-bar');
      const list = await bounds('background-list');
      const tab = await bounds('tab-item-2');
      const x = Math.floor((tab.left + tab.right) / 2);
      const startY = Math.floor((bar.top + bar.bottom) / 2);
      const endY = Math.floor((list.top + bar.top) / 2);
      expect(startY > bar.top && endY < bar.top).assertTrue();
      await driver().swipe(x, startY, x, endY, 2000);
      await waitForOriginalRect('background-image-0', image);
      await assertSelection(0);
    });

    it('TabHitAreaTest_equalHitColumnsCenterTheirIconAndTitle', 0, async () => {
      const bar = await bounds('blur-tab-bar');
      const expectedWidth = (bar.right - bar.left) / 4;
      const first = await bounds('tab-item-0');
      for (let index = 0; index < 4; index++) {
        const tab = await bounds('tab-item-' + index);
        const icon = await bounds('tab-icon-' + index);
        const title = await bounds('tab-title-' + index);
        const center = (tab.left + tab.right) / 2;
        expect(Math.abs(tab.right - tab.left - expectedWidth) <= 1).assertTrue();
        expect(tab.top).assertEqual(first.top);
        expect(tab.bottom).assertEqual(first.bottom);
        expect(Math.abs((icon.left + icon.right) / 2 - center) <= 1).assertTrue();
        expect(Math.abs((title.left + title.right) / 2 - center) <= 1).assertTrue();
      }
    });

    it('TabHitAreaTest_selectionStylingDoesNotMoveHitTargets', 0, async () => {
      const tabRects: Rect[] = [];
      const iconRects: Rect[] = [];
      const titleRects: Rect[] = [];
      for (let index = 0; index < 4; index++) {
        tabRects.push(await bounds('tab-item-' + index));
        iconRects.push(await bounds('tab-icon-' + index));
        titleRects.push(await bounds('tab-title-' + index));
      }
      await selectTab(3);
      await assertSelection(3);
      for (let index = 0; index < 4; index++) {
        assertSameRect(await bounds('tab-item-' + index), tabRects[index]);
        assertSameRect(await bounds('tab-icon-' + index), iconRects[index]);
        assertSameRect(await bounds('tab-title-' + index), titleRects[index]);
      }
    });
  });
}
