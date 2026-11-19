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

// @volume rule=SongType-fields-are-independent-of-each-other basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function modelMatrix06Test() {
  describe('ModelMatrix06', () => {

    /**
     * @tc.number: SUB_MM_MDLSONG02_0100
     * @tc.name: testMdlSong020001
     * @tc.desc: Verify updating count does not touch the resource fields (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020001 begin');
      let song: SongType = new SongType($r('app.media.list13'), $r('app.media.ic_more'), 2);
      song.count = 3;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_more').id));
      expect(v2).assertEqual($r('app.media.ic_more').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020001 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_0200
     * @tc.name: testMdlSong020002
     * @tc.desc: Verify updating count does not touch the resource fields (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020002 begin');
      let song: SongType = new SongType($r('app.media.banner1'), $r('app.media.ic_music_Album'), 4);
      song.count = 5;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_Album').id));
      expect(v2).assertEqual($r('app.media.ic_music_Album').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020002 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_0300
     * @tc.name: testMdlSong020003
     * @tc.desc: Verify updating count does not touch the resource fields (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020003 begin');
      let song: SongType = new SongType($r('app.media.banner2'), $r('app.media.ic_music_children'), 6);
      song.count = 7;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(7));
      expect(v0).assertEqual(7);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_children').id));
      expect(v2).assertEqual($r('app.media.ic_music_children').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020003 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_0400
     * @tc.name: testMdlSong020004
     * @tc.desc: Verify updating count does not touch the resource fields (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020004 begin');
      let song: SongType = new SongType($r('app.media.banner3'), $r('app.media.ic_music_hires'), 8);
      song.count = 9;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(9));
      expect(v0).assertEqual(9);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_hires').id));
      expect(v2).assertEqual($r('app.media.ic_music_hires').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020004 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_0500
     * @tc.name: testMdlSong020005
     * @tc.desc: Verify updating count does not touch the resource fields (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020005 begin');
      let song: SongType = new SongType($r('app.media.ic_find'), $r('app.media.ic_music_localmusic'), 10);
      song.count = 11;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(11));
      expect(v0).assertEqual(11);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_localmusic').id));
      expect(v2).assertEqual($r('app.media.ic_music_localmusic').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020005 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_0600
     * @tc.name: testMdlSong020006
     * @tc.desc: Verify updating count does not touch the resource fields (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020006 begin');
      let song: SongType = new SongType($r('app.media.ic_find_h'), $r('app.media.ic_music_musicfm'), 12);
      song.count = 13;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(13));
      expect(v0).assertEqual(13);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_musicfm').id));
      expect(v2).assertEqual($r('app.media.ic_music_musicfm').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020006 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_0700
     * @tc.name: testMdlSong020007
     * @tc.desc: Verify updating count does not touch the resource fields (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020007 begin');
      let song: SongType = new SongType($r('app.media.ic_home'), $r('app.media.ic_music_privatefm'), 14);
      song.count = 15;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(15));
      expect(v0).assertEqual(15);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_privatefm').id));
      expect(v2).assertEqual($r('app.media.ic_music_privatefm').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020007 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_0800
     * @tc.name: testMdlSong020008
     * @tc.desc: Verify updating count does not touch the resource fields (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020008 begin');
      let song: SongType = new SongType($r('app.media.ic_listener'), $r('app.media.ic_music_ranking'), 16);
      song.count = 17;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(17));
      expect(v0).assertEqual(17);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_ranking').id));
      expect(v2).assertEqual($r('app.media.ic_music_ranking').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020008 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_0900
     * @tc.name: testMdlSong020009
     * @tc.desc: Verify updating count does not touch the resource fields (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020009 begin');
      let song: SongType = new SongType($r('app.media.ic_mine'), $r('app.media.ic_music_singer'), 18);
      song.count = 19;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(19));
      expect(v0).assertEqual(19);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_singer').id));
      expect(v2).assertEqual($r('app.media.ic_music_singer').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020009 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1000
     * @tc.name: testMdlSong020010
     * @tc.desc: Verify updating count does not touch the resource fields (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020010 begin');
      let song: SongType = new SongType($r('app.media.ic_mine_h'), $r('app.media.ic_music_songsheet'), 20);
      song.count = 21;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(21));
      expect(v0).assertEqual(21);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_songsheet').id));
      expect(v2).assertEqual($r('app.media.ic_music_songsheet').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020010 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1100
     * @tc.name: testMdlSong020011
     * @tc.desc: Verify updating count does not touch the resource fields (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020011 begin');
      let song: SongType = new SongType($r('app.media.ic_more'), $r('app.media.ic_play'), 22);
      song.count = 23;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(23));
      expect(v0).assertEqual(23);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_play').id));
      expect(v2).assertEqual($r('app.media.ic_play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020011 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1200
     * @tc.name: testMdlSong020012
     * @tc.desc: Verify updating count does not touch the resource fields (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020012 begin');
      let song: SongType = new SongType($r('app.media.ic_music_Album'), $r('app.media.ic_playList'), 24);
      song.count = 25;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(25));
      expect(v0).assertEqual(25);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_playList').id));
      expect(v2).assertEqual($r('app.media.ic_playList').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020012 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1300
     * @tc.name: testMdlSong020013
     * @tc.desc: Verify updating count does not touch the resource fields (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020013 begin');
      let song: SongType = new SongType($r('app.media.ic_music_children'), $r('app.media.ic_public_arrow_right'), 26);
      song.count = 27;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(27));
      expect(v0).assertEqual(27);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_public_arrow_right').id));
      expect(v2).assertEqual($r('app.media.ic_public_arrow_right').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020013 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1400
     * @tc.name: testMdlSong020014
     * @tc.desc: Verify updating count does not touch the resource fields (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020014 begin');
      let song: SongType = new SongType($r('app.media.ic_music_hires'), $r('app.media.ic_public_home'), 28);
      song.count = 29;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(29));
      expect(v0).assertEqual(29);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_public_home').id));
      expect(v2).assertEqual($r('app.media.ic_public_home').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020014 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1500
     * @tc.name: testMdlSong020015
     * @tc.desc: Verify updating count does not touch the resource fields (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020015 begin');
      let song: SongType = new SongType($r('app.media.ic_music_localmusic'), $r('app.media.ic_public_home_filled'), 30);
      song.count = 31;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(31));
      expect(v0).assertEqual(31);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_public_home_filled').id));
      expect(v2).assertEqual($r('app.media.ic_public_home_filled').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020015 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1600
     * @tc.name: testMdlSong020016
     * @tc.desc: Verify updating count does not touch the resource fields (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020016 begin');
      let song: SongType = new SongType($r('app.media.ic_music_musicfm'), $r('app.media.ic_radio'), 32);
      song.count = 33;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(33));
      expect(v0).assertEqual(33);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_radio').id));
      expect(v2).assertEqual($r('app.media.ic_radio').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020016 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1700
     * @tc.name: testMdlSong020017
     * @tc.desc: Verify updating count does not touch the resource fields (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020017 begin');
      let song: SongType = new SongType($r('app.media.ic_music_privatefm'), $r('app.media.ic_radio_h'), 34);
      song.count = 35;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(35));
      expect(v0).assertEqual(35);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_radio_h').id));
      expect(v2).assertEqual($r('app.media.ic_radio_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020017 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1800
     * @tc.name: testMdlSong020018
     * @tc.desc: Verify updating count does not touch the resource fields (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020018 begin');
      let song: SongType = new SongType($r('app.media.ic_music_ranking'), $r('app.media.ic_search'), 36);
      song.count = 37;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(37));
      expect(v0).assertEqual(37);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_search').id));
      expect(v2).assertEqual($r('app.media.ic_search').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020018 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_1900
     * @tc.name: testMdlSong020019
     * @tc.desc: Verify updating count does not touch the resource fields (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020019 begin');
      let song: SongType = new SongType($r('app.media.ic_music_singer'), $r('app.media.icon'), 38);
      song.count = 39;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(39));
      expect(v0).assertEqual(39);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.icon').id));
      expect(v2).assertEqual($r('app.media.icon').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020019 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2000
     * @tc.name: testMdlSong020020
     * @tc.desc: Verify updating count does not touch the resource fields (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020020 begin');
      let song: SongType = new SongType($r('app.media.ic_music_songsheet'), $r('app.media.icon_play'), 40);
      song.count = 41;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(41));
      expect(v0).assertEqual(41);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_songsheet').id));
      expect(v1).assertEqual($r('app.media.ic_music_songsheet').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.icon_play').id));
      expect(v2).assertEqual($r('app.media.icon_play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020020 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2100
     * @tc.name: testMdlSong020021
     * @tc.desc: Verify updating count does not touch the resource fields (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020021 begin');
      let song: SongType = new SongType($r('app.media.ic_play'), $r('app.media.play'), 42);
      song.count = 43;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(43));
      expect(v0).assertEqual(43);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_play').id));
      expect(v1).assertEqual($r('app.media.ic_play').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.play').id));
      expect(v2).assertEqual($r('app.media.play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020021 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2200
     * @tc.name: testMdlSong020022
     * @tc.desc: Verify updating count does not touch the resource fields (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020022 begin');
      let song: SongType = new SongType($r('app.media.ic_playList'), $r('app.media.list1'), 44);
      song.count = 45;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(45));
      expect(v0).assertEqual(45);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_playList').id));
      expect(v1).assertEqual($r('app.media.ic_playList').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list1').id));
      expect(v2).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020022 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2300
     * @tc.name: testMdlSong020023
     * @tc.desc: Verify updating count does not touch the resource fields (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020023 begin');
      let song: SongType = new SongType($r('app.media.ic_public_arrow_right'), $r('app.media.list2'), 46);
      song.count = 47;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(47));
      expect(v0).assertEqual(47);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_arrow_right').id));
      expect(v1).assertEqual($r('app.media.ic_public_arrow_right').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list2').id));
      expect(v2).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020023 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2400
     * @tc.name: testMdlSong020024
     * @tc.desc: Verify updating count does not touch the resource fields (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020024 begin');
      let song: SongType = new SongType($r('app.media.ic_public_home'), $r('app.media.list3'), 48);
      song.count = 49;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(49));
      expect(v0).assertEqual(49);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home').id));
      expect(v1).assertEqual($r('app.media.ic_public_home').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list3').id));
      expect(v2).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020024 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2500
     * @tc.name: testMdlSong020025
     * @tc.desc: Verify updating count does not touch the resource fields (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020025 begin');
      let song: SongType = new SongType($r('app.media.ic_public_home_filled'), $r('app.media.list4'), 50);
      song.count = 51;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(51));
      expect(v0).assertEqual(51);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home_filled').id));
      expect(v1).assertEqual($r('app.media.ic_public_home_filled').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list4').id));
      expect(v2).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020025 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2600
     * @tc.name: testMdlSong020026
     * @tc.desc: Verify updating count does not touch the resource fields (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020026 begin');
      let song: SongType = new SongType($r('app.media.ic_radio'), $r('app.media.list5'), 52);
      song.count = 53;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(53));
      expect(v0).assertEqual(53);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio').id));
      expect(v1).assertEqual($r('app.media.ic_radio').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list5').id));
      expect(v2).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020026 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2700
     * @tc.name: testMdlSong020027
     * @tc.desc: Verify updating count does not touch the resource fields (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020027 begin');
      let song: SongType = new SongType($r('app.media.ic_radio_h'), $r('app.media.list6'), 54);
      song.count = 55;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(55));
      expect(v0).assertEqual(55);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio_h').id));
      expect(v1).assertEqual($r('app.media.ic_radio_h').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list6').id));
      expect(v2).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020027 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2800
     * @tc.name: testMdlSong020028
     * @tc.desc: Verify updating count does not touch the resource fields (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020028 begin');
      let song: SongType = new SongType($r('app.media.ic_search'), $r('app.media.list7'), 56);
      song.count = 57;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(57));
      expect(v0).assertEqual(57);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_search').id));
      expect(v1).assertEqual($r('app.media.ic_search').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list7').id));
      expect(v2).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020028 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_2900
     * @tc.name: testMdlSong020029
     * @tc.desc: Verify updating count does not touch the resource fields (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020029 begin');
      let song: SongType = new SongType($r('app.media.icon'), $r('app.media.list8'), 58);
      song.count = 59;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(59));
      expect(v0).assertEqual(59);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon').id));
      expect(v1).assertEqual($r('app.media.icon').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list8').id));
      expect(v2).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020029 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3000
     * @tc.name: testMdlSong020030
     * @tc.desc: Verify updating count does not touch the resource fields (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020030 begin');
      let song: SongType = new SongType($r('app.media.icon_play'), $r('app.media.list9'), 60);
      song.count = 61;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(61));
      expect(v0).assertEqual(61);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon_play').id));
      expect(v1).assertEqual($r('app.media.icon_play').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list9').id));
      expect(v2).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020030 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3100
     * @tc.name: testMdlSong020031
     * @tc.desc: Verify updating count does not touch the resource fields (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020031 begin');
      let song: SongType = new SongType($r('app.media.play'), $r('app.media.list10'), 62);
      song.count = 63;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(63));
      expect(v0).assertEqual(63);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.play').id));
      expect(v1).assertEqual($r('app.media.play').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list10').id));
      expect(v2).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020031 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3200
     * @tc.name: testMdlSong020032
     * @tc.desc: Verify updating count does not touch the resource fields (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020032 begin');
      let song: SongType = new SongType($r('app.media.list1'), $r('app.media.list11'), 64);
      song.count = 65;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(65));
      expect(v0).assertEqual(65);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list11').id));
      expect(v2).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020032 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3300
     * @tc.name: testMdlSong020033
     * @tc.desc: Verify updating count does not touch the resource fields (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020033 begin');
      let song: SongType = new SongType($r('app.media.list2'), $r('app.media.list12'), 66);
      song.count = 67;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(67));
      expect(v0).assertEqual(67);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list2').id));
      expect(v1).assertEqual($r('app.media.list2').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list12').id));
      expect(v2).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020033 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3400
     * @tc.name: testMdlSong020034
     * @tc.desc: Verify updating count does not touch the resource fields (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020034 begin');
      let song: SongType = new SongType($r('app.media.list3'), $r('app.media.list13'), 68);
      song.count = 69;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(69));
      expect(v0).assertEqual(69);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list13').id));
      expect(v2).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020034 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3500
     * @tc.name: testMdlSong020035
     * @tc.desc: Verify updating count does not touch the resource fields (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020035 begin');
      let song: SongType = new SongType($r('app.media.list4'), $r('app.media.banner1'), 70);
      song.count = 71;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(71));
      expect(v0).assertEqual(71);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list4').id));
      expect(v1).assertEqual($r('app.media.list4').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.banner1').id));
      expect(v2).assertEqual($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020035 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3600
     * @tc.name: testMdlSong020036
     * @tc.desc: Verify updating count does not touch the resource fields (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020036 begin');
      let song: SongType = new SongType($r('app.media.list5'), $r('app.media.banner2'), 72);
      song.count = 73;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(73));
      expect(v0).assertEqual(73);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.banner2').id));
      expect(v2).assertEqual($r('app.media.banner2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020036 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3700
     * @tc.name: testMdlSong020037
     * @tc.desc: Verify updating count does not touch the resource fields (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020037 begin');
      let song: SongType = new SongType($r('app.media.list6'), $r('app.media.banner3'), 74);
      song.count = 75;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(75));
      expect(v0).assertEqual(75);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.banner3').id));
      expect(v2).assertEqual($r('app.media.banner3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020037 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3800
     * @tc.name: testMdlSong020038
     * @tc.desc: Verify updating count does not touch the resource fields (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020038 begin');
      let song: SongType = new SongType($r('app.media.list7'), $r('app.media.ic_find'), 76);
      song.count = 77;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(77));
      expect(v0).assertEqual(77);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_find').id));
      expect(v2).assertEqual($r('app.media.ic_find').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020038 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_3900
     * @tc.name: testMdlSong020039
     * @tc.desc: Verify updating count does not touch the resource fields (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020039 begin');
      let song: SongType = new SongType($r('app.media.list8'), $r('app.media.ic_find_h'), 78);
      song.count = 79;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(79));
      expect(v0).assertEqual(79);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_find_h').id));
      expect(v2).assertEqual($r('app.media.ic_find_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020039 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4000
     * @tc.name: testMdlSong020040
     * @tc.desc: Verify updating count does not touch the resource fields (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020040 begin');
      let song: SongType = new SongType($r('app.media.list9'), $r('app.media.ic_home'), 80);
      song.count = 81;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(81));
      expect(v0).assertEqual(81);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_home').id));
      expect(v2).assertEqual($r('app.media.ic_home').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020040 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4100
     * @tc.name: testMdlSong020041
     * @tc.desc: Verify updating count does not touch the resource fields (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020041 begin');
      let song: SongType = new SongType($r('app.media.list10'), $r('app.media.ic_listener'), 82);
      song.count = 83;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(83));
      expect(v0).assertEqual(83);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_listener').id));
      expect(v2).assertEqual($r('app.media.ic_listener').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020041 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4200
     * @tc.name: testMdlSong020042
     * @tc.desc: Verify updating count does not touch the resource fields (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020042 begin');
      let song: SongType = new SongType($r('app.media.list11'), $r('app.media.ic_mine'), 84);
      song.count = 85;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(85));
      expect(v0).assertEqual(85);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_mine').id));
      expect(v2).assertEqual($r('app.media.ic_mine').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020042 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4300
     * @tc.name: testMdlSong020043
     * @tc.desc: Verify updating count does not touch the resource fields (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020043 begin');
      let song: SongType = new SongType($r('app.media.list12'), $r('app.media.ic_mine_h'), 86);
      song.count = 87;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(87));
      expect(v0).assertEqual(87);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_mine_h').id));
      expect(v2).assertEqual($r('app.media.ic_mine_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020043 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4400
     * @tc.name: testMdlSong020044
     * @tc.desc: Verify updating count does not touch the resource fields (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020044 begin');
      let song: SongType = new SongType($r('app.media.list13'), $r('app.media.ic_more'), 88);
      song.count = 89;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(89));
      expect(v0).assertEqual(89);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_more').id));
      expect(v2).assertEqual($r('app.media.ic_more').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020044 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4500
     * @tc.name: testMdlSong020045
     * @tc.desc: Verify updating count does not touch the resource fields (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020045 begin');
      let song: SongType = new SongType($r('app.media.banner1'), $r('app.media.ic_music_Album'), 90);
      song.count = 91;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(91));
      expect(v0).assertEqual(91);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_Album').id));
      expect(v2).assertEqual($r('app.media.ic_music_Album').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020045 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4600
     * @tc.name: testMdlSong020046
     * @tc.desc: Verify updating count does not touch the resource fields (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020046 begin');
      let song: SongType = new SongType($r('app.media.banner2'), $r('app.media.ic_music_children'), 92);
      song.count = 93;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(93));
      expect(v0).assertEqual(93);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_children').id));
      expect(v2).assertEqual($r('app.media.ic_music_children').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020046 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4700
     * @tc.name: testMdlSong020047
     * @tc.desc: Verify updating count does not touch the resource fields (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020047 begin');
      let song: SongType = new SongType($r('app.media.banner3'), $r('app.media.ic_music_hires'), 94);
      song.count = 95;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(95));
      expect(v0).assertEqual(95);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_hires').id));
      expect(v2).assertEqual($r('app.media.ic_music_hires').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020047 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4800
     * @tc.name: testMdlSong020048
     * @tc.desc: Verify updating count does not touch the resource fields (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020048 begin');
      let song: SongType = new SongType($r('app.media.ic_find'), $r('app.media.ic_music_localmusic'), 96);
      song.count = 97;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(97));
      expect(v0).assertEqual(97);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_localmusic').id));
      expect(v2).assertEqual($r('app.media.ic_music_localmusic').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020048 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_4900
     * @tc.name: testMdlSong020049
     * @tc.desc: Verify updating count does not touch the resource fields (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020049 begin');
      let song: SongType = new SongType($r('app.media.ic_find_h'), $r('app.media.ic_music_musicfm'), 98);
      song.count = 99;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(99));
      expect(v0).assertEqual(99);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_musicfm').id));
      expect(v2).assertEqual($r('app.media.ic_music_musicfm').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020049 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5000
     * @tc.name: testMdlSong020050
     * @tc.desc: Verify updating count does not touch the resource fields (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020050 begin');
      let song: SongType = new SongType($r('app.media.ic_home'), $r('app.media.ic_music_privatefm'), 100);
      song.count = 101;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(101));
      expect(v0).assertEqual(101);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_privatefm').id));
      expect(v2).assertEqual($r('app.media.ic_music_privatefm').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020050 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5100
     * @tc.name: testMdlSong020051
     * @tc.desc: Verify updating count does not touch the resource fields (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020051 begin');
      let song: SongType = new SongType($r('app.media.ic_listener'), $r('app.media.ic_music_ranking'), 102);
      song.count = 103;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(103));
      expect(v0).assertEqual(103);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_ranking').id));
      expect(v2).assertEqual($r('app.media.ic_music_ranking').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020051 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5200
     * @tc.name: testMdlSong020052
     * @tc.desc: Verify updating count does not touch the resource fields (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020052 begin');
      let song: SongType = new SongType($r('app.media.ic_mine'), $r('app.media.ic_music_singer'), 104);
      song.count = 105;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(105));
      expect(v0).assertEqual(105);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_singer').id));
      expect(v2).assertEqual($r('app.media.ic_music_singer').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020052 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5300
     * @tc.name: testMdlSong020053
     * @tc.desc: Verify updating count does not touch the resource fields (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020053 begin');
      let song: SongType = new SongType($r('app.media.ic_mine_h'), $r('app.media.ic_music_songsheet'), 106);
      song.count = 107;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(107));
      expect(v0).assertEqual(107);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_music_songsheet').id));
      expect(v2).assertEqual($r('app.media.ic_music_songsheet').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020053 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5400
     * @tc.name: testMdlSong020054
     * @tc.desc: Verify updating count does not touch the resource fields (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020054 begin');
      let song: SongType = new SongType($r('app.media.ic_more'), $r('app.media.ic_play'), 108);
      song.count = 109;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(109));
      expect(v0).assertEqual(109);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_play').id));
      expect(v2).assertEqual($r('app.media.ic_play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020054 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5500
     * @tc.name: testMdlSong020055
     * @tc.desc: Verify updating count does not touch the resource fields (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020055 begin');
      let song: SongType = new SongType($r('app.media.ic_music_Album'), $r('app.media.ic_playList'), 110);
      song.count = 111;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(111));
      expect(v0).assertEqual(111);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_playList').id));
      expect(v2).assertEqual($r('app.media.ic_playList').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020055 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5600
     * @tc.name: testMdlSong020056
     * @tc.desc: Verify updating count does not touch the resource fields (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020056 begin');
      let song: SongType = new SongType($r('app.media.ic_music_children'), $r('app.media.ic_public_arrow_right'), 112);
      song.count = 113;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(113));
      expect(v0).assertEqual(113);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_public_arrow_right').id));
      expect(v2).assertEqual($r('app.media.ic_public_arrow_right').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020056 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5700
     * @tc.name: testMdlSong020057
     * @tc.desc: Verify updating count does not touch the resource fields (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020057 begin');
      let song: SongType = new SongType($r('app.media.ic_music_hires'), $r('app.media.ic_public_home'), 114);
      song.count = 115;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(115));
      expect(v0).assertEqual(115);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_public_home').id));
      expect(v2).assertEqual($r('app.media.ic_public_home').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020057 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5800
     * @tc.name: testMdlSong020058
     * @tc.desc: Verify updating count does not touch the resource fields (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020058 begin');
      let song: SongType = new SongType($r('app.media.ic_music_localmusic'), $r('app.media.ic_public_home_filled'), 116);
      song.count = 117;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(117));
      expect(v0).assertEqual(117);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_public_home_filled').id));
      expect(v2).assertEqual($r('app.media.ic_public_home_filled').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020058 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_5900
     * @tc.name: testMdlSong020059
     * @tc.desc: Verify updating count does not touch the resource fields (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020059 begin');
      let song: SongType = new SongType($r('app.media.ic_music_musicfm'), $r('app.media.ic_radio'), 118);
      song.count = 119;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(119));
      expect(v0).assertEqual(119);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_radio').id));
      expect(v2).assertEqual($r('app.media.ic_radio').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020059 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6000
     * @tc.name: testMdlSong020060
     * @tc.desc: Verify updating count does not touch the resource fields (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020060 begin');
      let song: SongType = new SongType($r('app.media.ic_music_privatefm'), $r('app.media.ic_radio_h'), 120);
      song.count = 121;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(121));
      expect(v0).assertEqual(121);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_radio_h').id));
      expect(v2).assertEqual($r('app.media.ic_radio_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020060 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6100
     * @tc.name: testMdlSong020061
     * @tc.desc: Verify updating count does not touch the resource fields (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020061 begin');
      let song: SongType = new SongType($r('app.media.ic_music_ranking'), $r('app.media.ic_search'), 122);
      song.count = 123;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(123));
      expect(v0).assertEqual(123);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.ic_search').id));
      expect(v2).assertEqual($r('app.media.ic_search').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020061 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6200
     * @tc.name: testMdlSong020062
     * @tc.desc: Verify updating count does not touch the resource fields (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020062 begin');
      let song: SongType = new SongType($r('app.media.ic_music_singer'), $r('app.media.icon'), 124);
      song.count = 125;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(125));
      expect(v0).assertEqual(125);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.icon').id));
      expect(v2).assertEqual($r('app.media.icon').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020062 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6300
     * @tc.name: testMdlSong020063
     * @tc.desc: Verify updating count does not touch the resource fields (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020063 begin');
      let song: SongType = new SongType($r('app.media.ic_music_songsheet'), $r('app.media.icon_play'), 126);
      song.count = 127;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(127));
      expect(v0).assertEqual(127);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_songsheet').id));
      expect(v1).assertEqual($r('app.media.ic_music_songsheet').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.icon_play').id));
      expect(v2).assertEqual($r('app.media.icon_play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020063 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6400
     * @tc.name: testMdlSong020064
     * @tc.desc: Verify updating count does not touch the resource fields (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020064 begin');
      let song: SongType = new SongType($r('app.media.ic_play'), $r('app.media.play'), 128);
      song.count = 129;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(129));
      expect(v0).assertEqual(129);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_play').id));
      expect(v1).assertEqual($r('app.media.ic_play').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.play').id));
      expect(v2).assertEqual($r('app.media.play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020064 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6500
     * @tc.name: testMdlSong020065
     * @tc.desc: Verify updating count does not touch the resource fields (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020065 begin');
      let song: SongType = new SongType($r('app.media.ic_playList'), $r('app.media.list1'), 130);
      song.count = 131;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(131));
      expect(v0).assertEqual(131);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_playList').id));
      expect(v1).assertEqual($r('app.media.ic_playList').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list1').id));
      expect(v2).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020065 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6600
     * @tc.name: testMdlSong020066
     * @tc.desc: Verify updating count does not touch the resource fields (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020066 begin');
      let song: SongType = new SongType($r('app.media.ic_public_arrow_right'), $r('app.media.list2'), 132);
      song.count = 133;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(133));
      expect(v0).assertEqual(133);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_arrow_right').id));
      expect(v1).assertEqual($r('app.media.ic_public_arrow_right').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list2').id));
      expect(v2).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020066 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6700
     * @tc.name: testMdlSong020067
     * @tc.desc: Verify updating count does not touch the resource fields (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020067 begin');
      let song: SongType = new SongType($r('app.media.ic_public_home'), $r('app.media.list3'), 134);
      song.count = 135;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(135));
      expect(v0).assertEqual(135);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home').id));
      expect(v1).assertEqual($r('app.media.ic_public_home').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list3').id));
      expect(v2).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020067 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6800
     * @tc.name: testMdlSong020068
     * @tc.desc: Verify updating count does not touch the resource fields (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020068 begin');
      let song: SongType = new SongType($r('app.media.ic_public_home_filled'), $r('app.media.list4'), 136);
      song.count = 137;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(137));
      expect(v0).assertEqual(137);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home_filled').id));
      expect(v1).assertEqual($r('app.media.ic_public_home_filled').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list4').id));
      expect(v2).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020068 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_6900
     * @tc.name: testMdlSong020069
     * @tc.desc: Verify updating count does not touch the resource fields (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020069 begin');
      let song: SongType = new SongType($r('app.media.ic_radio'), $r('app.media.list5'), 138);
      song.count = 139;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(139));
      expect(v0).assertEqual(139);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio').id));
      expect(v1).assertEqual($r('app.media.ic_radio').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list5').id));
      expect(v2).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020069 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_7000
     * @tc.name: testMdlSong020070
     * @tc.desc: Verify updating count does not touch the resource fields (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020070 begin');
      let song: SongType = new SongType($r('app.media.ic_radio_h'), $r('app.media.list6'), 140);
      song.count = 141;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(141));
      expect(v0).assertEqual(141);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio_h').id));
      expect(v1).assertEqual($r('app.media.ic_radio_h').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list6').id));
      expect(v2).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020070 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_7100
     * @tc.name: testMdlSong020071
     * @tc.desc: Verify updating count does not touch the resource fields (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020071 begin');
      let song: SongType = new SongType($r('app.media.ic_search'), $r('app.media.list7'), 142);
      song.count = 143;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(143));
      expect(v0).assertEqual(143);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_search').id));
      expect(v1).assertEqual($r('app.media.ic_search').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list7').id));
      expect(v2).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020071 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_7200
     * @tc.name: testMdlSong020072
     * @tc.desc: Verify updating count does not touch the resource fields (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020072 begin');
      let song: SongType = new SongType($r('app.media.icon'), $r('app.media.list8'), 144);
      song.count = 145;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(145));
      expect(v0).assertEqual(145);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon').id));
      expect(v1).assertEqual($r('app.media.icon').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list8').id));
      expect(v2).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020072 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_7300
     * @tc.name: testMdlSong020073
     * @tc.desc: Verify updating count does not touch the resource fields (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong020073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020073 begin');
      let song: SongType = new SongType($r('app.media.icon_play'), $r('app.media.list9'), 146);
      song.count = 147;
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-after-set actual=%{public}s expected=%{public}s', String(v0), String(147));
      expect(v0).assertEqual(147);
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc-unaffected actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon_play').id));
      expect(v1).assertEqual($r('app.media.icon_play').id);
      const v2: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-unaffected actual=%{public}s expected=%{public}s', String(v2), String($r('app.media.list9').id));
      expect(v2).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020073 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_7400
     * @tc.name: testMdlSong020074
     * @tc.desc: Anchor: large song count must stay a plain number
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlSong020074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020074 begin');
      let song: SongType = new SongType($r('app.media.list1'), $r('app.string.rock'), 1000000);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-large actual=%{public}s expected=%{public}s', String(v0), String(1000000));
      expect(v0).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, 'count-above-threshold actual=%{public}s expected=true', String(song.count > 999999));
      expect(song.count > 999999).assertTrue();
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-kept actual=%{public}s expected=%{public}s', String(v1), String($r('app.string.rock').id));
      expect(v1).assertEqual($r('app.string.rock').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020074 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG02_7500
     * @tc.name: testMdlSong020075
     * @tc.desc: Anchor: song count zero is a valid boundary
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlSong020075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020075 begin');
      let song: SongType = new SongType($r('app.media.list13'), $r('app.string.emo'), 0);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-zero actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'count-is-zero actual=%{public}s expected=true', String(song.count === 0));
      expect(song.count === 0).assertTrue();
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'image-kept actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong020075 end');
    })

  })
}
