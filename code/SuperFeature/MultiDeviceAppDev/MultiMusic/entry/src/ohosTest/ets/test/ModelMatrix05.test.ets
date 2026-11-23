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

// @volume rule=SongType-keeps-count-and-resource-description basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function modelMatrix05Test() {
  describe('ModelMatrix05', () => {

    /**
     * @tc.number: SUB_MM_MDLSONG01_0100
     * @tc.name: testMdlSong010001
     * @tc.desc: Verify SongType keeps count 0 together with its resources (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010001 begin');
      let song: SongType = new SongType($r('app.media.list2'), $r('app.media.list6'), 0);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010001 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_0200
     * @tc.name: testMdlSong010002
     * @tc.desc: Verify SongType keeps count 1 together with its resources (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010002 begin');
      let song: SongType = new SongType($r('app.media.list3'), $r('app.media.list7'), 1);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010002 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_0300
     * @tc.name: testMdlSong010003
     * @tc.desc: Verify SongType keeps count 2 together with its resources (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010003 begin');
      let song: SongType = new SongType($r('app.media.list4'), $r('app.media.list8'), 2);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010003 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_0400
     * @tc.name: testMdlSong010004
     * @tc.desc: Verify SongType keeps count 3 together with its resources (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010004 begin');
      let song: SongType = new SongType($r('app.media.list5'), $r('app.media.list9'), 3);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010004 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_0500
     * @tc.name: testMdlSong010005
     * @tc.desc: Verify SongType keeps count 4 together with its resources (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010005 begin');
      let song: SongType = new SongType($r('app.media.list6'), $r('app.media.list10'), 4);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010005 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_0600
     * @tc.name: testMdlSong010006
     * @tc.desc: Verify SongType keeps count 5 together with its resources (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010006 begin');
      let song: SongType = new SongType($r('app.media.list7'), $r('app.media.list11'), 5);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010006 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_0700
     * @tc.name: testMdlSong010007
     * @tc.desc: Verify SongType keeps count 6 together with its resources (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010007 begin');
      let song: SongType = new SongType($r('app.media.list8'), $r('app.media.list12'), 6);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010007 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_0800
     * @tc.name: testMdlSong010008
     * @tc.desc: Verify SongType keeps count 7 together with its resources (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010008 begin');
      let song: SongType = new SongType($r('app.media.list9'), $r('app.media.list13'), 7);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(7));
      expect(v0).assertEqual(7);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010008 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_0900
     * @tc.name: testMdlSong010009
     * @tc.desc: Verify SongType keeps count 8 together with its resources (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010009 begin');
      let song: SongType = new SongType($r('app.media.list10'), $r('app.media.banner1'), 8);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010009 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1000
     * @tc.name: testMdlSong010010
     * @tc.desc: Verify SongType keeps count 9 together with its resources (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010010 begin');
      let song: SongType = new SongType($r('app.media.list11'), $r('app.media.banner2'), 9);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(9));
      expect(v0).assertEqual(9);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010010 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1100
     * @tc.name: testMdlSong010011
     * @tc.desc: Verify SongType keeps count 10 together with its resources (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010011 begin');
      let song: SongType = new SongType($r('app.media.list12'), $r('app.media.banner3'), 10);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(10));
      expect(v0).assertEqual(10);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010011 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1200
     * @tc.name: testMdlSong010012
     * @tc.desc: Verify SongType keeps count 11 together with its resources (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010012 begin');
      let song: SongType = new SongType($r('app.media.list13'), $r('app.media.ic_find'), 11);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(11));
      expect(v0).assertEqual(11);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010012 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1300
     * @tc.name: testMdlSong010013
     * @tc.desc: Verify SongType keeps count 12 together with its resources (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010013 begin');
      let song: SongType = new SongType($r('app.media.banner1'), $r('app.media.ic_find_h'), 12);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010013 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1400
     * @tc.name: testMdlSong010014
     * @tc.desc: Verify SongType keeps count 13 together with its resources (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010014 begin');
      let song: SongType = new SongType($r('app.media.banner2'), $r('app.media.ic_home'), 13);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(13));
      expect(v0).assertEqual(13);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010014 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1500
     * @tc.name: testMdlSong010015
     * @tc.desc: Verify SongType keeps count 14 together with its resources (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010015 begin');
      let song: SongType = new SongType($r('app.media.banner3'), $r('app.media.ic_listener'), 14);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(14));
      expect(v0).assertEqual(14);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010015 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1600
     * @tc.name: testMdlSong010016
     * @tc.desc: Verify SongType keeps count 15 together with its resources (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010016 begin');
      let song: SongType = new SongType($r('app.media.ic_find'), $r('app.media.ic_mine'), 15);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(15));
      expect(v0).assertEqual(15);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010016 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1700
     * @tc.name: testMdlSong010017
     * @tc.desc: Verify SongType keeps count 16 together with its resources (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010017 begin');
      let song: SongType = new SongType($r('app.media.ic_find_h'), $r('app.media.ic_mine_h'), 16);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010017 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1800
     * @tc.name: testMdlSong010018
     * @tc.desc: Verify SongType keeps count 17 together with its resources (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010018 begin');
      let song: SongType = new SongType($r('app.media.ic_home'), $r('app.media.ic_more'), 17);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(17));
      expect(v0).assertEqual(17);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010018 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_1900
     * @tc.name: testMdlSong010019
     * @tc.desc: Verify SongType keeps count 18 together with its resources (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010019 begin');
      let song: SongType = new SongType($r('app.media.ic_listener'), $r('app.media.ic_music_Album'), 18);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(18));
      expect(v0).assertEqual(18);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010019 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2000
     * @tc.name: testMdlSong010020
     * @tc.desc: Verify SongType keeps count 19 together with its resources (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010020 begin');
      let song: SongType = new SongType($r('app.media.ic_mine'), $r('app.media.ic_music_children'), 19);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(19));
      expect(v0).assertEqual(19);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010020 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2100
     * @tc.name: testMdlSong010021
     * @tc.desc: Verify SongType keeps count 20 together with its resources (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010021 begin');
      let song: SongType = new SongType($r('app.media.ic_mine_h'), $r('app.media.ic_music_hires'), 20);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(20));
      expect(v0).assertEqual(20);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010021 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2200
     * @tc.name: testMdlSong010022
     * @tc.desc: Verify SongType keeps count 21 together with its resources (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010022 begin');
      let song: SongType = new SongType($r('app.media.ic_more'), $r('app.media.ic_music_localmusic'), 21);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(21));
      expect(v0).assertEqual(21);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010022 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2300
     * @tc.name: testMdlSong010023
     * @tc.desc: Verify SongType keeps count 22 together with its resources (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010023 begin');
      let song: SongType = new SongType($r('app.media.ic_music_Album'), $r('app.media.ic_music_musicfm'), 22);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(22));
      expect(v0).assertEqual(22);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010023 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2400
     * @tc.name: testMdlSong010024
     * @tc.desc: Verify SongType keeps count 23 together with its resources (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010024 begin');
      let song: SongType = new SongType($r('app.media.ic_music_children'), $r('app.media.ic_music_privatefm'), 23);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(23));
      expect(v0).assertEqual(23);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010024 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2500
     * @tc.name: testMdlSong010025
     * @tc.desc: Verify SongType keeps count 24 together with its resources (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010025 begin');
      let song: SongType = new SongType($r('app.media.ic_music_hires'), $r('app.media.ic_music_ranking'), 24);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(24));
      expect(v0).assertEqual(24);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010025 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2600
     * @tc.name: testMdlSong010026
     * @tc.desc: Verify SongType keeps count 25 together with its resources (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010026 begin');
      let song: SongType = new SongType($r('app.media.ic_music_localmusic'), $r('app.media.ic_music_singer'), 25);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(25));
      expect(v0).assertEqual(25);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010026 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2700
     * @tc.name: testMdlSong010027
     * @tc.desc: Verify SongType keeps count 26 together with its resources (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010027 begin');
      let song: SongType = new SongType($r('app.media.ic_music_musicfm'), $r('app.media.ic_music_songsheet'), 26);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(26));
      expect(v0).assertEqual(26);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_songsheet').id));
      expect(v1).assertEqual($r('app.media.ic_music_songsheet').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010027 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2800
     * @tc.name: testMdlSong010028
     * @tc.desc: Verify SongType keeps count 27 together with its resources (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010028 begin');
      let song: SongType = new SongType($r('app.media.ic_music_privatefm'), $r('app.media.ic_play'), 27);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(27));
      expect(v0).assertEqual(27);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_play').id));
      expect(v1).assertEqual($r('app.media.ic_play').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010028 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_2900
     * @tc.name: testMdlSong010029
     * @tc.desc: Verify SongType keeps count 28 together with its resources (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010029 begin');
      let song: SongType = new SongType($r('app.media.ic_music_ranking'), $r('app.media.ic_playList'), 28);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(28));
      expect(v0).assertEqual(28);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_playList').id));
      expect(v1).assertEqual($r('app.media.ic_playList').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010029 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3000
     * @tc.name: testMdlSong010030
     * @tc.desc: Verify SongType keeps count 29 together with its resources (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010030 begin');
      let song: SongType = new SongType($r('app.media.ic_music_singer'), $r('app.media.ic_public_arrow_right'), 29);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(29));
      expect(v0).assertEqual(29);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_arrow_right').id));
      expect(v1).assertEqual($r('app.media.ic_public_arrow_right').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010030 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3100
     * @tc.name: testMdlSong010031
     * @tc.desc: Verify SongType keeps count 30 together with its resources (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010031 begin');
      let song: SongType = new SongType($r('app.media.ic_music_songsheet'), $r('app.media.ic_public_home'), 30);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(30));
      expect(v0).assertEqual(30);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home').id));
      expect(v1).assertEqual($r('app.media.ic_public_home').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010031 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3200
     * @tc.name: testMdlSong010032
     * @tc.desc: Verify SongType keeps count 31 together with its resources (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010032 begin');
      let song: SongType = new SongType($r('app.media.ic_play'), $r('app.media.ic_public_home_filled'), 31);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(31));
      expect(v0).assertEqual(31);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home_filled').id));
      expect(v1).assertEqual($r('app.media.ic_public_home_filled').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010032 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3300
     * @tc.name: testMdlSong010033
     * @tc.desc: Verify SongType keeps count 32 together with its resources (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010033 begin');
      let song: SongType = new SongType($r('app.media.ic_playList'), $r('app.media.ic_radio'), 32);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(32));
      expect(v0).assertEqual(32);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio').id));
      expect(v1).assertEqual($r('app.media.ic_radio').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010033 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3400
     * @tc.name: testMdlSong010034
     * @tc.desc: Verify SongType keeps count 33 together with its resources (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010034 begin');
      let song: SongType = new SongType($r('app.media.ic_public_arrow_right'), $r('app.media.ic_radio_h'), 33);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(33));
      expect(v0).assertEqual(33);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio_h').id));
      expect(v1).assertEqual($r('app.media.ic_radio_h').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010034 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3500
     * @tc.name: testMdlSong010035
     * @tc.desc: Verify SongType keeps count 34 together with its resources (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010035 begin');
      let song: SongType = new SongType($r('app.media.ic_public_home'), $r('app.media.ic_search'), 34);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(34));
      expect(v0).assertEqual(34);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_search').id));
      expect(v1).assertEqual($r('app.media.ic_search').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010035 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3600
     * @tc.name: testMdlSong010036
     * @tc.desc: Verify SongType keeps count 35 together with its resources (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010036 begin');
      let song: SongType = new SongType($r('app.media.ic_public_home_filled'), $r('app.media.icon'), 35);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(35));
      expect(v0).assertEqual(35);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon').id));
      expect(v1).assertEqual($r('app.media.icon').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010036 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3700
     * @tc.name: testMdlSong010037
     * @tc.desc: Verify SongType keeps count 36 together with its resources (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010037 begin');
      let song: SongType = new SongType($r('app.media.ic_radio'), $r('app.media.icon_play'), 36);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(36));
      expect(v0).assertEqual(36);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon_play').id));
      expect(v1).assertEqual($r('app.media.icon_play').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010037 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3800
     * @tc.name: testMdlSong010038
     * @tc.desc: Verify SongType keeps count 37 together with its resources (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010038 begin');
      let song: SongType = new SongType($r('app.media.ic_radio_h'), $r('app.media.play'), 37);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(37));
      expect(v0).assertEqual(37);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.play').id));
      expect(v1).assertEqual($r('app.media.play').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010038 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_3900
     * @tc.name: testMdlSong010039
     * @tc.desc: Verify SongType keeps count 38 together with its resources (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010039 begin');
      let song: SongType = new SongType($r('app.media.ic_search'), $r('app.media.list1'), 38);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(38));
      expect(v0).assertEqual(38);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010039 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4000
     * @tc.name: testMdlSong010040
     * @tc.desc: Verify SongType keeps count 39 together with its resources (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010040 begin');
      let song: SongType = new SongType($r('app.media.icon'), $r('app.media.list2'), 39);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(39));
      expect(v0).assertEqual(39);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list2').id));
      expect(v1).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010040 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4100
     * @tc.name: testMdlSong010041
     * @tc.desc: Verify SongType keeps count 40 together with its resources (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010041 begin');
      let song: SongType = new SongType($r('app.media.icon_play'), $r('app.media.list3'), 40);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(40));
      expect(v0).assertEqual(40);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010041 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4200
     * @tc.name: testMdlSong010042
     * @tc.desc: Verify SongType keeps count 41 together with its resources (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010042 begin');
      let song: SongType = new SongType($r('app.media.play'), $r('app.media.list4'), 41);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(41));
      expect(v0).assertEqual(41);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list4').id));
      expect(v1).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010042 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4300
     * @tc.name: testMdlSong010043
     * @tc.desc: Verify SongType keeps count 42 together with its resources (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010043 begin');
      let song: SongType = new SongType($r('app.media.list1'), $r('app.media.list5'), 42);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(42));
      expect(v0).assertEqual(42);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010043 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4400
     * @tc.name: testMdlSong010044
     * @tc.desc: Verify SongType keeps count 43 together with its resources (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010044 begin');
      let song: SongType = new SongType($r('app.media.list2'), $r('app.media.list6'), 43);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(43));
      expect(v0).assertEqual(43);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010044 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4500
     * @tc.name: testMdlSong010045
     * @tc.desc: Verify SongType keeps count 44 together with its resources (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010045 begin');
      let song: SongType = new SongType($r('app.media.list3'), $r('app.media.list7'), 44);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(44));
      expect(v0).assertEqual(44);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010045 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4600
     * @tc.name: testMdlSong010046
     * @tc.desc: Verify SongType keeps count 45 together with its resources (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010046 begin');
      let song: SongType = new SongType($r('app.media.list4'), $r('app.media.list8'), 45);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(45));
      expect(v0).assertEqual(45);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010046 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4700
     * @tc.name: testMdlSong010047
     * @tc.desc: Verify SongType keeps count 46 together with its resources (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010047 begin');
      let song: SongType = new SongType($r('app.media.list5'), $r('app.media.list9'), 46);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(46));
      expect(v0).assertEqual(46);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010047 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4800
     * @tc.name: testMdlSong010048
     * @tc.desc: Verify SongType keeps count 47 together with its resources (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010048 begin');
      let song: SongType = new SongType($r('app.media.list6'), $r('app.media.list10'), 47);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(47));
      expect(v0).assertEqual(47);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010048 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_4900
     * @tc.name: testMdlSong010049
     * @tc.desc: Verify SongType keeps count 48 together with its resources (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010049 begin');
      let song: SongType = new SongType($r('app.media.list7'), $r('app.media.list11'), 48);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(48));
      expect(v0).assertEqual(48);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010049 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5000
     * @tc.name: testMdlSong010050
     * @tc.desc: Verify SongType keeps count 49 together with its resources (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010050 begin');
      let song: SongType = new SongType($r('app.media.list8'), $r('app.media.list12'), 49);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(49));
      expect(v0).assertEqual(49);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010050 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5100
     * @tc.name: testMdlSong010051
     * @tc.desc: Verify SongType keeps count 50 together with its resources (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010051 begin');
      let song: SongType = new SongType($r('app.media.list9'), $r('app.media.list13'), 50);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(50));
      expect(v0).assertEqual(50);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010051 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5200
     * @tc.name: testMdlSong010052
     * @tc.desc: Verify SongType keeps count 51 together with its resources (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010052 begin');
      let song: SongType = new SongType($r('app.media.list10'), $r('app.media.banner1'), 51);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(51));
      expect(v0).assertEqual(51);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010052 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5300
     * @tc.name: testMdlSong010053
     * @tc.desc: Verify SongType keeps count 52 together with its resources (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010053 begin');
      let song: SongType = new SongType($r('app.media.list11'), $r('app.media.banner2'), 52);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(52));
      expect(v0).assertEqual(52);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010053 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5400
     * @tc.name: testMdlSong010054
     * @tc.desc: Verify SongType keeps count 53 together with its resources (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010054 begin');
      let song: SongType = new SongType($r('app.media.list12'), $r('app.media.banner3'), 53);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(53));
      expect(v0).assertEqual(53);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010054 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5500
     * @tc.name: testMdlSong010055
     * @tc.desc: Verify SongType keeps count 54 together with its resources (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010055 begin');
      let song: SongType = new SongType($r('app.media.list13'), $r('app.media.ic_find'), 54);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(54));
      expect(v0).assertEqual(54);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010055 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5600
     * @tc.name: testMdlSong010056
     * @tc.desc: Verify SongType keeps count 55 together with its resources (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010056 begin');
      let song: SongType = new SongType($r('app.media.banner1'), $r('app.media.ic_find_h'), 55);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(55));
      expect(v0).assertEqual(55);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010056 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5700
     * @tc.name: testMdlSong010057
     * @tc.desc: Verify SongType keeps count 56 together with its resources (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010057 begin');
      let song: SongType = new SongType($r('app.media.banner2'), $r('app.media.ic_home'), 56);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(56));
      expect(v0).assertEqual(56);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010057 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5800
     * @tc.name: testMdlSong010058
     * @tc.desc: Verify SongType keeps count 57 together with its resources (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010058 begin');
      let song: SongType = new SongType($r('app.media.banner3'), $r('app.media.ic_listener'), 57);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(57));
      expect(v0).assertEqual(57);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010058 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_5900
     * @tc.name: testMdlSong010059
     * @tc.desc: Verify SongType keeps count 58 together with its resources (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010059 begin');
      let song: SongType = new SongType($r('app.media.ic_find'), $r('app.media.ic_mine'), 58);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(58));
      expect(v0).assertEqual(58);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010059 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6000
     * @tc.name: testMdlSong010060
     * @tc.desc: Verify SongType keeps count 59 together with its resources (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010060 begin');
      let song: SongType = new SongType($r('app.media.ic_find_h'), $r('app.media.ic_mine_h'), 59);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(59));
      expect(v0).assertEqual(59);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010060 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6100
     * @tc.name: testMdlSong010061
     * @tc.desc: Verify SongType keeps count 60 together with its resources (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010061 begin');
      let song: SongType = new SongType($r('app.media.ic_home'), $r('app.media.ic_more'), 60);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(60));
      expect(v0).assertEqual(60);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010061 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6200
     * @tc.name: testMdlSong010062
     * @tc.desc: Verify SongType keeps count 61 together with its resources (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010062 begin');
      let song: SongType = new SongType($r('app.media.ic_listener'), $r('app.media.ic_music_Album'), 61);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(61));
      expect(v0).assertEqual(61);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010062 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6300
     * @tc.name: testMdlSong010063
     * @tc.desc: Verify SongType keeps count 62 together with its resources (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010063 begin');
      let song: SongType = new SongType($r('app.media.ic_mine'), $r('app.media.ic_music_children'), 62);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(62));
      expect(v0).assertEqual(62);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010063 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6400
     * @tc.name: testMdlSong010064
     * @tc.desc: Verify SongType keeps count 63 together with its resources (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010064 begin');
      let song: SongType = new SongType($r('app.media.ic_mine_h'), $r('app.media.ic_music_hires'), 63);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(63));
      expect(v0).assertEqual(63);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010064 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6500
     * @tc.name: testMdlSong010065
     * @tc.desc: Verify SongType keeps count 64 together with its resources (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010065 begin');
      let song: SongType = new SongType($r('app.media.ic_more'), $r('app.media.ic_music_localmusic'), 64);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(64));
      expect(v0).assertEqual(64);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010065 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6600
     * @tc.name: testMdlSong010066
     * @tc.desc: Verify SongType keeps count 65 together with its resources (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010066 begin');
      let song: SongType = new SongType($r('app.media.ic_music_Album'), $r('app.media.ic_music_musicfm'), 65);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(65));
      expect(v0).assertEqual(65);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010066 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6700
     * @tc.name: testMdlSong010067
     * @tc.desc: Verify SongType keeps count 66 together with its resources (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010067 begin');
      let song: SongType = new SongType($r('app.media.ic_music_children'), $r('app.media.ic_music_privatefm'), 66);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(66));
      expect(v0).assertEqual(66);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010067 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6800
     * @tc.name: testMdlSong010068
     * @tc.desc: Verify SongType keeps count 67 together with its resources (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010068 begin');
      let song: SongType = new SongType($r('app.media.ic_music_hires'), $r('app.media.ic_music_ranking'), 67);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(67));
      expect(v0).assertEqual(67);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010068 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_6900
     * @tc.name: testMdlSong010069
     * @tc.desc: Verify SongType keeps count 68 together with its resources (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010069 begin');
      let song: SongType = new SongType($r('app.media.ic_music_localmusic'), $r('app.media.ic_music_singer'), 68);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(68));
      expect(v0).assertEqual(68);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010069 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_7000
     * @tc.name: testMdlSong010070
     * @tc.desc: Verify SongType keeps count 69 together with its resources (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010070 begin');
      let song: SongType = new SongType($r('app.media.ic_music_musicfm'), $r('app.media.ic_music_songsheet'), 69);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(69));
      expect(v0).assertEqual(69);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_songsheet').id));
      expect(v1).assertEqual($r('app.media.ic_music_songsheet').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010070 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_7100
     * @tc.name: testMdlSong010071
     * @tc.desc: Verify SongType keeps count 70 together with its resources (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010071 begin');
      let song: SongType = new SongType($r('app.media.ic_music_privatefm'), $r('app.media.ic_play'), 70);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(70));
      expect(v0).assertEqual(70);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_play').id));
      expect(v1).assertEqual($r('app.media.ic_play').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010071 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_7200
     * @tc.name: testMdlSong010072
     * @tc.desc: Verify SongType keeps count 71 together with its resources (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010072 begin');
      let song: SongType = new SongType($r('app.media.ic_music_ranking'), $r('app.media.ic_playList'), 71);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(71));
      expect(v0).assertEqual(71);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_playList').id));
      expect(v1).assertEqual($r('app.media.ic_playList').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010072 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_7300
     * @tc.name: testMdlSong010073
     * @tc.desc: Verify SongType keeps count 72 together with its resources (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlSong010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010073 begin');
      let song: SongType = new SongType($r('app.media.ic_music_singer'), $r('app.media.ic_public_arrow_right'), 72);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count actual=%{public}s expected=%{public}s', String(v0), String(72));
      expect(v0).assertEqual(72);
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_arrow_right').id));
      expect(v1).assertEqual($r('app.media.ic_public_arrow_right').id);
      hilog.info(DOMAIN, TAG, 'count-not-negative actual=%{public}s expected=true', String(song.count >= 0));
      expect(song.count >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010073 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_7400
     * @tc.name: testMdlSong010074
     * @tc.desc: Anchor: song count zero is a valid boundary
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlSong010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010074 begin');
      let song: SongType = new SongType($r('app.media.list13'), $r('app.string.emo'), 0);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-zero actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'count-is-zero actual=%{public}s expected=true', String(song.count === 0));
      expect(song.count === 0).assertTrue();
      const v1: number = song.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'image-kept actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010074 end');
    })

    /**
     * @tc.number: SUB_MM_MDLSONG01_7500
     * @tc.name: testMdlSong010075
     * @tc.desc: Anchor: large song count must stay a plain number
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlSong010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010075 begin');
      let song: SongType = new SongType($r('app.media.list1'), $r('app.string.rock'), 1000000);
      const v0: number = song.count;
      hilog.info(DOMAIN, TAG, 'count-large actual=%{public}s expected=%{public}s', String(v0), String(1000000));
      expect(v0).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, 'count-above-threshold actual=%{public}s expected=true', String(song.count > 999999));
      expect(song.count > 999999).assertTrue();
      const v1: number = song.description.id;
      hilog.info(DOMAIN, TAG, 'description-kept actual=%{public}s expected=%{public}s', String(v1), String($r('app.string.rock').id));
      expect(v1).assertEqual($r('app.string.rock').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlSong010075 end');
    })

  })
}
