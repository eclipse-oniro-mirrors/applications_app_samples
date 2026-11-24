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
import { ON } from '@ohos.UiTest';
import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { assertSelection, bounds, driver, resetPage, scrollToFirstImage, scrollToLastImage,
  selectTab, swipeBackground, swipeBackgroundTowardStart, readDrawingGeometry } from './SharedDriver';
import { assertSameRect, settledRect, waitForOriginalRect, assertUnclippedGeometry,
  DRAWING_POSITION_PRECISION, waitForOriginalDrawingGeometry } from './InteractionAssertions';

export default function backgroundEdgesTests(): void {
  describe('BackgroundEdgesTest', () => {
    beforeEach(async () => { await resetPage(false); });

    it('BackgroundEdgesTest_startOverscrollReturnsWithoutLosingSelection', 0, async () => {
      await scrollToFirstImage();
      await selectTab(1);
      const first = await bounds('background-image-0');
      const second = await bounds('background-image-1');
      const list = await bounds('background-list');
      expect(first.top).assertEqual(list.top);
      await swipeBackgroundTowardStart();
      await waitForOriginalRect('background-image-0', first);
      assertSameRect(await bounds('background-image-1'), second);
      await assertSelection(1);
    });

    it('BackgroundEdgesTest_endOverscrollDoesNotCreateAnExtraRow', 0, async () => {
      await scrollToLastImage();
      await swipeBackground();
      const last = await settledRect('background-image-9');
      expect(last.bottom).assertEqual((await bounds('background-list')).bottom);
      const lastDrawing = readDrawingGeometry('background-image-9');
      assertUnclippedGeometry(last, lastDrawing);
      const bar = await bounds('blur-tab-bar');
      await swipeBackground();
      const restored = await waitForOriginalDrawingGeometry('background-image-9', lastDrawing);
      expect(restored.left).assertEqual(lastDrawing.left);
      expect(restored.width).assertEqual(lastDrawing.width);
      expect(restored.height).assertEqual(lastDrawing.height);
      expect(Math.abs(restored.top - lastDrawing.top) <= DRAWING_POSITION_PRECISION).assertTrue();
      const restoredRect = await bounds('background-image-9');
      assertUnclippedGeometry(restoredRect, restored);
      expect(restoredRect.bottom).assertEqual((await bounds('background-list')).bottom);
      expect(await driver().findComponent(ON.id('background-image-10'))).assertNull();
      expect(await driver().findComponent(ON.id('background-row-10'))).assertNull();
      assertSameRect(await bounds('blur-tab-bar'), bar);
      await assertSelection(0);
    });

    it('BackgroundEdgesTest_recycledEndRowsKeepOriginalSizeAndAdjacency', 0, async () => {
      await scrollToFirstImage();
      const first = await bounds('background-image-0');
      const firstDrawing = readDrawingGeometry('background-image-0');
      const initialHeight = firstDrawing.height;
      assertUnclippedGeometry(first, firstDrawing);
      await scrollToLastImage();
      await swipeBackground();
      const last = await settledRect('background-image-9');
      const previous = await bounds('background-image-8');
      const row = await bounds('background-row-9');
      const lastDrawing = readDrawingGeometry('background-image-9');
      const previousDrawing = readDrawingGeometry('background-image-8');
      expect(last.right - last.left).assertEqual(first.right - first.left);
      expect(previous.right - previous.left).assertEqual(first.right - first.left);
      expect(lastDrawing.height).assertEqual(initialHeight);
      expect(previousDrawing.height).assertEqual(initialHeight);
      expect(lastDrawing.width).assertEqual(firstDrawing.width);
      expect(previousDrawing.width).assertEqual(firstDrawing.width);
      assertUnclippedGeometry(last, lastDrawing);
      assertUnclippedGeometry(previous, previousDrawing);
      expect(last.bottom).assertEqual((await bounds('background-list')).bottom);
      expect(Math.abs(last.top - previous.bottom) <= 1).assertTrue();
      expect(row.left <= last.left && row.right >= last.right).assertTrue();
      expect(row.top <= last.top && row.bottom >= last.bottom).assertTrue();
    });
  });
}
