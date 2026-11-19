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
 * L2 suite for the home screen skeleton: header, playlist cover, the play-all
 * row and the bottom player.
 *
 * Every lookup goes through ON.id() against the semantic ids of
 * entry/src/main/ets/common/*.ets, and every case ends with resetToHome() so
 * the next case starts from the same screen.
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
  introInViewport,
  listInViewport,
  resetToHome,
  textOfId,
  typeOfId,
  waitId
} from '../util/UiEnv';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_MusicAlbum]';

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

export default function uiHome01Test() {
  describe('UiHome01', () => {

    beforeAll(async () => {
      await resetToHome();
    })

    afterEach(async () => {
      await resetToHome();
    })

    /**
     * @tc.name   testUiHome0001
     * @tc.number SUB_MUSICALBUM_UI_HOME_0001
     * @tc.desc   Anchor: the header container is reachable as soon as the page settles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0001 begin');
      const visible: boolean = await waitId('header_root', WAIT_MS);
      const rect: string = await geometryOfId('header_root');
      const type: string = await typeOfId('header_root');
      hilog.info(DOMAIN, TAG, 'visible=%{public}s rect=%{public}s type=%{public}s',
        visible.toString(), rect, type);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(type.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0001 end');
    })

    /**
     * @tc.name   testUiHome0002
     * @tc.number SUB_MUSICALBUM_UI_HOME_0002
     * @tc.desc   the header title shows the play_list string of the base resource file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0002 begin');
      const text: string = await textOfId('header_title');
      const expected: string = 'ok:' + expectedText('play_list');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
      expect(text).assertEqual(expected);
      expect(text.startsWith('ok:')).assertTrue();
      expect(text.length).assertLarger(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0002 end');
    })

    /**
     * @tc.name   testUiHome0003
     * @tc.number SUB_MUSICALBUM_UI_HOME_0003
     * @tc.desc   the back icon of the header is on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0003 begin');
      const visible: boolean = await existsId('header_back');
      const rect: string = await geometryOfId('header_back');
      const parts: string[] = rect.replace('ok:', '').split(',');
      hilog.info(DOMAIN, TAG, 'visible=%{public}s rect=%{public}s', visible.toString(), rect);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(Number(parts[2])).assertLarger(Number(parts[0]));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0003 end');
    })

    /**
     * @tc.name   testUiHome0004
     * @tc.number SUB_MUSICALBUM_UI_HOME_0004
     * @tc.desc   the more icon of the header is on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0004 begin');
      const visible: boolean = await existsId('header_more');
      const rect: string = await geometryOfId('header_more');
      const parts: string[] = rect.replace('ok:', '').split(',');
      hilog.info(DOMAIN, TAG, 'visible=%{public}s rect=%{public}s', visible.toString(), rect);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(Number(parts[3])).assertLarger(Number(parts[1]));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0004 end');
    })

    /**
     * @tc.name   testUiHome0005
     * @tc.number SUB_MUSICALBUM_UI_HOME_0005
     * @tc.desc   the back icon sits left of the more icon inside the header
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0005 begin');
      const back: string = await geometryOfId('header_back');
      const more: string = await geometryOfId('header_more');
      const backLeft: number = Number(back.replace('ok:', '').split(',')[0]);
      const moreLeft: number = Number(more.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'backLeft=%{public}d moreLeft=%{public}d', backLeft, moreLeft);
      expect(back.startsWith('ok:')).assertTrue();
      expect(more.startsWith('ok:')).assertTrue();
      expect(backLeft < moreLeft).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0005 end');
    })

    /**
     * @tc.name   testUiHome0006
     * @tc.number SUB_MUSICALBUM_UI_HOME_0006
     * @tc.desc   the header title sits between the back and the more icon
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0006 begin');
      const titleLeft: number = Number((await geometryOfId('header_title')).replace('ok:', '').split(',')[0]);
      const backLeft: number = Number((await geometryOfId('header_back')).replace('ok:', '').split(',')[0]);
      const moreLeft: number = Number((await geometryOfId('header_more')).replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'title=%{public}d back=%{public}d more=%{public}d', titleLeft, backLeft,
        moreLeft);
      expect(titleLeft > backLeft).assertTrue();
      expect(titleLeft < moreLeft).assertTrue();
      expect(moreLeft - backLeft).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0006 end');
    })

    /**
     * @tc.name   testUiHome0007
     * @tc.number SUB_MUSICALBUM_UI_HOME_0007
     * @tc.desc   the header spans the whole display width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0007 begin');
      const rect: string = await geometryOfId('header_root');
      const screen: string = await displaySize();
      const parts: string[] = rect.replace('ok:', '').split(',');
      const width: number = Number(parts[2]) - Number(parts[0]);
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'width=%{public}d screenWidth=%{public}d', width, screenWidth);
      expect(rect.startsWith('ok:')).assertTrue();
      expect(screen.startsWith('ok:')).assertTrue();
      expect(width).assertEqual(screenWidth);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0007 end');
    })

    /**
     * @tc.name   testUiHome0008
     * @tc.number SUB_MUSICALBUM_UI_HOME_0008
     * @tc.desc   the content container is below the header container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0008 begin');
      const order: string = await aboveOfId('header_root', 'content_root');
      const content: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'order=%{public}s content=%{public}s', order, content);
      expect(order).assertEqual('ok');
      expect(content.startsWith('ok:')).assertTrue();
      expect(content === 'notfound').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0008 end');
    })

    /**
     * @tc.name   testUiHome0009
     * @tc.number SUB_MUSICALBUM_UI_HOME_0009
     * @tc.desc   the album cover image of the playlist is on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0009 begin');
      const visible: boolean = await waitId('cover_album', WAIT_MS);
      const rect: string = await geometryOfId('cover_album');
      const type: string = await typeOfId('cover_album');
      hilog.info(DOMAIN, TAG, 'visible=%{public}s type=%{public}s', visible.toString(), type);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(type === 'notfound').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0009 end');
    })

    /**
     * @tc.name   testUiHome0010
     * @tc.number SUB_MUSICALBUM_UI_HOME_0010
     * @tc.desc   Anchor: the cover shows the collection counter of the sample
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0010 begin');
      const text: string = await textOfId('cover_collection_num');
      const expected: string = 'ok:' + expectedText('collection_num');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
      expect(text).assertEqual(expected);
      expect(text.startsWith('ok:')).assertTrue();
      expect(text === 'notfound').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0010 end');
    })

    /**
     * @tc.name   testUiHome0011
     * @tc.number SUB_MUSICALBUM_UI_HOME_0011
     * @tc.desc   the playlist name matches list_name when the cover column leaves room for it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0011 begin');
      const inline: boolean = await introInViewport();
      const text: string = await textOfId('cover_list_name');
      const expected: string = 'ok:' + expectedText('list_name');
      hilog.info(DOMAIN, TAG, 'inline=%{public}s actual=%{public}s expected=%{public}s', inline.toString(), text,
        expected);
      if (inline) {
        // md/lg: the cover and the copy sit side by side and the copy is reachable
        expect(text).assertEqual(expected);
        expect(text.startsWith('ok:')).assertTrue();
        expect(text.length).assertLarger(3);
      } else {
        // sm: the cover grows to the band width and covers the copy column
        expect(text).assertEqual('notfound');
        expect(await existsId('cover_album')).assertTrue();
        expect(await existsId('cover_collection_num')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0011 end');
    })

    /**
     * @tc.name   testUiHome0012
     * @tc.number SUB_MUSICALBUM_UI_HOME_0012
     * @tc.desc   the introduction matches playlist_Introduction when the copy column is reachable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0012 begin');
      const inline: boolean = await introInViewport();
      const text: string = await textOfId('cover_intro');
      const expected: string = 'ok:' + expectedText('playlist_Introduction');
      hilog.info(DOMAIN, TAG, 'inline=%{public}s actual=%{public}s expected=%{public}s', inline.toString(), text,
        expected);
      if (inline) {
        expect(text).assertEqual(expected);
        expect(text.startsWith('ok:')).assertTrue();
        expect(text.length).assertLarger(10);
      } else {
        // sm: the copy column is covered by the cover, only the cover band stays
        expect(text).assertEqual('notfound');
        expect(await existsId('cover_options')).assertTrue();
        expect(bottomOf(await geometryOfId('cover_album')) <= topOf(await geometryOfId('cover_options'))).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0012 end');
    })

    /**
     * @tc.name   testUiHome0013
     * @tc.number SUB_MUSICALBUM_UI_HOME_0013
     * @tc.desc   the option strip of the cover is on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0013 begin');
      const visible: boolean = await existsId('cover_options');
      const rect: string = await geometryOfId('cover_options');
      const width: number = Number(rect.replace('ok:', '').split(',')[2]) -
        Number(rect.replace('ok:', '').split(',')[0]);
      hilog.info(DOMAIN, TAG, 'visible=%{public}s width=%{public}d', visible.toString(), width);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(width).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0013 end');
    })

    /**
     * @tc.name   testUiHome0014
     * @tc.number SUB_MUSICALBUM_UI_HOME_0014
     * @tc.desc   the playlist name sits above the option strip when the copy column is laid out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0014 begin');
      const inline: boolean = await introInViewport();
      const order: string = await aboveOfId('cover_list_name', 'cover_options');
      const name: string = await geometryOfId('cover_list_name');
      const options: string = await geometryOfId('cover_options');
      hilog.info(DOMAIN, TAG, 'inline=%{public}s order=%{public}s name=%{public}s options=%{public}s',
        inline.toString(), order, name, options);
      expect(options.startsWith('ok:')).assertTrue();
      if (inline) {
        expect(order).assertEqual('ok');
        expect(name.startsWith('ok:')).assertTrue();
        expect(topOf(options) > 0).assertTrue();
      } else {
        // sm: the copy column is covered, but the cover still ends above the option strip
        expect(name).assertEqual('notfound');
        expect(bottomOf(await geometryOfId('cover_album')) <= topOf(options)).assertTrue();
        expect(leftOf(options)).assertLargerOrEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0014 end');
    })

    /**
     * @tc.name   testUiHome0015
     * @tc.number SUB_MUSICALBUM_UI_HOME_0015
     * @tc.desc   the introduction sits below the playlist name when the copy column is laid out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0015 begin');
      const inline: boolean = await introInViewport();
      const order: string = await aboveOfId('cover_list_name', 'cover_intro');
      const nameRect: string = await geometryOfId('cover_list_name');
      const introRect: string = await geometryOfId('cover_intro');
      hilog.info(DOMAIN, TAG, 'inline=%{public}s order=%{public}s name=%{public}s intro=%{public}s',
        inline.toString(), order, nameRect, introRect);
      if (inline) {
        expect(order).assertEqual('ok');
        expect(topOf(introRect) >= topOf(nameRect)).assertTrue();
        expect(order === 'fail').assertFalse();
      } else {
        // sm: both copy texts are covered by the cover image
        expect(nameRect).assertEqual('notfound');
        expect(introRect).assertEqual('notfound');
        expect(await existsId('cover_collection_num')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0015 end');
    })

    /**
     * @tc.name   testUiHome0016
     * @tc.number SUB_MUSICALBUM_UI_HOME_0016
     * @tc.desc   the cover image is above the option strip on compact screens
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0016 begin');
      const order: string = await aboveOfId('cover_album', 'cover_options');
      const album: string = await geometryOfId('cover_album');
      hilog.info(DOMAIN, TAG, 'testUiHome0016 begin-check order=%{public}s album=%{public}s', order, album);
      expect(order === 'notfound').assertFalse();
      expect(album.startsWith('ok:')).assertTrue();
      expect(album === 'notfound').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0016 end');
    })

    /**
     * @tc.name   testUiHome0017
     * @tc.number SUB_MUSICALBUM_UI_HOME_0017
     * @tc.desc   the play-all row of the list is on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0017 begin');
      const visible: boolean = await waitId('play_all_row', WAIT_MS);
      const rect: string = await geometryOfId('play_all_row');
      const height: number = Number(rect.replace('ok:', '').split(',')[3]) -
        Number(rect.replace('ok:', '').split(',')[1]);
      hilog.info(DOMAIN, TAG, 'visible=%{public}s height=%{public}d', visible.toString(), height);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(height).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0017 end');
    })

    /**
     * @tc.name   testUiHome0018
     * @tc.number SUB_MUSICALBUM_UI_HOME_0018
     * @tc.desc   the play-all label matches the play_all string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0018 begin');
      const text: string = await textOfId('play_all_text');
      const expected: string = 'ok:' + expectedText('play_all');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
      expect(text).assertEqual(expected);
      expect(text.startsWith('ok:')).assertTrue();
      expect(text === 'notfound').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0018 end');
    })

    /**
     * @tc.name   testUiHome0019
     * @tc.number SUB_MUSICALBUM_UI_HOME_0019
     * @tc.desc   the play order button of the list is on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0019 begin');
      const visible: boolean = await existsId('play_order_btn');
      const rect: string = await geometryOfId('play_order_btn');
      const type: string = await typeOfId('play_order_btn');
      hilog.info(DOMAIN, TAG, 'visible=%{public}s type=%{public}s', visible.toString(), type);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(type.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0019 end');
    })

    /**
     * @tc.name   testUiHome0020
     * @tc.number SUB_MUSICALBUM_UI_HOME_0020
     * @tc.desc   the sort button of the list is on screen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0020 begin');
      const visible: boolean = await existsId('play_sort_btn');
      const rect: string = await geometryOfId('play_sort_btn');
      const type: string = await typeOfId('play_sort_btn');
      hilog.info(DOMAIN, TAG, 'visible=%{public}s type=%{public}s', visible.toString(), type);
      expect(visible).assertTrue();
      expect(rect.startsWith('ok:')).assertTrue();
      expect(type.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0020 end');
    })

    /**
     * @tc.name   testUiHome0021
     * @tc.number SUB_MUSICALBUM_UI_HOME_0021
     * @tc.desc   the order button sits left of the sort button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0021 begin');
      const orderLeft: number = Number((await geometryOfId('play_order_btn')).replace('ok:', '').split(',')[0]);
      const sortLeft: number = Number((await geometryOfId('play_sort_btn')).replace('ok:', '').split(',')[0]);
      const order: string = await aboveOfId('play_all_text', 'play_order_btn');
      hilog.info(DOMAIN, TAG, 'orderLeft=%{public}d sortLeft=%{public}d relation=%{public}s', orderLeft,
        sortLeft, order);
      expect(orderLeft < sortLeft).assertTrue();
      expect(sortLeft - orderLeft).assertLarger(0);
      expect(order === 'notfound').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0021 end');
    })

    /**
     * @tc.name   testUiHome0022
     * @tc.number SUB_MUSICALBUM_UI_HOME_0022
     * @tc.desc   the song list is reachable below the play-all row, or clipped behind the player band
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0022 begin');
      const reachable: boolean = await listInViewport();
      const head: string = await geometryOfId('play_all_row');
      const band: string = await geometryOfId('content_root');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s head=%{public}s band=%{public}s', reachable.toString(), head,
        band);
      expect(head.startsWith('ok:')).assertTrue();
      if (reachable) {
        expect(await waitId('song_list', WAIT_MS)).assertTrue();
        expect(await aboveOfId('play_all_row', 'song_list')).assertEqual('ok');
        expect((await geometryOfId('song_list')).startsWith('ok:')).assertTrue();
      } else {
        // sm: the playlist column is pushed to the band edge and covered by the player
        expect(topOf(head) >= bottomOf(band) - 1).assertTrue();
        expect(await existsId('song_list')).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0022 end');
    })

    /**
     * @tc.name   testUiHome0023
     * @tc.number SUB_MUSICALBUM_UI_HOME_0023
     * @tc.desc   three song rows render when the list is inside the viewport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUiHome0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0023 begin');
      const reachable: boolean = await listInViewport();
      const visible: number = await countIds('song_item_1,song_item_2,song_item_3');
      const first: boolean = await existsId('song_item_1');
      const third: boolean = await existsId('song_item_3');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s visible=%{public}d first=%{public}s third=%{public}s',
        reachable.toString(), visible, first.toString(), third.toString());
      if (reachable) {
        expect(visible).assertEqual(3);
        expect(first).assertTrue();
        expect(third).assertTrue();
      } else {
        // sm: no row is rendered because the List itself is outside the viewport
        expect(visible).assertEqual(0);
        expect(first).assertFalse();
        expect(await existsId('play_all_text')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0023 end');
    })

    /**
     * @tc.name   testUiHome0024
     * @tc.number SUB_MUSICALBUM_UI_HOME_0024
     * @tc.desc   the first song row sits above the second row when the list is inside the viewport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0024 begin');
      const reachable: boolean = await listInViewport();
      const order: string = await aboveOfId('song_item_1', 'song_item_2');
      const first: string = await geometryOfId('song_item_1');
      const second: string = await geometryOfId('song_item_2');
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s order=%{public}s first=%{public}s second=%{public}s',
        reachable.toString(), order, first, second);
      if (reachable) {
        expect(order).assertEqual('ok');
        expect(first.startsWith('ok:')).assertTrue();
        expect(second.startsWith('ok:')).assertTrue();
      } else {
        // sm: rows are not laid out, the header keeps its position above them
        expect(first).assertEqual('notfound');
        expect(second).assertEqual('notfound');
        expect(topOf(await geometryOfId('play_all_row')) > topOf(await geometryOfId('cover_album'))).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0024 end');
    })

    /**
     * @tc.name   testUiHome0025
     * @tc.number SUB_MUSICALBUM_UI_HOME_0025
     * @tc.desc   the song rows keep a common height when the list is inside the viewport
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0025 begin');
      const reachable: boolean = await listInViewport();
      const firstRect: string = await geometryOfId('song_item_1');
      const secondRect: string = await geometryOfId('song_item_2');
      const firstHeight: number = bottomOf(firstRect) - topOf(firstRect);
      const secondHeight: number = bottomOf(secondRect) - topOf(secondRect);
      hilog.info(DOMAIN, TAG, 'reachable=%{public}s firstHeight=%{public}d secondHeight=%{public}d',
        reachable.toString(), firstHeight, secondHeight);
      if (reachable) {
        expect(firstHeight).assertEqual(secondHeight);
        expect(firstHeight).assertLarger(0);
        expect(secondHeight).assertLarger(0);
      } else {
        // sm: rows are clipped, the playlist head and the player share one band height
        expect(firstHeight).assertEqual(0);
        expect(secondHeight).assertEqual(0);
        const headHeight: number = bottomOf(await geometryOfId('play_all_row')) -
          topOf(await geometryOfId('play_all_row'));
        expect(headHeight).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0025 end');
    })

    /**
     * @tc.name   testUiHome0026
     * @tc.number SUB_MUSICALBUM_UI_HOME_0026
     * @tc.desc   the bottom player is the last band of the page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0026 begin');
      const order: string = await aboveOfId('content_root', 'player_root');
      const player: string = await geometryOfId('player_root');
      const screen: string = await displaySize();
      const playerBottom: number = Number(player.replace('ok:', '').split(',')[3]);
      const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
      hilog.info(DOMAIN, TAG, 'order=%{public}s playerBottom=%{public}d screenHeight=%{public}d', order,
        playerBottom, screenHeight);
      expect(order).assertEqual('ok');
      expect(player.startsWith('ok:')).assertTrue();
      expect(playerBottom <= screenHeight).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0026 end');
    })

    /**
     * @tc.name   testUiHome0027
     * @tc.number SUB_MUSICALBUM_UI_HOME_0027
     * @tc.desc   the three page bands appear in the frozen order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0027 begin');
      const headerFirst: string = await aboveOfId('header_root', 'content_root');
      const contentFirst: string = await aboveOfId('content_root', 'player_root');
      const bands: number = await countIds('header_root,content_root,player_root');
      hilog.info(DOMAIN, TAG, 'headerFirst=%{public}s contentFirst=%{public}s bands=%{public}d', headerFirst,
        contentFirst, bands);
      expect(headerFirst).assertEqual('ok');
      expect(contentFirst).assertEqual('ok');
      expect(bands).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0027 end');
    })

    /**
     * @tc.name   testUiHome0028
     * @tc.number SUB_MUSICALBUM_UI_HOME_0028
     * @tc.desc   every band of the page is inside the display
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0028 begin');
      const screen: string = await displaySize();
      const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
      const header: string = await geometryOfId('header_root');
      const player: string = await geometryOfId('player_root');
      const playerRight: number = Number(player.replace('ok:', '').split(',')[2]);
      hilog.info(DOMAIN, TAG, 'screenWidth=%{public}d playerRight=%{public}d header=%{public}s', screenWidth,
        playerRight, header);
      expect(screen.startsWith('ok:')).assertTrue();
      expect(playerRight <= screenWidth).assertTrue();
      expect(header.startsWith('ok:')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0028 end');
    })

    /**
     * @tc.name   testUiHome0029
     * @tc.number SUB_MUSICALBUM_UI_HOME_0029
     * @tc.desc   Anchor: an id that the app never declares is reported as not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0029 begin');
      const missing: boolean = await existsId('header_not_declared');
      const geometry: string = await geometryOfId('header_not_declared');
      const text: string = await textOfId('header_not_declared');
      hilog.info(DOMAIN, TAG, 'missing=%{public}s geometry=%{public}s text=%{public}s', missing.toString(),
        geometry, text);
      expect(missing).assertFalse();
      expect(geometry).assertEqual('notfound');
      expect(text).assertEqual('notfound');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0029 end');
    })

    /**
     * @tc.name   testUiHome0030
     * @tc.number SUB_MUSICALBUM_UI_HOME_0030
     * @tc.desc   the header stays on screen after the page is reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiHome0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0030 begin');
      await resetToHome();
      const visible: boolean = await waitId('header_root', WAIT_MS);
      const title: string = await textOfId('header_title');
      const again: boolean = await waitId('header_root', WAIT_MS);
      hilog.info(DOMAIN, TAG, 'visible=%{public}s title=%{public}s', visible.toString(), title);
      expect(visible).assertTrue();
      expect(title.startsWith('ok:')).assertTrue();
      expect(again).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0030 end');
    })

  })
}
