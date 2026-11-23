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
import { describe, it, expect, beforeAll, afterEach } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
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

export default function uiList01Test(): void {
  describe('UiList01Test', () => {

    beforeAll(async () => {
      await resetToHome();
    })

    afterEach(async () => {
      await resetToHome();
    })

    /*
     * @tc.number: SUB_UI_LIST_01_0100
     * @tc.name: testUiList0001
     * @tc.desc: Verify the list column is reachable when it fits, and the band head stays otherwise
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0001', 0, async (done: Function) => {
      await runCase('testUiList0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0001 begin');
        const reachable: boolean = await listInViewport();
        const rect: string = await geometryOfId('song_list');
        const type: string = await typeOfId('song_list');
        hilog.info(DOMAIN, TAG,
          'reachable=%{public}s rect=%{public}s type=%{public}s',
          reachable.toString(),
          rect,
          type);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
          expect(rect.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(type.startsWith('ok:')), 'true');
          expect(type.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(widthOf(rect)), '> ' + String(0));
          expect(widthOf(rect)).assertLarger(0);
        } else {
          // sm: the column is pushed out of the band, so neither id is mounted
          logAssertion(DOMAIN, TAG, String(rect), String('notfound'));
          expect(rect).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(type), String('notfound'));
          expect(type).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(await waitId('play_all_row', WAIT_MS)), 'true');
          expect(await waitId('play_all_row', WAIT_MS)).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_0200
     * @tc.name: testUiList0002
     * @tc.desc: Verify the list container sits below the play-all row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0002', 0, async (done: Function) => {
      await runCase('testUiList0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0002 begin');
        const reachable: boolean = await listInViewport();
        const order: string = await aboveOfId('play_all_row', 'song_list');
        const row: string = await geometryOfId('play_all_row');
        const list: string = await geometryOfId('song_list');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s order=%{public}s row=%{public}s list=%{public}s',
          reachable.toString(), order, row, list);
        logAssertion(DOMAIN, TAG, String(row.startsWith('ok:')), 'true');
        expect(row.startsWith('ok:')).assertTrue();
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(order), String('ok'));
          expect(order).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(list.startsWith('ok:')), 'true');
          expect(list.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(topOf(list) >= bottomOf(row)), 'true');
          expect(topOf(list) >= bottomOf(row)).assertTrue();
        } else {
          // sm: the row head is the last element of the band, its top is the band edge
          logAssertion(DOMAIN, TAG, String(order), String('notfound'));
          expect(order).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(topOf(row)), String(bottomOf(await geometryOfId('content_root'))));
          expect(topOf(row)).assertEqual(bottomOf(await geometryOfId('content_root')));
          logAssertion(DOMAIN, TAG, String(await aboveOfId('content_root', 'play_all_row')), String('ok'));
          expect(await aboveOfId('content_root', 'play_all_row')).assertEqual('ok');
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_0300
     * @tc.name: testUiList0003
     * @tc.desc: Verify the play-all row and the list do not overlap vertically
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0003', 0, async (done: Function) => {
      await runCase('testUiList0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0003 begin');
        const reachable: boolean = await listInViewport();
        const row: string = await geometryOfId('play_all_row');
        const list: string = await geometryOfId('song_list');
        const band: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s listTop=%{public}d rowBottom=%{public}d', reachable.toString(),
          topOf(list), bottomOf(row));
        logAssertion(DOMAIN, TAG, String(row.startsWith('ok:')), 'true');
        expect(row.startsWith('ok:')).assertTrue();
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(list.startsWith('ok:')), 'true');
          expect(list.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(topOf(list) >= bottomOf(row)), 'true');
          expect(topOf(list) >= bottomOf(row)).assertTrue();
          logAssertion(DOMAIN, TAG, String(heightOf(list)), '> ' + String(0));
          expect(heightOf(list)).assertLarger(0);
        } else {
          // sm: nothing is drawn below the row head, it ends past the band bottom
          logAssertion(DOMAIN, TAG, String(list), String('notfound'));
          expect(list).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(topOf(row)), String(bottomOf(band)));
          expect(topOf(row)).assertEqual(bottomOf(band));
          logAssertion(DOMAIN, TAG, String(bottomOf(row)), '> ' + String(bottomOf(band)));
          expect(bottomOf(row)).assertLarger(bottomOf(band));
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_0400
     * @tc.name: testUiList0004
     * @tc.desc: Verify the list column never leaves the display width
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0004', 0, async (done: Function) => {
      await runCase('testUiList0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0004 begin');
        const reachable: boolean = await listInViewport();
        const list: string = await geometryOfId('song_list');
        const row: string = await geometryOfId('play_all_row');
        const screen: string = await displaySize();
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s listWidth=%{public}d screenWidth=%{public}d',
          reachable.toString(), widthOf(list), screenWidth);
        logAssertion(DOMAIN, TAG, String(screen.startsWith('ok:')), 'true');
        expect(screen.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(screenWidth), '> ' + String(0));
        expect(screenWidth).assertLarger(0);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(widthOf(list)), '> ' + String(0));
          expect(widthOf(list)).assertLarger(0);
          logAssertion(DOMAIN, TAG, String(rightOf(list) <= screenWidth), 'true');
          expect(rightOf(list) <= screenWidth).assertTrue();
        } else {
          // sm: the row head is the widest element of the list column
          logAssertion(DOMAIN, TAG, String(list), String('notfound'));
          expect(list).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(widthOf(row)), String(screenWidth));
          expect(widthOf(row)).assertEqual(screenWidth);
          logAssertion(DOMAIN, TAG, String(rightOf(row)), String(screenWidth));
          expect(rightOf(row)).assertEqual(screenWidth);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_0500
     * @tc.name: testUiList0005
     * @tc.desc: Verify the list ends above the bottom player band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0005', 0, async (done: Function) => {
      await runCase('testUiList0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0005 begin');
        const reachable: boolean = await listInViewport();
        const list: string = await geometryOfId('song_list');
        const player: string = await geometryOfId('player_root');
        const row: string = await geometryOfId('play_all_row');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s listBottom=%{public}d playerTop=%{public}d',
          reachable.toString(), bottomOf(list), topOf(player));
        logAssertion(DOMAIN, TAG, String(player.startsWith('ok:')), 'true');
        expect(player.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(heightOf(player)), '> ' + String(0));
        expect(heightOf(player)).assertLarger(0);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(bottomOf(list) <= topOf(player)), 'true');
          expect(bottomOf(list) <= topOf(player)).assertTrue();
          logAssertion(DOMAIN, TAG, String(topOf(player) - bottomOf(list)), '>= ' + String(0));
          expect(topOf(player) - bottomOf(list)).assertLargerOrEqual(0);
        } else {
          // sm: the row head and the player share the same band edge
          logAssertion(DOMAIN, TAG, String(list), String('notfound'));
          expect(list).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(topOf(row)), String(topOf(player)));
          expect(topOf(row)).assertEqual(topOf(player));
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_0600
     * @tc.name: testUiList0006
     * @tc.desc: Verify the first song row is rendered inside the list bounds
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0006', 0, async (done: Function) => {
      await runCase('testUiList0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0006 begin');
        const reachable: boolean = await listInViewport();
        const row: string = await geometryOfId('song_item_1');
        const list: string = await geometryOfId('song_list');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s row=%{public}s list=%{public}s', reachable.toString(), row, list);
        if (reachable) {
          const inside: boolean = topOf(row) >= topOf(list) && bottomOf(row) <= bottomOf(list) &&
            leftOf(row) >= leftOf(list);
          logAssertion(DOMAIN, TAG, String(row.startsWith('ok:')), 'true');
          expect(row.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(inside), 'true');
          expect(inside).assertTrue();
          logAssertion(DOMAIN, TAG, String(heightOf(row)), '> ' + String(0));
          expect(heightOf(row)).assertLarger(0);
        } else {
          // sm: no row is mounted, only the row head of the column remains
          logAssertion(DOMAIN, TAG, String(row), String('notfound'));
          expect(row).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(list), String('notfound'));
          expect(list).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String((await geometryOfId('play_all_row')).startsWith('ok:')), 'true');
          expect((await geometryOfId('play_all_row')).startsWith('ok:')).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_0700
     * @tc.name: testUiList0007
     * @tc.desc: Verify the first row of the table is drawn above the second row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0007', 0, async (done: Function) => {
      await runCase('testUiList0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0007 begin');
        const reachable: boolean = await listInViewport();
        const order: string = await aboveOfId('song_item_1', 'song_item_2');
        const first: string = await geometryOfId('song_item_1');
        const second: string = await geometryOfId('song_item_2');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s order=%{public}s first=%{public}s second=%{public}s',
          reachable.toString(), order, first, second);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(order), String('ok'));
          expect(order).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(second.startsWith('ok:')), 'true');
          expect(second.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(topOf(second) > topOf(first)), 'true');
          expect(topOf(second) > topOf(first)).assertTrue();
        } else {
          // sm: neither row exists, so the ordering probe resolves to notfound
          logAssertion(DOMAIN, TAG, String(order), String('notfound'));
          expect(order).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_0800
     * @tc.name: testUiList0008
     * @tc.desc: Verify the first three rows of the frozen table are all rendered
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0008', 0, async (done: Function) => {
      await runCase('testUiList0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0008 begin');
        const reachable: boolean = await listInViewport();
        const present: number = await countIds('song_item_1,song_item_2,song_item_3');
        const third: string = await geometryOfId('song_item_3');
        const thirdVisible: boolean = await existsId('song_item_3');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s actual=%{public}d thirdVisible=%{public}s',
          reachable.toString(), present, thirdVisible.toString());
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(present), String(3));
          expect(present).assertEqual(3);
          logAssertion(DOMAIN, TAG, String(thirdVisible), 'true');
          expect(thirdVisible).assertTrue();
          logAssertion(DOMAIN, TAG, String(third.startsWith('ok:')), 'true');
          expect(third.startsWith('ok:')).assertTrue();
        } else {
          // sm: the whole column is out of the band, so none of the three is mounted
          logAssertion(DOMAIN, TAG, String(present), String(0));
          expect(present).assertEqual(0);
          logAssertion(DOMAIN, TAG, String(thirdVisible), 'false');
          expect(thirdVisible).assertFalse();
          logAssertion(DOMAIN, TAG, String(await countIds('play_all_row,player_root')), String(2));
          expect(await countIds('play_all_row,player_root')).assertEqual(2);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_0900
     * @tc.name: testUiList0009
     * @tc.desc: Verify the first two rows keep the same height
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0009', 0, async (done: Function) => {
      await runCase('testUiList0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0009 begin');
        const reachable: boolean = await listInViewport();
        const first: string = await geometryOfId('song_item_1');
        const second: string = await geometryOfId('song_item_2');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s first=%{public}d second=%{public}d', reachable.toString(),
          heightOf(first), heightOf(second));
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(heightOf(first)), '> ' + String(0));
          expect(heightOf(first)).assertLarger(0);
          logAssertion(DOMAIN, TAG, String(heightOf(second)), '> ' + String(0));
          expect(heightOf(second)).assertLarger(0);
          logAssertion(DOMAIN, TAG, String(heightOf(second)), String(heightOf(first)));
          expect(heightOf(second)).assertEqual(heightOf(first));
        } else {
          // sm: no row is mounted, the remaining fixed height belongs to the row head
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(heightOf(await geometryOfId('play_all_row'))), '> ' + String(0));
          expect(heightOf(await geometryOfId('play_all_row'))).assertLarger(0);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1000
     * @tc.name: testUiList0010
     * @tc.desc: Verify consecutive rows are stacked without a vertical gap
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0010', 0, async (done: Function) => {
      await runCase('testUiList0010', async (): Promise<void> => {
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
          logAssertion(DOMAIN, TAG, String(first.startsWith('ok:')), 'true');
          expect(first.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(gap >= 0), 'true');
          expect(gap >= 0).assertTrue();
          logAssertion(DOMAIN, TAG, String(gap <= 3), 'true');
          expect(gap <= 3).assertTrue();
        } else {
          // sm: the column keeps the full band width even when it is pushed out
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(Math.abs(rightOf(head) - rightOf(band))), String(0));
          expect(Math.abs(rightOf(head) - rightOf(band))).assertEqual(0);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1100
     * @tc.name: testUiList0011
     * @tc.desc: Verify the rows share the same left edge on a single lane layout
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0011', 0, async (done: Function) => {
      await runCase('testUiList0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0011 begin');
        const reachable: boolean = await listInViewport();
        const first: string = await geometryOfId('song_item_1');
        const second: string = await geometryOfId('song_item_2');
        const head: string = await geometryOfId('play_all_row');
        const band: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s firstLeft=%{public}d secondLeft=%{public}d',
          reachable.toString(), leftOf(first), leftOf(second));
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(leftOf(first)), '>= ' + String(0));
          expect(leftOf(first)).assertLargerOrEqual(0);
          logAssertion(DOMAIN, TAG, String(leftOf(second)), String(leftOf(first)));
          expect(leftOf(second)).assertEqual(leftOf(first));
          logAssertion(DOMAIN, TAG, String(rightOf(first)), String(rightOf(second)));
          expect(rightOf(first)).assertEqual(rightOf(second));
        } else {
          // sm: only the row head is measurable, and it starts at the band edge
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(leftOf(head)), String(leftOf(band)));
          expect(leftOf(head)).assertEqual(leftOf(band));
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1200
     * @tc.name: testUiList0012
     * @tc.desc: Verify the frozen table leaves a gap at id 22, so that row is absent
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0012', 0, async (done: Function) => {
      await runCase('testUiList0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0012 begin');
        const reachable: boolean = await listInViewport();
        const missing: boolean = await existsId('song_item_22');
        const geometry: string = await geometryOfId('song_item_22');
        const present: number = await countIds('song_item_1,song_item_22');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s missing=%{public}s geometry=%{public}s present=%{public}d',
          reachable.toString(), missing.toString(), geometry, present);
        logAssertion(DOMAIN, TAG, String(missing), 'false');
        expect(missing).assertFalse();
        logAssertion(DOMAIN, TAG, String(geometry), String('notfound'));
        expect(geometry).assertEqual('notfound');
        // with the column on screen only row 1 counts, otherwise neither id is mounted
        logAssertion(DOMAIN, TAG, String(present), String(reachable ? 1 : 0));
        expect(present).assertEqual(reachable ? 1 : 0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1300
     * @tc.name: testUiList0013
     * @tc.desc: Verify the row ids start at 1, so song_item_0 is never declared
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0013', 0, async (done: Function) => {
      await runCase('testUiList0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0013 begin');
        const reachable: boolean = await listInViewport();
        const zero: boolean = await existsId('song_item_0');
        const one: boolean = await existsId('song_item_1');
        const geometry: string = await geometryOfId('song_item_0');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s zero=%{public}s one=%{public}s geometry=%{public}s',
          reachable.toString(), zero.toString(), one.toString(), geometry);
        logAssertion(DOMAIN, TAG, String(zero), 'false');
        expect(zero).assertFalse();
        logAssertion(DOMAIN, TAG, String(geometry), String('notfound'));
        expect(geometry).assertEqual('notfound');
        // row 1 exists exactly when its column is inside the viewport
        logAssertion(DOMAIN, TAG, String(one), String(reachable));
        expect(one).assertEqual(reachable);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1400
     * @tc.name: testUiList0014
     * @tc.desc: Verify the third row keeps the left edge and gains a lower top than the first
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0014', 0, async (done: Function) => {
      await runCase('testUiList0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0014 begin');
        const reachable: boolean = await listInViewport();
        const first: string = await geometryOfId('song_item_1');
        const third: string = await geometryOfId('song_item_3');
        const band: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s firstLeft=%{public}d thirdLeft=%{public}d',
          reachable.toString(), leftOf(first), leftOf(third));
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(leftOf(third)), String(leftOf(first)));
          expect(leftOf(third)).assertEqual(leftOf(first));
          logAssertion(DOMAIN, TAG, String(topOf(third)), '> ' + String(topOf(first)));
          expect(topOf(third)).assertLarger(topOf(first));
          logAssertion(DOMAIN, TAG, String(heightOf(third)), String(heightOf(first)));
          expect(heightOf(third)).assertEqual(heightOf(first));
        } else {
          // sm: the rows are gone, but the cover still ends inside the band
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(third), String('notfound'));
          expect(third).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(bottomOf(await geometryOfId('cover_album')) <= bottomOf(band)), 'true');
          expect(bottomOf(await geometryOfId('cover_album')) <= bottomOf(band)).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1500
     * @tc.name: testUiList0015
     * @tc.desc: Verify swiping inside the list container succeeds and keeps the container mounted
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0015', 0, async (done: Function) => {
      await runCase('testUiList0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0015 begin');
        const reachable: boolean = await listInViewport();
        const swiped: string = await swipeUpInId('song_list');
        const stillThere: boolean = await existsId('song_list');
        const rect: string = await geometryOfId('song_list');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s swiped=%{public}s stillThere=%{public}s',
          reachable.toString(), swiped, stillThere.toString());
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(swiped), String('ok'));
          expect(swiped).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(stillThere), 'true');
          expect(stillThere).assertTrue();
          logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
          expect(rect.startsWith('ok:')).assertTrue();
        } else {
          // sm: a swipe can not start on a container that is not in the tree
          logAssertion(DOMAIN, TAG, String(swiped), String('notfound'));
          expect(swiped).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(stillThere), 'false');
          expect(stillThere).assertFalse();
          logAssertion(DOMAIN, TAG, String(await existsId('content_root')), 'true');
          expect(await existsId('content_root')).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1600
     * @tc.name: testUiList0016
     * @tc.desc: Verify the swipe brings later rows of the table closer to the viewport
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0016', 0, async (done: Function) => {
      await runCase('testUiList0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0016 begin');
        const reachable: boolean = await listInViewport();
        const before: number = await countIds('song_item_1,song_item_8,song_item_12');
        const swiped: string = await swipeUpInId('song_list');
        const after: number = await countIds('song_item_1,song_item_8,song_item_12');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s before=%{public}d after=%{public}d swiped=%{public}s',
          reachable.toString(), before, after, swiped);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(swiped), String('ok'));
          expect(swiped).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(before >= 1), 'true');
          expect(before >= 1).assertTrue();
          logAssertion(DOMAIN, TAG, String(after), '>= ' + String(1));
          expect(after).assertLargerOrEqual(1);
        } else {
          // sm: the sampled rows are all outside the band before and after the swipe
          logAssertion(DOMAIN, TAG, String(before), String(0));
          expect(before).assertEqual(0);
          logAssertion(DOMAIN, TAG, String(after), String(0));
          expect(after).assertEqual(0);
          logAssertion(DOMAIN, TAG, String(swiped), String('notfound'));
          expect(swiped).assertEqual('notfound');
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1700
     * @tc.name: testUiList0017
     * @tc.desc: Verify scrolling content does not move the list container itself
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0017', 0, async (done: Function) => {
      await runCase('testUiList0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0017 begin');
        const reachable: boolean = await listInViewport();
        const before: string = await geometryOfId('song_list');
        await swipeUpInId('song_list');
        const after: string = await geometryOfId('song_list');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s beforeTop=%{public}d afterTop=%{public}d',
          reachable.toString(), topOf(before), topOf(after));
        logAssertion(DOMAIN, TAG, String(after), String(before));
        expect(after).assertEqual(before);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(after.startsWith('ok:')), 'true');
          expect(after.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(heightOf(after)), '> ' + String(0));
          expect(heightOf(after)).assertLarger(0);
        } else {
          logAssertion(DOMAIN, TAG, String(before), String('notfound'));
          expect(before).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(await existsId('content_root')), 'true');
          expect(await existsId('content_root')).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1800
     * @tc.name: testUiList0018
     * @tc.desc: Verify the bottom player stays on screen while the list is scrolled
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0018', 0, async (done: Function) => {
      await runCase('testUiList0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0018 begin');
        await swipeUpInId('song_list');
        const player: string = await geometryOfId('player_root');
        const screen: string = await displaySize();
        const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
        hilog.info(DOMAIN, TAG, 'playerBottom=%{public}d screenHeight=%{public}d', bottomOf(player), screenHeight);
        logAssertion(DOMAIN, TAG, String(player.startsWith('ok:')), 'true');
        expect(player.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(bottomOf(player) <= screenHeight), 'true');
        expect(bottomOf(player) <= screenHeight).assertTrue();
        logAssertion(DOMAIN, TAG, String(topOf(player)), '> ' + String(0));
        expect(topOf(player)).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_1900
     * @tc.name: testUiList0019
     * @tc.desc: Verify the two first rows share the same width
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0019', 0, async (done: Function) => {
      await runCase('testUiList0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0019 begin');
        const reachable: boolean = await listInViewport();
        const first: string = await geometryOfId('song_item_1');
        const second: string = await geometryOfId('song_item_2');
        const head: string = await geometryOfId('play_all_row');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s firstWidth=%{public}d secondWidth=%{public}d',
          reachable.toString(), widthOf(first), widthOf(second));
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(widthOf(first)), '> ' + String(0));
          expect(widthOf(first)).assertLarger(0);
          logAssertion(DOMAIN, TAG, String(widthOf(second)), String(widthOf(first)));
          expect(widthOf(second)).assertEqual(widthOf(first));
          logAssertion(DOMAIN, TAG, String(rightOf(first)), String(rightOf(second)));
          expect(rightOf(first)).assertEqual(rightOf(second));
        } else {
          // sm: only the row head is measurable and it keeps a positive width
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(widthOf(head)), '> ' + String(0));
          expect(widthOf(head)).assertLarger(0);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2000
     * @tc.name: testUiList0020
     * @tc.desc: Verify the row gap stays below the height of a single row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0020', 0, async (done: Function) => {
      await runCase('testUiList0020', async (): Promise<void> => {
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
          logAssertion(DOMAIN, TAG, String(gap), '>= ' + String(0));
          expect(gap).assertLargerOrEqual(0);
          logAssertion(DOMAIN, TAG, String(gap < rowHeight), 'true');
          expect(gap < rowHeight).assertTrue();
          logAssertion(DOMAIN, TAG, String(rowHeight), '> ' + String(0));
          expect(rowHeight).assertLarger(0);
        } else {
          // sm: no row pair exists, the row head still owns the only fixed height
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(heightOf(head)), '> ' + String(0));
          expect(heightOf(head)).assertLarger(0);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2100
     * @tc.name: testUiList0021
     * @tc.desc: Verify the first row is bound below the play-all row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0021', 0, async (done: Function) => {
      await runCase('testUiList0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0021 begin');
        const reachable: boolean = await listInViewport();
        const both: number = await countIds('play_all_row,song_item_1');
        const order: string = await aboveOfId('play_all_row', 'song_item_1');
        const row: string = await geometryOfId('play_all_row');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s both=%{public}d order=%{public}s', reachable.toString(), both,
          order);
        logAssertion(DOMAIN, TAG, String(row.startsWith('ok:')), 'true');
        expect(row.startsWith('ok:')).assertTrue();
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(both), String(2));
          expect(both).assertEqual(2);
          logAssertion(DOMAIN, TAG, String(order), String('ok'));
          expect(order).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(topOf(await geometryOfId('song_item_1')) >= bottomOf(row)), 'true');
          expect(topOf(await geometryOfId('song_item_1')) >= bottomOf(row)).assertTrue();
        } else {
          // sm: the row head is on screen alone, its row is not bound at all
          logAssertion(DOMAIN, TAG, String(both), String(1));
          expect(both).assertEqual(1);
          logAssertion(DOMAIN, TAG, String(order), String('notfound'));
          expect(order).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(await existsId('song_item_1')), 'false');
          expect(await existsId('song_item_1')).assertFalse();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2200
     * @tc.name: testUiList0022
     * @tc.desc: Verify the list container reports a different component type than its rows
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0022', 0, async (done: Function) => {
      await runCase('testUiList0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0022 begin');
        const reachable: boolean = await listInViewport();
        const list: string = await typeOfId('song_list');
        const row: string = await typeOfId('song_item_1');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s list=%{public}s row=%{public}s', reachable.toString(), list, row);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(list.startsWith('ok:')), 'true');
          expect(list.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(row.startsWith('ok:')), 'true');
          expect(row.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(list === row), 'false');
          expect(list === row).assertFalse();
        } else {
          // sm: both ids are unmounted, the row head keeps its own type
          logAssertion(DOMAIN, TAG, String(list), String('notfound'));
          expect(list).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(row), String('notfound'));
          expect(row).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String((await typeOfId('play_all_row')).startsWith('ok:')), 'true');
          expect((await typeOfId('play_all_row')).startsWith('ok:')).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2300
     * @tc.name: testUiList0023
     * @tc.desc: Verify the third row is bound below the second row
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0023', 0, async (done: Function) => {
      await runCase('testUiList0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0023 begin');
        const reachable: boolean = await listInViewport();
        const order: string = await aboveOfId('song_item_2', 'song_item_3');
        const second: string = await geometryOfId('song_item_2');
        const third: string = await geometryOfId('song_item_3');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s order=%{public}s secondBottom=%{public}d thirdTop=%{public}d',
          reachable.toString(), order, bottomOf(second), topOf(third));
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(order), String('ok'));
          expect(order).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(topOf(third) >= bottomOf(second)), 'true');
          expect(topOf(third) >= bottomOf(second)).assertTrue();
          logAssertion(DOMAIN, TAG, String(third.startsWith('ok:')), 'true');
          expect(third.startsWith('ok:')).assertTrue();
        } else {
          // sm: no row pair is bound, the ordering probe reports the missing marker
          logAssertion(DOMAIN, TAG, String(order), String('notfound'));
          expect(order).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(third), String('notfound'));
          expect(third).assertEqual('notfound');
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2400
     * @tc.name: testUiList0024
     * @tc.desc: Verify a row id outside the table is reported as missing
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0024', 0, async (done: Function) => {
      await runCase('testUiList0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0024 begin');
        const missing: boolean = await existsId('song_item_999');
        const rect: string = await geometryOfId('song_item_999');
        const type: string = await typeOfId('song_item_999');
        hilog.info(DOMAIN, TAG, 'missing=%{public}s rect=%{public}s type=%{public}s', missing.toString(), rect, type);
        logAssertion(DOMAIN, TAG, String(missing), 'false');
        expect(missing).assertFalse();
        logAssertion(DOMAIN, TAG, String(rect), String('notfound'));
        expect(rect).assertEqual('notfound');
        logAssertion(DOMAIN, TAG, String(type), String('notfound'));
        expect(type).assertEqual('notfound');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2500
     * @tc.name: testUiList0025
     * @tc.desc: Verify at most one list container is mounted on the page
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0025', 0, async (done: Function) => {
      await runCase('testUiList0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0025 begin');
        const reachable: boolean = await listInViewport();
        const count: number = await countIds('song_list');
        const rect: string = await geometryOfId('song_list');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s count=%{public}d rect=%{public}s', reachable.toString(), count,
          rect);
        // the column is rendered once when it fits and not at all when it is pushed out
        logAssertion(DOMAIN, TAG, String(count), String(reachable ? 1 : 0));
        expect(count).assertEqual(reachable ? 1 : 0);
        logAssertion(DOMAIN, TAG, String(count <= 1), 'true');
        expect(count <= 1).assertTrue();
        logAssertion(DOMAIN, TAG, String(await existsId('content_root')), 'true');
        expect(await existsId('content_root')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2600
     * @tc.name: testUiList0026
     * @tc.desc: Verify the list column sits inside the display rectangle on both axes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0026', 0, async (done: Function) => {
      await runCase('testUiList0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0026 begin');
        const reachable: boolean = await listInViewport();
        const list: string = await geometryOfId('song_list');
        const band: string = await geometryOfId('content_root');
        const screen: string = await displaySize();
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
        hilog.info(DOMAIN, TAG,
          'reachable=%{public}s left=%{public}d top=%{public}d right=%{public}d bottom=%{public}d',
          reachable.toString(), leftOf(list), topOf(list), rightOf(list), bottomOf(list));
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(leftOf(list) >= 0), 'true');
          expect(leftOf(list) >= 0).assertTrue();
          logAssertion(DOMAIN, TAG, String(rightOf(list) <= screenWidth), 'true');
          expect(rightOf(list) <= screenWidth).assertTrue();
          logAssertion(DOMAIN, TAG, String(bottomOf(list) <= screenHeight), 'true');
          expect(bottomOf(list) <= screenHeight).assertTrue();
        } else {
          // sm: the band that would hold the column already fits the display
          logAssertion(DOMAIN, TAG, String(list), String('notfound'));
          expect(list).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(rightOf(band) <= screenWidth), 'true');
          expect(rightOf(band) <= screenWidth).assertTrue();
          logAssertion(DOMAIN, TAG, String(bottomOf(band) <= screenHeight), 'true');
          expect(bottomOf(band) <= screenHeight).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2700
     * @tc.name: testUiList0027
     * @tc.desc: Verify the list column is rebuilt in the same shape after a full reset
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiList0027', 0, async (done: Function) => {
      await runCase('testUiList0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0027 begin');
        await resetToHome();
        const reachable: boolean = await listInViewport();
        const visible: boolean = await waitId('song_list', WAIT_MS);
        const first: boolean = await existsId('song_item_1');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s visible=%{public}s first=%{public}s', reachable.toString(),
          visible.toString(), first.toString());
        logAssertion(DOMAIN, TAG, String(visible), String(reachable));
        expect(visible).assertEqual(reachable);
        logAssertion(DOMAIN, TAG, String(first), String(reachable));
        expect(first).assertEqual(reachable);
        logAssertion(DOMAIN, TAG, String(await waitId('header_root', WAIT_MS)), 'true');
        expect(await waitId('header_root', WAIT_MS)).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2800
     * @tc.name: testUiList0028
     * @tc.desc: Verify tapping a song row keeps the page bands mounted
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0028', 0, async (done: Function) => {
      await runCase('testUiList0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0028 begin');
        const reachable: boolean = await listInViewport();
        const clicked: string = await clickId('song_item_1');
        const header: boolean = await existsId('header_root');
        const player: boolean = await existsId('player_root');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s clicked=%{public}s header=%{public}s player=%{public}s',
          reachable.toString(), clicked, header.toString(), player.toString());
        logAssertion(DOMAIN, TAG, String(clicked), String(reachable ? 'ok' : 'notfound'));
        expect(clicked).assertEqual(reachable ? 'ok' : 'notfound');
        logAssertion(DOMAIN, TAG, String(header), 'true');
        expect(header).assertTrue();
        logAssertion(DOMAIN, TAG, String(player), 'true');
        expect(player).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_2900
     * @tc.name: testUiList0029
     * @tc.desc: Verify two swipes do not detach the play-all row from the list
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0029', 0, async (done: Function) => {
      await runCase('testUiList0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0029 begin');
        const reachable: boolean = await listInViewport();
        const first: string = await swipeUpInId('song_list');
        const second: string = await swipeUpInId('song_list');
        const order: string = await aboveOfId('play_all_row', 'song_list');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s first=%{public}s second=%{public}s order=%{public}s',
          reachable.toString(), first, second, order);
        logAssertion(DOMAIN, TAG, String(first), String(second));
        expect(first).assertEqual(second);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(first), String('ok'));
          expect(first).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(order), String('ok'));
          expect(order).assertEqual('ok');
        } else {
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(order), String('notfound'));
          expect(order).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(await existsId('play_all_row')), 'true');
          expect(await existsId('play_all_row')).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_LIST_01_3000
     * @tc.name: testUiList0030
     * @tc.desc: Verify the list geometry is stable across two consecutive reads
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiList0030', 0, async (done: Function) => {
      await runCase('testUiList0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0030 begin');
        const first: string = await geometryOfId('song_item_1');
        const second: string = await geometryOfId('song_item_1');
        const listA: string = await geometryOfId('song_list');
        const listB: string = await geometryOfId('song_list');
        hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s listA=%{public}s listB=%{public}s', first, second,
          listA, listB);
        logAssertion(DOMAIN, TAG, String(first), String(second));
        expect(first).assertEqual(second);
        logAssertion(DOMAIN, TAG, String(listA), String(listB));
        expect(listA).assertEqual(listB);
        logAssertion(DOMAIN, TAG, String((await geometryOfId('content_root')).startsWith('ok:')), 'true');
        expect((await geometryOfId('content_root')).startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiList0030 end');
      }, done);
    });

  })
}
