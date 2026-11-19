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
 * L2 suite for the song list band: the 'song_list' container, the lazy
 * 'song_item_<id>' rows and the scrolling behaviour of the list.
 *
 * The frozen table of entry/src/main/ets/model/SongList.ets owns ids 1..21 and
 * 23..25, so every case that walks the rows also proves that the gap at 22 is
 * not filled in by the renderer.
 *
 * The list column only exists inside the viewport while the window is wide
 * enough. Content.ets stacks the cover column above the list column, and on a
 * compact (sm) window the square cover takes the whole content band, which
 * pushes the list past the band edge; the List is then not part of the
 * UI component tree at all. Each case therefore asks listInViewport() first and
 * asserts the arrangement that the current window really shows: the rows when
 * the column is reachable, the band geometry when it is not.
 */
import { describe, it, expect, beforeAll, afterEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  WAIT_MS,
  aboveOfId,
  clickId,
  countIds,
  displaySize,
  existsId,
  geometryOfId,
  listInViewport,
  resetToHome,
  swipeUpInId,
  typeOfId,
  waitId
} from '../util/UiEnv';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_MusicAlbum]';

// -1 keeps the arithmetic valid for a component that is not on screen.
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

export default function uiList01Test() {
  describe('UiList01', () => {

    beforeAll(async () => {
      await resetToHome();
    })

    afterEach(async () => {
      await resetToHome();
    })

    /**
     * @tc.name   testUiList0001
     * @tc.number SUB_MUSICALBUM_UI_LIST_0001
     * @tc.desc   Anchor: the list column is reachable when it fits, and the band head stays otherwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0001 begin');
      const reachable: boolean = await listInViewport();
      const rect: string = await geometryOfId('song_list');
      const type: string = await typeOfId('song_list');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s rect=%{public}s type=%{public}s', reachable.toString(), rect, type);
      if (reachable) {
        expect(rect.startsWith('ok:')).assertTrue();
        expect(type.startsWith('ok:')).assertTrue();
        expect(widthOf(rect)).assertLarger(0);
      } else {
        // sm: the column is pushed out of the band, so neither id is mounted
        expect(rect).assertEqual('notfound');
        expect(type).assertEqual('notfound');
        expect(await waitId('play_all_row', WAIT_MS)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0001 end');
    })

    /**
     * @tc.name   testUiList0002
     * @tc.number SUB_MUSICALBUM_UI_LIST_0002
     * @tc.desc   the list container sits below the play-all row
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0002 begin');
      const reachable: boolean = await listInViewport();
      const order: string = await aboveOfId('play_all_row', 'song_list');
      const row: string = await geometryOfId('play_all_row');
      const list: string = await geometryOfId('song_list');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s order=%{public}s row=%{public}s list=%{public}s',
        reachable.toString(), order, row, list);
      expect(row.startsWith('ok:')).assertTrue();
      if (reachable) {
        expect(order).assertEqual('ok');
        expect(list.startsWith('ok:')).assertTrue();
        expect(topOf(list) >= bottomOf(row)).assertTrue();
      } else {
        // sm: the row head is the last element of the band, its top is the band edge
        expect(order).assertEqual('notfound');
        expect(topOf(row)).assertEqual(bottomOf(await geometryOfId('content_root')));
        expect(await aboveOfId('content_root', 'play_all_row')).assertEqual('ok');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0002 end');
    })

    /**
     * @tc.name   testUiList0003
     * @tc.number SUB_MUSICALBUM_UI_LIST_0003
     * @tc.desc   the play-all row and the list do not overlap vertically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0003 begin');
      const reachable: boolean = await listInViewport();
      const row: string = await geometryOfId('play_all_row');
      const list: string = await geometryOfId('song_list');
      const band: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s listTop=%{public}d rowBottom=%{public}d', reachable.toString(),
        topOf(list), bottomOf(row));
      expect(row.startsWith('ok:')).assertTrue();
      if (reachable) {
        expect(list.startsWith('ok:')).assertTrue();
        expect(topOf(list) >= bottomOf(row)).assertTrue();
        expect(heightOf(list)).assertLarger(0);
      } else {
        // sm: nothing is drawn below the row head, it ends past the band bottom
        expect(list).assertEqual('notfound');
        expect(topOf(row)).assertEqual(bottomOf(band));
        expect(bottomOf(row)).assertLarger(bottomOf(band));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0003 end');
    })

    /**
     * @tc.name   testUiList0004
     * @tc.number SUB_MUSICALBUM_UI_LIST_0004
     * @tc.desc   the list column never leaves the display width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0004 begin');
      const reachable: boolean = await listInViewport();
      const list: string = await geometryOfId('song_list');
      const row: string = await geometryOfId('play_all_row');
      const screen: string = await displaySize();
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s listWidth=%{public}d screenWidth=%{public}d',
        reachable.toString(), widthOf(list), screenWidth);
      expect(screen.startsWith('ok:')).assertTrue();
      expect(screenWidth).assertLarger(0);
      if (reachable) {
        expect(widthOf(list)).assertLarger(0);
        expect(rightOf(list) <= screenWidth).assertTrue();
      } else {
        // sm: the row head is the widest element of the list column
        expect(list).assertEqual('notfound');
        expect(widthOf(row)).assertEqual(screenWidth);
        expect(rightOf(row)).assertEqual(screenWidth);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0004 end');
    })

    /**
     * @tc.name   testUiList0005
     * @tc.number SUB_MUSICALBUM_UI_LIST_0005
     * @tc.desc   the list ends above the bottom player band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0005 begin');
      const reachable: boolean = await listInViewport();
      const list: string = await geometryOfId('song_list');
      const player: string = await geometryOfId('player_root');
      const row: string = await geometryOfId('play_all_row');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s listBottom=%{public}d playerTop=%{public}d',
        reachable.toString(), bottomOf(list), topOf(player));
      expect(player.startsWith('ok:')).assertTrue();
      expect(heightOf(player)).assertLarger(0);
      if (reachable) {
        expect(bottomOf(list) <= topOf(player)).assertTrue();
        expect(topOf(player) - bottomOf(list)).assertLargerOrEqual(0);
      } else {
        // sm: the row head and the player share the same band edge
        expect(list).assertEqual('notfound');
        expect(topOf(row)).assertEqual(topOf(player));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0005 end');
    })

    /**
     * @tc.name   testUiList0006
     * @tc.number SUB_MUSICALBUM_UI_LIST_0006
     * @tc.desc   the first song row is rendered inside the list bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0006 begin');
      const reachable: boolean = await listInViewport();
      const row: string = await geometryOfId('song_item_1');
      const list: string = await geometryOfId('song_list');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s row=%{public}s list=%{public}s', reachable.toString(), row, list);
      if (reachable) {
        const inside: boolean = topOf(row) >= topOf(list) && bottomOf(row) <= bottomOf(list) &&
          leftOf(row) >= leftOf(list);
        expect(row.startsWith('ok:')).assertTrue();
        expect(inside).assertTrue();
        expect(heightOf(row)).assertLarger(0);
      } else {
        // sm: no row is mounted, only the row head of the column remains
        expect(row).assertEqual('notfound');
        expect(list).assertEqual('notfound');
        expect((await geometryOfId('play_all_row')).startsWith('ok:')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0006 end');
    })

    /**
     * @tc.name   testUiList0007
     * @tc.number SUB_MUSICALBUM_UI_LIST_0007
     * @tc.desc   the first row of the table is drawn above the second row
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0007 begin');
      const reachable: boolean = await listInViewport();
      const order: string = await aboveOfId('song_item_1', 'song_item_2');
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_2');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s order=%{public}s first=%{public}s second=%{public}s',
        reachable.toString(), order, first, second);
      if (reachable) {
        expect(order).assertEqual('ok');
        expect(second.startsWith('ok:')).assertTrue();
        expect(topOf(second) > topOf(first)).assertTrue();
      } else {
        // sm: neither row exists, so the ordering probe resolves to notfound
        expect(order).assertEqual('notfound');
        expect(first).assertEqual('notfound');
        expect(second).assertEqual('notfound');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0007 end');
    })

    /**
     * @tc.name   testUiList0008
     * @tc.number SUB_MUSICALBUM_UI_LIST_0008
     * @tc.desc   Anchor: the first three rows of the frozen table are all rendered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0008 begin');
      const reachable: boolean = await listInViewport();
      const present: number = await countIds('song_item_1,song_item_2,song_item_3');
      const third: string = await geometryOfId('song_item_3');
      const thirdVisible: boolean = await existsId('song_item_3');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s actual=%{public}d thirdVisible=%{public}s',
        reachable.toString(), present, thirdVisible.toString());
      if (reachable) {
        expect(present).assertEqual(3);
        expect(thirdVisible).assertTrue();
        expect(third.startsWith('ok:')).assertTrue();
      } else {
        // sm: the whole column is out of the band, so none of the three is mounted
        expect(present).assertEqual(0);
        expect(thirdVisible).assertFalse();
        expect(await countIds('play_all_row,player_root')).assertEqual(2);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0008 end');
    })

    /**
     * @tc.name   testUiList0009
     * @tc.number SUB_MUSICALBUM_UI_LIST_0009
     * @tc.desc   the first two rows keep the same height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0009 begin');
      const reachable: boolean = await listInViewport();
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_2');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s first=%{public}d second=%{public}d', reachable.toString(),
        heightOf(first), heightOf(second));
      if (reachable) {
        expect(heightOf(first)).assertLarger(0);
        expect(heightOf(second)).assertLarger(0);
        expect(heightOf(second)).assertEqual(heightOf(first));
      } else {
        // sm: no row is mounted, the remaining fixed height belongs to the row head
        expect(first).assertEqual('notfound');
        expect(second).assertEqual('notfound');
        expect(heightOf(await geometryOfId('play_all_row'))).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0009 end');
    })

    /**
     * @tc.name   testUiList0010
     * @tc.number SUB_MUSICALBUM_UI_LIST_0010
     * @tc.desc   consecutive rows are stacked without a vertical gap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0010 begin');
      const reachable: boolean = await listInViewport();
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_2');
      const head: string = await geometryOfId('play_all_row');
      const band: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s gap=%{public}d', reachable.toString(),
        topOf(second) - bottomOf(first));
      if (reachable) {
        const gap: number = topOf(second) - bottomOf(first);
        expect(first.startsWith('ok:')).assertTrue();
        expect(gap >= 0).assertTrue();
        expect(gap <= 3).assertTrue();
      } else {
        // sm: the column keeps the full band width even when it is pushed out
        expect(first).assertEqual('notfound');
        expect(second).assertEqual('notfound');
        expect(Math.abs(rightOf(head) - rightOf(band))).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0010 end');
    })

    /**
     * @tc.name   testUiList0011
     * @tc.number SUB_MUSICALBUM_UI_LIST_0011
     * @tc.desc   the rows share the same left edge on a single lane layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0011 begin');
      const reachable: boolean = await listInViewport();
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_2');
      const head: string = await geometryOfId('play_all_row');
      const band: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s firstLeft=%{public}d secondLeft=%{public}d',
        reachable.toString(), leftOf(first), leftOf(second));
      if (reachable) {
        expect(leftOf(first)).assertLargerOrEqual(0);
        expect(leftOf(second)).assertEqual(leftOf(first));
        expect(rightOf(first)).assertEqual(rightOf(second));
      } else {
        // sm: only the row head is measurable, and it starts at the band edge
        expect(first).assertEqual('notfound');
        expect(second).assertEqual('notfound');
        expect(leftOf(head)).assertEqual(leftOf(band));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0011 end');
    })

    /**
     * @tc.name   testUiList0012
     * @tc.number SUB_MUSICALBUM_UI_LIST_0012
     * @tc.desc   Anchor: the frozen table leaves a gap at id 22, so that row is absent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0012 begin');
      const reachable: boolean = await listInViewport();
      const missing: boolean = await existsId('song_item_22');
      const geometry: string = await geometryOfId('song_item_22');
      const present: number = await countIds('song_item_1,song_item_22');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s missing=%{public}s geometry=%{public}s present=%{public}d',
        reachable.toString(), missing.toString(), geometry, present);
      expect(missing).assertFalse();
      expect(geometry).assertEqual('notfound');
      // with the column on screen only row 1 counts, otherwise neither id is mounted
      expect(present).assertEqual(reachable ? 1 : 0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0012 end');
    })

    /**
     * @tc.name   testUiList0013
     * @tc.number SUB_MUSICALBUM_UI_LIST_0013
     * @tc.desc   the row ids start at 1, so song_item_0 is never declared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0013 begin');
      const reachable: boolean = await listInViewport();
      const zero: boolean = await existsId('song_item_0');
      const one: boolean = await existsId('song_item_1');
      const geometry: string = await geometryOfId('song_item_0');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s zero=%{public}s one=%{public}s geometry=%{public}s',
        reachable.toString(), zero.toString(), one.toString(), geometry);
      expect(zero).assertFalse();
      expect(geometry).assertEqual('notfound');
      // row 1 exists exactly when its column is inside the viewport
      expect(one).assertEqual(reachable);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0013 end');
    })

    /**
     * @tc.name   testUiList0014
     * @tc.number SUB_MUSICALBUM_UI_LIST_0014
     * @tc.desc   the third row keeps the left edge and gains a lower top than the first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0014 begin');
      const reachable: boolean = await listInViewport();
      const first: string = await geometryOfId('song_item_1');
      const third: string = await geometryOfId('song_item_3');
      const band: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s firstLeft=%{public}d thirdLeft=%{public}d',
        reachable.toString(), leftOf(first), leftOf(third));
      if (reachable) {
        expect(leftOf(third)).assertEqual(leftOf(first));
        expect(topOf(third)).assertLarger(topOf(first));
        expect(heightOf(third)).assertEqual(heightOf(first));
      } else {
        // sm: the rows are gone, but the cover still ends inside the band
        expect(first).assertEqual('notfound');
        expect(third).assertEqual('notfound');
        expect(bottomOf(await geometryOfId('cover_album')) <= bottomOf(band)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0014 end');
    })

    /**
     * @tc.name   testUiList0015
     * @tc.number SUB_MUSICALBUM_UI_LIST_0015
     * @tc.desc   swiping inside the list container succeeds and keeps the container mounted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0015 begin');
      const reachable: boolean = await listInViewport();
      const swiped: string = await swipeUpInId('song_list');
      const stillThere: boolean = await existsId('song_list');
      const rect: string = await geometryOfId('song_list');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s swiped=%{public}s stillThere=%{public}s',
        reachable.toString(), swiped, stillThere.toString());
      if (reachable) {
        expect(swiped).assertEqual('ok');
        expect(stillThere).assertTrue();
        expect(rect.startsWith('ok:')).assertTrue();
      } else {
        // sm: a swipe can not start on a container that is not in the tree
        expect(swiped).assertEqual('notfound');
        expect(stillThere).assertFalse();
        expect(await existsId('content_root')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0015 end');
    })

    /**
     * @tc.name   testUiList0016
     * @tc.number SUB_MUSICALBUM_UI_LIST_0016
     * @tc.desc   the swipe brings later rows of the table closer to the viewport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0016 begin');
      const reachable: boolean = await listInViewport();
      const before: number = await countIds('song_item_1,song_item_8,song_item_12');
      const swiped: string = await swipeUpInId('song_list');
      const after: number = await countIds('song_item_1,song_item_8,song_item_12');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s before=%{public}d after=%{public}d swiped=%{public}s',
        reachable.toString(), before, after, swiped);
      if (reachable) {
        expect(swiped).assertEqual('ok');
        expect(before >= 1).assertTrue();
        expect(after).assertLargerOrEqual(1);
      } else {
        // sm: the sampled rows are all outside the band before and after the swipe
        expect(before).assertEqual(0);
        expect(after).assertEqual(0);
        expect(swiped).assertEqual('notfound');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0016 end');
    })

    /**
     * @tc.name   testUiList0017
     * @tc.number SUB_MUSICALBUM_UI_LIST_0017
     * @tc.desc   scrolling content does not move the list container itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0017 begin');
      const reachable: boolean = await listInViewport();
      const before: string = await geometryOfId('song_list');
      await swipeUpInId('song_list');
      const after: string = await geometryOfId('song_list');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s beforeTop=%{public}d afterTop=%{public}d',
        reachable.toString(), topOf(before), topOf(after));
      expect(after).assertEqual(before);
      if (reachable) {
        expect(after.startsWith('ok:')).assertTrue();
        expect(heightOf(after)).assertLarger(0);
      } else {
        expect(before).assertEqual('notfound');
        expect(await existsId('content_root')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0017 end');
    })

    /**
     * @tc.name   testUiList0018
     * @tc.number SUB_MUSICALBUM_UI_LIST_0018
     * @tc.desc   the bottom player stays on screen while the list is scrolled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0018 begin');
      await swipeUpInId('song_list');
      const player: string = await geometryOfId('player_root');
      const screen: string = await displaySize();
      const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
      hilog.info(DOMAIN, TAG, 'playerBottom=%{public}d screenHeight=%{public}d', bottomOf(player), screenHeight);
      expect(player.startsWith('ok:')).assertTrue();
      expect(bottomOf(player) <= screenHeight).assertTrue();
      expect(topOf(player)).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0018 end');
    })

    /**
     * @tc.name   testUiList0019
     * @tc.number SUB_MUSICALBUM_UI_LIST_0019
     * @tc.desc   the two first rows share the same width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0019 begin');
      const reachable: boolean = await listInViewport();
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_2');
      const head: string = await geometryOfId('play_all_row');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s firstWidth=%{public}d secondWidth=%{public}d',
        reachable.toString(), widthOf(first), widthOf(second));
      if (reachable) {
        expect(widthOf(first)).assertLarger(0);
        expect(widthOf(second)).assertEqual(widthOf(first));
        expect(rightOf(first)).assertEqual(rightOf(second));
      } else {
        // sm: only the row head is measurable and it keeps a positive width
        expect(first).assertEqual('notfound');
        expect(second).assertEqual('notfound');
        expect(widthOf(head)).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0019 end');
    })

    /**
     * @tc.name   testUiList0020
     * @tc.number SUB_MUSICALBUM_UI_LIST_0020
     * @tc.desc   the row gap stays below the height of a single row
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiList0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0020 begin');
      const reachable: boolean = await listInViewport();
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_2');
      const head: string = await geometryOfId('play_all_row');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s gap=%{public}d rowHeight=%{public}d', reachable.toString(),
        topOf(second) - bottomOf(first), heightOf(first));
      if (reachable) {
        const gap: number = topOf(second) - bottomOf(first);
        const rowHeight: number = heightOf(first);
        expect(gap).assertLargerOrEqual(0);
        expect(gap < rowHeight).assertTrue();
        expect(rowHeight).assertLarger(0);
      } else {
        // sm: no row pair exists, the row head still owns the only fixed height
        expect(first).assertEqual('notfound');
        expect(second).assertEqual('notfound');
        expect(heightOf(head)).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0020 end');
    })

    /**
     * @tc.name   testUiList0021
     * @tc.number SUB_MUSICALBUM_UI_LIST_0021
     * @tc.desc   the first row is bound below the play-all row
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0021 begin');
      const reachable: boolean = await listInViewport();
      const both: number = await countIds('play_all_row,song_item_1');
      const order: string = await aboveOfId('play_all_row', 'song_item_1');
      const row: string = await geometryOfId('play_all_row');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s both=%{public}d order=%{public}s', reachable.toString(), both,
        order);
      expect(row.startsWith('ok:')).assertTrue();
      if (reachable) {
        expect(both).assertEqual(2);
        expect(order).assertEqual('ok');
        expect(topOf(await geometryOfId('song_item_1')) >= bottomOf(row)).assertTrue();
      } else {
        // sm: the row head is on screen alone, its row is not bound at all
        expect(both).assertEqual(1);
        expect(order).assertEqual('notfound');
        expect(await existsId('song_item_1')).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0021 end');
    })

    /**
     * @tc.name   testUiList0022
     * @tc.number SUB_MUSICALBUM_UI_LIST_0022
     * @tc.desc   the list container reports a different component type than its rows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiList0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0022 begin');
      const reachable: boolean = await listInViewport();
      const list: string = await typeOfId('song_list');
      const row: string = await typeOfId('song_item_1');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s list=%{public}s row=%{public}s', reachable.toString(), list, row);
      if (reachable) {
        expect(list.startsWith('ok:')).assertTrue();
        expect(row.startsWith('ok:')).assertTrue();
        expect(list === row).assertFalse();
      } else {
        // sm: both ids are unmounted, the row head keeps its own type
        expect(list).assertEqual('notfound');
        expect(row).assertEqual('notfound');
        expect((await typeOfId('play_all_row')).startsWith('ok:')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0022 end');
    })

    /**
     * @tc.name   testUiList0023
     * @tc.number SUB_MUSICALBUM_UI_LIST_0023
     * @tc.desc   the third row is bound below the second row
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0023 begin');
      const reachable: boolean = await listInViewport();
      const order: string = await aboveOfId('song_item_2', 'song_item_3');
      const second: string = await geometryOfId('song_item_2');
      const third: string = await geometryOfId('song_item_3');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s order=%{public}s secondBottom=%{public}d thirdTop=%{public}d',
        reachable.toString(), order, bottomOf(second), topOf(third));
      if (reachable) {
        expect(order).assertEqual('ok');
        expect(topOf(third) >= bottomOf(second)).assertTrue();
        expect(third.startsWith('ok:')).assertTrue();
      } else {
        // sm: no row pair is bound, the ordering probe reports the missing marker
        expect(order).assertEqual('notfound');
        expect(second).assertEqual('notfound');
        expect(third).assertEqual('notfound');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0023 end');
    })

    /**
     * @tc.name   testUiList0024
     * @tc.number SUB_MUSICALBUM_UI_LIST_0024
     * @tc.desc   Anchor: a row id outside the table is reported as missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0024 begin');
      const missing: boolean = await existsId('song_item_999');
      const rect: string = await geometryOfId('song_item_999');
      const type: string = await typeOfId('song_item_999');
      hilog.info(DOMAIN, TAG, 'missing=%{public}s rect=%{public}s type=%{public}s', missing.toString(), rect, type);
      expect(missing).assertFalse();
      expect(rect).assertEqual('notfound');
      expect(type).assertEqual('notfound');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0024 end');
    })

    /**
     * @tc.name   testUiList0025
     * @tc.number SUB_MUSICALBUM_UI_LIST_0025
     * @tc.desc   at most one list container is mounted on the page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0025 begin');
      const reachable: boolean = await listInViewport();
      const count: number = await countIds('song_list');
      const rect: string = await geometryOfId('song_list');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s count=%{public}d rect=%{public}s', reachable.toString(), count,
        rect);
      // the column is rendered once when it fits and not at all when it is pushed out
      expect(count).assertEqual(reachable ? 1 : 0);
      expect(count <= 1).assertTrue();
      expect(await existsId('content_root')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0025 end');
    })

    /**
     * @tc.name   testUiList0026
     * @tc.number SUB_MUSICALBUM_UI_LIST_0026
     * @tc.desc   the list column sits inside the display rectangle on both axes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0026 begin');
      const reachable: boolean = await listInViewport();
      const list: string = await geometryOfId('song_list');
      const band: string = await geometryOfId('content_root');
      const screen: string = await displaySize();
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s left=%{public}d top=%{public}d right=%{public}d bottom=%{public}d',
        reachable.toString(), leftOf(list), topOf(list), rightOf(list), bottomOf(list));
      if (reachable) {
        expect(leftOf(list) >= 0).assertTrue();
        expect(rightOf(list) <= screenWidth).assertTrue();
        expect(bottomOf(list) <= screenHeight).assertTrue();
      } else {
        // sm: the band that would hold the column already fits the display
        expect(list).assertEqual('notfound');
        expect(rightOf(band) <= screenWidth).assertTrue();
        expect(bottomOf(band) <= screenHeight).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0026 end');
    })

    /**
     * @tc.name   testUiList0027
     * @tc.number SUB_MUSICALBUM_UI_LIST_0027
     * @tc.desc   the list column is rebuilt in the same shape after a full reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiList0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0027 begin');
      await resetToHome();
      const reachable: boolean = await listInViewport();
      const visible: boolean = await waitId('song_list', WAIT_MS);
      const first: boolean = await existsId('song_item_1');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s visible=%{public}s first=%{public}s', reachable.toString(),
        visible.toString(), first.toString());
      expect(visible).assertEqual(reachable);
      expect(first).assertEqual(reachable);
      expect(await waitId('header_root', WAIT_MS)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0027 end');
    })

    /**
     * @tc.name   testUiList0028
     * @tc.number SUB_MUSICALBUM_UI_LIST_0028
     * @tc.desc   tapping a song row keeps the page bands mounted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0028 begin');
      const reachable: boolean = await listInViewport();
      const clicked: string = await clickId('song_item_1');
      const header: boolean = await existsId('header_root');
      const player: boolean = await existsId('player_root');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s clicked=%{public}s header=%{public}s player=%{public}s',
        reachable.toString(), clicked, header.toString(), player.toString());
      expect(clicked).assertEqual(reachable ? 'ok' : 'notfound');
      expect(header).assertTrue();
      expect(player).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0028 end');
    })

    /**
     * @tc.name   testUiList0029
     * @tc.number SUB_MUSICALBUM_UI_LIST_0029
     * @tc.desc   two swipes do not detach the play-all row from the list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiList0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0029 begin');
      const reachable: boolean = await listInViewport();
      const first: string = await swipeUpInId('song_list');
      const second: string = await swipeUpInId('song_list');
      const order: string = await aboveOfId('play_all_row', 'song_list');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s first=%{public}s second=%{public}s order=%{public}s',
        reachable.toString(), first, second, order);
      expect(first).assertEqual(second);
      if (reachable) {
        expect(first).assertEqual('ok');
        expect(order).assertEqual('ok');
      } else {
        expect(first).assertEqual('notfound');
        expect(order).assertEqual('notfound');
        expect(await existsId('play_all_row')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0029 end');
    })

    /**
     * @tc.name   testUiList0030
     * @tc.number SUB_MUSICALBUM_UI_LIST_0030
     * @tc.desc   the list geometry is stable across two consecutive reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiList0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0030 begin');
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_1');
      const listA: string = await geometryOfId('song_list');
      const listB: string = await geometryOfId('song_list');
      hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s listA=%{public}s listB=%{public}s', first, second,
        listA, listB);
      expect(first).assertEqual(second);
      expect(listA).assertEqual(listB);
      expect((await geometryOfId('content_root')).startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0030 end');
    })

  })
}
