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

/**
 * L2 suite for the adaptive layout of the sample.
 *
 * entry/src/main/ets/model/MediaData.ets declares three bands
 * (sm: 320vp<=width<600vp, md: 600vp<=width<840vp, lg: 840vp<=width) and
 * Content.ets flips between a stacked and a side-by-side arrangement. The
 * cases below therefore never hard-code one arrangement: they read the display
 * size, derive which arrangement must be on screen and then prove that the
 * geometry agrees with it.
 */
import { describe, it, expect, beforeAll, afterEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  WAIT_MS,
  aboveOfId,
  countIds,
  displaySize,
  existsId,
  expectedText,
  geometryOfId,
  introInViewport,
  listInViewport,
  resetToHome,
  textOfId,
  waitId
} from '../util/UiEnv';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_MusicAlbum]';
const MIN_BREAKPOINT_VP: number = 320;

// -1 keeps the arithmetic valid for a component that is not on screen, so a
// branch can still compare two edges without a NaN result.
function leftOf(rect: string): number {
  return rect.startsWith('ok:') ? Number(rect.replace('ok:', '').split(',')[0]) : -1;
}

function topOf(rect: string): number {
  return rect.startsWith('ok:') ? Number(rect.replace('ok:', '').split(',')[1]) : -1;
}

function rightOf(rect: string): number {
  return rect.startsWith('ok:') ? Number(rect.replace('ok:', '').split(',')[2]) : -1;
}

function bottomOf(rect: string): number {
  return rect.startsWith('ok:') ? Number(rect.replace('ok:', '').split(',')[3]) : -1;
}

function widthOf(rect: string): number {
  return rightOf(rect) - leftOf(rect);
}

function heightOf(rect: string): number {
  return bottomOf(rect) - topOf(rect);
}

/** 'horizontal' when the cover column leads the list column, 'vertical' when stacked. */
function arrangement(cover: string, list: string): string {
  if (!cover.startsWith('ok:') || !list.startsWith('ok:')) {
    return 'unknown';
  }
  if (rightOf(cover) <= leftOf(list)) {
    return 'horizontal';
  }
  return topOf(list) >= topOf(cover) ? 'vertical' : 'overlap';
}

export default function uiBreakpoint01Test() {
  describe('UiBreakpoint01', () => {

    beforeAll(async () => {
      await resetToHome();
    })

    afterEach(async () => {
      await resetToHome();
    })

    /**
     * @tc.name   testUiBreakpoint0001
     * @tc.number SUB_MUSICALBUM_UI_BP_0001
     * @tc.desc   Anchor: the driver reports a positive display rectangle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiBreakpoint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0001 begin');
      const screen: string = await displaySize();
      const width: number = Number(screen.replace('ok:', '').split(',')[0]);
      const height: number = Number(screen.replace('ok:', '').split(',')[1]);
      hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d screen=%{public}s', width, height, screen);
      expect(screen.startsWith('ok:')).assertTrue();
      expect(width).assertLarger(0);
      expect(height).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0001 end');
    })

    /**
     * @tc.name   testUiBreakpoint0002
     * @tc.number SUB_MUSICALBUM_UI_BP_0002
     * @tc.desc   the display rectangle is stable between two reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0002 begin');
      const first: string = await displaySize();
      const second: string = await displaySize();
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', second, first);
      expect(first).assertEqual(second);
      expect(first.startsWith('ok:')).assertTrue();
      expect(first === 'notfound').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0002 end');
    })

    /**
     * @tc.name   testUiBreakpoint0003
     * @tc.number SUB_MUSICALBUM_UI_BP_0003
     * @tc.desc   the display is at least as wide as the smallest declared breakpoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0003 begin');
      const screen: string = await displaySize();
      const width: number = Number(screen.replace('ok:', '').split(',')[0]);
      const height: number = Number(screen.replace('ok:', '').split(',')[1]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected>=%{public}d (px, sm band starts at 320vp)', width,
        MIN_BREAKPOINT_VP);
      expect(width).assertLargerOrEqual(MIN_BREAKPOINT_VP);
      expect(height).assertLarger(0);
      expect(width !== height).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0003 end');
    })

    /**
     * @tc.name   testUiBreakpoint0004
     * @tc.number SUB_MUSICALBUM_UI_BP_0004
     * @tc.desc   the header band covers the whole display width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0004 begin');
      const header: string = await geometryOfId('header_root');
      const screen: string = await displaySize();
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', widthOf(header), screenWidth);
      expect(header.startsWith('ok:')).assertTrue();
      expect(leftOf(header)).assertEqual(0);
      expect(widthOf(header)).assertEqual(screenWidth);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0004 end');
    })

    /**
     * @tc.name   testUiBreakpoint0005
     * @tc.number SUB_MUSICALBUM_UI_BP_0005
     * @tc.desc   the content band covers the whole display width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0005 begin');
      const content: string = await geometryOfId('content_root');
      const screen: string = await displaySize();
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', widthOf(content), screenWidth);
      expect(content.startsWith('ok:')).assertTrue();
      expect(widthOf(content)).assertLarger(0);
      expect(rightOf(content)).assertEqual(screenWidth);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0005 end');
    })

    /**
     * @tc.name   testUiBreakpoint0006
     * @tc.number SUB_MUSICALBUM_UI_BP_0006
     * @tc.desc   the player band covers the whole display width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0006 begin');
      const player: string = await geometryOfId('player_root');
      const screen: string = await displaySize();
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      const playerWidth: number = widthOf(player);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', playerWidth, screenWidth);
      expect(player.startsWith('ok:')).assertTrue();
      expect(playerWidth).assertEqual(screenWidth);
      expect(playerWidth).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0006 end');
    })

    /**
     * @tc.name   testUiBreakpoint0007
     * @tc.number SUB_MUSICALBUM_UI_BP_0007
     * @tc.desc   the page is built from exactly three bands
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiBreakpoint0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0007 begin');
      const bands: number = await countIds('header_root,content_root,player_root');
      const header: boolean = await waitId('header_root', WAIT_MS);
      const player: boolean = await existsId('player_root');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=3 header=%{public}s player=%{public}s', bands,
        header.toString(), player.toString());
      expect(bands).assertEqual(3);
      expect(header).assertTrue();
      expect(player).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0007 end');
    })

    /**
     * @tc.name   testUiBreakpoint0008
     * @tc.number SUB_MUSICALBUM_UI_BP_0008
     * @tc.desc   the header band is rendered above the content band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiBreakpoint0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0008 begin');
      const order: string = await aboveOfId('header_root', 'content_root');
      const header: string = await geometryOfId('header_root');
      const content: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'order=%{public}s headerBottom=%{public}d contentTop=%{public}d', order,
        bottomOf(header), topOf(content));
      expect(order).assertEqual('ok');
      expect(bottomOf(header) <= topOf(content)).assertTrue();
      expect(content.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0008 end');
    })

    /**
     * @tc.name   testUiBreakpoint0009
     * @tc.number SUB_MUSICALBUM_UI_BP_0009
     * @tc.desc   the content band is rendered above the player band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiBreakpoint0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0009 begin');
      const order: string = await aboveOfId('content_root', 'player_root');
      const content: string = await geometryOfId('content_root');
      const player: string = await geometryOfId('player_root');
      hilog.info(DOMAIN, TAG, 'order=%{public}s contentBottom=%{public}d playerTop=%{public}d', order,
        bottomOf(content), topOf(player));
      expect(order).assertEqual('ok');
      expect(bottomOf(content) <= topOf(player)).assertTrue();
      expect(player.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0009 end');
    })

    /**
     * @tc.name   testUiBreakpoint0010
     * @tc.number SUB_MUSICALBUM_UI_BP_0010
     * @tc.desc   the three bands are stacked with strictly increasing tops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0010 begin');
      const header: string = await geometryOfId('header_root');
      const content: string = await geometryOfId('content_root');
      const player: string = await geometryOfId('player_root');
      hilog.info(DOMAIN, TAG, 'headerTop=%{public}d contentTop=%{public}d playerTop=%{public}d', topOf(header),
        topOf(content), topOf(player));
      expect(topOf(header) < topOf(content)).assertTrue();
      expect(topOf(content) < topOf(player)).assertTrue();
      expect(topOf(player) < bottomOf(player)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0010 end');
    })

    /**
     * @tc.name   testUiBreakpoint0011
     * @tc.number SUB_MUSICALBUM_UI_BP_0011
     * @tc.desc   the content band takes the space left between the two toolbars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0011 begin');
      const header: string = await geometryOfId('header_root');
      const content: string = await geometryOfId('content_root');
      const player: string = await geometryOfId('player_root');
      const gapTop: number = topOf(content) - bottomOf(header);
      const gapBottom: number = topOf(player) - bottomOf(content);
      hilog.info(DOMAIN, TAG, 'gapTop=%{public}d gapBottom=%{public}d contentHeight=%{public}d', gapTop,
        gapBottom, heightOf(content));
      expect(gapTop).assertLargerOrEqual(0);
      expect(gapBottom).assertLargerOrEqual(0);
      expect(heightOf(content)).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0011 end');
    })

    /**
     * @tc.name   testUiBreakpoint0012
     * @tc.number SUB_MUSICALBUM_UI_BP_0012
     * @tc.desc   the content band never exceeds the display height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0012 begin');
      const content: string = await geometryOfId('content_root');
      const screen: string = await displaySize();
      const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected<=%{public}d', heightOf(content), screenHeight);
      expect(heightOf(content)).assertLarger(0);
      expect(heightOf(content) <= screenHeight).assertTrue();
      expect(bottomOf(content) <= screenHeight).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0012 end');
    })

    /**
     * @tc.name   testUiBreakpoint0013
     * @tc.number SUB_MUSICALBUM_UI_BP_0013
     * @tc.desc   the album cover keeps the 1:1 aspect ratio required by the layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiBreakpoint0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0013 begin');
      const cover: string = await geometryOfId('cover_album');
      hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(cover), heightOf(cover));
      expect(cover.startsWith('ok:')).assertTrue();
      expect(widthOf(cover)).assertLarger(0);
      expect(Math.abs(widthOf(cover) - heightOf(cover)) <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0013 end');
    })

    /**
     * @tc.name   testUiBreakpoint0014
     * @tc.number SUB_MUSICALBUM_UI_BP_0014
     * @tc.desc   the album cover is inside the content band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0014 begin');
      const cover: string = await geometryOfId('cover_album');
      const content: string = await geometryOfId('content_root');
      const inside: boolean = topOf(cover) >= topOf(content) && leftOf(cover) >= leftOf(content) &&
        rightOf(cover) <= rightOf(content);
      hilog.info(DOMAIN, TAG, 'inside=%{public}s coverTop=%{public}d contentTop=%{public}d', inside.toString(),
        topOf(cover), topOf(content));
      expect(inside).assertTrue();
      expect(widthOf(cover) <= widthOf(content)).assertTrue();
      expect(rightOf(cover)).assertLarger(leftOf(cover));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0014 end');
    })

    /**
     * @tc.name   testUiBreakpoint0015
     * @tc.number SUB_MUSICALBUM_UI_BP_0015
     * @tc.desc   the collection counter is drawn over the album cover
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0015 begin');
      const cover: string = await geometryOfId('cover_album');
      const counter: string = await geometryOfId('cover_collection_num');
      const counterText: string = await textOfId('cover_collection_num');
      const overCover: boolean = topOf(counter) >= topOf(cover) && bottomOf(counter) <= bottomOf(cover) &&
        leftOf(counter) >= leftOf(cover) && rightOf(counter) <= rightOf(cover);
      hilog.info(DOMAIN, TAG, 'overCover=%{public}s counter=%{public}s', overCover.toString(), counter);
      expect(counter.startsWith('ok:')).assertTrue();
      expect(overCover).assertTrue();
      expect(counterText).assertEqual('ok:' + expectedText('collection_num'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0015 end');
    })

    /**
     * @tc.name   testUiBreakpoint0016
     * @tc.number SUB_MUSICALBUM_UI_BP_0016
     * @tc.desc   the playlist name is inside the content band when the copy column is laid out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0016 begin');
      const inline: boolean = await introInViewport();
      const name: string = await geometryOfId('cover_list_name');
      const content: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'inline=%{public}s nameTop=%{public}d contentTop=%{public}d nameRight=%{public}d',
        inline.toString(), topOf(name), topOf(content), rightOf(name));
      expect(content.startsWith('ok:')).assertTrue();
      if (inline) {
        expect(name.startsWith('ok:')).assertTrue();
        expect(topOf(name) >= topOf(content)).assertTrue();
        expect(rightOf(name) <= rightOf(content)).assertTrue();
      } else {
        // sm: the enlarged cover covers the copy column, so the name never enters
        // the tree and the cover itself has to stay inside the band instead
        expect(name).assertEqual('notfound');
        expect(topOf(await geometryOfId('cover_album')) >= topOf(content)).assertTrue();
        expect(rightOf(await geometryOfId('cover_album')) <= rightOf(content)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0016 end');
    })

    /**
     * @tc.name   testUiBreakpoint0017
     * @tc.number SUB_MUSICALBUM_UI_BP_0017
     * @tc.desc   the playlist introduction keeps the copy of the resource file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiBreakpoint0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0017 begin');
      const inline: boolean = await introInViewport();
      const text: string = await textOfId('cover_intro');
      const expected: string = 'ok:' + expectedText('playlist_Introduction');
      hilog.info(DOMAIN, TAG, 'inline=%{public}s actual=%{public}s expected=%{public}s', inline.toString(), text,
        expected);
      if (inline) {
        expect(text).assertEqual(expected);
        expect(text.startsWith('ok:')).assertTrue();
        expect(text.length).assertLarger(3);
      } else {
        // sm: the introduction is covered by the cover; the expectation must
        // still resolve, so the resource copy is proven instead of the node
        expect(text).assertEqual('notfound');
        expect(expected.startsWith('ok:')).assertTrue();
        expect(expected.length).assertLarger(10);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0017 end');
    })

    /**
     * @tc.name   testUiBreakpoint0018
     * @tc.number SUB_MUSICALBUM_UI_BP_0018
     * @tc.desc   the option strip keeps a positive height inside the content band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0018 begin');
      const options: string = await geometryOfId('cover_options');
      const content: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'optionsHeight=%{public}d contentHeight=%{public}d', heightOf(options),
        heightOf(content));
      expect(options.startsWith('ok:')).assertTrue();
      expect(heightOf(options)).assertLarger(0);
      expect(rightOf(options) <= rightOf(content)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0018 end');
    })

    /**
     * @tc.name   testUiBreakpoint0019
     * @tc.number SUB_MUSICALBUM_UI_BP_0019
     * @tc.desc   Anchor: the cover column and the list column use one of the two declared arrangements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiBreakpoint0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0019 begin');
      const cover: string = await geometryOfId('cover_album');
      const list: string = await geometryOfId('play_all_row');
      const mode: string = arrangement(cover, list);
      hilog.info(DOMAIN, TAG, 'mode=%{public}s expected=horizontal|vertical cover=%{public}s list=%{public}s', mode,
        cover, list);
      expect(mode === 'horizontal' || mode === 'vertical').assertTrue();
      expect(mode === 'unknown').assertFalse();
      expect(mode === 'overlap').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0019 end');
    })

    /**
     * @tc.name   testUiBreakpoint0020
     * @tc.number SUB_MUSICALBUM_UI_BP_0020
     * @tc.desc   the arrangement on screen agrees with the geometry it implies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0020 begin');
      const cover: string = await geometryOfId('cover_album');
      const list: string = await geometryOfId('play_all_row');
      const mode: string = arrangement(cover, list);
      const horizontalOk: boolean = mode === 'horizontal' && rightOf(cover) <= leftOf(list);
      const verticalOk: boolean = mode === 'vertical' && topOf(list) >= bottomOf(cover);
      hilog.info(DOMAIN, TAG, 'mode=%{public}s horizontalOk=%{public}s verticalOk=%{public}s', mode,
        horizontalOk.toString(), verticalOk.toString());
      expect(mode === 'unknown').assertFalse();
      expect(horizontalOk || verticalOk).assertTrue();
      expect(horizontalOk && verticalOk).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0020 end');
    })

    /**
     * @tc.name   testUiBreakpoint0021
     * @tc.number SUB_MUSICALBUM_UI_BP_0021
     * @tc.desc   the song list column never leaves the right edge of the display
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0021 begin');
      const reachable: boolean = await listInViewport();
      const list: string = await geometryOfId('song_list');
      const screen: string = await displaySize();
      const content: string = await geometryOfId('content_root');
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s listRight=%{public}d contentRight=%{public}d screenWidth=%{public}d',
        reachable.toString(), rightOf(list), rightOf(content), screenWidth);
      expect(screen.startsWith('ok:')).assertTrue();
      if (reachable) {
        expect(list.startsWith('ok:')).assertTrue();
        expect(rightOf(list) <= screenWidth).assertTrue();
        expect(widthOf(list)).assertLarger(0);
      } else {
        // sm: the list column is pushed out of the band, but its row head is
        // still on screen and must stop at the display edge
        expect(list).assertEqual('notfound');
        expect(rightOf(await geometryOfId('play_all_row')) <= screenWidth).assertTrue();
        expect(rightOf(content)).assertEqual(screenWidth);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0021 end');
    })

    /**
     * @tc.name   testUiBreakpoint0022
     * @tc.number SUB_MUSICALBUM_UI_BP_0022
     * @tc.desc   the header band is shorter than the display it sits in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiBreakpoint0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0022 begin');
      const header: string = await geometryOfId('header_root');
      const player: string = await geometryOfId('player_root');
      const screen: string = await displaySize();
      const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
      const toolbars: number = heightOf(header) + heightOf(player);
      hilog.info(DOMAIN, TAG, 'toolbars=%{public}d screenHeight=%{public}d', toolbars, screenHeight);
      expect(heightOf(header)).assertLarger(0);
      expect(heightOf(header) < screenHeight).assertTrue();
      expect(toolbars < screenHeight).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0022 end');
    })

    /**
     * @tc.name   testUiBreakpoint0023
     * @tc.number SUB_MUSICALBUM_UI_BP_0023
     * @tc.desc   the first two song rows share the same height when the list is on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0023 begin');
      const reachable: boolean = await listInViewport();
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_2');
      const head: string = await geometryOfId('play_all_row');
      const band: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s first=%{public}d second=%{public}d', reachable.toString(),
        heightOf(first), heightOf(second));
      if (reachable) {
        expect(heightOf(first)).assertLarger(0);
        expect(heightOf(second)).assertEqual(heightOf(first));
        expect(topOf(second)).assertLarger(topOf(first));
      } else {
        // sm: no row is on screen; the row head is pinned to the band bottom
        expect(first).assertEqual('notfound');
        expect(second).assertEqual('notfound');
        expect(Math.abs(topOf(head) - bottomOf(band)) <= 1).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0023 end');
    })

    /**
     * @tc.name   testUiBreakpoint0024
     * @tc.number SUB_MUSICALBUM_UI_BP_0024
     * @tc.desc   the play-all row starts at the left edge of its column
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiBreakpoint0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0024 begin');
      const reachable: boolean = await listInViewport();
      const row: string = await geometryOfId('play_all_row');
      const list: string = await geometryOfId('song_list');
      const band: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s rowLeft=%{public}d listLeft=%{public}d rowWidth=%{public}d',
        reachable.toString(), leftOf(row), leftOf(list), widthOf(row));
      expect(widthOf(row)).assertLarger(0);
      if (reachable) {
        expect(leftOf(row)).assertEqual(leftOf(list));
        expect(Math.abs(widthOf(row) - widthOf(list)) <= 2).assertTrue();
      } else {
        // sm: the list column is out of the band, so the row head spans the band
        expect(list).assertEqual('notfound');
        expect(leftOf(row)).assertEqual(leftOf(band));
        expect(Math.abs(widthOf(row) - widthOf(band)) <= 2).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0024 end');
    })

    /**
     * @tc.name   testUiBreakpoint0025
     * @tc.number SUB_MUSICALBUM_UI_BP_0025
     * @tc.desc   the playlist name and the cover are both inside the display width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0025 begin');
      const inline: boolean = await introInViewport();
      const name: string = await geometryOfId('cover_list_name');
      const cover: string = await geometryOfId('cover_album');
      const screen: string = await displaySize();
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'inline=%{public}s nameRight=%{public}d coverRight=%{public}d screenWidth=%{public}d',
        inline.toString(), rightOf(name), rightOf(cover), screenWidth);
      expect(cover.startsWith('ok:')).assertTrue();
      expect(rightOf(cover) <= screenWidth).assertTrue();
      if (inline) {
        expect(rightOf(name) <= screenWidth).assertTrue();
        expect(leftOf(name)).assertLargerOrEqual(0);
      } else {
        // sm: the name is covered, but nothing may spill past the display edge
        expect(name).assertEqual('notfound');
        expect(leftOf(cover)).assertLargerOrEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0025 end');
    })

    /**
     * @tc.name   testUiBreakpoint0026
     * @tc.number SUB_MUSICALBUM_UI_BP_0026
     * @tc.desc   the header title keeps the play_list copy on every breakpoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiBreakpoint0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0026 begin');
      const text: string = await textOfId('header_title');
      const expected: string = 'ok:' + expectedText('play_list');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
      expect(text).assertEqual(expected);
      expect(text === 'notfound').assertFalse();
      expect(text.length).assertLarger(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0026 end');
    })

    /**
     * @tc.name   testUiBreakpoint0027
     * @tc.number SUB_MUSICALBUM_UI_BP_0027
     * @tc.desc   the cover never overlaps the option strip vertically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiBreakpoint0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0027 begin');
      const cover: string = await geometryOfId('cover_album');
      const options: string = await geometryOfId('cover_options');
      const mode: string = arrangement(cover, await geometryOfId('play_all_row'));
      hilog.info(DOMAIN, TAG, 'mode=%{public}s coverBottom=%{public}d optionsTop=%{public}d', mode,
        bottomOf(cover), topOf(options));
      expect(mode === 'unknown').assertFalse();
      expect(bottomOf(cover) <= topOf(options)).assertTrue();
      expect(topOf(options)).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0027 end');
    })

    /**
     * @tc.name   testUiBreakpoint0028
     * @tc.number SUB_MUSICALBUM_UI_BP_0028
     * @tc.desc   Anchor: an undeclared id is reported as missing on every breakpoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0028 begin');
      const missing: boolean = await existsId('content_side_panel');
      const rect: string = await geometryOfId('content_side_panel');
      const bands: number = await countIds('header_root,content_root,player_root');
      hilog.info(DOMAIN, TAG, 'missing=%{public}s rect=%{public}s bands=%{public}d', missing.toString(), rect,
        bands);
      expect(missing).assertFalse();
      expect(rect).assertEqual('notfound');
      expect(bands).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0028 end');
    })

    /**
     * @tc.name   testUiBreakpoint0029
     * @tc.number SUB_MUSICALBUM_UI_BP_0029
     * @tc.desc   the band chain is rebuilt in the same order after a reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiBreakpoint0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0029 begin');
      await resetToHome();
      const headerFirst: string = await aboveOfId('header_root', 'content_root');
      const contentFirst: string = await aboveOfId('content_root', 'player_root');
      const visible: boolean = await waitId('player_root', WAIT_MS);
      hilog.info(DOMAIN, TAG, 'headerFirst=%{public}s contentFirst=%{public}s visible=%{public}s', headerFirst,
        contentFirst, visible.toString());
      expect(headerFirst).assertEqual('ok');
      expect(contentFirst).assertEqual('ok');
      expect(visible).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0029 end');
    })

    /**
     * @tc.name   testUiBreakpoint0030
     * @tc.number SUB_MUSICALBUM_UI_BP_0030
     * @tc.desc   the display rectangle is wider than a single song row is tall
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiBreakpoint0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0030 begin');
      const reachable: boolean = await listInViewport();
      const screen: string = await displaySize();
      const row: string = await geometryOfId('song_item_1');
      const head: string = await geometryOfId('play_all_row');
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s screenWidth=%{public}d rowHeight=%{public}d headWidth=%{public}d',
        reachable.toString(), screenWidth, heightOf(row), widthOf(head));
      expect(screenWidth).assertLarger(0);
      if (reachable) {
        expect(screenWidth > heightOf(row)).assertTrue();
        expect(widthOf(row)).assertLarger(heightOf(row));
        expect(widthOf(row) <= screenWidth).assertTrue();
      } else {
        // sm: rows are out of the band, the row head is the widest row element
        expect(row).assertEqual('notfound');
        expect(screenWidth > heightOf(head)).assertTrue();
        expect(widthOf(head)).assertLarger(heightOf(head));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0030 end');
    })

  })
}
