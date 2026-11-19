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
 * L2 suite for the bottom player band of entry/src/main/ets/common/Player.ets.
 *
 * The band is always mounted (it is a sibling of Header and Content in
 * pages/index.ets), so the cases read it like a fixed toolbar: the copy of the
 * current song, the three transport buttons and the click behaviour that must
 * never replace the page.
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
  expectedText,
  geometryOfId,
  launchApp,
  pressBack,
  resetToHome,
  textOfId,
  typeOfId,
  waitId
} from '../util/UiEnv';

const DOMAIN: number = 0xF813;
const TAG: string = '[Sample_MusicAlbum]';

function leftOf(rect: string): number {
  return Number(rect.replace('ok:', '').split(',')[0]);
}

function topOf(rect: string): number {
  return Number(rect.replace('ok:', '').split(',')[1]);
}

function rightOf(rect: string): number {
  return Number(rect.replace('ok:', '').split(',')[2]);
}

function bottomOf(rect: string): number {
  return Number(rect.replace('ok:', '').split(',')[3]);
}

function widthOf(rect: string): number {
  return rightOf(rect) - leftOf(rect);
}

function heightOf(rect: string): number {
  return bottomOf(rect) - topOf(rect);
}

export default function uiPlayer01Test() {
  describe('UiPlayer01', () => {

    beforeAll(async () => {
      await resetToHome();
    })

    afterEach(async () => {
      await resetToHome();
    })

    /**
     * @tc.name   testUiPlayer0001
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0001
     * @tc.desc   Anchor: the bottom player band is reachable on the home screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiPlayer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0001 begin');
      const visible: boolean = await waitId('player_root', WAIT_MS);
      const rect: string = await geometryOfId('player_root');
      const type: string = await typeOfId('player_root');
      hilog.info(DOMAIN, TAG, 'visible=%{public}s rect=%{public}s type=%{public}s', visible.toString(), rect, type);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(type.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0001 end');
    })

    /**
     * @tc.name   testUiPlayer0002
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0002
     * @tc.desc   the player band spans the whole display width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0002 begin');
      const player: string = await geometryOfId('player_root');
      const screen: string = await displaySize();
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', widthOf(player), screenWidth);
      expect(screen.startsWith('ok:')).assertTrue();
      expect(screenWidth).assertLarger(0);
      expect(widthOf(player)).assertEqual(screenWidth);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0002 end');
    })

    /**
     * @tc.name   testUiPlayer0003
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0003
     * @tc.desc   the seven declared parts of the band are all rendered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0003 begin');
      const present: number = await countIds('player_root,player_cover,player_song_name,player_vip,' +
        'player_singer,player_play_btn,player_next_btn,player_list_btn');
      const buttons: number = await countIds('player_play_btn,player_next_btn,player_list_btn');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=8 buttons=%{public}d', present, buttons);
      expect(present).assertEqual(8);
      expect(buttons).assertEqual(3);
      expect(present).assertLarger(buttons);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0003 end');
    })

    /**
     * @tc.name   testUiPlayer0004
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0004
     * @tc.desc   the song name of the band follows the song_name string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiPlayer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0004 begin');
      const text: string = await textOfId('player_song_name');
      const expected: string = 'ok:' + expectedText('song_name');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
      expect(text).assertEqual(expected);
      expect(text.startsWith('ok:')).assertTrue();
      expect(text.length).assertLarger(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0004 end');
    })

    /**
     * @tc.name   testUiPlayer0005
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0005
     * @tc.desc   the singer of the band follows the singer string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiPlayer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0005 begin');
      const text: string = await textOfId('player_singer');
      const expected: string = 'ok:' + expectedText('singer');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
      expect(text).assertEqual(expected);
      expect(text === 'notfound').assertFalse();
      expect(text === expected).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0005 end');
    })

    /**
     * @tc.name   testUiPlayer0006
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0006
     * @tc.desc   the vip badge sits inside the player band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0006 begin');
      const root: string = await geometryOfId('player_root');
      const vip: string = await geometryOfId('player_vip');
      const inside: boolean = topOf(vip) >= topOf(root) && bottomOf(vip) <= bottomOf(root) &&
        leftOf(vip) >= leftOf(root) && rightOf(vip) <= rightOf(root);
      hilog.info(DOMAIN, TAG, 'inside=%{public}s vip=%{public}s root=%{public}s', inside.toString(), vip, root);
      expect(vip.startsWith('ok:')).assertTrue();
      expect(widthOf(vip)).assertLarger(0);
      expect(inside).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0006 end');
    })

    /**
     * @tc.name   testUiPlayer0007
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0007
     * @tc.desc   the album cover of the band is a square
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0007 begin');
      const cover: string = await geometryOfId('player_cover');
      hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(cover), heightOf(cover));
      expect(cover.startsWith('ok:')).assertTrue();
      expect(widthOf(cover)).assertLarger(0);
      expect(widthOf(cover)).assertEqual(heightOf(cover));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0007 end');
    })

    /**
     * @tc.name   testUiPlayer0008
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0008
     * @tc.desc   the play/pause button is a square
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0008 begin');
      const button: string = await geometryOfId('player_play_btn');
      hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(button), heightOf(button));
      expect(button.startsWith('ok:')).assertTrue();
      expect(widthOf(button)).assertLarger(0);
      expect(widthOf(button)).assertEqual(heightOf(button));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0008 end');
    })

    /**
     * @tc.name   testUiPlayer0009
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0009
     * @tc.desc   the next button is a square
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiPlayer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0009 begin');
      const button: string = await geometryOfId('player_next_btn');
      hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(button), heightOf(button));
      expect(button.startsWith('ok:')).assertTrue();
      expect(widthOf(button)).assertEqual(heightOf(button));
      expect(bottomOf(button) <= bottomOf(await geometryOfId('player_root'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0009 end');
    })

    /**
     * @tc.name   testUiPlayer0010
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0010
     * @tc.desc   the playlist button is a square
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiPlayer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0010 begin');
      const button: string = await geometryOfId('player_list_btn');
      hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(button), heightOf(button));
      expect(button.startsWith('ok:')).assertTrue();
      expect(widthOf(button)).assertEqual(heightOf(button));
      expect(leftOf(button)).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0010 end');
    })

    /**
     * @tc.name   testUiPlayer0011
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0011
     * @tc.desc   the cover is drawn left of the song name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0011 begin');
      const cover: string = await geometryOfId('player_cover');
      const name: string = await geometryOfId('player_song_name');
      hilog.info(DOMAIN, TAG, 'coverRight=%{public}d nameLeft=%{public}d', rightOf(cover), leftOf(name));
      expect(cover.startsWith('ok:')).assertTrue();
      expect(name.startsWith('ok:')).assertTrue();
      expect(rightOf(cover) <= leftOf(name)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0011 end');
    })

    /**
     * @tc.name   testUiPlayer0012
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0012
     * @tc.desc   the song name is drawn above the singer line
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0012 begin');
      const order: string = await aboveOfId('player_song_name', 'player_singer');
      const name: string = await geometryOfId('player_song_name');
      const singer: string = await geometryOfId('player_singer');
      hilog.info(DOMAIN, TAG, 'order=%{public}s nameTop=%{public}d singerTop=%{public}d', order,
        topOf(name), topOf(singer));
      expect(order).assertEqual('ok');
      expect(topOf(singer) > topOf(name)).assertTrue();
      expect(singer.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0012 end');
    })

    /**
     * @tc.name   testUiPlayer0013
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0013
     * @tc.desc   the vip badge leads the singer text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiPlayer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0013 begin');
      const vip: string = await geometryOfId('player_vip');
      const singer: string = await geometryOfId('player_singer');
      hilog.info(DOMAIN, TAG, 'vipRight=%{public}d singerLeft=%{public}d', rightOf(vip), leftOf(singer));
      expect(vip.startsWith('ok:')).assertTrue();
      expect(rightOf(vip) <= leftOf(singer)).assertTrue();
      expect(leftOf(singer) - rightOf(vip)).assertLargerOrEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0013 end');
    })

    /**
     * @tc.name   testUiPlayer0014
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0014
     * @tc.desc   the play button leads the next button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0014 begin');
      const play: string = await geometryOfId('player_play_btn');
      const next: string = await geometryOfId('player_next_btn');
      hilog.info(DOMAIN, TAG, 'playRight=%{public}d nextLeft=%{public}d', rightOf(play), leftOf(next));
      expect(play.startsWith('ok:')).assertTrue();
      expect(rightOf(play) <= leftOf(next)).assertTrue();
      expect(next.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0014 end');
    })

    /**
     * @tc.name   testUiPlayer0015
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0015
     * @tc.desc   the next button leads the playlist button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0015 begin');
      const next: string = await geometryOfId('player_next_btn');
      const list: string = await geometryOfId('player_list_btn');
      hilog.info(DOMAIN, TAG, 'nextRight=%{public}d listLeft=%{public}d', rightOf(next), leftOf(list));
      expect(rightOf(next) <= leftOf(list)).assertTrue();
      expect(list.startsWith('ok:')).assertTrue();
      expect(rightOf(list) <= rightOf(await geometryOfId('player_root'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0015 end');
    })

    /**
     * @tc.name   testUiPlayer0016
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0016
     * @tc.desc   every control of the band stays inside the band height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0016 begin');
      const root: string = await geometryOfId('player_root');
      const cover: string = await geometryOfId('player_cover');
      const play: string = await geometryOfId('player_play_btn');
      const list: string = await geometryOfId('player_list_btn');
      const inside: boolean = topOf(cover) >= topOf(root) && bottomOf(cover) <= bottomOf(root) &&
        topOf(play) >= topOf(root) && bottomOf(play) <= bottomOf(root) &&
        bottomOf(list) <= bottomOf(root);
      hilog.info(DOMAIN, TAG, 'inside=%{public}s rootHeight=%{public}d', inside.toString(), heightOf(root));
      expect(inside).assertTrue();
      expect(heightOf(root)).assertLarger(0);
      expect(heightOf(cover) <= heightOf(root)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0016 end');
    })

    /**
     * @tc.name   testUiPlayer0017
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0017
     * @tc.desc   the transport buttons share one vertical centre line
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiPlayer0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0017 begin');
      const play: string = await geometryOfId('player_play_btn');
      const next: string = await geometryOfId('player_next_btn');
      const list: string = await geometryOfId('player_list_btn');
      const playCentre: number = (topOf(play) + bottomOf(play)) / 2;
      const nextCentre: number = (topOf(next) + bottomOf(next)) / 2;
      const listCentre: number = (topOf(list) + bottomOf(list)) / 2;
      hilog.info(DOMAIN, TAG, 'play=%{public}d next=%{public}d list=%{public}d', playCentre, nextCentre,
        listCentre);
      expect(Math.abs(playCentre - nextCentre) <= 2).assertTrue();
      expect(Math.abs(nextCentre - listCentre) <= 2).assertTrue();
      expect(Math.abs(playCentre - listCentre) <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0017 end');
    })

    /**
     * @tc.name   testUiPlayer0018
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0018
     * @tc.desc   the text block does not run under the transport buttons
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0018 begin');
      const singer: string = await geometryOfId('player_singer');
      const play: string = await geometryOfId('player_play_btn');
      hilog.info(DOMAIN, TAG, 'singerRight=%{public}d playLeft=%{public}d', rightOf(singer), leftOf(play));
      expect(rightOf(singer) <= leftOf(play)).assertTrue();
      expect(leftOf(play)).assertLarger(0);
      expect(widthOf(singer)).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0018 end');
    })

    /**
     * @tc.name   testUiPlayer0019
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0019
     * @tc.desc   the band is mounted below the content container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0019 begin');
      const order: string = await aboveOfId('content_root', 'player_root');
      const content: string = await geometryOfId('content_root');
      const player: string = await geometryOfId('player_root');
      hilog.info(DOMAIN, TAG, 'order=%{public}s contentBottom=%{public}d playerTop=%{public}d', order,
        bottomOf(content), topOf(player));
      expect(order).assertEqual('ok');
      expect(topOf(player) >= bottomOf(content)).assertTrue();
      expect(player.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0019 end');
    })

    /**
     * @tc.name   testUiPlayer0020
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0020
     * @tc.desc   the band does not leave the bottom of the display
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0020 begin');
      const player: string = await geometryOfId('player_root');
      const screen: string = await displaySize();
      const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
      hilog.info(DOMAIN, TAG, 'playerBottom=%{public}d screenHeight=%{public}d', bottomOf(player), screenHeight);
      expect(screen.startsWith('ok:')).assertTrue();
      expect(bottomOf(player) <= screenHeight).assertTrue();
      expect(topOf(player) < screenHeight).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0020 end');
    })

    /**
     * @tc.name   testUiPlayer0021
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0021
     * @tc.desc   clicking the play button keeps the band and its copy mounted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiPlayer0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0021 begin');
      const clicked: string = await clickId('player_play_btn');
      const stillThere: boolean = await existsId('player_root');
      const name: string = await textOfId('player_song_name');
      hilog.info(DOMAIN, TAG, 'clicked=%{public}s stillThere=%{public}s name=%{public}s', clicked,
        stillThere.toString(), name);
      expect(clicked).assertEqual('ok');
      expect(stillThere).assertTrue();
      expect(name).assertEqual('ok:' + expectedText('song_name'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0021 end');
    })

    /**
     * @tc.name   testUiPlayer0022
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0022
     * @tc.desc   clicking the next button keeps the page on the same screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0022 begin');
      const clicked: string = await clickId('player_next_btn');
      const header: boolean = await existsId('header_root');
      const singer: string = await textOfId('player_singer');
      hilog.info(DOMAIN, TAG, 'clicked=%{public}s header=%{public}s singer=%{public}s', clicked,
        header.toString(), singer);
      expect(clicked).assertEqual('ok');
      expect(header).assertTrue();
      expect(singer).assertEqual('ok:' + expectedText('singer'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0022 end');
    })

    /**
     * @tc.name   testUiPlayer0023
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0023
     * @tc.desc   Anchor: the playlist button can be tapped, back leaves the page and a relaunch restores it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiPlayer0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0023 begin');
      const clicked: string = await clickId('player_list_btn');
      const player: boolean = await existsId('player_root');
      const back: string = await pressBack();
      // this sample owns a single page, so back leaves the ability instead of
      // popping a page; the page must therefore come back after a relaunch
      const relaunch: string = await launchApp();
      const header: boolean = await waitId('header_root', WAIT_MS);
      hilog.info(DOMAIN, TAG, 'clicked=%{public}s player=%{public}s back=%{public}s relaunch=%{public}s header=%{public}s',
        clicked, player.toString(), back, relaunch, header.toString());
      expect(clicked).assertEqual('ok');
      expect(player).assertTrue();
      expect(back).assertEqual('ok');
      expect(relaunch).assertEqual('ok');
      expect(header).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0023 end');
    })

    /**
     * @tc.name   testUiPlayer0024
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0024
     * @tc.desc   Anchor: an id the player never declares is reported as missing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0024 begin');
      const missing: boolean = await existsId('player_volume_btn');
      const rect: string = await geometryOfId('player_volume_btn');
      const text: string = await textOfId('player_volume_btn');
      hilog.info(DOMAIN, TAG, 'missing=%{public}s rect=%{public}s text=%{public}s', missing.toString(), rect, text);
      expect(missing).assertFalse();
      expect(rect).assertEqual('notfound');
      expect(text).assertEqual('notfound');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0024 end');
    })

    /**
     * @tc.name   testUiPlayer0025
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0025
     * @tc.desc   exactly one player band is mounted on the page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0025 begin');
      const count: number = await countIds('player_root');
      const covers: number = await countIds('player_cover');
      const root: string = await geometryOfId('player_root');
      hilog.info(DOMAIN, TAG, 'root=%{public}d covers=%{public}d rect=%{public}s', count, covers, root);
      expect(count).assertEqual(1);
      expect(covers).assertEqual(1);
      expect(root.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0025 end');
    })

    /**
     * @tc.name   testUiPlayer0026
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0026
     * @tc.desc   the cover and the vip badge overlap the band vertically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiPlayer0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0026 begin');
      const root: string = await geometryOfId('player_root');
      const cover: string = await geometryOfId('player_cover');
      const vip: string = await geometryOfId('player_vip');
      const coverOverlap: boolean = topOf(cover) < bottomOf(root) && bottomOf(cover) > topOf(root);
      const vipOverlap: boolean = topOf(vip) < bottomOf(root) && bottomOf(vip) > topOf(root);
      hilog.info(DOMAIN, TAG, 'coverOverlap=%{public}s vipOverlap=%{public}s', coverOverlap.toString(),
        vipOverlap.toString());
      expect(coverOverlap).assertTrue();
      expect(vipOverlap).assertTrue();
      expect(heightOf(root)).assertLarger(heightOf(vip));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0026 end');
    })

    /**
     * @tc.name   testUiPlayer0027
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0027
     * @tc.desc   the playlist button is the right-most control of the band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiPlayer0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0027 begin');
      const list: string = await geometryOfId('player_list_btn');
      const next: string = await geometryOfId('player_next_btn');
      const play: string = await geometryOfId('player_play_btn');
      hilog.info(DOMAIN, TAG, 'listRight=%{public}d nextRight=%{public}d playRight=%{public}d', rightOf(list),
        rightOf(next), rightOf(play));
      expect(rightOf(list) > rightOf(next)).assertTrue();
      expect(rightOf(next) > rightOf(play)).assertTrue();
      expect(rightOf(list)).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0027 end');
    })

    /**
     * @tc.name   testUiPlayer0028
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0028
     * @tc.desc   the player band stays below the header band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0028 begin');
      const order: string = await aboveOfId('header_root', 'player_root');
      const header: string = await geometryOfId('header_root');
      const player: string = await geometryOfId('player_root');
      hilog.info(DOMAIN, TAG, 'order=%{public}s headerBottom=%{public}d playerTop=%{public}d', order,
        bottomOf(header), topOf(player));
      expect(order).assertEqual('ok');
      expect(topOf(player) >= bottomOf(header)).assertTrue();
      expect(bottomOf(player) > bottomOf(header)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0028 end');
    })

    /**
     * @tc.name   testUiPlayer0029
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0029
     * @tc.desc   the band geometry and copy survive a reset of the page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiPlayer0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0029 begin');
      const before: string = await geometryOfId('player_root');
      await resetToHome();
      const after: string = await geometryOfId('player_root');
      const visible: boolean = await existsId('player_root');
      hilog.info(DOMAIN, TAG, 'before=%{public}s after=%{public}s', before, after);
      expect(after.startsWith('ok:')).assertTrue();
      expect(topOf(after)).assertEqual(topOf(before));
      expect(visible).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0029 end');
    })

    /**
     * @tc.name   testUiPlayer0030
     * @tc.number SUB_MUSICALBUM_UI_PLAYER_0030
     * @tc.desc   repeated reads of the band return the same rectangle and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiPlayer0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0030 begin');
      const first: string = await geometryOfId('player_root');
      const second: string = await geometryOfId('player_root');
      const type: string = await typeOfId('player_root');
      const again: string = await typeOfId('player_root');
      hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s type=%{public}s', first, second, type);
      expect(first).assertEqual(second);
      expect(type).assertEqual(again);
      expect(bottomOf(first)).assertLarger(topOf(first));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0030 end');
    })

  })
}
