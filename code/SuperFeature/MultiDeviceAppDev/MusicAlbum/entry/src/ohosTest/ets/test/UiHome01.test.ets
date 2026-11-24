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

export default function uiHome01Test(): void {
  describe('UiHome01Test', () => {

    beforeAll(async () => {
      await resetToHome();
    })

    afterEach(async () => {
      await resetToHome();
    })

    /*
     * @tc.number: SUB_UI_HOME_01_0100
     * @tc.name: testUiHome0001
     * @tc.desc: Verify the header container is reachable as soon as the page settles
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0001', 0, async (done: Function) => {
      await runCase('testUiHome0001', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0001 begin');
        const visible: boolean = await waitId('header_root', WAIT_MS);
        const rect: string = await geometryOfId('header_root');
        const type: string = await typeOfId('header_root');
        hilog.info(DOMAIN, TAG, 'visible=%{public}s rect=%{public}s type=%{public}s',
          visible.toString(), rect, type);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(type.startsWith('ok:')), 'true');
        expect(type.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0001 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_0200
     * @tc.name: testUiHome0002
     * @tc.desc: Verify the header title shows the play_list string of the base resource file
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0002', 0, async (done: Function) => {
      await runCase('testUiHome0002', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0002 begin');
        const text: string = await textOfId('header_title');
        const expected: string = 'ok:' + expectedText('play_list');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
        logAssertion(DOMAIN, TAG, String(text), String(expected));
        expect(text).assertEqual(expected);
        logAssertion(DOMAIN, TAG, String(text.startsWith('ok:')), 'true');
        expect(text.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(text.length), '> ' + String(3));
        expect(text.length).assertLarger(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0002 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_0300
     * @tc.name: testUiHome0003
     * @tc.desc: Verify the back icon of the header is on screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0003', 0, async (done: Function) => {
      await runCase('testUiHome0003', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0003 begin');
        const visible: boolean = await existsId('header_back');
        const rect: string = await geometryOfId('header_back');
        const parts: string[] = rect.replace('ok:', '').split(',');
        hilog.info(DOMAIN, TAG, 'visible=%{public}s rect=%{public}s', visible.toString(), rect);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(Number(parts[2])), '> ' + String(Number(parts[0])));
        expect(Number(parts[2])).assertLarger(Number(parts[0]));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0003 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_0400
     * @tc.name: testUiHome0004
     * @tc.desc: Verify the more icon of the header is on screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0004', 0, async (done: Function) => {
      await runCase('testUiHome0004', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0004 begin');
        const visible: boolean = await existsId('header_more');
        const rect: string = await geometryOfId('header_more');
        const parts: string[] = rect.replace('ok:', '').split(',');
        hilog.info(DOMAIN, TAG, 'visible=%{public}s rect=%{public}s', visible.toString(), rect);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(Number(parts[3])), '> ' + String(Number(parts[1])));
        expect(Number(parts[3])).assertLarger(Number(parts[1]));
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0004 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_0500
     * @tc.name: testUiHome0005
     * @tc.desc: Verify the back icon sits left of the more icon inside the header
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0005', 0, async (done: Function) => {
      await runCase('testUiHome0005', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0005 begin');
        const back: string = await geometryOfId('header_back');
        const more: string = await geometryOfId('header_more');
        const backLeft: number = Number(back.replace('ok:', '').split(',')[0]);
        const moreLeft: number = Number(more.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'backLeft=%{public}d moreLeft=%{public}d', backLeft, moreLeft);
        logAssertion(DOMAIN, TAG, String(back.startsWith('ok:')), 'true');
        expect(back.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(more.startsWith('ok:')), 'true');
        expect(more.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(backLeft < moreLeft), 'true');
        expect(backLeft < moreLeft).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0005 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_0600
     * @tc.name: testUiHome0006
     * @tc.desc: Verify the header title sits between the back and the more icon
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0006', 0, async (done: Function) => {
      await runCase('testUiHome0006', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0006 begin');
        const titleLeft: number = Number((await geometryOfId('header_title')).replace('ok:', '').split(',')[0]);
        const backLeft: number = Number((await geometryOfId('header_back')).replace('ok:', '').split(',')[0]);
        const moreLeft: number = Number((await geometryOfId('header_more')).replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'title=%{public}d back=%{public}d more=%{public}d', titleLeft, backLeft,
          moreLeft);
        logAssertion(DOMAIN, TAG, String(titleLeft > backLeft), 'true');
        expect(titleLeft > backLeft).assertTrue();
        logAssertion(DOMAIN, TAG, String(titleLeft < moreLeft), 'true');
        expect(titleLeft < moreLeft).assertTrue();
        logAssertion(DOMAIN, TAG, String(moreLeft - backLeft), '> ' + String(0));
        expect(moreLeft - backLeft).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0006 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_0700
     * @tc.name: testUiHome0007
     * @tc.desc: Verify the header spans the whole display width
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0007', 0, async (done: Function) => {
      await runCase('testUiHome0007', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0007 begin');
        const rect: string = await geometryOfId('header_root');
        const screen: string = await displaySize();
        const parts: string[] = rect.replace('ok:', '').split(',');
        const width: number = Number(parts[2]) - Number(parts[0]);
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'width=%{public}d screenWidth=%{public}d', width, screenWidth);
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(screen.startsWith('ok:')), 'true');
        expect(screen.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(width), String(screenWidth));
        expect(width).assertEqual(screenWidth);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0007 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_0800
     * @tc.name: testUiHome0008
     * @tc.desc: Verify the content container is below the header container
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0008', 0, async (done: Function) => {
      await runCase('testUiHome0008', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0008 begin');
        const order: string = await aboveOfId('header_root', 'content_root');
        const content: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'order=%{public}s content=%{public}s', order, content);
        logAssertion(DOMAIN, TAG, String(order), String('ok'));
        expect(order).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(content.startsWith('ok:')), 'true');
        expect(content.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(content === 'notfound'), 'false');
        expect(content === 'notfound').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0008 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_0900
     * @tc.name: testUiHome0009
     * @tc.desc: Verify the album cover image of the playlist is on screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0009', 0, async (done: Function) => {
      await runCase('testUiHome0009', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0009 begin');
        const visible: boolean = await waitId('cover_album', WAIT_MS);
        const rect: string = await geometryOfId('cover_album');
        const type: string = await typeOfId('cover_album');
        hilog.info(DOMAIN, TAG, 'visible=%{public}s type=%{public}s', visible.toString(), type);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(type === 'notfound'), 'false');
        expect(type === 'notfound').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0009 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1000
     * @tc.name: testUiHome0010
     * @tc.desc: Verify the cover shows the collection counter of the sample
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0010', 0, async (done: Function) => {
      await runCase('testUiHome0010', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0010 begin');
        const text: string = await textOfId('cover_collection_num');
        const expected: string = 'ok:' + expectedText('collection_num');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
        logAssertion(DOMAIN, TAG, String(text), String(expected));
        expect(text).assertEqual(expected);
        logAssertion(DOMAIN, TAG, String(text.startsWith('ok:')), 'true');
        expect(text.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(text === 'notfound'), 'false');
        expect(text === 'notfound').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0010 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1100
     * @tc.name: testUiHome0011
     * @tc.desc: Verify the playlist name matches list_name when the cover column leaves room for it
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0011', 0, async (done: Function) => {
      await runCase('testUiHome0011', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0011 begin');
        const inline: boolean = await introInViewport();
        const text: string = await textOfId('cover_list_name');
        const expected: string = 'ok:' + expectedText('list_name');
        hilog.info(DOMAIN, TAG, 'inline=%{public}s actual=%{public}s expected=%{public}s', inline.toString(), text,
          expected);
        if (inline) {
          // md/lg: the cover and the copy sit side by side and the copy is reachable
          logAssertion(DOMAIN, TAG, String(text), String(expected));
          expect(text).assertEqual(expected);
          logAssertion(DOMAIN, TAG, String(text.startsWith('ok:')), 'true');
          expect(text.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(text.length), '> ' + String(3));
          expect(text.length).assertLarger(3);
        } else {
          // sm: the cover grows to the band width and covers the copy column
          logAssertion(DOMAIN, TAG, String(text), String('notfound'));
          expect(text).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(await existsId('cover_album')), 'true');
          expect(await existsId('cover_album')).assertTrue();
          logAssertion(DOMAIN, TAG, String(await existsId('cover_collection_num')), 'true');
          expect(await existsId('cover_collection_num')).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0011 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1200
     * @tc.name: testUiHome0012
     * @tc.desc: Verify the introduction matches playlist_Introduction when the copy column is reachable
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0012', 0, async (done: Function) => {
      await runCase('testUiHome0012', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0012 begin');
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
          logAssertion(DOMAIN, TAG, String(text.length), '> ' + String(10));
          expect(text.length).assertLarger(10);
        } else {
          // sm: the copy column is covered by the cover, only the cover band stays
          logAssertion(DOMAIN, TAG, String(text), String('notfound'));
          expect(text).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(await existsId('cover_options')), 'true');
          expect(await existsId('cover_options')).assertTrue();
          logAssertion(DOMAIN, TAG,
            String(bottomOf(await geometryOfId('cover_album')) <= topOf(await geometryOfId('cover_options'))),
            'true');
          expect(bottomOf(await geometryOfId('cover_album')) <=
            topOf(await geometryOfId('cover_options'))).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0012 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1300
     * @tc.name: testUiHome0013
     * @tc.desc: Verify the option strip of the cover is on screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0013', 0, async (done: Function) => {
      await runCase('testUiHome0013', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0013 begin');
        const visible: boolean = await existsId('cover_options');
        const rect: string = await geometryOfId('cover_options');
        const width: number = Number(rect.replace('ok:', '').split(',')[2]) -
          Number(rect.replace('ok:', '').split(',')[0]);
        hilog.info(DOMAIN, TAG, 'visible=%{public}s width=%{public}d', visible.toString(), width);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(width), '> ' + String(0));
        expect(width).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0013 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1400
     * @tc.name: testUiHome0014
     * @tc.desc: Verify the playlist name sits above the option strip when the copy column is laid out
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0014', 0, async (done: Function) => {
      await runCase('testUiHome0014', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0014 begin');
        const inline: boolean = await introInViewport();
        const order: string = await aboveOfId('cover_list_name', 'cover_options');
        const name: string = await geometryOfId('cover_list_name');
        const options: string = await geometryOfId('cover_options');
        hilog.info(DOMAIN, TAG, 'inline=%{public}s order=%{public}s name=%{public}s options=%{public}s',
          inline.toString(), order, name, options);
        logAssertion(DOMAIN, TAG, String(options.startsWith('ok:')), 'true');
        expect(options.startsWith('ok:')).assertTrue();
        if (inline) {
          logAssertion(DOMAIN, TAG, String(order), String('ok'));
          expect(order).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(name.startsWith('ok:')), 'true');
          expect(name.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(topOf(options) > 0), 'true');
          expect(topOf(options) > 0).assertTrue();
        } else {
          // sm: the copy column is covered, but the cover still ends above the option strip
          logAssertion(DOMAIN, TAG, String(name), String('notfound'));
          expect(name).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(bottomOf(await geometryOfId('cover_album')) <= topOf(options)), 'true');
          expect(bottomOf(await geometryOfId('cover_album')) <= topOf(options)).assertTrue();
          logAssertion(DOMAIN, TAG, String(leftOf(options)), '>= ' + String(0));
          expect(leftOf(options)).assertLargerOrEqual(0);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0014 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1500
     * @tc.name: testUiHome0015
     * @tc.desc: Verify the introduction sits below the playlist name when the copy column is laid out
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0015', 0, async (done: Function) => {
      await runCase('testUiHome0015', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0015 begin');
        const inline: boolean = await introInViewport();
        const order: string = await aboveOfId('cover_list_name', 'cover_intro');
        const nameRect: string = await geometryOfId('cover_list_name');
        const introRect: string = await geometryOfId('cover_intro');
        hilog.info(DOMAIN, TAG, 'inline=%{public}s order=%{public}s name=%{public}s intro=%{public}s',
          inline.toString(), order, nameRect, introRect);
        if (inline) {
          logAssertion(DOMAIN, TAG, String(order), String('ok'));
          expect(order).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(topOf(introRect) >= topOf(nameRect)), 'true');
          expect(topOf(introRect) >= topOf(nameRect)).assertTrue();
          logAssertion(DOMAIN, TAG, String(order === 'fail'), 'false');
          expect(order === 'fail').assertFalse();
        } else {
          // sm: both copy texts are covered by the cover image
          logAssertion(DOMAIN, TAG, String(nameRect), String('notfound'));
          expect(nameRect).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(introRect), String('notfound'));
          expect(introRect).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(await existsId('cover_collection_num')), 'true');
          expect(await existsId('cover_collection_num')).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0015 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1600
     * @tc.name: testUiHome0016
     * @tc.desc: Verify the cover image is above the option strip on compact screens
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0016', 0, async (done: Function) => {
      await runCase('testUiHome0016', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0016 begin');
        const order: string = await aboveOfId('cover_album', 'cover_options');
        const album: string = await geometryOfId('cover_album');
        hilog.info(DOMAIN, TAG, 'testUiHome0016 begin-check order=%{public}s album=%{public}s', order, album);
        logAssertion(DOMAIN, TAG, String(order === 'notfound'), 'false');
        expect(order === 'notfound').assertFalse();
        logAssertion(DOMAIN, TAG, String(album.startsWith('ok:')), 'true');
        expect(album.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(album === 'notfound'), 'false');
        expect(album === 'notfound').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0016 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1700
     * @tc.name: testUiHome0017
     * @tc.desc: Verify the play-all row of the list is on screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0017', 0, async (done: Function) => {
      await runCase('testUiHome0017', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0017 begin');
        const visible: boolean = await waitId('play_all_row', WAIT_MS);
        const rect: string = await geometryOfId('play_all_row');
        const height: number = Number(rect.replace('ok:', '').split(',')[3]) -
          Number(rect.replace('ok:', '').split(',')[1]);
        hilog.info(DOMAIN, TAG, 'visible=%{public}s height=%{public}d', visible.toString(), height);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(height), '> ' + String(0));
        expect(height).assertLarger(0);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0017 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1800
     * @tc.name: testUiHome0018
     * @tc.desc: Verify the play-all label matches the play_all string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0018', 0, async (done: Function) => {
      await runCase('testUiHome0018', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0018 begin');
        const text: string = await textOfId('play_all_text');
        const expected: string = 'ok:' + expectedText('play_all');
        hilog.info(DOMAIN, TAG, 'actual=%{public}s expected=%{public}s', text, expected);
        logAssertion(DOMAIN, TAG, String(text), String(expected));
        expect(text).assertEqual(expected);
        logAssertion(DOMAIN, TAG, String(text.startsWith('ok:')), 'true');
        expect(text.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(text === 'notfound'), 'false');
        expect(text === 'notfound').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0018 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_1900
     * @tc.name: testUiHome0019
     * @tc.desc: Verify the play order button of the list is on screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0019', 0, async (done: Function) => {
      await runCase('testUiHome0019', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0019 begin');
        const visible: boolean = await existsId('play_order_btn');
        const rect: string = await geometryOfId('play_order_btn');
        const type: string = await typeOfId('play_order_btn');
        hilog.info(DOMAIN, TAG, 'visible=%{public}s type=%{public}s', visible.toString(), type);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(type.startsWith('ok:')), 'true');
        expect(type.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0019 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2000
     * @tc.name: testUiHome0020
     * @tc.desc: Verify the sort button of the list is on screen
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0020', 0, async (done: Function) => {
      await runCase('testUiHome0020', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0020 begin');
        const visible: boolean = await existsId('play_sort_btn');
        const rect: string = await geometryOfId('play_sort_btn');
        const type: string = await typeOfId('play_sort_btn');
        hilog.info(DOMAIN, TAG, 'visible=%{public}s type=%{public}s', visible.toString(), type);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(rect.startsWith('ok:')), 'true');
        expect(rect.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(type.startsWith('ok:')), 'true');
        expect(type.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0020 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2100
     * @tc.name: testUiHome0021
     * @tc.desc: Verify the order button sits left of the sort button
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0021', 0, async (done: Function) => {
      await runCase('testUiHome0021', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0021 begin');
        const orderLeft: number = Number((await geometryOfId('play_order_btn')).replace('ok:', '').split(',')[0]);
        const sortLeft: number = Number((await geometryOfId('play_sort_btn')).replace('ok:', '').split(',')[0]);
        const order: string = await aboveOfId('play_all_text', 'play_order_btn');
        hilog.info(DOMAIN, TAG, 'orderLeft=%{public}d sortLeft=%{public}d relation=%{public}s', orderLeft,
          sortLeft, order);
        logAssertion(DOMAIN, TAG, String(orderLeft < sortLeft), 'true');
        expect(orderLeft < sortLeft).assertTrue();
        logAssertion(DOMAIN, TAG, String(sortLeft - orderLeft), '> ' + String(0));
        expect(sortLeft - orderLeft).assertLarger(0);
        logAssertion(DOMAIN, TAG, String(order === 'notfound'), 'false');
        expect(order === 'notfound').assertFalse();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0021 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2200
     * @tc.name: testUiHome0022
     * @tc.desc: Verify the song list is reachable below the play-all row, or clipped behind the player band
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0022', 0, async (done: Function) => {
      await runCase('testUiHome0022', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0022 begin');
        const reachable: boolean = await listInViewport();
        const head: string = await geometryOfId('play_all_row');
        const band: string = await geometryOfId('content_root');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s head=%{public}s band=%{public}s', reachable.toString(), head,
          band);
        logAssertion(DOMAIN, TAG, String(head.startsWith('ok:')), 'true');
        expect(head.startsWith('ok:')).assertTrue();
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(await waitId('song_list', WAIT_MS)), 'true');
          expect(await waitId('song_list', WAIT_MS)).assertTrue();
          logAssertion(DOMAIN, TAG, String(await aboveOfId('play_all_row', 'song_list')), String('ok'));
          expect(await aboveOfId('play_all_row', 'song_list')).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String((await geometryOfId('song_list')).startsWith('ok:')), 'true');
          expect((await geometryOfId('song_list')).startsWith('ok:')).assertTrue();
        } else {
          // sm: the playlist column is pushed to the band edge and covered by the player
          logAssertion(DOMAIN, TAG, String(topOf(head) >= bottomOf(band) - 1), 'true');
          expect(topOf(head) >= bottomOf(band) - 1).assertTrue();
          logAssertion(DOMAIN, TAG, String(await existsId('song_list')), 'false');
          expect(await existsId('song_list')).assertFalse();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0022 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2300
     * @tc.name: testUiHome0023
     * @tc.desc: Verify three song rows render when the list is inside the viewport
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testUiHome0023', 0, async (done: Function) => {
      await runCase('testUiHome0023', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0023 begin');
        const reachable: boolean = await listInViewport();
        const visible: number = await countIds('song_item_1,song_item_2,song_item_3');
        const first: boolean = await existsId('song_item_1');
        const third: boolean = await existsId('song_item_3');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s visible=%{public}d first=%{public}s third=%{public}s',
          reachable.toString(), visible, first.toString(), third.toString());
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(visible), String(3));
          expect(visible).assertEqual(3);
          logAssertion(DOMAIN, TAG, String(first), 'true');
          expect(first).assertTrue();
          logAssertion(DOMAIN, TAG, String(third), 'true');
          expect(third).assertTrue();
        } else {
          // sm: no row is rendered because the List itself is outside the viewport
          logAssertion(DOMAIN, TAG, String(visible), String(0));
          expect(visible).assertEqual(0);
          logAssertion(DOMAIN, TAG, String(first), 'false');
          expect(first).assertFalse();
          logAssertion(DOMAIN, TAG, String(await existsId('play_all_text')), 'true');
          expect(await existsId('play_all_text')).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0023 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2400
     * @tc.name: testUiHome0024
     * @tc.desc: Verify the first song row sits above the second row when the list is inside the viewport
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0024', 0, async (done: Function) => {
      await runCase('testUiHome0024', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0024 begin');
        const reachable: boolean = await listInViewport();
        const order: string = await aboveOfId('song_item_1', 'song_item_2');
        const first: string = await geometryOfId('song_item_1');
        const second: string = await geometryOfId('song_item_2');
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s order=%{public}s first=%{public}s second=%{public}s',
          reachable.toString(), order, first, second);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(order), String('ok'));
          expect(order).assertEqual('ok');
          logAssertion(DOMAIN, TAG, String(first.startsWith('ok:')), 'true');
          expect(first.startsWith('ok:')).assertTrue();
          logAssertion(DOMAIN, TAG, String(second.startsWith('ok:')), 'true');
          expect(second.startsWith('ok:')).assertTrue();
        } else {
          // sm: rows are not laid out, the header keeps its position above them
          logAssertion(DOMAIN, TAG, String(first), String('notfound'));
          expect(first).assertEqual('notfound');
          logAssertion(DOMAIN, TAG, String(second), String('notfound'));
          expect(second).assertEqual('notfound');
          logAssertion(DOMAIN, TAG,
            String(topOf(await geometryOfId('play_all_row')) > topOf(await geometryOfId('cover_album'))),
            'true');
          expect(topOf(await geometryOfId('play_all_row')) > topOf(await geometryOfId('cover_album'))).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0024 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2500
     * @tc.name: testUiHome0025
     * @tc.desc: Verify the song rows keep a common height when the list is inside the viewport
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0025', 0, async (done: Function) => {
      await runCase('testUiHome0025', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0025 begin');
        const reachable: boolean = await listInViewport();
        const firstRect: string = await geometryOfId('song_item_1');
        const secondRect: string = await geometryOfId('song_item_2');
        const firstHeight: number = bottomOf(firstRect) - topOf(firstRect);
        const secondHeight: number = bottomOf(secondRect) - topOf(secondRect);
        hilog.info(DOMAIN, TAG, 'reachable=%{public}s firstHeight=%{public}d secondHeight=%{public}d',
          reachable.toString(), firstHeight, secondHeight);
        if (reachable) {
          logAssertion(DOMAIN, TAG, String(firstHeight), String(secondHeight));
          expect(firstHeight).assertEqual(secondHeight);
          logAssertion(DOMAIN, TAG, String(firstHeight), '> ' + String(0));
          expect(firstHeight).assertLarger(0);
          logAssertion(DOMAIN, TAG, String(secondHeight), '> ' + String(0));
          expect(secondHeight).assertLarger(0);
        } else {
          // sm: rows are clipped, the playlist head and the player share one band height
          logAssertion(DOMAIN, TAG, String(firstHeight), String(0));
          expect(firstHeight).assertEqual(0);
          logAssertion(DOMAIN, TAG, String(secondHeight), String(0));
          expect(secondHeight).assertEqual(0);
          const headHeight: number = bottomOf(await geometryOfId('play_all_row')) -
            topOf(await geometryOfId('play_all_row'));
          logAssertion(DOMAIN, TAG, String(headHeight), '> ' + String(0));
          expect(headHeight).assertLarger(0);
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0025 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2600
     * @tc.name: testUiHome0026
     * @tc.desc: Verify the bottom player is the last band of the page
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0026', 0, async (done: Function) => {
      await runCase('testUiHome0026', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0026 begin');
        const order: string = await aboveOfId('content_root', 'player_root');
        const player: string = await geometryOfId('player_root');
        const screen: string = await displaySize();
        const playerBottom: number = Number(player.replace('ok:', '').split(',')[3]);
        const screenHeight: number = Number(screen.replace('ok:', '').split(',')[1]);
        hilog.info(DOMAIN, TAG, 'order=%{public}s playerBottom=%{public}d screenHeight=%{public}d', order,
          playerBottom, screenHeight);
        logAssertion(DOMAIN, TAG, String(order), String('ok'));
        expect(order).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(player.startsWith('ok:')), 'true');
        expect(player.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(playerBottom <= screenHeight), 'true');
        expect(playerBottom <= screenHeight).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0026 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2700
     * @tc.name: testUiHome0027
     * @tc.desc: Verify the three page bands appear in the frozen order
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0027', 0, async (done: Function) => {
      await runCase('testUiHome0027', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0027 begin');
        const headerFirst: string = await aboveOfId('header_root', 'content_root');
        const contentFirst: string = await aboveOfId('content_root', 'player_root');
        const bands: number = await countIds('header_root,content_root,player_root');
        hilog.info(DOMAIN, TAG, 'headerFirst=%{public}s contentFirst=%{public}s bands=%{public}d', headerFirst,
          contentFirst, bands);
        logAssertion(DOMAIN, TAG, String(headerFirst), String('ok'));
        expect(headerFirst).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(contentFirst), String('ok'));
        expect(contentFirst).assertEqual('ok');
        logAssertion(DOMAIN, TAG, String(bands), String(3));
        expect(bands).assertEqual(3);
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0027 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2800
     * @tc.name: testUiHome0028
     * @tc.desc: Verify every band of the page is inside the display
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0028', 0, async (done: Function) => {
      await runCase('testUiHome0028', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0028 begin');
        const screen: string = await displaySize();
        const screenWidth: number = Number(screen.replace('ok:', '').split(',')[0]);
        const header: string = await geometryOfId('header_root');
        const player: string = await geometryOfId('player_root');
        const playerRight: number = Number(player.replace('ok:', '').split(',')[2]);
        hilog.info(DOMAIN, TAG, 'screenWidth=%{public}d playerRight=%{public}d header=%{public}s', screenWidth,
          playerRight, header);
        logAssertion(DOMAIN, TAG, String(screen.startsWith('ok:')), 'true');
        expect(screen.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(playerRight <= screenWidth), 'true');
        expect(playerRight <= screenWidth).assertTrue();
        logAssertion(DOMAIN, TAG, String(header.startsWith('ok:')), 'true');
        expect(header.startsWith('ok:')).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0028 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_2900
     * @tc.name: testUiHome0029
     * @tc.desc: Verify an id that the app never declares is reported as not found
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0029', 0, async (done: Function) => {
      await runCase('testUiHome0029', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0029 begin');
        const missing: boolean = await existsId('header_not_declared');
        const geometry: string = await geometryOfId('header_not_declared');
        const text: string = await textOfId('header_not_declared');
        hilog.info(DOMAIN, TAG, 'missing=%{public}s geometry=%{public}s text=%{public}s', missing.toString(),
          geometry, text);
        logAssertion(DOMAIN, TAG, String(missing), 'false');
        expect(missing).assertFalse();
        logAssertion(DOMAIN, TAG, String(geometry), String('notfound'));
        expect(geometry).assertEqual('notfound');
        logAssertion(DOMAIN, TAG, String(text), String('notfound'));
        expect(text).assertEqual('notfound');
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0029 end');
      }, done);
    });

    /*
     * @tc.number: SUB_UI_HOME_01_3000
     * @tc.name: testUiHome0030
     * @tc.desc: Verify the header stays on screen after the page is reset
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testUiHome0030', 0, async (done: Function) => {
      await runCase('testUiHome0030', async (): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0030 begin');
        await resetToHome();
        const visible: boolean = await waitId('header_root', WAIT_MS);
        const title: string = await textOfId('header_title');
        const again: boolean = await waitId('header_root', WAIT_MS);
        hilog.info(DOMAIN, TAG, 'visible=%{public}s title=%{public}s', visible.toString(), title);
        logAssertion(DOMAIN, TAG, String(visible), 'true');
        expect(visible).assertTrue();
        logAssertion(DOMAIN, TAG, String(title.startsWith('ok:')), 'true');
        expect(title.startsWith('ok:')).assertTrue();
        logAssertion(DOMAIN, TAG, String(again), 'true');
        expect(again).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testUiHome0030 end');
      }, done);
    });

  })
}
