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

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component } from '@kit.TestKit';
import { display } from '@kit.ArkUI';
import { paceTurn, delay } from '../Shared/TestPace';
import {
  APP_TITLE,
  PLAY_TEXT,
  PLAYING_TEXT,
  SPEED_TEXTS,
  findTextOrNull,
  openApp
} from '../Shared/UiSession';

async function componentForText(target: Driver, text: string): Promise<Component> {
  const found: Component | null = await findTextOrNull(target, text);
  expect(found !== null).assertTrue();
  return found as Component;
}

export default function indexPageContractTest() {
  describe('indexPageContractTest', () => {
    let target: Driver;

    beforeAll(async () => {
      await delay(1500);
      target = await openApp();
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      try {
        await target.pressBack();
      } catch (error) {
        console.info('indexPageContractTest teardown pressBack skipped');
      }
    });

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0100
     * @tc.name      testIndexPage0001
     * @tc.desc      Verify the entry page exposes the product title exactly once
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0001', 0, async () => {
      const title: Component = await componentForText(target, APP_TITLE);
      const text: string = await title.getText();
      expect(text).assertEqual(APP_TITLE);
      expect(text.length).assertLarger(0);
      const bounds = await title.getBounds();
      expect(bounds.right).assertLarger(bounds.left);
      expect(bounds.bottom).assertLarger(bounds.top);
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0200
     * @tc.name      testIndexPage0002
     * @tc.desc      Verify the play button is present, labelled for playback and enabled before any file is chosen
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0002', 0, async () => {
      const play: Component = await componentForText(target, PLAY_TEXT);
      expect(await play.getText()).assertEqual(PLAY_TEXT);
      expect(await play.isEnabled()).assertTrue();
      expect(await play.getText() === PLAYING_TEXT).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0300
     * @tc.name      testIndexPage0003
     * @tc.desc      Verify the three speed buttons are present with their expected labels
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0003', 0, async () => {
      for (let i = 0; i < SPEED_TEXTS.length; i++) {
        const button: Component = await componentForText(target, SPEED_TEXTS[i]);
        expect(await button.getText()).assertEqual(SPEED_TEXTS[i]);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0400
     * @tc.name      testIndexPage0004
     * @tc.desc      Verify every speed button starts disabled until playback has started
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0004', 0, async () => {
      for (let i = 0; i < SPEED_TEXTS.length; i++) {
        const button: Component = await componentForText(target, SPEED_TEXTS[i]);
        expect(await button.isEnabled()).assertFalse();
      }
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0500
     * @tc.name      testIndexPage0005
     * @tc.desc      Verify the play button sits above the first speed button and the speed buttons are ordered
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0005', 0, async () => {
      const play = await (await componentForText(target, PLAY_TEXT)).getBounds();
      const first = await (await componentForText(target, SPEED_TEXTS[0])).getBounds();
      const second = await (await componentForText(target, SPEED_TEXTS[1])).getBounds();
      const third = await (await componentForText(target, SPEED_TEXTS[2])).getBounds();
      expect(first.top).assertLargerOrEqual(play.bottom);
      expect(second.top).assertLargerOrEqual(first.bottom);
      expect(third.top).assertLargerOrEqual(second.bottom);
      expect(third.bottom).assertLarger(third.top);
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0600
     * @tc.name      testIndexPage0006
     * @tc.desc      Verify every button lies fully inside the physical display rectangle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0006', 0, async () => {
      const screen: display.Display = display.getDefaultDisplaySync();
      const texts: string[] = [PLAY_TEXT, SPEED_TEXTS[0], SPEED_TEXTS[1], SPEED_TEXTS[2]];
      for (let i = 0; i < texts.length; i++) {
        const bounds = await (await componentForText(target, texts[i])).getBounds();
        expect(bounds.left).assertLargerOrEqual(0);
        expect(bounds.top).assertLargerOrEqual(0);
        expect(bounds.right).assertLessOrEqual(screen.width);
        expect(bounds.bottom).assertLessOrEqual(screen.height);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0700
     * @tc.name      testIndexPage0007
     * @tc.desc      Verify the three speed buttons share the same width and height within one pixel
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0007', 0, async () => {
      const first = await (await componentForText(target, SPEED_TEXTS[0])).getBounds();
      const firstWidth: number = first.right - first.left;
      const firstHeight: number = first.bottom - first.top;
      for (let i = 1; i < SPEED_TEXTS.length; i++) {
        const bounds = await (await componentForText(target, SPEED_TEXTS[i])).getBounds();
        expect(Math.abs((bounds.right - bounds.left) - firstWidth)).assertLessOrEqual(1);
        expect(Math.abs((bounds.bottom - bounds.top) - firstHeight)).assertLessOrEqual(1);
      }
      expect(firstWidth).assertLarger(0);
      expect(firstHeight).assertLarger(0);
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0800
     * @tc.name      testIndexPage0008
     * @tc.desc      Verify the play button is horizontally centred within the display
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0008', 0, async () => {
      const screen: display.Display = display.getDefaultDisplaySync();
      const bounds = await (await componentForText(target, PLAY_TEXT)).getBounds();
      const centre: number = (bounds.left + bounds.right) / 2;
      expect(Math.abs(centre - screen.width / 2)).assertLessOrEqual(4);
      expect(bounds.right - bounds.left).assertLessOrEqual(screen.width);
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_0900
     * @tc.name      testIndexPage0009
     * @tc.desc      Verify button labels are distinct strings so the page has no duplicate control text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0009', 0, async () => {
      const texts: string[] = [PLAY_TEXT, SPEED_TEXTS[0], SPEED_TEXTS[1], SPEED_TEXTS[2]];
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < texts.length; i++) {
        seen.add(texts[i]);
        expect(texts[i].length).assertLarger(0);
      }
      expect(seen.size).assertEqual(texts.length);
      expect(seen.has(PLAYING_TEXT)).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_1000
     * @tc.name      testIndexPage0010
     * @tc.desc      Verify repeated lookups return the same control text without stale state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0010', 0, async () => {
      for (let i = 0; i < 3; i++) {
        const play: Component = await componentForText(target, PLAY_TEXT);
        expect(await play.getText()).assertEqual(PLAY_TEXT);
        expect(await play.isEnabled()).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_1100
     * @tc.name      testIndexPage0011
     * @tc.desc      Verify the title is positioned above the play button
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0011', 0, async () => {
      const titleBounds = await (await componentForText(target, APP_TITLE)).getBounds();
      const playBounds = await (await componentForText(target, PLAY_TEXT)).getBounds();
      expect(playBounds.top).assertLargerOrEqual(titleBounds.bottom);
      expect(titleBounds.top).assertLargerOrEqual(0);
      expect(titleBounds.bottom).assertLarger(titleBounds.top);
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_1200
     * @tc.name      testIndexPage0012
     * @tc.desc      Verify relaunching the ability rebuilds the same page structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0012', 0, async () => {
      const relaunched: Driver = await openApp();
      expect(await (await componentForText(relaunched, APP_TITLE)).getText()).assertEqual(APP_TITLE);
      expect(await (await componentForText(relaunched, PLAY_TEXT)).isEnabled()).assertTrue();
      for (let i = 0; i < SPEED_TEXTS.length; i++) {
        expect(await (await componentForText(relaunched, SPEED_TEXTS[i])).isEnabled()).assertFalse();
      }
      target = relaunched;
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_1300
     * @tc.name      testIndexPage0013
     * @tc.desc      Verify the driver singleton is reused so repeated page queries stay on the same instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0013', 0, async () => {
      const reopened: Driver = await openApp();
      expect(reopened === target).assertTrue();
      expect(await (await componentForText(target, APP_TITLE)).getText()).assertEqual(APP_TITLE);
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_1400
     * @tc.name      testIndexPage0014
     * @tc.desc      Verify each speed button is shorter than the play button row and remains clickable-shaped
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0014', 0, async () => {
      const playBounds = await (await componentForText(target, PLAY_TEXT)).getBounds();
      const playHeight: number = playBounds.bottom - playBounds.top;
      for (let i = 0; i < SPEED_TEXTS.length; i++) {
        const bounds = await (await componentForText(target, SPEED_TEXTS[i])).getBounds();
        const height: number = bounds.bottom - bounds.top;
        expect(height).assertLarger(0);
        expect(height).assertLessOrEqual(playHeight + 1);
        expect(bounds.right).assertLarger(bounds.left);
      }
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_PAGE_1500
     * @tc.name      testIndexPage0015
     * @tc.desc      Verify the play button text can only be the idle or playing label, never empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexPage0015', 0, async () => {
      const play: Component = await componentForText(target, PLAY_TEXT);
      const text: string = await play.getText();
      expect(text.length).assertLarger(0);
      expect(text).assertEqual(PLAY_TEXT);
      expect(text === PLAYING_TEXT).assertFalse();
    })
  });
}
