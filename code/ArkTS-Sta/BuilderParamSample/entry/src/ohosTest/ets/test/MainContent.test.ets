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
import { ON } from '@ohos.UiTest';
import { openMain, driver, text, node, cardId, TITLES, DESCRIPTIONS, bounds } from './SharedDriver';

export default function mainContentTests(): void {
  describe('MainContentTest', () => {
    beforeAll(async () => { await openMain(); });

    it('MainContent_headingMatchesItinerary', 0, async () => {
      expect(await text('trip-heading')).assertEqual('\u884c\u7a0b\u89c4\u5212');
      expect((await driver().findComponents(ON.id('trip-heading'))).length).assertEqual(1);
    });

    it('MainContent_threeTitlesKeepMapInsertionOrder', 0, async () => {
      let previousBottom: number = -1;
      for (let index = 0; index < TITLES.length; index++) {
        expect(await text(cardId(index, 'title'))).assertEqual(TITLES[index]);
        const rect = await bounds(cardId(index, 'title'));
        expect(rect.top > previousBottom).assertTrue();
        previousBottom = rect.bottom;
      }
    });

    it('MainContent_descriptionsStayBoundToTheirOwnTitles', 0, async () => {
      for (let index = 0; index < TITLES.length; index++) {
        expect(await text(cardId(index, 'description'))).assertEqual(DESCRIPTIONS[index]);
      }
    });

    it('MainContent_exactlyThreeListItems', 0, async () => {
      const items = await driver().findComponents(ON.type('ListItem'));
      expect(items.length).assertEqual(3);
      for (let index = 0; index < TITLES.length; index++) {
        expect(await (await node('item-' + TITLES[index])).isEnabled()).assertTrue();
      }
    });

    it('MainContent_eachCardContainsOneTrailingLabelButton', 0, async () => {
      expect((await driver().findComponents(ON.type('Button'))).length).assertEqual(3);
      for (let index = 0; index < TITLES.length; index++) {
        // The sample label is decorative and has no onClick handler.
        expect(await (await node(cardId(index, 'label'))).isClickable()).assertFalse();
        expect(await (await node(cardId(index, 'label'))).isEnabled()).assertTrue();
      }
    });

    it('MainContent_eachCardContainsOneBottomDivider', 0, async () => {
      expect((await driver().findComponents(ON.type('Divider'))).length).assertEqual(3);
      for (let index = 0; index < TITLES.length; index++) {
        expect((await driver().findComponents(ON.id(cardId(index, 'divider')))).length).assertEqual(1);
      }
    });
  });
}
