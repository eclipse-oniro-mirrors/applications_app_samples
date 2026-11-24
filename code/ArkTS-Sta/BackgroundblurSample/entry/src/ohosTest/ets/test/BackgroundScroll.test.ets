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
import { ON } from '@ohos.UiTest';
import { assertSelection, bounds, captureScreenshot, driver, positive,
  resetPage, scrollToFirstImage, scrollToLastImage, selectTab, swipeBackground } from './SharedDriver';

export default function backgroundScrollTests(): void {
  describe('BackgroundScrollTest', () => {
    beforeEach(async () => { await resetPage(); });

    it('BackgroundScrollTest_swipeMovesBackgroundContent', 0, async () => {
      const before = await bounds('background-image-1');
      await swipeBackground();
      const first = await driver().findComponent(ON.id('background-image-1'));
      if (first) {
        expect((await first.getBounds()).top < before.top).assertTrue();
      } else {
        expect(await driver().findComponent(ON.id('background-image-0'))).assertNull();
        expect(positive(await bounds('background-list'))).assertTrue();
      }
    });

    it('BackgroundScrollTest_barRemainsFixedDuringScroll', 0, async () => {
      const before = await bounds('blur-tab-bar');
      await swipeBackground();
      const after = await bounds('blur-tab-bar');
      expect(after.top).assertEqual(before.top);
      expect(after.bottom).assertEqual(before.bottom);
      expect(after.left).assertEqual(before.left);
      expect(after.right).assertEqual(before.right);
    });

    it('BackgroundScrollTest_nonHomeSelectionSurvivesScroll', 0, async () => {
      await selectTab(2);
      await swipeBackground();
      await assertSelection(2);
    });

    it('BackgroundScrollTest_lastImageReachableAndTabStillInteractive', 0, async () => {
      await scrollToLastImage();
      expect(positive(await bounds('background-image-9'))).assertTrue();
      await selectTab(3);
      await assertSelection(3);
      expect(positive(await bounds('background-image-9'))).assertTrue();
      await captureScreenshot('backgroundblur-scroll-selected');
    });

    it('BackgroundScrollTest_roundTripRestoresFirstImagePosition', 0, async () => {
      const start = await bounds('background-image-0');
      await scrollToLastImage();
      expect(positive(await bounds('background-image-9'))).assertTrue();
      await scrollToFirstImage();
      const finish = await bounds('background-image-0');
      expect(finish.top).assertEqual(start.top);
      expect(finish.bottom).assertEqual(start.bottom);
      await assertSelection(0);
    });
  });
}
