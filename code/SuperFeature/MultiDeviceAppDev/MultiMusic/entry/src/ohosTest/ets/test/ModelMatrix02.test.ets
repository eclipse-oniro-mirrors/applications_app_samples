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

// @volume rule=IconItem-keeps-Resource-description-in-union-field basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function modelMatrix02Test() {
  describe('ModelMatrix02', () => {

    /**
     * @tc.number: SUB_MM_MDLICON02_0100
     * @tc.name: testMdlIcon020001
     * @tc.desc: Verify IconItem keeps Resource description for media list2/list11 (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020001 begin');
      let item: IconItem = new IconItem($r('app.media.list2'), $r('app.media.list11'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list11').id));
      expect(v0).assertEqual($r('app.media.list11').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list2').id));
      expect(v1).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020001 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_0200
     * @tc.name: testMdlIcon020002
     * @tc.desc: Verify IconItem keeps Resource description for media list3/list12 (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020002 begin');
      let item: IconItem = new IconItem($r('app.media.list3'), $r('app.media.list12'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020002 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_0300
     * @tc.name: testMdlIcon020003
     * @tc.desc: Verify IconItem keeps Resource description for media list4/list13 (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020003 begin');
      let item: IconItem = new IconItem($r('app.media.list4'), $r('app.media.list13'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list13').id));
      expect(v0).assertEqual($r('app.media.list13').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list4').id));
      expect(v1).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020003 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_0400
     * @tc.name: testMdlIcon020004
     * @tc.desc: Verify IconItem keeps Resource description for media list5/banner1 (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020004 begin');
      let item: IconItem = new IconItem($r('app.media.list5'), $r('app.media.banner1'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner1').id));
      expect(v0).assertEqual($r('app.media.banner1').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020004 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_0500
     * @tc.name: testMdlIcon020005
     * @tc.desc: Verify IconItem keeps Resource description for media list6/banner2 (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020005 begin');
      let item: IconItem = new IconItem($r('app.media.list6'), $r('app.media.banner2'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner2').id));
      expect(v0).assertEqual($r('app.media.banner2').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020005 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_0600
     * @tc.name: testMdlIcon020006
     * @tc.desc: Verify IconItem keeps Resource description for media list7/banner3 (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020006 begin');
      let item: IconItem = new IconItem($r('app.media.list7'), $r('app.media.banner3'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner3').id));
      expect(v0).assertEqual($r('app.media.banner3').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020006 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_0700
     * @tc.name: testMdlIcon020007
     * @tc.desc: Verify IconItem keeps Resource description for media list8/ic_find (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020007 begin');
      let item: IconItem = new IconItem($r('app.media.list8'), $r('app.media.ic_find'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_find').id));
      expect(v0).assertEqual($r('app.media.ic_find').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020007 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_0800
     * @tc.name: testMdlIcon020008
     * @tc.desc: Verify IconItem keeps Resource description for media list9/ic_find_h (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020008 begin');
      let item: IconItem = new IconItem($r('app.media.list9'), $r('app.media.ic_find_h'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_find_h').id));
      expect(v0).assertEqual($r('app.media.ic_find_h').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020008 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_0900
     * @tc.name: testMdlIcon020009
     * @tc.desc: Verify IconItem keeps Resource description for media list10/ic_home (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020009 begin');
      let item: IconItem = new IconItem($r('app.media.list10'), $r('app.media.ic_home'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_home').id));
      expect(v0).assertEqual($r('app.media.ic_home').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020009 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1000
     * @tc.name: testMdlIcon020010
     * @tc.desc: Verify IconItem keeps Resource description for media list11/ic_listener (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020010 begin');
      let item: IconItem = new IconItem($r('app.media.list11'), $r('app.media.ic_listener'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_listener').id));
      expect(v0).assertEqual($r('app.media.ic_listener').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020010 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1100
     * @tc.name: testMdlIcon020011
     * @tc.desc: Verify IconItem keeps Resource description for media list12/ic_mine (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020011 begin');
      let item: IconItem = new IconItem($r('app.media.list12'), $r('app.media.ic_mine'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_mine').id));
      expect(v0).assertEqual($r('app.media.ic_mine').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020011 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1200
     * @tc.name: testMdlIcon020012
     * @tc.desc: Verify IconItem keeps Resource description for media list13/ic_mine_h (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020012 begin');
      let item: IconItem = new IconItem($r('app.media.list13'), $r('app.media.ic_mine_h'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_mine_h').id));
      expect(v0).assertEqual($r('app.media.ic_mine_h').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020012 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1300
     * @tc.name: testMdlIcon020013
     * @tc.desc: Verify IconItem keeps Resource description for media banner1/ic_more (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020013 begin');
      let item: IconItem = new IconItem($r('app.media.banner1'), $r('app.media.ic_more'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_more').id));
      expect(v0).assertEqual($r('app.media.ic_more').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020013 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1400
     * @tc.name: testMdlIcon020014
     * @tc.desc: Verify IconItem keeps Resource description for media banner2/ic_music_Album (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020014 begin');
      let item: IconItem = new IconItem($r('app.media.banner2'), $r('app.media.ic_music_Album'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_Album').id));
      expect(v0).assertEqual($r('app.media.ic_music_Album').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020014 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1500
     * @tc.name: testMdlIcon020015
     * @tc.desc: Verify IconItem keeps Resource description for media banner3/ic_music_children (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020015 begin');
      let item: IconItem = new IconItem($r('app.media.banner3'), $r('app.media.ic_music_children'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_children').id));
      expect(v0).assertEqual($r('app.media.ic_music_children').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020015 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1600
     * @tc.name: testMdlIcon020016
     * @tc.desc: Verify IconItem keeps Resource description for media ic_find/ic_music_hires (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020016 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find'), $r('app.media.ic_music_hires'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_hires').id));
      expect(v0).assertEqual($r('app.media.ic_music_hires').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020016 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1700
     * @tc.name: testMdlIcon020017
     * @tc.desc: Verify IconItem keeps Resource description for media ic_find_h/ic_music_localmusic (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020017 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find_h'), $r('app.media.ic_music_localmusic'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_localmusic').id));
      expect(v0).assertEqual($r('app.media.ic_music_localmusic').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020017 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1800
     * @tc.name: testMdlIcon020018
     * @tc.desc: Verify IconItem keeps Resource description for media ic_home/ic_music_musicfm (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020018 begin');
      let item: IconItem = new IconItem($r('app.media.ic_home'), $r('app.media.ic_music_musicfm'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_musicfm').id));
      expect(v0).assertEqual($r('app.media.ic_music_musicfm').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020018 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_1900
     * @tc.name: testMdlIcon020019
     * @tc.desc: Verify IconItem keeps Resource description for media ic_listener/ic_music_privatefm (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020019 begin');
      let item: IconItem = new IconItem($r('app.media.ic_listener'), $r('app.media.ic_music_privatefm'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_privatefm').id));
      expect(v0).assertEqual($r('app.media.ic_music_privatefm').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020019 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2000
     * @tc.name: testMdlIcon020020
     * @tc.desc: Verify IconItem keeps Resource description for media ic_mine/ic_music_ranking (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020020 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine'), $r('app.media.ic_music_ranking'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_ranking').id));
      expect(v0).assertEqual($r('app.media.ic_music_ranking').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020020 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2100
     * @tc.name: testMdlIcon020021
     * @tc.desc: Verify IconItem keeps Resource description for media ic_mine_h/ic_music_singer (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020021 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine_h'), $r('app.media.ic_music_singer'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_singer').id));
      expect(v0).assertEqual($r('app.media.ic_music_singer').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020021 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2200
     * @tc.name: testMdlIcon020022
     * @tc.desc: Verify IconItem keeps Resource description for media ic_more/ic_music_songsheet (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020022 begin');
      let item: IconItem = new IconItem($r('app.media.ic_more'), $r('app.media.ic_music_songsheet'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_songsheet').id));
      expect(v0).assertEqual($r('app.media.ic_music_songsheet').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020022 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2300
     * @tc.name: testMdlIcon020023
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_Album/ic_play (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020023 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_Album'), $r('app.media.ic_play'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_play').id));
      expect(v0).assertEqual($r('app.media.ic_play').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020023 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2400
     * @tc.name: testMdlIcon020024
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_children/ic_playList (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020024 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_children'), $r('app.media.ic_playList'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_playList').id));
      expect(v0).assertEqual($r('app.media.ic_playList').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020024 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2500
     * @tc.name: testMdlIcon020025
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_hires/ic_public_arrow_right (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020025 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_hires'), $r('app.media.ic_public_arrow_right'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_arrow_right').id));
      expect(v0).assertEqual($r('app.media.ic_public_arrow_right').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020025 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2600
     * @tc.name: testMdlIcon020026
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_localmusic/ic_public_home (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020026 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_localmusic'), $r('app.media.ic_public_home'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_home').id));
      expect(v0).assertEqual($r('app.media.ic_public_home').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020026 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2700
     * @tc.name: testMdlIcon020027
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_musicfm/ic_public_home_filled (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020027 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_musicfm'), $r('app.media.ic_public_home_filled'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_home_filled').id));
      expect(v0).assertEqual($r('app.media.ic_public_home_filled').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020027 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2800
     * @tc.name: testMdlIcon020028
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_privatefm/ic_radio (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020028 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_privatefm'), $r('app.media.ic_radio'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_radio').id));
      expect(v0).assertEqual($r('app.media.ic_radio').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020028 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_2900
     * @tc.name: testMdlIcon020029
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_ranking/ic_radio_h (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020029 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_ranking'), $r('app.media.ic_radio_h'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_radio_h').id));
      expect(v0).assertEqual($r('app.media.ic_radio_h').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020029 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3000
     * @tc.name: testMdlIcon020030
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_singer/ic_search (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020030 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_singer'), $r('app.media.ic_search'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_search').id));
      expect(v0).assertEqual($r('app.media.ic_search').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020030 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3100
     * @tc.name: testMdlIcon020031
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_songsheet/icon (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020031 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_songsheet'), $r('app.media.icon'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.icon').id));
      expect(v0).assertEqual($r('app.media.icon').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_songsheet').id));
      expect(v1).assertEqual($r('app.media.ic_music_songsheet').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020031 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3200
     * @tc.name: testMdlIcon020032
     * @tc.desc: Verify IconItem keeps Resource description for media ic_play/icon_play (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020032 begin');
      let item: IconItem = new IconItem($r('app.media.ic_play'), $r('app.media.icon_play'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.icon_play').id));
      expect(v0).assertEqual($r('app.media.icon_play').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_play').id));
      expect(v1).assertEqual($r('app.media.ic_play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020032 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3300
     * @tc.name: testMdlIcon020033
     * @tc.desc: Verify IconItem keeps Resource description for media ic_playList/play (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020033 begin');
      let item: IconItem = new IconItem($r('app.media.ic_playList'), $r('app.media.play'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.play').id));
      expect(v0).assertEqual($r('app.media.play').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_playList').id));
      expect(v1).assertEqual($r('app.media.ic_playList').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020033 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3400
     * @tc.name: testMdlIcon020034
     * @tc.desc: Verify IconItem keeps Resource description for media ic_public_arrow_right/list1 (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020034 begin');
      let item: IconItem = new IconItem($r('app.media.ic_public_arrow_right'), $r('app.media.list1'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list1').id));
      expect(v0).assertEqual($r('app.media.list1').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_arrow_right').id));
      expect(v1).assertEqual($r('app.media.ic_public_arrow_right').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020034 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3500
     * @tc.name: testMdlIcon020035
     * @tc.desc: Verify IconItem keeps Resource description for media ic_public_home/list2 (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020035 begin');
      let item: IconItem = new IconItem($r('app.media.ic_public_home'), $r('app.media.list2'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list2').id));
      expect(v0).assertEqual($r('app.media.list2').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home').id));
      expect(v1).assertEqual($r('app.media.ic_public_home').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020035 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3600
     * @tc.name: testMdlIcon020036
     * @tc.desc: Verify IconItem keeps Resource description for media ic_public_home_filled/list3 (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020036 begin');
      let item: IconItem = new IconItem($r('app.media.ic_public_home_filled'), $r('app.media.list3'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list3').id));
      expect(v0).assertEqual($r('app.media.list3').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home_filled').id));
      expect(v1).assertEqual($r('app.media.ic_public_home_filled').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020036 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3700
     * @tc.name: testMdlIcon020037
     * @tc.desc: Verify IconItem keeps Resource description for media ic_radio/list4 (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020037 begin');
      let item: IconItem = new IconItem($r('app.media.ic_radio'), $r('app.media.list4'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list4').id));
      expect(v0).assertEqual($r('app.media.list4').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio').id));
      expect(v1).assertEqual($r('app.media.ic_radio').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020037 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3800
     * @tc.name: testMdlIcon020038
     * @tc.desc: Verify IconItem keeps Resource description for media ic_radio_h/list5 (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020038 begin');
      let item: IconItem = new IconItem($r('app.media.ic_radio_h'), $r('app.media.list5'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list5').id));
      expect(v0).assertEqual($r('app.media.list5').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio_h').id));
      expect(v1).assertEqual($r('app.media.ic_radio_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020038 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_3900
     * @tc.name: testMdlIcon020039
     * @tc.desc: Verify IconItem keeps Resource description for media ic_search/list6 (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020039 begin');
      let item: IconItem = new IconItem($r('app.media.ic_search'), $r('app.media.list6'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list6').id));
      expect(v0).assertEqual($r('app.media.list6').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_search').id));
      expect(v1).assertEqual($r('app.media.ic_search').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020039 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4000
     * @tc.name: testMdlIcon020040
     * @tc.desc: Verify IconItem keeps Resource description for media icon/list7 (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020040 begin');
      let item: IconItem = new IconItem($r('app.media.icon'), $r('app.media.list7'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list7').id));
      expect(v0).assertEqual($r('app.media.list7').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon').id));
      expect(v1).assertEqual($r('app.media.icon').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020040 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4100
     * @tc.name: testMdlIcon020041
     * @tc.desc: Verify IconItem keeps Resource description for media icon_play/list8 (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020041 begin');
      let item: IconItem = new IconItem($r('app.media.icon_play'), $r('app.media.list8'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list8').id));
      expect(v0).assertEqual($r('app.media.list8').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon_play').id));
      expect(v1).assertEqual($r('app.media.icon_play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020041 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4200
     * @tc.name: testMdlIcon020042
     * @tc.desc: Verify IconItem keeps Resource description for media play/list9 (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020042 begin');
      let item: IconItem = new IconItem($r('app.media.play'), $r('app.media.list9'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list9').id));
      expect(v0).assertEqual($r('app.media.list9').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.play').id));
      expect(v1).assertEqual($r('app.media.play').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020042 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4300
     * @tc.name: testMdlIcon020043
     * @tc.desc: Verify IconItem keeps Resource description for media list1/list10 (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020043 begin');
      let item: IconItem = new IconItem($r('app.media.list1'), $r('app.media.list10'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list10').id));
      expect(v0).assertEqual($r('app.media.list10').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020043 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4400
     * @tc.name: testMdlIcon020044
     * @tc.desc: Verify IconItem keeps Resource description for media list2/list11 (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020044 begin');
      let item: IconItem = new IconItem($r('app.media.list2'), $r('app.media.list11'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list11').id));
      expect(v0).assertEqual($r('app.media.list11').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list2').id));
      expect(v1).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020044 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4500
     * @tc.name: testMdlIcon020045
     * @tc.desc: Verify IconItem keeps Resource description for media list3/list12 (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020045 begin');
      let item: IconItem = new IconItem($r('app.media.list3'), $r('app.media.list12'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020045 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4600
     * @tc.name: testMdlIcon020046
     * @tc.desc: Verify IconItem keeps Resource description for media list4/list13 (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020046 begin');
      let item: IconItem = new IconItem($r('app.media.list4'), $r('app.media.list13'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list13').id));
      expect(v0).assertEqual($r('app.media.list13').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list4').id));
      expect(v1).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020046 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4700
     * @tc.name: testMdlIcon020047
     * @tc.desc: Verify IconItem keeps Resource description for media list5/banner1 (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020047 begin');
      let item: IconItem = new IconItem($r('app.media.list5'), $r('app.media.banner1'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner1').id));
      expect(v0).assertEqual($r('app.media.banner1').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020047 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4800
     * @tc.name: testMdlIcon020048
     * @tc.desc: Verify IconItem keeps Resource description for media list6/banner2 (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020048 begin');
      let item: IconItem = new IconItem($r('app.media.list6'), $r('app.media.banner2'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner2').id));
      expect(v0).assertEqual($r('app.media.banner2').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020048 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_4900
     * @tc.name: testMdlIcon020049
     * @tc.desc: Verify IconItem keeps Resource description for media list7/banner3 (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020049 begin');
      let item: IconItem = new IconItem($r('app.media.list7'), $r('app.media.banner3'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.banner3').id));
      expect(v0).assertEqual($r('app.media.banner3').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020049 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5000
     * @tc.name: testMdlIcon020050
     * @tc.desc: Verify IconItem keeps Resource description for media list8/ic_find (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020050 begin');
      let item: IconItem = new IconItem($r('app.media.list8'), $r('app.media.ic_find'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_find').id));
      expect(v0).assertEqual($r('app.media.ic_find').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020050 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5100
     * @tc.name: testMdlIcon020051
     * @tc.desc: Verify IconItem keeps Resource description for media list9/ic_find_h (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020051 begin');
      let item: IconItem = new IconItem($r('app.media.list9'), $r('app.media.ic_find_h'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_find_h').id));
      expect(v0).assertEqual($r('app.media.ic_find_h').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020051 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5200
     * @tc.name: testMdlIcon020052
     * @tc.desc: Verify IconItem keeps Resource description for media list10/ic_home (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020052 begin');
      let item: IconItem = new IconItem($r('app.media.list10'), $r('app.media.ic_home'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_home').id));
      expect(v0).assertEqual($r('app.media.ic_home').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020052 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5300
     * @tc.name: testMdlIcon020053
     * @tc.desc: Verify IconItem keeps Resource description for media list11/ic_listener (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020053 begin');
      let item: IconItem = new IconItem($r('app.media.list11'), $r('app.media.ic_listener'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_listener').id));
      expect(v0).assertEqual($r('app.media.ic_listener').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020053 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5400
     * @tc.name: testMdlIcon020054
     * @tc.desc: Verify IconItem keeps Resource description for media list12/ic_mine (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020054 begin');
      let item: IconItem = new IconItem($r('app.media.list12'), $r('app.media.ic_mine'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_mine').id));
      expect(v0).assertEqual($r('app.media.ic_mine').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020054 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5500
     * @tc.name: testMdlIcon020055
     * @tc.desc: Verify IconItem keeps Resource description for media list13/ic_mine_h (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020055 begin');
      let item: IconItem = new IconItem($r('app.media.list13'), $r('app.media.ic_mine_h'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_mine_h').id));
      expect(v0).assertEqual($r('app.media.ic_mine_h').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020055 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5600
     * @tc.name: testMdlIcon020056
     * @tc.desc: Verify IconItem keeps Resource description for media banner1/ic_more (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020056 begin');
      let item: IconItem = new IconItem($r('app.media.banner1'), $r('app.media.ic_more'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_more').id));
      expect(v0).assertEqual($r('app.media.ic_more').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020056 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5700
     * @tc.name: testMdlIcon020057
     * @tc.desc: Verify IconItem keeps Resource description for media banner2/ic_music_Album (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020057 begin');
      let item: IconItem = new IconItem($r('app.media.banner2'), $r('app.media.ic_music_Album'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_Album').id));
      expect(v0).assertEqual($r('app.media.ic_music_Album').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020057 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5800
     * @tc.name: testMdlIcon020058
     * @tc.desc: Verify IconItem keeps Resource description for media banner3/ic_music_children (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020058 begin');
      let item: IconItem = new IconItem($r('app.media.banner3'), $r('app.media.ic_music_children'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_children').id));
      expect(v0).assertEqual($r('app.media.ic_music_children').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020058 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_5900
     * @tc.name: testMdlIcon020059
     * @tc.desc: Verify IconItem keeps Resource description for media ic_find/ic_music_hires (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020059 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find'), $r('app.media.ic_music_hires'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_hires').id));
      expect(v0).assertEqual($r('app.media.ic_music_hires').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020059 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6000
     * @tc.name: testMdlIcon020060
     * @tc.desc: Verify IconItem keeps Resource description for media ic_find_h/ic_music_localmusic (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020060 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find_h'), $r('app.media.ic_music_localmusic'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_localmusic').id));
      expect(v0).assertEqual($r('app.media.ic_music_localmusic').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020060 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6100
     * @tc.name: testMdlIcon020061
     * @tc.desc: Verify IconItem keeps Resource description for media ic_home/ic_music_musicfm (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020061 begin');
      let item: IconItem = new IconItem($r('app.media.ic_home'), $r('app.media.ic_music_musicfm'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_musicfm').id));
      expect(v0).assertEqual($r('app.media.ic_music_musicfm').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020061 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6200
     * @tc.name: testMdlIcon020062
     * @tc.desc: Verify IconItem keeps Resource description for media ic_listener/ic_music_privatefm (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020062 begin');
      let item: IconItem = new IconItem($r('app.media.ic_listener'), $r('app.media.ic_music_privatefm'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_privatefm').id));
      expect(v0).assertEqual($r('app.media.ic_music_privatefm').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020062 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6300
     * @tc.name: testMdlIcon020063
     * @tc.desc: Verify IconItem keeps Resource description for media ic_mine/ic_music_ranking (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020063 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine'), $r('app.media.ic_music_ranking'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_ranking').id));
      expect(v0).assertEqual($r('app.media.ic_music_ranking').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020063 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6400
     * @tc.name: testMdlIcon020064
     * @tc.desc: Verify IconItem keeps Resource description for media ic_mine_h/ic_music_singer (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020064 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine_h'), $r('app.media.ic_music_singer'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_singer').id));
      expect(v0).assertEqual($r('app.media.ic_music_singer').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020064 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6500
     * @tc.name: testMdlIcon020065
     * @tc.desc: Verify IconItem keeps Resource description for media ic_more/ic_music_songsheet (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020065 begin');
      let item: IconItem = new IconItem($r('app.media.ic_more'), $r('app.media.ic_music_songsheet'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_music_songsheet').id));
      expect(v0).assertEqual($r('app.media.ic_music_songsheet').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020065 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6600
     * @tc.name: testMdlIcon020066
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_Album/ic_play (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020066 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_Album'), $r('app.media.ic_play'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_play').id));
      expect(v0).assertEqual($r('app.media.ic_play').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020066 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6700
     * @tc.name: testMdlIcon020067
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_children/ic_playList (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020067 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_children'), $r('app.media.ic_playList'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_playList').id));
      expect(v0).assertEqual($r('app.media.ic_playList').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020067 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6800
     * @tc.name: testMdlIcon020068
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_hires/ic_public_arrow_right (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020068 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_hires'), $r('app.media.ic_public_arrow_right'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_arrow_right').id));
      expect(v0).assertEqual($r('app.media.ic_public_arrow_right').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020068 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_6900
     * @tc.name: testMdlIcon020069
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_localmusic/ic_public_home (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020069 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_localmusic'), $r('app.media.ic_public_home'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_home').id));
      expect(v0).assertEqual($r('app.media.ic_public_home').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020069 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_7000
     * @tc.name: testMdlIcon020070
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_musicfm/ic_public_home_filled (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020070 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_musicfm'), $r('app.media.ic_public_home_filled'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_public_home_filled').id));
      expect(v0).assertEqual($r('app.media.ic_public_home_filled').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020070 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_7100
     * @tc.name: testMdlIcon020071
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_privatefm/ic_radio (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020071 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_privatefm'), $r('app.media.ic_radio'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_radio').id));
      expect(v0).assertEqual($r('app.media.ic_radio').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020071 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_7200
     * @tc.name: testMdlIcon020072
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_ranking/ic_radio_h (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020072 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_ranking'), $r('app.media.ic_radio_h'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_radio_h').id));
      expect(v0).assertEqual($r('app.media.ic_radio_h').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020072 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_7300
     * @tc.name: testMdlIcon020073
     * @tc.desc: Verify IconItem keeps Resource description for media ic_music_singer/ic_search (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon020073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020073 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_singer'), $r('app.media.ic_search'));
      hilog.info(DOMAIN, TAG, 'description-is-resource-state actual=%{public}s expected=true', String(typeof item.description === 'object'));
      expect(typeof item.description === 'object').assertTrue();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description.id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.ic_search').id));
      expect(v0).assertEqual($r('app.media.ic_search').id);
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020073 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_7400
     * @tc.name: testMdlIcon020074
     * @tc.desc: Anchor: description union must report the resource state when a Resource is passed
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlIcon020074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020074 begin');
      let item: IconItem = new IconItem($r('app.media.ic_play'), $r('app.string.index'));
      hilog.info(DOMAIN, TAG, 'not-string-state actual=%{public}s expected=false', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertFalse();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.string.index').id));
      expect(v0).assertEqual($r('app.string.index').id);
      const v1: string = (item.description as Resource).moduleName;
      hilog.info(DOMAIN, TAG, 'description-module actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020074 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON02_7500
     * @tc.name: testMdlIcon020075
     * @tc.desc: Anchor: empty description is preserved as empty string not as undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlIcon020075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020075 begin');
      let item: IconItem = new IconItem($r('app.media.list1'), '');
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'empty-description actual=%{public}s expected=%{public}s', String(v0), String(''));
      expect(v0).assertEqual('');
      hilog.info(DOMAIN, TAG, 'still-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, 'image-kept actual=%{public}s expected=true', String(item.imageSrc.id > 0));
      expect(item.imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon020075 end');
    })

  })
}
