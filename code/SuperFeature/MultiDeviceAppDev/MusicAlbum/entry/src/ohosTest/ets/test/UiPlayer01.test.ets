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
 * pages/Index.ets), so the cases read it like a fixed toolbar: the copy of the
 * current song, the three transport buttons and the click behaviour that must
 * never replace the page.
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

export default function uiPlayer01Test(): void {
  describe('UiPlayer01Test', () => {

    beforeAll(async () => {
      await resetToHome();
    })

    afterEach(async () => {
      await resetToHome();
    })

    /*
     * @tc.number: SUB_UI_PLAYER_01_0100
     * @tc.name: testUiPlayer0001
     * @tc.desc: Verify the bottom player band is reachable on the home screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiPlayer0001', 0, async (done: Function) => {
      await runCase('testUiPlayer0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0001 begin');
        const visible: boolean = await waitId('player_root', WAIT_MS);
        const rect: string = await geometryOfId('player_root');
        const type: string = await typeOfId('player_root');
        hilog.info(DOMAIN, TAG, 'visible=%{public}s rect=%{public}s type=%{public}s', visible.toString(), rect, type);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(type.startsWith('ok:')), 'true');
        expect(type.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_0200
     * @tc.name: testUiPlayer0002
     * @tc.desc: Verify the player band spans the whole display width
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0002', 0, async (done: Function) => {
      await runCase('testUiPlayer0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0002 begin');
        const player: string = await geometryOfId('player_root');
        const screen: string = await displaySize();
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=%{public}d', widthOf(player), screenWidth);
        logAssertion(DOMAIN, TAG, String(screen.startsWith('ok:')), 'true');
        expect(screen.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(screenWidth), '> ' + String(0));
        expect(screenWidth).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(widthOf(player)), String(screenWidth));
        expect(widthOf(player)).assertEqual(screenWidth);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_0300
     * @tc.name: testUiPlayer0003
     * @tc.desc: Verify the seven declared parts of the band are all rendered
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0003', 0, async (done: Function) => {
      await runCase('testUiPlayer0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0003 begin');
        const present: number = await countIds('player_root,player_cover,player_song_name,player_vip,' +
          'player_singer,player_play_btn,player_next_btn,player_list_btn');
        const buttons: number = await countIds('player_play_btn,player_next_btn,player_list_btn');
        hilog.info(DOMAIN, TAG, 'actual=%{public}d expected=8 buttons=%{public}d', present, buttons);
        logAssertion(DOMAIN, TAG, String(present), String(8));
        expect(present).assertEqual(8);
        logAssertion(DOMAIN, TAG, String(buttons), String(3));
        expect(buttons).assertEqual(3);
        logAssertion(DOMAIN, TAG, String(present), '> ' + String(buttons));
        expect(present).assertLarger(buttons);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_0400
     * @tc.name: testUiPlayer0004
     * @tc.desc: Verify the song name of the band follows the song_name string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiPlayer0004', 0, async (done: Function) => {
      await runCase('testUiPlayer0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0004 begin');
        const text: string = await textOfId('player_song_name');
        const expected: string = 'ok:' + expectedText('song_name');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
        logAssertion(DOMAIN, TAG, String(text), String(expected));
        expect(text).assertEqual(expected);
        logAssertion(DOMAIN, TAG, String(text.startsWith('ok:')), 'true');
        expect(text.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(text.length), '> ' + String(3));
        expect(text.length).assertLarger(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_0500
     * @tc.name: testUiPlayer0005
     * @tc.desc: Verify the singer of the band follows the singer string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiPlayer0005', 0, async (done: Function) => {
      await runCase('testUiPlayer0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0005 begin');
        const text: string = await textOfId('player_singer');
        const expected: string = 'ok:' + expectedText('singer');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
        logAssertion(DOMAIN, TAG, String(text), String(expected));
        expect(text).assertEqual(expected);
        logAssertion(DOMAIN, TAG, String(text === 'notfound'), 'false');
        expect(text === 'notfound').assertFalse();
        logAssertion(DOMAIN, TAG, String(text === expected), 'true');
        expect(text === expected).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_0600
     * @tc.name: testUiPlayer0006
     * @tc.desc: Verify the vip badge sits inside the player band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0006', 0, async (done: Function) => {
      await runCase('testUiPlayer0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0006 begin');
        const root: string = await geometryOfId('player_root');
        const vip: string = await geometryOfId('player_vip');
        const inside: boolean = topOf(vip) >= topOf(root) && bottomOf(vip) <= bottomOf(root) &&
          leftOf(vip) >= leftOf(root) && rightOf(vip) <= rightOf(root);
        hilog.info(DOMAIN, TAG, 'inside=%{public}s vip=%{public}s root=%{public}s', inside.toString(), vip, root);
        logAssertion(DOMAIN, TAG, String(vip.startsWith('ok:')), 'true');
        expect(vip.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(widthOf(vip)), '> ' + String(0));
        expect(widthOf(vip)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(inside), 'true');
        expect(inside).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_0700
     * @tc.name: testUiPlayer0007
     * @tc.desc: Verify the album cover of the band is a square
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0007', 0, async (done: Function) => {
      await runCase('testUiPlayer0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0007 begin');
        const cover: string = await geometryOfId('player_cover');
        hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(cover), heightOf(cover));
        logAssertion(DOMAIN, TAG, String(cover.startsWith('ok:')), 'true');
        expect(cover.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(widthOf(cover)), '> ' + String(0));
        expect(widthOf(cover)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(widthOf(cover)), String(heightOf(cover)));
        expect(widthOf(cover)).assertEqual(heightOf(cover));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_0800
     * @tc.name: testUiPlayer0008
     * @tc.desc: Verify the play/pause button is a square
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0008', 0, async (done: Function) => {
      await runCase('testUiPlayer0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0008 begin');
        const button: string = await geometryOfId('player_play_btn');
        hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(button), heightOf(button));
        logAssertion(DOMAIN, TAG, String(button.startsWith('ok:')), 'true');
        expect(button.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(widthOf(button)), '> ' + String(0));
        expect(widthOf(button)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(widthOf(button)), String(heightOf(button)));
        expect(widthOf(button)).assertEqual(heightOf(button));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_0900
     * @tc.name: testUiPlayer0009
     * @tc.desc: Verify the next button is a square
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0009', 0, async (done: Function) => {
      await runCase('testUiPlayer0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0009 begin');
        const button: string = await geometryOfId('player_next_btn');
        hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(button), heightOf(button));
        logAssertion(DOMAIN, TAG, String(button.startsWith('ok:')), 'true');
        expect(button.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(widthOf(button)), String(heightOf(button)));
        expect(widthOf(button)).assertEqual(heightOf(button));
        logAssertion(DOMAIN, TAG, String(bottomOf(button) <= bottomOf(await geometryOfId('player_root'))), 'true');
        expect(bottomOf(button) <= bottomOf(await geometryOfId('player_root'))).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1000
     * @tc.name: testUiPlayer0010
     * @tc.desc: Verify the playlist button is a square
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0010', 0, async (done: Function) => {
      await runCase('testUiPlayer0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0010 begin');
        const button: string = await geometryOfId('player_list_btn');
        hilog.info(DOMAIN, TAG, 'width=%{public}d height=%{public}d', widthOf(button), heightOf(button));
        logAssertion(DOMAIN, TAG, String(button.startsWith('ok:')), 'true');
        expect(button.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(widthOf(button)), String(heightOf(button)));
        expect(widthOf(button)).assertEqual(heightOf(button));
        logAssertion(DOMAIN, TAG, String(leftOf(button)), '> ' + String(0));
        expect(leftOf(button)).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1100
     * @tc.name: testUiPlayer0011
     * @tc.desc: Verify the cover is drawn left of the song name
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0011', 0, async (done: Function) => {
      await runCase('testUiPlayer0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0011 begin');
        const cover: string = await geometryOfId('player_cover');
        const name: string = await geometryOfId('player_song_name');
        hilog.info(DOMAIN, TAG, 'coverRight=%{public}d nameLeft=%{public}d', rightOf(cover), leftOf(name));
        logAssertion(DOMAIN, TAG, String(cover.startsWith('ok:')), 'true');
        expect(cover.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(name.startsWith('ok:')), 'true');
        expect(name.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(rightOf(cover) <= leftOf(name)), 'true');
        expect(rightOf(cover) <= leftOf(name)).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1200
     * @tc.name: testUiPlayer0012
     * @tc.desc: Verify the song name is drawn above the singer line
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0012', 0, async (done: Function) => {
      await runCase('testUiPlayer0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0012 begin');
        const order: string = await aboveOfId('player_song_name', 'player_singer');
        const name: string = await geometryOfId('player_song_name');
        const singer: string = await geometryOfId('player_singer');
        hilog.info(DOMAIN, TAG, 'order=%{public}s nameTop=%{public}d singerTop=%{public}d', order,
          topOf(name), topOf(singer));
        logAssertion(DOMAIN, TAG, String(order), String('ok'));
        expect(order).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(topOf(singer) > topOf(name)), 'true');
        expect(topOf(singer) > topOf(name)).assertTrue();
        logAssertion(DOMAIN, TAG, String(singer.startsWith('ok:')), 'true');
        expect(singer.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1300
     * @tc.name: testUiPlayer0013
     * @tc.desc: Verify the vip badge leads the singer text
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0013', 0, async (done: Function) => {
      await runCase('testUiPlayer0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0013 begin');
        const vip: string = await geometryOfId('player_vip');
        const singer: string = await geometryOfId('player_singer');
        hilog.info(DOMAIN, TAG, 'vipRight=%{public}d singerLeft=%{public}d', rightOf(vip), leftOf(singer));
        logAssertion(DOMAIN, TAG, String(vip.startsWith('ok:')), 'true');
        expect(vip.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(rightOf(vip) <= leftOf(singer)), 'true');
        expect(rightOf(vip) <= leftOf(singer)).assertTrue();
        logAssertion(DOMAIN, TAG, String(leftOf(singer) - rightOf(vip)), '>= ' + String(0));
        expect(leftOf(singer) - rightOf(vip)).assertLargerOrEqual(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1400
     * @tc.name: testUiPlayer0014
     * @tc.desc: Verify the play button leads the next button
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0014', 0, async (done: Function) => {
      await runCase('testUiPlayer0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0014 begin');
        const play: string = await geometryOfId('player_play_btn');
        const next: string = await geometryOfId('player_next_btn');
        hilog.info(DOMAIN, TAG, 'playRight=%{public}d nextLeft=%{public}d', rightOf(play), leftOf(next));
        logAssertion(DOMAIN, TAG, String(play.startsWith('ok:')), 'true');
        expect(play.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(rightOf(play) <= leftOf(next)), 'true');
        expect(rightOf(play) <= leftOf(next)).assertTrue();
        logAssertion(DOMAIN, TAG, String(next.startsWith('ok:')), 'true');
        expect(next.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1500
     * @tc.name: testUiPlayer0015
     * @tc.desc: Verify the next button leads the playlist button
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0015', 0, async (done: Function) => {
      await runCase('testUiPlayer0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0015 begin');
        const next: string = await geometryOfId('player_next_btn');
        const list: string = await geometryOfId('player_list_btn');
        hilog.info(DOMAIN, TAG, 'nextRight=%{public}d listLeft=%{public}d', rightOf(next), leftOf(list));
        logAssertion(DOMAIN, TAG, String(rightOf(next) <= leftOf(list)), 'true');
        expect(rightOf(next) <= leftOf(list)).assertTrue();
        logAssertion(DOMAIN, TAG, String(list.startsWith('ok:')), 'true');
        expect(list.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(rightOf(list) <= rightOf(await geometryOfId('player_root'))), 'true');
        expect(rightOf(list) <= rightOf(await geometryOfId('player_root'))).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1600
     * @tc.name: testUiPlayer0016
     * @tc.desc: Verify every control of the band stays inside the band height
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0016', 0, async (done: Function) => {
      await runCase('testUiPlayer0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0016 begin');
        const root: string = await geometryOfId('player_root');
        const cover: string = await geometryOfId('player_cover');
        const play: string = await geometryOfId('player_play_btn');
        const list: string = await geometryOfId('player_list_btn');
        const inside: boolean = topOf(cover) >= topOf(root) && bottomOf(cover) <= bottomOf(root) &&
          topOf(play) >= topOf(root) && bottomOf(play) <= bottomOf(root) &&
          bottomOf(list) <= bottomOf(root);
        hilog.info(DOMAIN, TAG, 'inside=%{public}s rootHeight=%{public}d', inside.toString(), heightOf(root));
        logAssertion(DOMAIN, TAG, String(inside), 'true');
        expect(inside).assertTrue();
        logAssertion(DOMAIN, TAG, String(heightOf(root)), '> ' + String(0));
        expect(heightOf(root)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(heightOf(cover) <= heightOf(root)), 'true');
        expect(heightOf(cover) <= heightOf(root)).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1700
     * @tc.name: testUiPlayer0017
     * @tc.desc: Verify the transport buttons share one vertical centre line
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0017', 0, async (done: Function) => {
      await runCase('testUiPlayer0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0017 begin');
        const play: string = await geometryOfId('player_play_btn');
        const next: string = await geometryOfId('player_next_btn');
        const list: string = await geometryOfId('player_list_btn');
        const playCentre: number = (topOf(play) + bottomOf(play)) / 2;
        const nextCentre: number = (topOf(next) + bottomOf(next)) / 2;
        const listCentre: number = (topOf(list) + bottomOf(list)) / 2;
        hilog.info(DOMAIN, TAG, 'play=%{public}d next=%{public}d list=%{public}d', playCentre, nextCentre,
          listCentre);
        logAssertion(DOMAIN, TAG, String(Math.abs(playCentre - nextCentre) <= 2), 'true');
        expect(Math.abs(playCentre - nextCentre) <= 2).assertTrue();
        logAssertion(DOMAIN, TAG, String(Math.abs(nextCentre - listCentre) <= 2), 'true');
        expect(Math.abs(nextCentre - listCentre) <= 2).assertTrue();
        logAssertion(DOMAIN, TAG, String(Math.abs(playCentre - listCentre) <= 2), 'true');
        expect(Math.abs(playCentre - listCentre) <= 2).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1800
     * @tc.name: testUiPlayer0018
     * @tc.desc: Verify the text block does not run under the transport buttons
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0018', 0, async (done: Function) => {
      await runCase('testUiPlayer0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0018 begin');
        const singer: string = await geometryOfId('player_singer');
        const play: string = await geometryOfId('player_play_btn');
        hilog.info(DOMAIN, TAG, 'singerRight=%{public}d playLeft=%{public}d', rightOf(singer), leftOf(play));
        logAssertion(DOMAIN, TAG, String(rightOf(singer) <= leftOf(play)), 'true');
        expect(rightOf(singer) <= leftOf(play)).assertTrue();
        logAssertion(DOMAIN, TAG, String(leftOf(play)), '> ' + String(0));
        expect(leftOf(play)).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(widthOf(singer)), '> ' + String(0));
        expect(widthOf(singer)).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_1900
     * @tc.name: testUiPlayer0019
     * @tc.desc: Verify the band is mounted below the content container
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0019', 0, async (done: Function) => {
      await runCase('testUiPlayer0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0019 begin');
        const order: string = await aboveOfId('content_root', 'player_root');
        const content: string = await geometryOfId('content_root');
        const player: string = await geometryOfId('player_root');
        hilog.info(DOMAIN, TAG, 'order=%{public}s contentBottom=%{public}d playerTop=%{public}d', order,
          bottomOf(content), topOf(player));
        logAssertion(DOMAIN, TAG, String(order), String('ok'));
        expect(order).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(topOf(player) >= bottomOf(content)), 'true');
        expect(topOf(player) >= bottomOf(content)).assertTrue();
        logAssertion(DOMAIN, TAG, String(player.startsWith('ok:')), 'true');
        expect(player.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2000
     * @tc.name: testUiPlayer0020
     * @tc.desc: Verify the band does not leave the bottom of the display
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0020', 0, async (done: Function) => {
      await runCase('testUiPlayer0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0020 begin');
        const player: string = await geometryOfId('player_root');
        const screen: string = await displaySize();
        const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
        hilog.info(DOMAIN, TAG, 'playerBottom=%{public}d screenHeight=%{public}d', bottomOf(player), screenHeight);
        logAssertion(DOMAIN, TAG, String(screen.startsWith('ok:')), 'true');
        expect(screen.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(bottomOf(player) <= screenHeight), 'true');
        expect(bottomOf(player) <= screenHeight).assertTrue();
        logAssertion(DOMAIN, TAG, String(topOf(player) < screenHeight), 'true');
        expect(topOf(player) < screenHeight).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2100
     * @tc.name: testUiPlayer0021
     * @tc.desc: Verify clicking the play button keeps the band and its copy mounted
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiPlayer0021', 0, async (done: Function) => {
      await runCase('testUiPlayer0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0021 begin');
        const clicked: string = await clickId('player_play_btn');
        const stillThere: boolean = await existsId('player_root');
        const name: string = await textOfId('player_song_name');
        hilog.info(DOMAIN, TAG, 'clicked=%{public}s stillThere=%{public}s name=%{public}s', clicked,
          stillThere.toString(), name);
        logAssertion(DOMAIN, TAG, String(clicked), String('ok'));
        expect(clicked).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(stillThere), 'true');
        expect(stillThere).assertTrue();
        logAssertion(DOMAIN, TAG, String(name), String('ok:' + expectedText('song_name')));
        expect(name).assertEqual('ok:' + expectedText('song_name'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2200
     * @tc.name: testUiPlayer0022
     * @tc.desc: Verify clicking the next button keeps the page on the same screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0022', 0, async (done: Function) => {
      await runCase('testUiPlayer0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0022 begin');
        const clicked: string = await clickId('player_next_btn');
        const header: boolean = await existsId('header_root');
        const singer: string = await textOfId('player_singer');
        hilog.info(DOMAIN, TAG, 'clicked=%{public}s header=%{public}s singer=%{public}s', clicked,
          header.toString(), singer);
        logAssertion(DOMAIN, TAG, String(clicked), String('ok'));
        expect(clicked).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(header), 'true');
        expect(header).assertTrue();
        logAssertion(DOMAIN, TAG, String(singer), String('ok:' + expectedText('singer')));
        expect(singer).assertEqual('ok:' + expectedText('singer'));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2300
     * @tc.name: testUiPlayer0023
     * @tc.desc: Verify the playlist button can be tapped, back leaves the page and a relaunch restores it
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiPlayer0023', 0, async (done: Function) => {
      await runCase('testUiPlayer0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0023 begin');
        const clicked: string = await clickId('player_list_btn');
        const player: boolean = await existsId('player_root');
        const back: string = await pressBack();
        // this sample owns a single page, so back leaves the ability instead of
        // popping a page; the page must therefore come back after a relaunch
        const relaunch: string = await launchApp();
        const header: boolean = await waitId('header_root', WAIT_MS);
        hilog.info(DOMAIN, TAG,
          'clicked=%{public}s player=%{public}s back=%{public}s relaunch=%{public}s header=%{public}s',
          clicked, player.toString(), back, relaunch, header.toString());
        logAssertion(DOMAIN, TAG, String(clicked), String('ok'));
        expect(clicked).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(player), 'true');
        expect(player).assertTrue();
        logAssertion(DOMAIN, TAG, String(back), String('ok'));
        expect(back).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(relaunch), String('ok'));
        expect(relaunch).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(header), 'true');
        expect(header).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2400
     * @tc.name: testUiPlayer0024
     * @tc.desc: Verify an id the player never declares is reported as missing
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0024', 0, async (done: Function) => {
      await runCase('testUiPlayer0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0024 begin');
        const missing: boolean = await existsId('player_volume_btn');
        const rect: string = await geometryOfId('player_volume_btn');
        const text: string = await textOfId('player_volume_btn');
        hilog.info(DOMAIN, TAG, 'missing=%{public}s rect=%{public}s text=%{public}s', missing.toString(), rect, text);
        logAssertion(DOMAIN, TAG, String(missing), 'false');
        expect(missing).assertFalse();
        logAssertion(DOMAIN, TAG, String(rect), String('notfound'));
        expect(rect).assertEqual('notfound');
        logAssertion(DOMAIN, TAG, String(text), String('notfound'));
        expect(text).assertEqual('notfound');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2500
     * @tc.name: testUiPlayer0025
     * @tc.desc: Verify exactly one player band is mounted on the page
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0025', 0, async (done: Function) => {
      await runCase('testUiPlayer0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0025 begin');
        const count: number = await countIds('player_root');
        const covers: number = await countIds('player_cover');
        const root: string = await geometryOfId('player_root');
        hilog.info(DOMAIN, TAG, 'root=%{public}d covers=%{public}d rect=%{public}s', count, covers, root);
        logAssertion(DOMAIN, TAG, String(count), String(1));
        expect(count).assertEqual(1);
        logAssertion(DOMAIN, TAG, String(covers), String(1));
        expect(covers).assertEqual(1);
        logAssertion(DOMAIN, TAG, String(root.startsWith('ok:')), 'true');
        expect(root.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2600
     * @tc.name: testUiPlayer0026
     * @tc.desc: Verify the cover and the vip badge overlap the band vertically
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0026', 0, async (done: Function) => {
      await runCase('testUiPlayer0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0026 begin');
        const root: string = await geometryOfId('player_root');
        const cover: string = await geometryOfId('player_cover');
        const vip: string = await geometryOfId('player_vip');
        const coverOverlap: boolean = topOf(cover) < bottomOf(root) && bottomOf(cover) > topOf(root);
        const vipOverlap: boolean = topOf(vip) < bottomOf(root) && bottomOf(vip) > topOf(root);
        hilog.info(DOMAIN, TAG, 'coverOverlap=%{public}s vipOverlap=%{public}s', coverOverlap.toString(),
          vipOverlap.toString());
        logAssertion(DOMAIN, TAG, String(coverOverlap), 'true');
        expect(coverOverlap).assertTrue();
        logAssertion(DOMAIN, TAG, String(vipOverlap), 'true');
        expect(vipOverlap).assertTrue();
        logAssertion(DOMAIN, TAG, String(heightOf(root)), '> ' + String(heightOf(vip)));
        expect(heightOf(root)).assertLarger(heightOf(vip));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2700
     * @tc.name: testUiPlayer0027
     * @tc.desc: Verify the playlist button is the right-most control of the band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0027', 0, async (done: Function) => {
      await runCase('testUiPlayer0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0027 begin');
        const list: string = await geometryOfId('player_list_btn');
        const next: string = await geometryOfId('player_next_btn');
        const play: string = await geometryOfId('player_play_btn');
        hilog.info(DOMAIN, TAG, 'listRight=%{public}d nextRight=%{public}d playRight=%{public}d', rightOf(list),
          rightOf(next), rightOf(play));
        logAssertion(DOMAIN, TAG, String(rightOf(list) > rightOf(next)), 'true');
        expect(rightOf(list) > rightOf(next)).assertTrue();
        logAssertion(DOMAIN, TAG, String(rightOf(next) > rightOf(play)), 'true');
        expect(rightOf(next) > rightOf(play)).assertTrue();
        logAssertion(DOMAIN, TAG, String(rightOf(list)), '> ' + String(0));
        expect(rightOf(list)).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2800
     * @tc.name: testUiPlayer0028
     * @tc.desc: Verify the player band stays below the header band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0028', 0, async (done: Function) => {
      await runCase('testUiPlayer0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0028 begin');
        const order: string = await aboveOfId('header_root', 'player_root');
        const header: string = await geometryOfId('header_root');
        const player: string = await geometryOfId('player_root');
        hilog.info(DOMAIN, TAG, 'order=%{public}s headerBottom=%{public}d playerTop=%{public}d', order,
          bottomOf(header), topOf(player));
        logAssertion(DOMAIN, TAG, String(order), String('ok'));
        expect(order).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(topOf(player) >= bottomOf(header)), 'true');
        expect(topOf(player) >= bottomOf(header)).assertTrue();
        logAssertion(DOMAIN, TAG, String(bottomOf(player) > bottomOf(header)), 'true');
        expect(bottomOf(player) > bottomOf(header)).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_2900
     * @tc.name: testUiPlayer0029
     * @tc.desc: Verify the band geometry and copy survive a reset of the page
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0029', 0, async (done: Function) => {
      await runCase('testUiPlayer0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0029 begin');
        const before: string = await geometryOfId('player_root');
        await resetToHome();
        const after: string = await geometryOfId('player_root');
        const visible: boolean = await existsId('player_root');
        hilog.info(DOMAIN, TAG, 'before=%{public}s after=%{public}s', before, after);
        logAssertion(DOMAIN, TAG, String(after.startsWith('ok:')), 'true');
        expect(after.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(topOf(after)), String(topOf(before)));
        expect(topOf(after)).assertEqual(topOf(before));
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_PLAYER_01_3000
     * @tc.name: testUiPlayer0030
     * @tc.desc: Verify repeated reads of the band return the same rectangle and type
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiPlayer0030', 0, async (done: Function) => {
      await runCase('testUiPlayer0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0030 begin');
        const first: string = await geometryOfId('player_root');
        const second: string = await geometryOfId('player_root');
        const type: string = await typeOfId('player_root');
        const again: string = await typeOfId('player_root');
        hilog.info(DOMAIN, TAG, 'first=%{public}s second=%{public}s type=%{public}s', first, second, type);
        logAssertion(DOMAIN, TAG, String(first), String(second));
        expect(first).assertEqual(second);
        logAssertion(DOMAIN, TAG, String(type), String(again));
        expect(type).assertEqual(again);
        logAssertion(DOMAIN, TAG, String(bottomOf(first)), '> ' + String(topOf(first)));
        expect(bottomOf(first)).assertLarger(topOf(first));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiPlayer0030 end');
      }, done);
    });

  })
}
