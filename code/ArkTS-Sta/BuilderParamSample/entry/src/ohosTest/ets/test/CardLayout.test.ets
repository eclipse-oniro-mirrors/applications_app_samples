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
import { openMain, bounds, cardId, TITLES, inside, positive } from './SharedDriver';

export default function cardLayoutTests(): void {
  describe('CardLayoutTest', () => {
    beforeAll(async () => { await openMain(); });

    it('CardLayout_labelPrecedesDetailInEveryRow', 0, async () => {
      for (let index = 0; index < TITLES.length; index++) {
        const label = await bounds(cardId(index, 'label'));
        const detail = await bounds(cardId(index, 'detail'));
        positive(label);
        positive(detail);
        expect(label.right <= detail.left + 1).assertTrue();
      }
    });

    it('CardLayout_titlePrecedesDescriptionVertically', 0, async () => {
      for (let index = 0; index < TITLES.length; index++) {
        const title = await bounds(cardId(index, 'title'));
        const description = await bounds(cardId(index, 'description'));
        positive(description);
        expect(title.bottom <= description.top + 1).assertTrue();
        expect(Math.abs(title.left - description.left) <= 1).assertTrue();
      }
    });

    it('CardLayout_topAlignmentKeepsLabelAtDetailTop', 0, async () => {
      for (let index = 0; index < TITLES.length; index++) {
        const label = await bounds(cardId(index, 'label'));
        const detail = await bounds(cardId(index, 'detail'));
        expect(Math.abs(label.top - detail.top) <= 2).assertTrue();
      }
    });

    it('CardLayout_bottomBuilderFollowsTheRow', 0, async () => {
      for (let index = 0; index < TITLES.length; index++) {
        const row = await bounds(cardId(index, 'row'));
        const divider = await bounds(cardId(index, 'divider'));
        expect(divider.top >= row.bottom - 1).assertTrue();
        expect(divider.left > row.left).assertTrue();
        expect(divider.right < row.right).assertTrue();
      }
    });

    it('CardLayout_generalWidthAttributeFillsEachListItem', 0, async () => {
      const first = await bounds(cardId(0, 'row'));
      for (let index = 0; index < TITLES.length; index++) {
        const row = await bounds(cardId(index, 'row'));
        const item = await bounds('item-' + TITLES[index]);
        expect(Math.abs(row.left - item.left) <= 1).assertTrue();
        expect(Math.abs(row.right - item.right) <= 1).assertTrue();
        expect(Math.abs(row.right - row.left - first.right + first.left) <= 1).assertTrue();
      }
    });

    it('CardLayout_listHasSideInsetsAndNoHorizontalOverflow', 0, async () => {
      const list = await bounds('trip-list');
      for (let index = 0; index < TITLES.length; index++) {
        const row = await bounds(cardId(index, 'row'));
        expect(row.left > list.left).assertTrue();
        expect(row.right < list.right).assertTrue();
        inside(await bounds(cardId(index, 'label')), row);
        inside(await bounds(cardId(index, 'description')), row);
      }
    });

    it('CardLayout_headingAndCardsDoNotOverlap', 0, async () => {
      let previousBottom = (await bounds('trip-heading')).bottom;
      for (let index = 0; index < TITLES.length; index++) {
        const container = await bounds(cardId(index, 'container'));
        positive(container);
        expect(container.top >= previousBottom).assertTrue();
        previousBottom = container.bottom;
      }
    });
  });
}
