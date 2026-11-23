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
import { describe, it, expect, beforeAll, afterEach } from '@ohos/hypium';
import { logAssertion, runCase } from '../util/TestCase';
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

export default function uiBreakpoint01Test(): void {
  describe('UiBreakpoint01Test', () => {

    beforeAll(async () => {
      await resetToHome();
    })

    afterEach(async () => {
      await resetToHome();
    })

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0100
     * @tc.name: testUiBreakpoint0001
     * @tc.desc: Verify the driver reports a positive display rectangle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiBreakpoint0001', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0001 begin');
        const screen: string = await displaySize();
        const width: number = Number(screen.replace('ok:', '').split(',')[0]);
        const height: number = Number(screen.replace('ok:', '').split(',')[1]);
        hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d screen=%{public}s', width, height, screen);
        logAssertion(DOMAIN, TAG, String(screen.startsWith('ok:')), 'true');
        expect(screen.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(width), '> ' + String(0));
        expect(width).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(height), '> ' + String(0));
        expect(height).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0200
     * @tc.name: testUiBreakpoint0002
     * @tc.desc: Verify the display rectangle is stable between two reads
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0002', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0002 begin');
        const first: string = await displaySize();
        const second: string = await displaySize();
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', second, first);
        logAssertion(DOMAIN, TAG, String(first), String(second));
        expect(first).assertEqual(second);
        logAssertion(DOMAIN, TAG, String(first.startsWith('ok:')), 'true');
        expect(first.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(first === 'notfound'), 'false');
        expect(first === 'notfound').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0300
     * @tc.name: testUiBreakpoint0003
     * @tc.desc: Verify the display is at least as wide as the smallest declared breakpoint
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0003', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0003 begin');
        const screen: string = await displaySize();
        const width: number = Number(screen.replace('ok:', '').split(',')[0]);
        const height: number = Number(screen.replace('ok:', '').split(',')[1]);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected>=%{public}d (px, sm band starts at 320vp)', width,
          MIN_BREAKPOINT_VP);
        logAssertion(DOMAIN, TAG, String(width), '>= ' + String(MIN_BREAKPOINT_VP));
        expect(width).assertLargerOrEqual(MIN_BREAKPOINT_VP);
        logAssertion(DOMAIN, TAG, String(height), '> ' + String(0));
        expect(height).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(width !== height), 'true');
        expect(width !== height).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0400
     * @tc.name: testUiBreakpoint0004
     * @tc.desc: Verify the header band covers the whole display width
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0004', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0004 begin');
        const header: string = await geometryOfId('header_root');
        const screen: string = await displaySize();
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', widthOf(header), screenWidth);
        logAssertion(DOMAIN, TAG, String(header.startsWith('ok:')), 'true');
        expect(header.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(leftOf(header)), String(0));
        expect(leftOf(header)).assertEqual(0);
        logAssertion(DOMAIN, TAG, String(widthOf(header)), String(screenWidth));
        expect(widthOf(header)).assertEqual(screenWidth);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0500
     * @tc.name: testUiBreakpoint0005
     * @tc.desc: Verify the content band covers the whole display width
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0005', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0005 begin');
        const content: string = await geometryOfId('content_root');
        const screen: string = await displaySize();
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', widthOf(content), screenWidth);
        logAssertion(DOMAIN, TAG, String(content.startsWith('ok:')), 'true');
        expect(content.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(widthOf(content)), '> ' + String(0));
        expect(widthOf(content)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(rightOf(content)), String(screenWidth));
        expect(rightOf(content)).assertEqual(screenWidth);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0600
     * @tc.name: testUiBreakpoint0006
     * @tc.desc: Verify the player band covers the whole display width
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0006', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0006 begin');
        const player: string = await geometryOfId('player_root');
        const screen: string = await displaySize();
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        const playerWidth: number = widthOf(player);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', playerWidth, screenWidth);
        logAssertion(DOMAIN, TAG, String(player.startsWith('ok:')), 'true');
        expect(player.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(playerWidth), String(screenWidth));
        expect(playerWidth).assertEqual(screenWidth);
        logAssertion(DOMAIN, TAG, String(playerWidth), '> ' + String(0));
        expect(playerWidth).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0700
     * @tc.name: testUiBreakpoint0007
     * @tc.desc: Verify the page is built from exactly three bands
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiBreakpoint0007', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0007 begin');
        const bands: number = await countIds('header_root,content_root,player_root');
        const header: boolean = await waitId('header_root', WAIT_MS);
        const player: boolean = await existsId('player_root');
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=3 header=%{public}s player=%{public}s', bands,
          header.toString(), player.toString());
        logAssertion(DOMAIN, TAG, String(bands), String(3));
        expect(bands).assertEqual(3);
        logAssertion(DOMAIN, TAG, String(header), 'true');
        expect(header).assertTrue();
        logAssertion(DOMAIN, TAG, String(player), 'true');
        expect(player).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0800
     * @tc.name: testUiBreakpoint0008
     * @tc.desc: Verify the header band is rendered above the content band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiBreakpoint0008', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0008 begin');
        const order: string = await aboveOfId('header_root', 'content_root');
        const header: string = await geometryOfId('header_root');
        const content: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'order=%{public}s headerBottom=%{public}d contentTop=%{public}d', order,
          bottomOf(header), topOf(content));
        logAssertion(DOMAIN, TAG, String(order), String('ok'));
        expect(order).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(bottomOf(header) <= topOf(content)), 'true');
        expect(bottomOf(header) <= topOf(content)).assertTrue();
        logAssertion(DOMAIN, TAG, String(content.startsWith('ok:')), 'true');
        expect(content.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_0900
     * @tc.name: testUiBreakpoint0009
     * @tc.desc: Verify the content band is rendered above the player band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiBreakpoint0009', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0009 begin');
        const order: string = await aboveOfId('content_root', 'player_root');
        const content: string = await geometryOfId('content_root');
        const player: string = await geometryOfId('player_root');
        hilog.info(DOMAIN, TAG, 'order=%{public}s contentBottom=%{public}d playerTop=%{public}d', order,
          bottomOf(content), topOf(player));
        logAssertion(DOMAIN, TAG, String(order), String('ok'));
        expect(order).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(bottomOf(content) <= topOf(player)), 'true');
        expect(bottomOf(content) <= topOf(player)).assertTrue();
        logAssertion(DOMAIN, TAG, String(player.startsWith('ok:')), 'true');
        expect(player.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1000
     * @tc.name: testUiBreakpoint0010
     * @tc.desc: Verify the three bands are stacked with strictly increasing tops
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0010', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0010 begin');
        const header: string = await geometryOfId('header_root');
        const content: string = await geometryOfId('content_root');
        const player: string = await geometryOfId('player_root');
        hilog.info(DOMAIN, TAG, 'headerTop=%{public}d contentTop=%{public}d playerTop=%{public}d', topOf(header),
          topOf(content), topOf(player));
        logAssertion(DOMAIN, TAG, String(topOf(header) < topOf(content)), 'true');
        expect(topOf(header) < topOf(content)).assertTrue();
        logAssertion(DOMAIN, TAG, String(topOf(content) < topOf(player)), 'true');
        expect(topOf(content) < topOf(player)).assertTrue();
        logAssertion(DOMAIN, TAG, String(topOf(player) < bottomOf(player)), 'true');
        expect(topOf(player) < bottomOf(player)).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1100
     * @tc.name: testUiBreakpoint0011
     * @tc.desc: Verify the content band takes the space left between the two toolbars
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0011', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0011 begin');
        const header: string = await geometryOfId('header_root');
        const content: string = await geometryOfId('content_root');
        const player: string = await geometryOfId('player_root');
        const gapTop: number = topOf(content) - bottomOf(header);
        const gapBottom: number = topOf(player) - bottomOf(content);
        hilog.info(DOMAIN, TAG, 'gapTop=%{public}d gapBottom=%{public}d contentHeight=%{public}d', gapTop,
          gapBottom, heightOf(content));
        logAssertion(DOMAIN, TAG, String(gapTop), '>= ' + String(0));
        expect(gapTop).assertLargerOrEqual(0);
        logAssertion(DOMAIN, TAG, String(gapBottom), '>= ' + String(0));
        expect(gapBottom).assertLargerOrEqual(0);
        logAssertion(DOMAIN, TAG, String(heightOf(content)), '> ' + String(0));
        expect(heightOf(content)).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1200
     * @tc.name: testUiBreakpoint0012
     * @tc.desc: Verify the content band never exceeds the display height
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0012', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0012 begin');
        const content: string = await geometryOfId('content_root');
        const screen: string = await displaySize();
        const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected<=%{public}d', heightOf(content), screenHeight);
        logAssertion(DOMAIN, TAG, String(heightOf(content)), '> ' + String(0));
        expect(heightOf(content)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(heightOf(content) <= screenHeight), 'true');
        expect(heightOf(content) <= screenHeight).assertTrue();
        logAssertion(DOMAIN, TAG, String(bottomOf(content) <= screenHeight), 'true');
        expect(bottomOf(content) <= screenHeight).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1300
     * @tc.name: testUiBreakpoint0013
     * @tc.desc: Verify the album cover keeps the 1:1 aspect ratio required by the layout
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiBreakpoint0013', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0013 begin');
        const cover: string = await geometryOfId('cover_album');
        hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(cover), heightOf(cover));
        logAssertion(DOMAIN, TAG, String(cover.startsWith('ok:')), 'true');
        expect(cover.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(widthOf(cover)), '> ' + String(0));
        expect(widthOf(cover)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(Math.abs(widthOf(cover) - heightOf(cover)) <= 2), 'true');
        expect(Math.abs(widthOf(cover) - heightOf(cover)) <= 2).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1400
     * @tc.name: testUiBreakpoint0014
     * @tc.desc: Verify the album cover is inside the content band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0014', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0014 begin');
        const cover: string = await geometryOfId('cover_album');
        const content: string = await geometryOfId('content_root');
        const inside: boolean = topOf(cover) >= topOf(content) && leftOf(cover) >= leftOf(content) &&
          rightOf(cover) <= rightOf(content);
        hilog.info(DOMAIN, TAG, 'inside=%{public}s coverTop=%{public}d contentTop=%{public}d', inside.toString(),
          topOf(cover), topOf(content));
        logAssertion(DOMAIN, TAG, String(inside), 'true');
        expect(inside).assertTrue();
        logAssertion(DOMAIN, TAG, String(widthOf(cover) <= widthOf(content)), 'true');
        expect(widthOf(cover) <= widthOf(content)).assertTrue();
        logAssertion(DOMAIN, TAG, String(rightOf(cover)), '> ' + String(leftOf(cover)));
        expect(rightOf(cover)).assertLarger(leftOf(cover));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1500
     * @tc.name: testUiBreakpoint0015
     * @tc.desc: Verify the collection counter is drawn over the album cover
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0015', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0015 begin');
        const cover: string = await geometryOfId('cover_album');
        const counter: string = await geometryOfId('cover_collection_num');
        const counterText: string = await textOfId('cover_collection_num');
        const overCover: boolean = topOf(counter) >= topOf(cover) && bottomOf(counter) <= bottomOf(cover) &&
          leftOf(counter) >= leftOf(cover) && rightOf(counter) <= rightOf(cover);
        hilog.info(DOMAIN, TAG, 'overCover=%{public}s counter=%{public}s', overCover.toString(), counter);
        logAssertion(DOMAIN, TAG, String(counter.startsWith('ok:')), 'true');
        expect(counter.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(overCover), 'true');
        expect(overCover).assertTrue();
        logAssertion(DOMAIN, TAG, String(counterText), String('ok:' + expectedText('collection_num')));
        expect(counterText).assertEqual('ok:' + expectedText('collection_num'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1600
     * @tc.name: testUiBreakpoint0016
     * @tc.desc: Verify the playlist name is inside the content band when the copy column is laid out
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0016', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0016 begin');
        const inline: boolean = await introInViewport();
        const name: string = await geometryOfId('cover_list_name');
        const content: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'inline=%{public}s nameTop=%{public}d contentTop=%{public}d nameRight=%{public}d',
          inline.toString(), topOf(name), topOf(content), rightOf(name));
        logAssertion(DOMAIN, TAG, String(content.startsWith('ok:')), 'true');
        expect(content.startsWith('ok:')).assertTrue();
        if (inline) {
          logAssertion(DOMAIN, TAG, String(name.startsWith('ok:')), 'true');
          expect(name.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(topOf(name) >= topOf(content)), 'true');
          expect(topOf(name) >= topOf(content)).assertTrue();
          logAssertion(DOMAIN, TAG, String(rightOf(name) <= rightOf(content)), 'true');
          expect(rightOf(name) <= rightOf(content)).assertTrue();
        } else {
          // sm: the enlarged cover covers the copy column, so the name never enters
          // the tree and the cover itself has to stay inside the band instead
          logAssertion(DOMAIN, TAG, String(name), String('notfound'));
          expect(name).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(topOf(await geometryOfId('cover_album')) >= topOf(content)), 'true');
          expect(topOf(await geometryOfId('cover_album')) >= topOf(content)).assertTrue();
          logAssertion(DOMAIN, TAG, String(rightOf(await geometryOfId('cover_album')) <= rightOf(content)), 'true');
          expect(rightOf(await geometryOfId('cover_album')) <= rightOf(content)).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1700
     * @tc.name: testUiBreakpoint0017
     * @tc.desc: Verify the playlist introduction keeps the copy of the resource file
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiBreakpoint0017', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0017 begin');
        const inline: boolean = await introInViewport();
        const text: string = await textOfId('cover_intro');
        const expected: string = 'ok:' + expectedText('playlist_Introduction');
        hilog.info(DOMAIN, TAG, 'inline=%{public}s actual=%{public}s expected=%{public}s', inline.toString(), text,
          expected);
        if (inline) {
          logAssertion(DOMAIN, TAG, String(text), String(expected));
          expect(text).assertEqual(expected);
          logAssertion(DOMAIN, TAG, String(text.startsWith('ok:')), 'true');
          expect(text.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(text.length), '> ' + String(3));
          expect(text.length).assertLarger(3);
        } else {
          // sm: the introduction is covered by the cover; the expectation must
          // still resolve, so the resource copy is proven instead of the node
          logAssertion(DOMAIN, TAG, String(text), String('notfound'));
          expect(text).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(expected.startsWith('ok:')), 'true');
          expect(expected.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(expected.length), '> ' + String(10));
          expect(expected.length).assertLarger(10);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1800
     * @tc.name: testUiBreakpoint0018
     * @tc.desc: Verify the option strip keeps a positive height inside the content band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0018', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0018 begin');
        const options: string = await geometryOfId('cover_options');
        const content: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'optionsHeight=%{public}d contentHeight=%{public}d', heightOf(options),
          heightOf(content));
        logAssertion(DOMAIN, TAG, String(options.startsWith('ok:')), 'true');
        expect(options.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(heightOf(options)), '> ' + String(0));
        expect(heightOf(options)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(rightOf(options) <= rightOf(content)), 'true');
        expect(rightOf(options) <= rightOf(content)).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_1900
     * @tc.name: testUiBreakpoint0019
     * @tc.desc: Verify the cover column and the list column use one of the two declared arrangements
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiBreakpoint0019', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0019 begin');
        const cover: string = await geometryOfId('cover_album');
        const list: string = await geometryOfId('play_all_row');
        const mode: string = arrangement(cover, list);
        hilog.info(DOMAIN, TAG, 'mode=%{public}s expected=horizontal|vertical cover=%{public}s list=%{public}s', mode,
          cover, list);
        logAssertion(DOMAIN, TAG, String(mode === 'horizontal' || mode === 'vertical'), 'true');
        expect(mode === 'horizontal' || mode === 'vertical').assertTrue();
        logAssertion(DOMAIN, TAG, String(mode === 'unknown'), 'false');
        expect(mode === 'unknown').assertFalse();
        logAssertion(DOMAIN, TAG, String(mode === 'overlap'), 'false');
        expect(mode === 'overlap').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2000
     * @tc.name: testUiBreakpoint0020
     * @tc.desc: Verify the arrangement on screen agrees with the geometry it implies
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0020', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0020 begin');
        const cover: string = await geometryOfId('cover_album');
        const list: string = await geometryOfId('play_all_row');
        const mode: string = arrangement(cover, list);
        const horizontalOk: boolean = mode === 'horizontal' && rightOf(cover) <= leftOf(list);
        const verticalOk: boolean = mode === 'vertical' && topOf(list) >= bottomOf(cover);
        hilog.info(DOMAIN, TAG, 'mode=%{public}s horizontalOk=%{public}s verticalOk=%{public}s', mode,
          horizontalOk.toString(), verticalOk.toString());
        logAssertion(DOMAIN, TAG, String(mode === 'unknown'), 'false');
        expect(mode === 'unknown').assertFalse();
        logAssertion(DOMAIN, TAG, String(horizontalOk || verticalOk), 'true');
        expect(horizontalOk || verticalOk).assertTrue();
        logAssertion(DOMAIN, TAG, String(horizontalOk && verticalOk), 'false');
        expect(horizontalOk && verticalOk).assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2100
     * @tc.name: testUiBreakpoint0021
     * @tc.desc: Verify the song list column never leaves the right edge of the display
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0021', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0021 begin');
        const reachable: boolean = await listInViewport();
        const list: string = await geometryOfId('song_list');
        const screen: string = await displaySize();
        const content: string = await geometryOfId('content_root');
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG,
          'reachable=%{public}s listRight=%{public}d contentRight=%{public}d screenWidth=%{public}d',
          reachable.toString(), rightOf(list), rightOf(content), screenWidth);
        logAssertion(DOMAIN, TAG, String(screen.startsWith('ok:')), 'true');
        expect(screen.startsWith('ok:')).assertTrue();
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(list.startsWith('ok:')), 'true');
          expect(list.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(rightOf(list) <= screenWidth), 'true');
          expect(rightOf(list) <= screenWidth).assertTrue();
          logAssertion(DOMAIN, TAG, String(widthOf(list)), '> ' + String(0));
          expect(widthOf(list)).assertLarger(0);
        } else {
          // sm: the list column is pushed out of the band, but its row head is
          // still on screen and must stop at the display edge
          logAssertion(DOMAIN, TAG, String(list), String('notfound'));
          expect(list).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(rightOf(await geometryOfId('play_all_row')) <= screenWidth), 'true');
          expect(rightOf(await geometryOfId('play_all_row')) <= screenWidth).assertTrue();
          logAssertion(DOMAIN, TAG, String(rightOf(content)), String(screenWidth));
          expect(rightOf(content)).assertEqual(screenWidth);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2200
     * @tc.name: testUiBreakpoint0022
     * @tc.desc: Verify the header band is shorter than the display it sits in
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0022', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0022 begin');
        const header: string = await geometryOfId('header_root');
        const player: string = await geometryOfId('player_root');
        const screen: string = await displaySize();
        const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
        const toolbars: number = heightOf(header) + heightOf(player);
        hilog.info(DOMAIN, TAG, 'toolbars=%{public}d screenHeight=%{public}d', toolbars, screenHeight);
        logAssertion(DOMAIN, TAG, String(heightOf(header)), '> ' + String(0));
        expect(heightOf(header)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(heightOf(header) < screenHeight), 'true');
        expect(heightOf(header) < screenHeight).assertTrue();
        logAssertion(DOMAIN, TAG, String(toolbars < screenHeight), 'true');
        expect(toolbars < screenHeight).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2300
     * @tc.name: testUiBreakpoint0023
     * @tc.desc: Verify the first two song rows share the same height when the list is on screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0023', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0023 begin');
        const reachable: boolean = await listInViewport();
        const first: string = await geometryOfId('song_item_1');
        const second: string = await geometryOfId('song_item_2');
        const head: string = await geometryOfId('play_all_row');
        const band: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s first=%{public}d second=%{public}d', reachable.toString(),
          heightOf(first), heightOf(second));
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(heightOf(first)), '> ' + String(0));
          expect(heightOf(first)).assertLarger(0);
          logAssertion(DOMAIN, TAG, String(heightOf(second)), String(heightOf(first)));
          expect(heightOf(second)).assertEqual(heightOf(first));
          logAssertion(DOMAIN, TAG, String(topOf(second)), '> ' + String(topOf(first)));
          expect(topOf(second)).assertLarger(topOf(first));
        } else {
          // sm: no row is on screen; the row head is pinned to the band bottom
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(Math.abs(topOf(head) - bottomOf(band)) <= 1), 'true');
          expect(Math.abs(topOf(head) - bottomOf(band)) <= 1).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2400
     * @tc.name: testUiBreakpoint0024
     * @tc.desc: Verify the play-all row starts at the left edge of its column
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0024', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0024 begin');
        const reachable: boolean = await listInViewport();
        const row: string = await geometryOfId('play_all_row');
        const list: string = await geometryOfId('song_list');
        const band: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s rowLeft=%{public}d listLeft=%{public}d rowWidth=%{public}d',
          reachable.toString(), leftOf(row), leftOf(list), widthOf(row));
        logAssertion(DOMAIN, TAG, String(widthOf(row)), '> ' + String(0));
        expect(widthOf(row)).assertLarger(0);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(leftOf(row)), String(leftOf(list)));
          expect(leftOf(row)).assertEqual(leftOf(list));
          logAssertion(DOMAIN, TAG, String(Math.abs(widthOf(row) - widthOf(list)) <= 2), 'true');
          expect(Math.abs(widthOf(row) - widthOf(list)) <= 2).assertTrue();
        } else {
          // sm: the list column is out of the band, so the row head spans the band
          logAssertion(DOMAIN, TAG, String(list), String('notfound'));
          expect(list).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(leftOf(row)), String(leftOf(band)));
          expect(leftOf(row)).assertEqual(leftOf(band));
          logAssertion(DOMAIN, TAG, String(Math.abs(widthOf(row) - widthOf(band)) <= 2), 'true');
          expect(Math.abs(widthOf(row) - widthOf(band)) <= 2).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2500
     * @tc.name: testUiBreakpoint0025
     * @tc.desc: Verify the playlist name and the cover are both inside the display width
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0025', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0025 begin');
        const inline: boolean = await introInViewport();
        const name: string = await geometryOfId('cover_list_name');
        const cover: string = await geometryOfId('cover_album');
        const screen: string = await displaySize();
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'inline=%{public}s nameRight=%{public}d coverRight=%{public}d screenWidth=%{public}d',
          inline.toString(), rightOf(name), rightOf(cover), screenWidth);
        logAssertion(DOMAIN, TAG, String(cover.startsWith('ok:')), 'true');
        expect(cover.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(rightOf(cover) <= screenWidth), 'true');
        expect(rightOf(cover) <= screenWidth).assertTrue();
        if (inline) {
          logAssertion(DOMAIN, TAG, String(rightOf(name) <= screenWidth), 'true');
          expect(rightOf(name) <= screenWidth).assertTrue();
          logAssertion(DOMAIN, TAG, String(leftOf(name)), '>= ' + String(0));
          expect(leftOf(name)).assertLargerOrEqual(0);
        } else {
          // sm: the name is covered, but nothing may spill past the display edge
          logAssertion(DOMAIN, TAG, String(name), String('notfound'));
          expect(name).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(leftOf(cover)), '>= ' + String(0));
          expect(leftOf(cover)).assertLargerOrEqual(0);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2600
     * @tc.name: testUiBreakpoint0026
     * @tc.desc: Verify the header title keeps the play_list copy on every breakpoint
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiBreakpoint0026', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0026 begin');
        const text: string = await textOfId('header_title');
        const expected: string = 'ok:' + expectedText('play_list');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
        logAssertion(DOMAIN, TAG, String(text), String(expected));
        expect(text).assertEqual(expected);
        logAssertion(DOMAIN, TAG, String(text === 'notfound'), 'false');
        expect(text === 'notfound').assertFalse();
        logAssertion(DOMAIN, TAG, String(text.length), '> ' + String(3));
        expect(text.length).assertLarger(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2700
     * @tc.name: testUiBreakpoint0027
     * @tc.desc: Verify the cover never overlaps the option strip vertically
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0027', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0027 begin');
        const cover: string = await geometryOfId('cover_album');
        const options: string = await geometryOfId('cover_options');
        const mode: string = arrangement(cover, await geometryOfId('play_all_row'));
        hilog.info(DOMAIN, TAG, 'mode=%{public}s coverBottom=%{public}d optionsTop=%{public}d', mode,
          bottomOf(cover), topOf(options));
        logAssertion(DOMAIN, TAG, String(mode === 'unknown'), 'false');
        expect(mode === 'unknown').assertFalse();
        logAssertion(DOMAIN, TAG, String(bottomOf(cover) <= topOf(options)), 'true');
        expect(bottomOf(cover) <= topOf(options)).assertTrue();
        logAssertion(DOMAIN, TAG, String(topOf(options)), '> ' + String(0));
        expect(topOf(options)).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2800
     * @tc.name: testUiBreakpoint0028
     * @tc.desc: Verify an undeclared id is reported as missing on every breakpoint
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0028', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0028 begin');
        const missing: boolean = await existsId('content_side_panel');
        const rect: string = await geometryOfId('content_side_panel');
        const bands: number = await countIds('header_root,content_root,player_root');
        hilog.info(DOMAIN, TAG, 'missing=%{public}s rect=%{public}s bands=%{public}d', missing.toString(), rect,
          bands);
        logAssertion(DOMAIN, TAG, String(missing), 'false');
        expect(missing).assertFalse();
        logAssertion(DOMAIN, TAG, String(rect), String('notfound'));
        expect(rect).assertEqual('notfound');
        logAssertion(DOMAIN, TAG, String(bands), String(3));
        expect(bands).assertEqual(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_2900
     * @tc.name: testUiBreakpoint0029
     * @tc.desc: Verify the band chain is rebuilt in the same order after a reset
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0029', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0029 begin');
        await resetToHome();
        const headerFirst: string = await aboveOfId('header_root', 'content_root');
        const contentFirst: string = await aboveOfId('content_root', 'player_root');
        const visible: boolean = await waitId('player_root', WAIT_MS);
        hilog.info(DOMAIN, TAG, 'headerFirst=%{public}s contentFirst=%{public}s visible=%{public}s', headerFirst,
          contentFirst, visible.toString());
        logAssertion(DOMAIN, TAG, String(headerFirst), String('ok'));
        expect(headerFirst).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(contentFirst), String('ok'));
        expect(contentFirst).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_BREAKPOINT_01_3000
     * @tc.name: testUiBreakpoint0030
     * @tc.desc: Verify the display rectangle is wider than a single song row is tall
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiBreakpoint0030', 0, async (done: Function) => {
      await runCase('testUiBreakpoint0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0030 begin');
        const reachable: boolean = await listInViewport();
        const screen: string = await displaySize();
        const row: string = await geometryOfId('song_item_1');
        const head: string = await geometryOfId('play_all_row');
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s screenWidth=%{public}d rowHeight=%{public}d headWidth=%{public}d',
          reachable.toString(), screenWidth, heightOf(row), widthOf(head));
        logAssertion(DOMAIN, TAG, String(screenWidth), '> ' + String(0));
        expect(screenWidth).assertLarger(0);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(screenWidth > heightOf(row)), 'true');
          expect(screenWidth > heightOf(row)).assertTrue();
          logAssertion(DOMAIN, TAG, String(widthOf(row)), '> ' + String(heightOf(row)));
          expect(widthOf(row)).assertLarger(heightOf(row));
          logAssertion(DOMAIN, TAG, String(widthOf(row) <= screenWidth), 'true');
          expect(widthOf(row) <= screenWidth).assertTrue();
        } else {
          // sm: rows are out of the band, the row head is the widest row element
          logAssertion(DOMAIN, TAG, String(row), String('notfound'));
          expect(row).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(screenWidth > heightOf(head)), 'true');
          expect(screenWidth > heightOf(head)).assertTrue();
          logAssertion(DOMAIN, TAG, String(widthOf(head)), '> ' + String(heightOf(head)));
          expect(widthOf(head)).assertLarger(heightOf(head));
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiBreakpoint0030 end');
      }, done);
    });

  })
}
