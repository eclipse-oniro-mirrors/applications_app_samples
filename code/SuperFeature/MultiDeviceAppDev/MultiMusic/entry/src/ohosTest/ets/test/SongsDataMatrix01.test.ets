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

// @volume rule=songsList[i].imageSrc-is-app.media.list-(12-i) basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem } from '../../../main/ets/model/DataType';
import { songsList } from '../../../main/ets/model/DataSummary';
import { BUNDLE_NAME, TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function songsDataMatrix01Test() {
  describe('SongsDataMatrix01', () => {

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0100
     * @tc.name: testDataMedia010001
     * @tc.desc: Verify songs entry 0 keeps media list12 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010001 begin');
      const v0: number = songsList[0].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[0].imageSrc.id === $r('app.media.list12').id));
      expect(songsList[0].imageSrc.id === $r('app.media.list12').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[0].imageSrc.id === songsList[6].imageSrc.id));
      expect(songsList[0].imageSrc.id === songsList[6].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010001 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0200
     * @tc.name: testDataMedia010002
     * @tc.desc: Verify songs entry 1 keeps media list11 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010002 begin');
      const v0: number = songsList[1].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list11').id));
      expect(v0).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[1].imageSrc.id === $r('app.media.list11').id));
      expect(songsList[1].imageSrc.id === $r('app.media.list11').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[1].imageSrc.id === songsList[7].imageSrc.id));
      expect(songsList[1].imageSrc.id === songsList[7].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010002 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0300
     * @tc.name: testDataMedia010003
     * @tc.desc: Verify songs entry 2 keeps media list10 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010003 begin');
      const v0: number = songsList[2].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list10').id));
      expect(v0).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[2].imageSrc.id === $r('app.media.list10').id));
      expect(songsList[2].imageSrc.id === $r('app.media.list10').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[2].imageSrc.id === songsList[8].imageSrc.id));
      expect(songsList[2].imageSrc.id === songsList[8].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010003 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0400
     * @tc.name: testDataMedia010004
     * @tc.desc: Verify songs entry 3 keeps media list9 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010004 begin');
      const v0: number = songsList[3].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list9').id));
      expect(v0).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[3].imageSrc.id === $r('app.media.list9').id));
      expect(songsList[3].imageSrc.id === $r('app.media.list9').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[3].imageSrc.id === songsList[9].imageSrc.id));
      expect(songsList[3].imageSrc.id === songsList[9].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010004 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0500
     * @tc.name: testDataMedia010005
     * @tc.desc: Verify songs entry 4 keeps media list8 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010005 begin');
      const v0: number = songsList[4].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list8').id));
      expect(v0).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[4].imageSrc.id === $r('app.media.list8').id));
      expect(songsList[4].imageSrc.id === $r('app.media.list8').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[4].imageSrc.id === songsList[10].imageSrc.id));
      expect(songsList[4].imageSrc.id === songsList[10].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010005 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0600
     * @tc.name: testDataMedia010006
     * @tc.desc: Verify songs entry 5 keeps media list7 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010006 begin');
      const v0: number = songsList[5].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list7').id));
      expect(v0).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[5].imageSrc.id === $r('app.media.list7').id));
      expect(songsList[5].imageSrc.id === $r('app.media.list7').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[5].imageSrc.id === songsList[11].imageSrc.id));
      expect(songsList[5].imageSrc.id === songsList[11].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010006 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0700
     * @tc.name: testDataMedia010007
     * @tc.desc: Verify songs entry 6 keeps media list6 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010007 begin');
      const v0: number = songsList[6].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list6').id));
      expect(v0).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[6].imageSrc.id === $r('app.media.list6').id));
      expect(songsList[6].imageSrc.id === $r('app.media.list6').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[6].imageSrc.id === songsList[0].imageSrc.id));
      expect(songsList[6].imageSrc.id === songsList[0].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010007 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0800
     * @tc.name: testDataMedia010008
     * @tc.desc: Verify songs entry 7 keeps media list5 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010008 begin');
      const v0: number = songsList[7].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list5').id));
      expect(v0).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[7].imageSrc.id === $r('app.media.list5').id));
      expect(songsList[7].imageSrc.id === $r('app.media.list5').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[7].imageSrc.id === songsList[1].imageSrc.id));
      expect(songsList[7].imageSrc.id === songsList[1].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010008 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_0900
     * @tc.name: testDataMedia010009
     * @tc.desc: Verify songs entry 8 keeps media list4 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010009 begin');
      const v0: number = songsList[8].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list4').id));
      expect(v0).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[8].imageSrc.id === $r('app.media.list4').id));
      expect(songsList[8].imageSrc.id === $r('app.media.list4').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[8].imageSrc.id === songsList[2].imageSrc.id));
      expect(songsList[8].imageSrc.id === songsList[2].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010009 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1000
     * @tc.name: testDataMedia010010
     * @tc.desc: Verify songs entry 9 keeps media list3 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010010 begin');
      const v0: number = songsList[9].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list3').id));
      expect(v0).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[9].imageSrc.id === $r('app.media.list3').id));
      expect(songsList[9].imageSrc.id === $r('app.media.list3').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[9].imageSrc.id === songsList[3].imageSrc.id));
      expect(songsList[9].imageSrc.id === songsList[3].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010010 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1100
     * @tc.name: testDataMedia010011
     * @tc.desc: Verify songs entry 10 keeps media list2 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010011 begin');
      const v0: number = songsList[10].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list2').id));
      expect(v0).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[10].imageSrc.id === $r('app.media.list2').id));
      expect(songsList[10].imageSrc.id === $r('app.media.list2').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[10].imageSrc.id === songsList[4].imageSrc.id));
      expect(songsList[10].imageSrc.id === songsList[4].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010011 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1200
     * @tc.name: testDataMedia010012
     * @tc.desc: Verify songs entry 11 keeps media list1 (aspect 0).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010012 begin');
      const v0: number = songsList[11].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list1').id));
      expect(v0).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[11].imageSrc.id === $r('app.media.list1').id));
      expect(songsList[11].imageSrc.id === $r('app.media.list1').id).assertTrue();
      hilog.info(DOMAIN, TAG, 'mirror-media-differs actual=%{public}s expected=false', String(songsList[11].imageSrc.id === songsList[5].imageSrc.id));
      expect(songsList[11].imageSrc.id === songsList[5].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010012 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1300
     * @tc.name: testDataMedia010013
     * @tc.desc: Verify songs entry 0 keeps media list12 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010013 begin');
      const v0: number = songsList[0].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[0].imageSrc.id === $r('app.media.list7').id));
      expect(songsList[0].imageSrc.id === $r('app.media.list7').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010013 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1400
     * @tc.name: testDataMedia010014
     * @tc.desc: Verify songs entry 1 keeps media list11 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010014 begin');
      const v0: number = songsList[1].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list11').id));
      expect(v0).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[1].imageSrc.id === $r('app.media.list6').id));
      expect(songsList[1].imageSrc.id === $r('app.media.list6').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010014 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1500
     * @tc.name: testDataMedia010015
     * @tc.desc: Verify songs entry 2 keeps media list10 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010015 begin');
      const v0: number = songsList[2].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list10').id));
      expect(v0).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[2].imageSrc.id === $r('app.media.list5').id));
      expect(songsList[2].imageSrc.id === $r('app.media.list5').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010015 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1600
     * @tc.name: testDataMedia010016
     * @tc.desc: Verify songs entry 3 keeps media list9 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010016 begin');
      const v0: number = songsList[3].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list9').id));
      expect(v0).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[3].imageSrc.id === $r('app.media.list4').id));
      expect(songsList[3].imageSrc.id === $r('app.media.list4').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010016 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1700
     * @tc.name: testDataMedia010017
     * @tc.desc: Verify songs entry 4 keeps media list8 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010017 begin');
      const v0: number = songsList[4].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list8').id));
      expect(v0).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[4].imageSrc.id === $r('app.media.list3').id));
      expect(songsList[4].imageSrc.id === $r('app.media.list3').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010017 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1800
     * @tc.name: testDataMedia010018
     * @tc.desc: Verify songs entry 5 keeps media list7 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010018 begin');
      const v0: number = songsList[5].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list7').id));
      expect(v0).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[5].imageSrc.id === $r('app.media.list2').id));
      expect(songsList[5].imageSrc.id === $r('app.media.list2').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010018 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_1900
     * @tc.name: testDataMedia010019
     * @tc.desc: Verify songs entry 6 keeps media list6 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010019 begin');
      const v0: number = songsList[6].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list6').id));
      expect(v0).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[6].imageSrc.id === $r('app.media.list1').id));
      expect(songsList[6].imageSrc.id === $r('app.media.list1').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010019 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2000
     * @tc.name: testDataMedia010020
     * @tc.desc: Verify songs entry 7 keeps media list5 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010020 begin');
      const v0: number = songsList[7].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list5').id));
      expect(v0).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[7].imageSrc.id === $r('app.media.list12').id));
      expect(songsList[7].imageSrc.id === $r('app.media.list12').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010020 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2100
     * @tc.name: testDataMedia010021
     * @tc.desc: Verify songs entry 8 keeps media list4 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010021 begin');
      const v0: number = songsList[8].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list4').id));
      expect(v0).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[8].imageSrc.id === $r('app.media.list11').id));
      expect(songsList[8].imageSrc.id === $r('app.media.list11').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010021 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2200
     * @tc.name: testDataMedia010022
     * @tc.desc: Verify songs entry 9 keeps media list3 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010022 begin');
      const v0: number = songsList[9].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list3').id));
      expect(v0).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[9].imageSrc.id === $r('app.media.list10').id));
      expect(songsList[9].imageSrc.id === $r('app.media.list10').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010022 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2300
     * @tc.name: testDataMedia010023
     * @tc.desc: Verify songs entry 10 keeps media list2 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010023 begin');
      const v0: number = songsList[10].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list2').id));
      expect(v0).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[10].imageSrc.id === $r('app.media.list9').id));
      expect(songsList[10].imageSrc.id === $r('app.media.list9').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010023 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2400
     * @tc.name: testDataMedia010024
     * @tc.desc: Verify songs entry 11 keeps media list1 (aspect 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010024 begin');
      const v0: number = songsList[11].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list1').id));
      expect(v0).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'not-other-media actual=%{public}s expected=false', String(songsList[11].imageSrc.id === $r('app.media.list8').id));
      expect(songsList[11].imageSrc.id === $r('app.media.list8').id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010024 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2500
     * @tc.name: testDataMedia010025
     * @tc.desc: Verify songs entry 0 keeps media list12 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010025 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[0].imageSrc.id > 0));
      expect(songsList[0].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[0].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010025 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2600
     * @tc.name: testDataMedia010026
     * @tc.desc: Verify songs entry 1 keeps media list11 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010026 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[1].imageSrc.id > 0));
      expect(songsList[1].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[1].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list11').id));
      expect(v0).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010026 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2700
     * @tc.name: testDataMedia010027
     * @tc.desc: Verify songs entry 2 keeps media list10 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010027 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[2].imageSrc.id > 0));
      expect(songsList[2].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[2].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list10').id));
      expect(v0).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010027 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2800
     * @tc.name: testDataMedia010028
     * @tc.desc: Verify songs entry 3 keeps media list9 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010028 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[3].imageSrc.id > 0));
      expect(songsList[3].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[3].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list9').id));
      expect(v0).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010028 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_2900
     * @tc.name: testDataMedia010029
     * @tc.desc: Verify songs entry 4 keeps media list8 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010029 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[4].imageSrc.id > 0));
      expect(songsList[4].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[4].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list8').id));
      expect(v0).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010029 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3000
     * @tc.name: testDataMedia010030
     * @tc.desc: Verify songs entry 5 keeps media list7 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010030 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[5].imageSrc.id > 0));
      expect(songsList[5].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[5].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list7').id));
      expect(v0).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010030 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3100
     * @tc.name: testDataMedia010031
     * @tc.desc: Verify songs entry 6 keeps media list6 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010031 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[6].imageSrc.id > 0));
      expect(songsList[6].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[6].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list6').id));
      expect(v0).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010031 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3200
     * @tc.name: testDataMedia010032
     * @tc.desc: Verify songs entry 7 keeps media list5 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010032 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[7].imageSrc.id > 0));
      expect(songsList[7].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[7].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list5').id));
      expect(v0).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010032 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3300
     * @tc.name: testDataMedia010033
     * @tc.desc: Verify songs entry 8 keeps media list4 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010033 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[8].imageSrc.id > 0));
      expect(songsList[8].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[8].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list4').id));
      expect(v0).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010033 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3400
     * @tc.name: testDataMedia010034
     * @tc.desc: Verify songs entry 9 keeps media list3 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010034 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[9].imageSrc.id > 0));
      expect(songsList[9].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[9].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list3').id));
      expect(v0).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010034 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3500
     * @tc.name: testDataMedia010035
     * @tc.desc: Verify songs entry 10 keeps media list2 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010035 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[10].imageSrc.id > 0));
      expect(songsList[10].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[10].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list2').id));
      expect(v0).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010035 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3600
     * @tc.name: testDataMedia010036
     * @tc.desc: Verify songs entry 11 keeps media list1 (aspect 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010036 begin');
      hilog.info(DOMAIN, TAG, 'media-id-positive actual=%{public}s expected=true', String(songsList[11].imageSrc.id > 0));
      expect(songsList[11].imageSrc.id > 0).assertTrue();
      const v0: number = songsList[11].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list1').id));
      expect(v0).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010036 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3700
     * @tc.name: testDataMedia010037
     * @tc.desc: Verify songs entry 0 keeps media list12 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010037 begin');
      const v0: string = songsList[0].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[0].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010037 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3800
     * @tc.name: testDataMedia010038
     * @tc.desc: Verify songs entry 1 keeps media list11 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010038 begin');
      const v0: string = songsList[1].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[1].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010038 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_3900
     * @tc.name: testDataMedia010039
     * @tc.desc: Verify songs entry 2 keeps media list10 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010039 begin');
      const v0: string = songsList[2].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[2].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010039 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4000
     * @tc.name: testDataMedia010040
     * @tc.desc: Verify songs entry 3 keeps media list9 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010040 begin');
      const v0: string = songsList[3].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[3].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010040 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4100
     * @tc.name: testDataMedia010041
     * @tc.desc: Verify songs entry 4 keeps media list8 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010041 begin');
      const v0: string = songsList[4].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[4].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010041 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4200
     * @tc.name: testDataMedia010042
     * @tc.desc: Verify songs entry 5 keeps media list7 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010042 begin');
      const v0: string = songsList[5].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[5].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010042 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4300
     * @tc.name: testDataMedia010043
     * @tc.desc: Verify songs entry 6 keeps media list6 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010043 begin');
      const v0: string = songsList[6].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[6].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010043 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4400
     * @tc.name: testDataMedia010044
     * @tc.desc: Verify songs entry 7 keeps media list5 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010044 begin');
      const v0: string = songsList[7].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[7].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010044 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4500
     * @tc.name: testDataMedia010045
     * @tc.desc: Verify songs entry 8 keeps media list4 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010045 begin');
      const v0: string = songsList[8].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[8].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list4').id));
      expect(v1).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010045 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4600
     * @tc.name: testDataMedia010046
     * @tc.desc: Verify songs entry 9 keeps media list3 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010046 begin');
      const v0: string = songsList[9].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[9].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010046 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4700
     * @tc.name: testDataMedia010047
     * @tc.desc: Verify songs entry 10 keeps media list2 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010047 begin');
      const v0: string = songsList[10].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[10].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list2').id));
      expect(v1).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010047 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4800
     * @tc.name: testDataMedia010048
     * @tc.desc: Verify songs entry 11 keeps media list1 (aspect 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010048 begin');
      const v0: string = songsList[11].imageSrc.moduleName;
      hilog.info(DOMAIN, TAG, 'moduleName actual=%{public}s expected=%{public}s', String(v0), String(TEST_MODULE_NAME));
      expect(v0).assertEqual(TEST_MODULE_NAME);
      const v1: number = songsList[11].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010048 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_4900
     * @tc.name: testDataMedia010049
     * @tc.desc: Verify songs entry 0 keeps media list12 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010049 begin');
      const v0: string = songsList[0].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[0].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list12').id));
      expect(v1).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010049 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5000
     * @tc.name: testDataMedia010050
     * @tc.desc: Verify songs entry 1 keeps media list11 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010050 begin');
      const v0: string = songsList[1].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[1].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list11').id));
      expect(v1).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010050 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5100
     * @tc.name: testDataMedia010051
     * @tc.desc: Verify songs entry 2 keeps media list10 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010051 begin');
      const v0: string = songsList[2].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[2].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list10').id));
      expect(v1).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010051 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5200
     * @tc.name: testDataMedia010052
     * @tc.desc: Verify songs entry 3 keeps media list9 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010052 begin');
      const v0: string = songsList[3].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[3].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list9').id));
      expect(v1).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010052 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5300
     * @tc.name: testDataMedia010053
     * @tc.desc: Verify songs entry 4 keeps media list8 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010053 begin');
      const v0: string = songsList[4].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[4].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list8').id));
      expect(v1).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010053 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5400
     * @tc.name: testDataMedia010054
     * @tc.desc: Verify songs entry 5 keeps media list7 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010054 begin');
      const v0: string = songsList[5].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[5].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list7').id));
      expect(v1).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010054 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5500
     * @tc.name: testDataMedia010055
     * @tc.desc: Verify songs entry 6 keeps media list6 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010055 begin');
      const v0: string = songsList[6].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[6].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list6').id));
      expect(v1).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010055 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5600
     * @tc.name: testDataMedia010056
     * @tc.desc: Verify songs entry 7 keeps media list5 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010056 begin');
      const v0: string = songsList[7].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[7].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list5').id));
      expect(v1).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010056 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5700
     * @tc.name: testDataMedia010057
     * @tc.desc: Verify songs entry 8 keeps media list4 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010057 begin');
      const v0: string = songsList[8].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[8].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list4').id));
      expect(v1).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010057 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5800
     * @tc.name: testDataMedia010058
     * @tc.desc: Verify songs entry 9 keeps media list3 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010058 begin');
      const v0: string = songsList[9].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[9].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list3').id));
      expect(v1).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010058 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_5900
     * @tc.name: testDataMedia010059
     * @tc.desc: Verify songs entry 10 keeps media list2 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010059 begin');
      const v0: string = songsList[10].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[10].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list2').id));
      expect(v1).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010059 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6000
     * @tc.name: testDataMedia010060
     * @tc.desc: Verify songs entry 11 keeps media list1 (aspect 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010060 begin');
      const v0: string = songsList[11].imageSrc.bundleName;
      hilog.info(DOMAIN, TAG, 'bundleName actual=%{public}s expected=%{public}s', String(v0), String(BUNDLE_NAME));
      expect(v0).assertEqual(BUNDLE_NAME);
      const v1: number = songsList[11].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010060 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6100
     * @tc.name: testDataMedia010061
     * @tc.desc: Verify songs entry 0 keeps media list12 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010061 begin');
      const v0: number = songsList[0].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[0].imageSrc.id === $r('app.media.list12').id));
      expect(songsList[0].imageSrc.id === $r('app.media.list12').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010061 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6200
     * @tc.name: testDataMedia010062
     * @tc.desc: Verify songs entry 1 keeps media list11 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010062 begin');
      const v0: number = songsList[1].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list11').id));
      expect(v0).assertEqual($r('app.media.list11').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[1].imageSrc.id === $r('app.media.list11').id));
      expect(songsList[1].imageSrc.id === $r('app.media.list11').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010062 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6300
     * @tc.name: testDataMedia010063
     * @tc.desc: Verify songs entry 2 keeps media list10 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010063 begin');
      const v0: number = songsList[2].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list10').id));
      expect(v0).assertEqual($r('app.media.list10').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[2].imageSrc.id === $r('app.media.list10').id));
      expect(songsList[2].imageSrc.id === $r('app.media.list10').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010063 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6400
     * @tc.name: testDataMedia010064
     * @tc.desc: Verify songs entry 3 keeps media list9 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010064 begin');
      const v0: number = songsList[3].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list9').id));
      expect(v0).assertEqual($r('app.media.list9').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[3].imageSrc.id === $r('app.media.list9').id));
      expect(songsList[3].imageSrc.id === $r('app.media.list9').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010064 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6500
     * @tc.name: testDataMedia010065
     * @tc.desc: Verify songs entry 4 keeps media list8 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010065 begin');
      const v0: number = songsList[4].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list8').id));
      expect(v0).assertEqual($r('app.media.list8').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[4].imageSrc.id === $r('app.media.list8').id));
      expect(songsList[4].imageSrc.id === $r('app.media.list8').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010065 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6600
     * @tc.name: testDataMedia010066
     * @tc.desc: Verify songs entry 5 keeps media list7 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010066 begin');
      const v0: number = songsList[5].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list7').id));
      expect(v0).assertEqual($r('app.media.list7').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[5].imageSrc.id === $r('app.media.list7').id));
      expect(songsList[5].imageSrc.id === $r('app.media.list7').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010066 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6700
     * @tc.name: testDataMedia010067
     * @tc.desc: Verify songs entry 6 keeps media list6 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010067 begin');
      const v0: number = songsList[6].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list6').id));
      expect(v0).assertEqual($r('app.media.list6').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[6].imageSrc.id === $r('app.media.list6').id));
      expect(songsList[6].imageSrc.id === $r('app.media.list6').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010067 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6800
     * @tc.name: testDataMedia010068
     * @tc.desc: Verify songs entry 7 keeps media list5 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010068 begin');
      const v0: number = songsList[7].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list5').id));
      expect(v0).assertEqual($r('app.media.list5').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[7].imageSrc.id === $r('app.media.list5').id));
      expect(songsList[7].imageSrc.id === $r('app.media.list5').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010068 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_6900
     * @tc.name: testDataMedia010069
     * @tc.desc: Verify songs entry 8 keeps media list4 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010069 begin');
      const v0: number = songsList[8].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list4').id));
      expect(v0).assertEqual($r('app.media.list4').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[8].imageSrc.id === $r('app.media.list4').id));
      expect(songsList[8].imageSrc.id === $r('app.media.list4').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010069 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_7000
     * @tc.name: testDataMedia010070
     * @tc.desc: Verify songs entry 9 keeps media list3 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010070 begin');
      const v0: number = songsList[9].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list3').id));
      expect(v0).assertEqual($r('app.media.list3').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[9].imageSrc.id === $r('app.media.list3').id));
      expect(songsList[9].imageSrc.id === $r('app.media.list3').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010070 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_7100
     * @tc.name: testDataMedia010071
     * @tc.desc: Verify songs entry 10 keeps media list2 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010071 begin');
      const v0: number = songsList[10].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list2').id));
      expect(v0).assertEqual($r('app.media.list2').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[10].imageSrc.id === $r('app.media.list2').id));
      expect(songsList[10].imageSrc.id === $r('app.media.list2').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010071 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_7200
     * @tc.name: testDataMedia010072
     * @tc.desc: Verify songs entry 11 keeps media list1 (aspect 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testDataMedia010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010072 begin');
      const v0: number = songsList[11].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'media-id-first-read actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list1').id));
      expect(v0).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'media-id-stable-vs-resource actual=%{public}s expected=true', String(songsList[11].imageSrc.id === $r('app.media.list1').id));
      expect(songsList[11].imageSrc.id === $r('app.media.list1').id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010072 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_7300
     * @tc.name: testDataMedia010073
     * @tc.desc: Anchor: songsList media mapping must stay reversed from list12 to list1
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataMedia010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010073 begin');
      const v0: number = songsList[0].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'index-0-media actual=%{public}s expected=%{public}s', String(v0), String($r('app.media.list12').id));
      expect(v0).assertEqual($r('app.media.list12').id);
      const v1: number = songsList[11].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'index-11-media actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'ends-differ actual=%{public}s expected=false', String(songsList[0].imageSrc.id === songsList[11].imageSrc.id));
      expect(songsList[0].imageSrc.id === songsList[11].imageSrc.id).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010073 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_7400
     * @tc.name: testDataMedia010074
     * @tc.desc: Anchor: songsList media ids must be pairwise distinct for all 12 entries
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataMedia010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010074 begin');
      hilog.info(DOMAIN, TAG, 'first-pair-distinct actual=%{public}s expected=true', String(songsList[0].imageSrc.id !== songsList[1].imageSrc.id));
      expect(songsList[0].imageSrc.id !== songsList[1].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'middle-pair-distinct actual=%{public}s expected=true', String(songsList[5].imageSrc.id !== songsList[6].imageSrc.id));
      expect(songsList[5].imageSrc.id !== songsList[6].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, 'last-pair-distinct actual=%{public}s expected=true', String(songsList[10].imageSrc.id !== songsList[11].imageSrc.id));
      expect(songsList[10].imageSrc.id !== songsList[11].imageSrc.id).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010074 end');
    })

    /**
     * @tc.number: SUB_MM_DATAMEDIA01_7500
     * @tc.name: testDataMedia010075
     * @tc.desc: Anchor: unknown index boundary of songsList must not return a media
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testDataMedia010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010075 begin');
      const v0: number = songsList.length;
      hilog.info(DOMAIN, TAG, 'list-length actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = songsList[songsList.length - 1].imageSrc.id;
      hilog.info(DOMAIN, TAG, 'last-entry-media actual=%{public}s expected=%{public}s', String(v1), String($r('app.media.list1').id));
      expect(v1).assertEqual($r('app.media.list1').id);
      hilog.info(DOMAIN, TAG, 'highest-valid-index actual=%{public}s expected=true', String(songsList.length - 1 === 11));
      expect(songsList.length - 1 === 11).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataMedia010075 end');
    })

  })
}
