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

// @volume rule=IconItem-keeps-string-description-and-image-resource basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';
import { labelByName } from '../util/LabelResolver';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function modelMatrix01Test() {
  describe('ModelMatrix01', () => {

    /**
     * @tc.number: SUB_MM_MDLICON01_0100
     * @tc.name: testMdlIcon010001
     * @tc.desc: Verify IconItem keeps string description for media list2 (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010001 begin');
      let item: IconItem = new IconItem($r('app.media.list2'), labelByName('song_label_01'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list2').id));
      expect(v1).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010001 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_0200
     * @tc.name: testMdlIcon010002
     * @tc.desc: Verify IconItem keeps string description for media list3 (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010002 begin');
      let item: IconItem = new IconItem($r('app.media.list3'), "");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010002 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_0300
     * @tc.name: testMdlIcon010003
     * @tc.desc: Verify IconItem keeps string description for media list4 (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010003 begin');
      let item: IconItem = new IconItem($r('app.media.list4'), "a");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("a"));
      expect(v0).assertEqual("a");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list4').id));
      expect(v1).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010003 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_0400
     * @tc.name: testMdlIcon010004
     * @tc.desc: Verify IconItem keeps string description for media list5 (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010004 begin');
      let item: IconItem = new IconItem($r('app.media.list5'), labelByName('recommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('recommend')));
      expect(v0).assertEqual(labelByName('recommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010004 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_0500
     * @tc.name: testMdlIcon010005
     * @tc.desc: Verify IconItem keeps string description for media list6 (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010005 begin');
      let item: IconItem = new IconItem($r('app.media.list6'), labelByName('singRecommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singRecommend')));
      expect(v0).assertEqual(labelByName('singRecommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010005 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_0600
     * @tc.name: testMdlIcon010006
     * @tc.desc: Verify IconItem keeps string description for media list7 (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010006 begin');
      let item: IconItem = new IconItem($r('app.media.list7'), labelByName('emo'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('emo')));
      expect(v0).assertEqual(labelByName('emo'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010006 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_0700
     * @tc.name: testMdlIcon010007
     * @tc.desc: Verify IconItem keeps string description for media list8 (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010007 begin');
      let item: IconItem = new IconItem($r('app.media.list8'), labelByName('bgm'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('bgm')));
      expect(v0).assertEqual(labelByName('bgm'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010007 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_0800
     * @tc.name: testMdlIcon010008
     * @tc.desc: Verify IconItem keeps string description for media list9 (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010008 begin');
      let item: IconItem = new IconItem($r('app.media.list9'), labelByName('oldYear'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('oldYear')));
      expect(v0).assertEqual(labelByName('oldYear'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010008 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_0900
     * @tc.name: testMdlIcon010009
     * @tc.desc: Verify IconItem keeps string description for media list10 (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010009 begin');
      let item: IconItem = new IconItem($r('app.media.list10'), "  padded  ");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("  padded  "));
      expect(v0).assertEqual("  padded  ");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010009 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1000
     * @tc.name: testMdlIcon010010
     * @tc.desc: Verify IconItem keeps string description for media list11 (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010010 begin');
      let item: IconItem = new IconItem($r('app.media.list11'), "desc with \"quote\"");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with \"quote\""));
      expect(v0).assertEqual("desc with \"quote\"");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010010 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1100
     * @tc.name: testMdlIcon010011
     * @tc.desc: Verify IconItem keeps string description for media list12 (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010011 begin');
      let item: IconItem = new IconItem($r('app.media.list12'), "desc with 'single'");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with 'single'"));
      expect(v0).assertEqual("desc with 'single'");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010011 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1200
     * @tc.name: testMdlIcon010012
     * @tc.desc: Verify IconItem keeps string description for media list13 (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010012 begin');
      let item: IconItem = new IconItem($r('app.media.list13'), labelByName('song_label_06'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010012 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1300
     * @tc.name: testMdlIcon010013
     * @tc.desc: Verify IconItem keeps string description for media banner1 (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010013 begin');
      let item: IconItem = new IconItem($r('app.media.banner1'), labelByName('song_label_01'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010013 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1400
     * @tc.name: testMdlIcon010014
     * @tc.desc: Verify IconItem keeps string description for media banner2 (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010014 begin');
      let item: IconItem = new IconItem($r('app.media.banner2'), "");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010014 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1500
     * @tc.name: testMdlIcon010015
     * @tc.desc: Verify IconItem keeps string description for media banner3 (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010015 begin');
      let item: IconItem = new IconItem($r('app.media.banner3'), "a");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("a"));
      expect(v0).assertEqual("a");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010015 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1600
     * @tc.name: testMdlIcon010016
     * @tc.desc: Verify IconItem keeps string description for media ic_find (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010016 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find'), labelByName('recommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('recommend')));
      expect(v0).assertEqual(labelByName('recommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010016 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1700
     * @tc.name: testMdlIcon010017
     * @tc.desc: Verify IconItem keeps string description for media ic_find_h (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010017 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find_h'), labelByName('singRecommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singRecommend')));
      expect(v0).assertEqual(labelByName('singRecommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010017 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1800
     * @tc.name: testMdlIcon010018
     * @tc.desc: Verify IconItem keeps string description for media ic_home (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010018 begin');
      let item: IconItem = new IconItem($r('app.media.ic_home'), labelByName('emo'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('emo')));
      expect(v0).assertEqual(labelByName('emo'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010018 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_1900
     * @tc.name: testMdlIcon010019
     * @tc.desc: Verify IconItem keeps string description for media ic_listener (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010019 begin');
      let item: IconItem = new IconItem($r('app.media.ic_listener'), labelByName('bgm'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('bgm')));
      expect(v0).assertEqual(labelByName('bgm'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010019 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2000
     * @tc.name: testMdlIcon010020
     * @tc.desc: Verify IconItem keeps string description for media ic_mine (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010020 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine'), labelByName('oldYear'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('oldYear')));
      expect(v0).assertEqual(labelByName('oldYear'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010020 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2100
     * @tc.name: testMdlIcon010021
     * @tc.desc: Verify IconItem keeps string description for media ic_mine_h (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010021 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine_h'), "  padded  ");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("  padded  "));
      expect(v0).assertEqual("  padded  ");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010021 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2200
     * @tc.name: testMdlIcon010022
     * @tc.desc: Verify IconItem keeps string description for media ic_more (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010022 begin');
      let item: IconItem = new IconItem($r('app.media.ic_more'), "desc with \"quote\"");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with \"quote\""));
      expect(v0).assertEqual("desc with \"quote\"");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010022 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2300
     * @tc.name: testMdlIcon010023
     * @tc.desc: Verify IconItem keeps string description for media ic_music_Album (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010023 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_Album'), "desc with 'single'");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with 'single'"));
      expect(v0).assertEqual("desc with 'single'");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010023 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2400
     * @tc.name: testMdlIcon010024
     * @tc.desc: Verify IconItem keeps string description for media ic_music_children (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010024 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_children'), labelByName('song_label_06'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010024 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2500
     * @tc.name: testMdlIcon010025
     * @tc.desc: Verify IconItem keeps string description for media ic_music_hires (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010025 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_hires'), labelByName('song_label_01'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010025 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2600
     * @tc.name: testMdlIcon010026
     * @tc.desc: Verify IconItem keeps string description for media ic_music_localmusic (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010026 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_localmusic'), "");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010026 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2700
     * @tc.name: testMdlIcon010027
     * @tc.desc: Verify IconItem keeps string description for media ic_music_musicfm (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010027 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_musicfm'), "a");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("a"));
      expect(v0).assertEqual("a");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010027 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2800
     * @tc.name: testMdlIcon010028
     * @tc.desc: Verify IconItem keeps string description for media ic_music_privatefm (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010028 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_privatefm'), labelByName('recommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('recommend')));
      expect(v0).assertEqual(labelByName('recommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010028 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_2900
     * @tc.name: testMdlIcon010029
     * @tc.desc: Verify IconItem keeps string description for media ic_music_ranking (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010029 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_ranking'), labelByName('singRecommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singRecommend')));
      expect(v0).assertEqual(labelByName('singRecommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010029 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3000
     * @tc.name: testMdlIcon010030
     * @tc.desc: Verify IconItem keeps string description for media ic_music_singer (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010030 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_singer'), labelByName('emo'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('emo')));
      expect(v0).assertEqual(labelByName('emo'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010030 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3100
     * @tc.name: testMdlIcon010031
     * @tc.desc: Verify IconItem keeps string description for media ic_music_songsheet (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010031 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_songsheet'), labelByName('bgm'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('bgm')));
      expect(v0).assertEqual(labelByName('bgm'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_songsheet').id));
      expect(v1).assertEqual($r('app.media.ic_music_songsheet').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010031 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3200
     * @tc.name: testMdlIcon010032
     * @tc.desc: Verify IconItem keeps string description for media ic_play (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010032 begin');
      let item: IconItem = new IconItem($r('app.media.ic_play'), labelByName('oldYear'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('oldYear')));
      expect(v0).assertEqual(labelByName('oldYear'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_play').id));
      expect(v1).assertEqual($r('app.media.ic_play').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010032 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3300
     * @tc.name: testMdlIcon010033
     * @tc.desc: Verify IconItem keeps string description for media ic_playList (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010033 begin');
      let item: IconItem = new IconItem($r('app.media.ic_playList'), "  padded  ");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("  padded  "));
      expect(v0).assertEqual("  padded  ");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_playList').id));
      expect(v1).assertEqual($r('app.media.ic_playList').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010033 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3400
     * @tc.name: testMdlIcon010034
     * @tc.desc: Verify IconItem keeps string description for media ic_public_arrow_right (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010034 begin');
      let item: IconItem = new IconItem($r('app.media.ic_public_arrow_right'), "desc with \"quote\"");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with \"quote\""));
      expect(v0).assertEqual("desc with \"quote\"");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_arrow_right').id));
      expect(v1).assertEqual($r('app.media.ic_public_arrow_right').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010034 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3500
     * @tc.name: testMdlIcon010035
     * @tc.desc: Verify IconItem keeps string description for media ic_public_home (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010035 begin');
      let item: IconItem = new IconItem($r('app.media.ic_public_home'), "desc with 'single'");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with 'single'"));
      expect(v0).assertEqual("desc with 'single'");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home').id));
      expect(v1).assertEqual($r('app.media.ic_public_home').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010035 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3600
     * @tc.name: testMdlIcon010036
     * @tc.desc: Verify IconItem keeps string description for media ic_public_home_filled (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010036 begin');
      let item: IconItem = new IconItem($r('app.media.ic_public_home_filled'), labelByName('song_label_06'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_public_home_filled').id));
      expect(v1).assertEqual($r('app.media.ic_public_home_filled').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010036 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3700
     * @tc.name: testMdlIcon010037
     * @tc.desc: Verify IconItem keeps string description for media ic_radio (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010037 begin');
      let item: IconItem = new IconItem($r('app.media.ic_radio'), labelByName('song_label_01'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio').id));
      expect(v1).assertEqual($r('app.media.ic_radio').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010037 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3800
     * @tc.name: testMdlIcon010038
     * @tc.desc: Verify IconItem keeps string description for media ic_radio_h (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010038 begin');
      let item: IconItem = new IconItem($r('app.media.ic_radio_h'), "");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_radio_h').id));
      expect(v1).assertEqual($r('app.media.ic_radio_h').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010038 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_3900
     * @tc.name: testMdlIcon010039
     * @tc.desc: Verify IconItem keeps string description for media ic_search (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010039 begin');
      let item: IconItem = new IconItem($r('app.media.ic_search'), "a");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("a"));
      expect(v0).assertEqual("a");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_search').id));
      expect(v1).assertEqual($r('app.media.ic_search').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010039 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4000
     * @tc.name: testMdlIcon010040
     * @tc.desc: Verify IconItem keeps string description for media icon (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010040 begin');
      let item: IconItem = new IconItem($r('app.media.icon'), labelByName('recommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('recommend')));
      expect(v0).assertEqual(labelByName('recommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon').id));
      expect(v1).assertEqual($r('app.media.icon').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010040 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4100
     * @tc.name: testMdlIcon010041
     * @tc.desc: Verify IconItem keeps string description for media icon_play (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010041 begin');
      let item: IconItem = new IconItem($r('app.media.icon_play'), labelByName('singRecommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singRecommend')));
      expect(v0).assertEqual(labelByName('singRecommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.icon_play').id));
      expect(v1).assertEqual($r('app.media.icon_play').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010041 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4200
     * @tc.name: testMdlIcon010042
     * @tc.desc: Verify IconItem keeps string description for media play (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010042 begin');
      let item: IconItem = new IconItem($r('app.media.play'), labelByName('emo'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('emo')));
      expect(v0).assertEqual(labelByName('emo'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.play').id));
      expect(v1).assertEqual($r('app.media.play').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010042 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4300
     * @tc.name: testMdlIcon010043
     * @tc.desc: Verify IconItem keeps string description for media list1 (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010043 begin');
      let item: IconItem = new IconItem($r('app.media.list1'), labelByName('bgm'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('bgm')));
      expect(v0).assertEqual(labelByName('bgm'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010043 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4400
     * @tc.name: testMdlIcon010044
     * @tc.desc: Verify IconItem keeps string description for media list2 (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010044 begin');
      let item: IconItem = new IconItem($r('app.media.list2'), labelByName('oldYear'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('oldYear')));
      expect(v0).assertEqual(labelByName('oldYear'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list2').id));
      expect(v1).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010044 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4500
     * @tc.name: testMdlIcon010045
     * @tc.desc: Verify IconItem keeps string description for media list3 (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010045 begin');
      let item: IconItem = new IconItem($r('app.media.list3'), "  padded  ");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("  padded  "));
      expect(v0).assertEqual("  padded  ");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010045 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4600
     * @tc.name: testMdlIcon010046
     * @tc.desc: Verify IconItem keeps string description for media list4 (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010046 begin');
      let item: IconItem = new IconItem($r('app.media.list4'), "desc with \"quote\"");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with \"quote\""));
      expect(v0).assertEqual("desc with \"quote\"");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list4').id));
      expect(v1).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010046 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4700
     * @tc.name: testMdlIcon010047
     * @tc.desc: Verify IconItem keeps string description for media list5 (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010047 begin');
      let item: IconItem = new IconItem($r('app.media.list5'), "desc with 'single'");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with 'single'"));
      expect(v0).assertEqual("desc with 'single'");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010047 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4800
     * @tc.name: testMdlIcon010048
     * @tc.desc: Verify IconItem keeps string description for media list6 (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010048 begin');
      let item: IconItem = new IconItem($r('app.media.list6'), labelByName('song_label_06'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010048 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_4900
     * @tc.name: testMdlIcon010049
     * @tc.desc: Verify IconItem keeps string description for media list7 (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010049 begin');
      let item: IconItem = new IconItem($r('app.media.list7'), labelByName('song_label_01'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010049 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5000
     * @tc.name: testMdlIcon010050
     * @tc.desc: Verify IconItem keeps string description for media list8 (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010050 begin');
      let item: IconItem = new IconItem($r('app.media.list8'), "");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010050 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5100
     * @tc.name: testMdlIcon010051
     * @tc.desc: Verify IconItem keeps string description for media list9 (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010051 begin');
      let item: IconItem = new IconItem($r('app.media.list9'), "a");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("a"));
      expect(v0).assertEqual("a");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010051 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5200
     * @tc.name: testMdlIcon010052
     * @tc.desc: Verify IconItem keeps string description for media list10 (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010052 begin');
      let item: IconItem = new IconItem($r('app.media.list10'), labelByName('recommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('recommend')));
      expect(v0).assertEqual(labelByName('recommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010052 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5300
     * @tc.name: testMdlIcon010053
     * @tc.desc: Verify IconItem keeps string description for media list11 (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010053 begin');
      let item: IconItem = new IconItem($r('app.media.list11'), labelByName('singRecommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singRecommend')));
      expect(v0).assertEqual(labelByName('singRecommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010053 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5400
     * @tc.name: testMdlIcon010054
     * @tc.desc: Verify IconItem keeps string description for media list12 (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010054 begin');
      let item: IconItem = new IconItem($r('app.media.list12'), labelByName('emo'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('emo')));
      expect(v0).assertEqual(labelByName('emo'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010054 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5500
     * @tc.name: testMdlIcon010055
     * @tc.desc: Verify IconItem keeps string description for media list13 (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010055 begin');
      let item: IconItem = new IconItem($r('app.media.list13'), labelByName('bgm'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('bgm')));
      expect(v0).assertEqual(labelByName('bgm'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list13').id));
      expect(v1).assertEqual($r('app.media.list13').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010055 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5600
     * @tc.name: testMdlIcon010056
     * @tc.desc: Verify IconItem keeps string description for media banner1 (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010056 begin');
      let item: IconItem = new IconItem($r('app.media.banner1'), labelByName('oldYear'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('oldYear')));
      expect(v0).assertEqual(labelByName('oldYear'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner1').id));
      expect(v1).assertEqual($r('app.media.banner1').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010056 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5700
     * @tc.name: testMdlIcon010057
     * @tc.desc: Verify IconItem keeps string description for media banner2 (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010057 begin');
      let item: IconItem = new IconItem($r('app.media.banner2'), "  padded  ");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("  padded  "));
      expect(v0).assertEqual("  padded  ");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner2').id));
      expect(v1).assertEqual($r('app.media.banner2').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010057 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5800
     * @tc.name: testMdlIcon010058
     * @tc.desc: Verify IconItem keeps string description for media banner3 (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010058 begin');
      let item: IconItem = new IconItem($r('app.media.banner3'), "desc with \"quote\"");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with \"quote\""));
      expect(v0).assertEqual("desc with \"quote\"");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.banner3').id));
      expect(v1).assertEqual($r('app.media.banner3').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010058 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_5900
     * @tc.name: testMdlIcon010059
     * @tc.desc: Verify IconItem keeps string description for media ic_find (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010059 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find'), "desc with 'single'");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with 'single'"));
      expect(v0).assertEqual("desc with 'single'");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find').id));
      expect(v1).assertEqual($r('app.media.ic_find').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010059 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6000
     * @tc.name: testMdlIcon010060
     * @tc.desc: Verify IconItem keeps string description for media ic_find_h (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010060 begin');
      let item: IconItem = new IconItem($r('app.media.ic_find_h'), labelByName('song_label_06'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_find_h').id));
      expect(v1).assertEqual($r('app.media.ic_find_h').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010060 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6100
     * @tc.name: testMdlIcon010061
     * @tc.desc: Verify IconItem keeps string description for media ic_home (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010061 begin');
      let item: IconItem = new IconItem($r('app.media.ic_home'), labelByName('song_label_01'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_home').id));
      expect(v1).assertEqual($r('app.media.ic_home').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010061 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6200
     * @tc.name: testMdlIcon010062
     * @tc.desc: Verify IconItem keeps string description for media ic_listener (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010062 begin');
      let item: IconItem = new IconItem($r('app.media.ic_listener'), "");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(""));
      expect(v0).assertEqual("");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_listener').id));
      expect(v1).assertEqual($r('app.media.ic_listener').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010062 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6300
     * @tc.name: testMdlIcon010063
     * @tc.desc: Verify IconItem keeps string description for media ic_mine (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010063 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine'), "a");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("a"));
      expect(v0).assertEqual("a");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine').id));
      expect(v1).assertEqual($r('app.media.ic_mine').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010063 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6400
     * @tc.name: testMdlIcon010064
     * @tc.desc: Verify IconItem keeps string description for media ic_mine_h (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010064 begin');
      let item: IconItem = new IconItem($r('app.media.ic_mine_h'), labelByName('recommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('recommend')));
      expect(v0).assertEqual(labelByName('recommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_mine_h').id));
      expect(v1).assertEqual($r('app.media.ic_mine_h').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010064 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6500
     * @tc.name: testMdlIcon010065
     * @tc.desc: Verify IconItem keeps string description for media ic_more (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010065 begin');
      let item: IconItem = new IconItem($r('app.media.ic_more'), labelByName('singRecommend'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('singRecommend')));
      expect(v0).assertEqual(labelByName('singRecommend'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_more').id));
      expect(v1).assertEqual($r('app.media.ic_more').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010065 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6600
     * @tc.name: testMdlIcon010066
     * @tc.desc: Verify IconItem keeps string description for media ic_music_Album (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010066 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_Album'), labelByName('emo'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('emo')));
      expect(v0).assertEqual(labelByName('emo'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_Album').id));
      expect(v1).assertEqual($r('app.media.ic_music_Album').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010066 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6700
     * @tc.name: testMdlIcon010067
     * @tc.desc: Verify IconItem keeps string description for media ic_music_children (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010067 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_children'), labelByName('bgm'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('bgm')));
      expect(v0).assertEqual(labelByName('bgm'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_children').id));
      expect(v1).assertEqual($r('app.media.ic_music_children').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010067 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6800
     * @tc.name: testMdlIcon010068
     * @tc.desc: Verify IconItem keeps string description for media ic_music_hires (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010068 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_hires'), labelByName('oldYear'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('oldYear')));
      expect(v0).assertEqual(labelByName('oldYear'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_hires').id));
      expect(v1).assertEqual($r('app.media.ic_music_hires').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010068 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_6900
     * @tc.name: testMdlIcon010069
     * @tc.desc: Verify IconItem keeps string description for media ic_music_localmusic (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010069 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_localmusic'), "  padded  ");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("  padded  "));
      expect(v0).assertEqual("  padded  ");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_localmusic').id));
      expect(v1).assertEqual($r('app.media.ic_music_localmusic').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010069 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_7000
     * @tc.name: testMdlIcon010070
     * @tc.desc: Verify IconItem keeps string description for media ic_music_musicfm (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010070 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_musicfm'), "desc with \"quote\"");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with \"quote\""));
      expect(v0).assertEqual("desc with \"quote\"");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_musicfm').id));
      expect(v1).assertEqual($r('app.media.ic_music_musicfm').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010070 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_7100
     * @tc.name: testMdlIcon010071
     * @tc.desc: Verify IconItem keeps string description for media ic_music_privatefm (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010071 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_privatefm'), "desc with 'single'");
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String("desc with 'single'"));
      expect(v0).assertEqual("desc with 'single'");
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_privatefm').id));
      expect(v1).assertEqual($r('app.media.ic_music_privatefm').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010071 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_7200
     * @tc.name: testMdlIcon010072
     * @tc.desc: Verify IconItem keeps string description for media ic_music_ranking (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010072 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_ranking'), labelByName('song_label_06'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_06')));
      expect(v0).assertEqual(labelByName('song_label_06'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_ranking').id));
      expect(v1).assertEqual($r('app.media.ic_music_ranking').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010072 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_7300
     * @tc.name: testMdlIcon010073
     * @tc.desc: Verify IconItem keeps string description for media ic_music_singer (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIcon010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010073 begin');
      let item: IconItem = new IconItem($r('app.media.ic_music_singer'), labelByName('song_label_01'));
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'description-value actual=%{public}s expected=%{public}s', String(v0), String(labelByName('song_label_01')));
      expect(v0).assertEqual(labelByName('song_label_01'));
      const v1: number = item.imageSrc.id;
      hilog.info(DOMAIN, TAG, 'imageSrc.id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.ic_music_singer').id));
      expect(v1).assertEqual($r('app.media.ic_music_singer').id);
      hilog.info(DOMAIN, TAG, 'description-is-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010073 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_7400
     * @tc.name: testMdlIcon010074
     * @tc.desc: Anchor: empty description is preserved as empty string not as undefined
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlIcon010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010074 begin');
      let item: IconItem = new IconItem($r('app.media.list1'), '');
      const v0: Resource | string = item.description;
      hilog.info(DOMAIN, TAG, 'empty-description actual=%{public}s expected=%{public}s', String(v0), String(''));
      expect(v0).assertEqual('');
      hilog.info(DOMAIN, TAG, 'still-string-state actual=%{public}s expected=true', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, 'image-kept actual=%{public}s expected=true', String(item.imageSrc.id > 0));
      expect(item.imageSrc.id > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010074 end');
    })

    /**
     * @tc.number: SUB_MM_MDLICON01_7500
     * @tc.name: testMdlIcon010075
     * @tc.desc: Anchor: description union must report the resource state when a Resource is passed
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlIcon010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010075 begin');
      let item: IconItem = new IconItem($r('app.media.ic_play'), $r('app.string.index'));
      hilog.info(DOMAIN, TAG, 'not-string-state actual=%{public}s expected=false', String(typeof item.description === 'string'));
      expect(typeof item.description === 'string').assertFalse();
      const v0: number = (item.description as Resource).id;
      hilog.info(DOMAIN, TAG, 'description-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.string.index').id));
      expect(v0).assertEqual($r('app.string.index').id);
      const v1: string = (item.description as Resource).moduleName;
      hilog.info(DOMAIN, TAG, 'description-module actual=%{public}s expected=%{public}s', String(v1), String(TEST_MODULE_NAME));
      expect(v1).assertEqual(TEST_MODULE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIcon010075 end');
    })

  })
}
