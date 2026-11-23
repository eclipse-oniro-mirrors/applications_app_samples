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

// @volume rule=PaddingDataType-maps-constructor-args-to-left-and-right basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function modelMatrix04Test() {
  describe('ModelMatrix04', () => {

    /**
     * @tc.number: SUB_MM_MDLPAD01_0100
     * @tc.name: testMdlPad010001
     * @tc.desc: Verify PaddingDataType keeps left=1 and right=4 (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010001 begin');
      let pad: PaddingDataType = new PaddingDataType(1, 4);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(4));
      expect(v1).assertEqual(4);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010001 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_0200
     * @tc.name: testMdlPad010002
     * @tc.desc: Verify PaddingDataType keeps left=2 and right=7 (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010002 begin');
      let pad: PaddingDataType = new PaddingDataType(2, 7);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010002 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_0300
     * @tc.name: testMdlPad010003
     * @tc.desc: Verify PaddingDataType keeps left=3 and right=10 (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010003 begin');
      let pad: PaddingDataType = new PaddingDataType(3, 10);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(10));
      expect(v1).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010003 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_0400
     * @tc.name: testMdlPad010004
     * @tc.desc: Verify PaddingDataType keeps left=4 and right=13 (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010004 begin');
      let pad: PaddingDataType = new PaddingDataType(4, 13);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(13));
      expect(v1).assertEqual(13);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010004 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_0500
     * @tc.name: testMdlPad010005
     * @tc.desc: Verify PaddingDataType keeps left=5 and right=16 (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010005 begin');
      let pad: PaddingDataType = new PaddingDataType(5, 16);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(16));
      expect(v1).assertEqual(16);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010005 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_0600
     * @tc.name: testMdlPad010006
     * @tc.desc: Verify PaddingDataType keeps left=6 and right=19 (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010006 begin');
      let pad: PaddingDataType = new PaddingDataType(6, 19);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(19));
      expect(v1).assertEqual(19);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010006 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_0700
     * @tc.name: testMdlPad010007
     * @tc.desc: Verify PaddingDataType keeps left=7 and right=22 (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010007 begin');
      let pad: PaddingDataType = new PaddingDataType(7, 22);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(7));
      expect(v0).assertEqual(7);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(22));
      expect(v1).assertEqual(22);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010007 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_0800
     * @tc.name: testMdlPad010008
     * @tc.desc: Verify PaddingDataType keeps left=8 and right=25 (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010008 begin');
      let pad: PaddingDataType = new PaddingDataType(8, 25);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(25));
      expect(v1).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010008 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_0900
     * @tc.name: testMdlPad010009
     * @tc.desc: Verify PaddingDataType keeps left=9 and right=28 (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010009 begin');
      let pad: PaddingDataType = new PaddingDataType(9, 28);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(9));
      expect(v0).assertEqual(9);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(28));
      expect(v1).assertEqual(28);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010009 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1000
     * @tc.name: testMdlPad010010
     * @tc.desc: Verify PaddingDataType keeps left=10 and right=31 (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010010 begin');
      let pad: PaddingDataType = new PaddingDataType(10, 31);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(10));
      expect(v0).assertEqual(10);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(31));
      expect(v1).assertEqual(31);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010010 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1100
     * @tc.name: testMdlPad010011
     * @tc.desc: Verify PaddingDataType keeps left=11 and right=34 (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010011 begin');
      let pad: PaddingDataType = new PaddingDataType(11, 34);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(11));
      expect(v0).assertEqual(11);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(34));
      expect(v1).assertEqual(34);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010011 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1200
     * @tc.name: testMdlPad010012
     * @tc.desc: Verify PaddingDataType keeps left=12 and right=37 (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010012 begin');
      let pad: PaddingDataType = new PaddingDataType(12, 37);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(37));
      expect(v1).assertEqual(37);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010012 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1300
     * @tc.name: testMdlPad010013
     * @tc.desc: Verify PaddingDataType keeps left=13 and right=40 (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010013 begin');
      let pad: PaddingDataType = new PaddingDataType(13, 40);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(13));
      expect(v0).assertEqual(13);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(40));
      expect(v1).assertEqual(40);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010013 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1400
     * @tc.name: testMdlPad010014
     * @tc.desc: Verify PaddingDataType keeps left=14 and right=43 (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010014 begin');
      let pad: PaddingDataType = new PaddingDataType(14, 43);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(14));
      expect(v0).assertEqual(14);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(43));
      expect(v1).assertEqual(43);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010014 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1500
     * @tc.name: testMdlPad010015
     * @tc.desc: Verify PaddingDataType keeps left=15 and right=46 (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010015 begin');
      let pad: PaddingDataType = new PaddingDataType(15, 46);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(15));
      expect(v0).assertEqual(15);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(46));
      expect(v1).assertEqual(46);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010015 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1600
     * @tc.name: testMdlPad010016
     * @tc.desc: Verify PaddingDataType keeps left=16 and right=49 (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010016 begin');
      let pad: PaddingDataType = new PaddingDataType(16, 49);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(49));
      expect(v1).assertEqual(49);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010016 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1700
     * @tc.name: testMdlPad010017
     * @tc.desc: Verify PaddingDataType keeps left=17 and right=52 (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010017 begin');
      let pad: PaddingDataType = new PaddingDataType(17, 52);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(17));
      expect(v0).assertEqual(17);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(52));
      expect(v1).assertEqual(52);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010017 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1800
     * @tc.name: testMdlPad010018
     * @tc.desc: Verify PaddingDataType keeps left=18 and right=55 (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010018 begin');
      let pad: PaddingDataType = new PaddingDataType(18, 55);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(18));
      expect(v0).assertEqual(18);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(55));
      expect(v1).assertEqual(55);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010018 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_1900
     * @tc.name: testMdlPad010019
     * @tc.desc: Verify PaddingDataType keeps left=19 and right=58 (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010019 begin');
      let pad: PaddingDataType = new PaddingDataType(19, 58);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(19));
      expect(v0).assertEqual(19);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(58));
      expect(v1).assertEqual(58);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010019 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2000
     * @tc.name: testMdlPad010020
     * @tc.desc: Verify PaddingDataType keeps left=20 and right=61 (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010020 begin');
      let pad: PaddingDataType = new PaddingDataType(20, 61);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(20));
      expect(v0).assertEqual(20);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(61));
      expect(v1).assertEqual(61);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010020 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2100
     * @tc.name: testMdlPad010021
     * @tc.desc: Verify PaddingDataType keeps left=21 and right=64 (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010021 begin');
      let pad: PaddingDataType = new PaddingDataType(21, 64);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(21));
      expect(v0).assertEqual(21);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(64));
      expect(v1).assertEqual(64);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010021 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2200
     * @tc.name: testMdlPad010022
     * @tc.desc: Verify PaddingDataType keeps left=22 and right=67 (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010022 begin');
      let pad: PaddingDataType = new PaddingDataType(22, 67);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(22));
      expect(v0).assertEqual(22);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(67));
      expect(v1).assertEqual(67);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010022 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2300
     * @tc.name: testMdlPad010023
     * @tc.desc: Verify PaddingDataType keeps left=23 and right=70 (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010023 begin');
      let pad: PaddingDataType = new PaddingDataType(23, 70);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(23));
      expect(v0).assertEqual(23);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(70));
      expect(v1).assertEqual(70);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010023 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2400
     * @tc.name: testMdlPad010024
     * @tc.desc: Verify PaddingDataType keeps left=24 and right=73 (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010024 begin');
      let pad: PaddingDataType = new PaddingDataType(24, 73);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(24));
      expect(v0).assertEqual(24);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(73));
      expect(v1).assertEqual(73);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010024 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2500
     * @tc.name: testMdlPad010025
     * @tc.desc: Verify PaddingDataType keeps left=25 and right=76 (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010025 begin');
      let pad: PaddingDataType = new PaddingDataType(25, 76);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(25));
      expect(v0).assertEqual(25);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(76));
      expect(v1).assertEqual(76);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010025 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2600
     * @tc.name: testMdlPad010026
     * @tc.desc: Verify PaddingDataType keeps left=26 and right=79 (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010026 begin');
      let pad: PaddingDataType = new PaddingDataType(26, 79);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(26));
      expect(v0).assertEqual(26);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(79));
      expect(v1).assertEqual(79);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010026 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2700
     * @tc.name: testMdlPad010027
     * @tc.desc: Verify PaddingDataType keeps left=27 and right=82 (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010027 begin');
      let pad: PaddingDataType = new PaddingDataType(27, 82);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(27));
      expect(v0).assertEqual(27);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(82));
      expect(v1).assertEqual(82);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010027 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2800
     * @tc.name: testMdlPad010028
     * @tc.desc: Verify PaddingDataType keeps left=28 and right=85 (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010028 begin');
      let pad: PaddingDataType = new PaddingDataType(28, 85);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(28));
      expect(v0).assertEqual(28);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(85));
      expect(v1).assertEqual(85);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010028 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_2900
     * @tc.name: testMdlPad010029
     * @tc.desc: Verify PaddingDataType keeps left=29 and right=88 (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010029 begin');
      let pad: PaddingDataType = new PaddingDataType(29, 88);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(29));
      expect(v0).assertEqual(29);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(88));
      expect(v1).assertEqual(88);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010029 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3000
     * @tc.name: testMdlPad010030
     * @tc.desc: Verify PaddingDataType keeps left=30 and right=91 (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010030 begin');
      let pad: PaddingDataType = new PaddingDataType(30, 91);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(30));
      expect(v0).assertEqual(30);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(91));
      expect(v1).assertEqual(91);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010030 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3100
     * @tc.name: testMdlPad010031
     * @tc.desc: Verify PaddingDataType keeps left=31 and right=94 (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010031 begin');
      let pad: PaddingDataType = new PaddingDataType(31, 94);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(31));
      expect(v0).assertEqual(31);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(94));
      expect(v1).assertEqual(94);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010031 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3200
     * @tc.name: testMdlPad010032
     * @tc.desc: Verify PaddingDataType keeps left=32 and right=97 (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010032 begin');
      let pad: PaddingDataType = new PaddingDataType(32, 97);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(32));
      expect(v0).assertEqual(32);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(97));
      expect(v1).assertEqual(97);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010032 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3300
     * @tc.name: testMdlPad010033
     * @tc.desc: Verify PaddingDataType keeps left=33 and right=100 (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010033 begin');
      let pad: PaddingDataType = new PaddingDataType(33, 100);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(33));
      expect(v0).assertEqual(33);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(100));
      expect(v1).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010033 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3400
     * @tc.name: testMdlPad010034
     * @tc.desc: Verify PaddingDataType keeps left=34 and right=103 (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010034 begin');
      let pad: PaddingDataType = new PaddingDataType(34, 103);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(34));
      expect(v0).assertEqual(34);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(103));
      expect(v1).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010034 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3500
     * @tc.name: testMdlPad010035
     * @tc.desc: Verify PaddingDataType keeps left=35 and right=106 (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010035 begin');
      let pad: PaddingDataType = new PaddingDataType(35, 106);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(35));
      expect(v0).assertEqual(35);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(106));
      expect(v1).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010035 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3600
     * @tc.name: testMdlPad010036
     * @tc.desc: Verify PaddingDataType keeps left=36 and right=109 (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010036 begin');
      let pad: PaddingDataType = new PaddingDataType(36, 109);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(36));
      expect(v0).assertEqual(36);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(109));
      expect(v1).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010036 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3700
     * @tc.name: testMdlPad010037
     * @tc.desc: Verify PaddingDataType keeps left=37 and right=112 (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010037 begin');
      let pad: PaddingDataType = new PaddingDataType(37, 112);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(37));
      expect(v0).assertEqual(37);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(112));
      expect(v1).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010037 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3800
     * @tc.name: testMdlPad010038
     * @tc.desc: Verify PaddingDataType keeps left=38 and right=115 (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010038 begin');
      let pad: PaddingDataType = new PaddingDataType(38, 115);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(38));
      expect(v0).assertEqual(38);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(115));
      expect(v1).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010038 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_3900
     * @tc.name: testMdlPad010039
     * @tc.desc: Verify PaddingDataType keeps left=39 and right=118 (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010039 begin');
      let pad: PaddingDataType = new PaddingDataType(39, 118);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(39));
      expect(v0).assertEqual(39);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(118));
      expect(v1).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010039 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4000
     * @tc.name: testMdlPad010040
     * @tc.desc: Verify PaddingDataType keeps left=40 and right=121 (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010040 begin');
      let pad: PaddingDataType = new PaddingDataType(40, 121);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(40));
      expect(v0).assertEqual(40);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(121));
      expect(v1).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010040 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4100
     * @tc.name: testMdlPad010041
     * @tc.desc: Verify PaddingDataType keeps left=41 and right=124 (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010041 begin');
      let pad: PaddingDataType = new PaddingDataType(41, 124);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(41));
      expect(v0).assertEqual(41);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(124));
      expect(v1).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010041 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4200
     * @tc.name: testMdlPad010042
     * @tc.desc: Verify PaddingDataType keeps left=42 and right=127 (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010042 begin');
      let pad: PaddingDataType = new PaddingDataType(42, 127);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(42));
      expect(v0).assertEqual(42);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(127));
      expect(v1).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010042 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4300
     * @tc.name: testMdlPad010043
     * @tc.desc: Verify PaddingDataType keeps left=43 and right=130 (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010043 begin');
      let pad: PaddingDataType = new PaddingDataType(43, 130);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(43));
      expect(v0).assertEqual(43);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(130));
      expect(v1).assertEqual(130);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010043 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4400
     * @tc.name: testMdlPad010044
     * @tc.desc: Verify PaddingDataType keeps left=44 and right=133 (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010044 begin');
      let pad: PaddingDataType = new PaddingDataType(44, 133);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(44));
      expect(v0).assertEqual(44);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(133));
      expect(v1).assertEqual(133);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010044 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4500
     * @tc.name: testMdlPad010045
     * @tc.desc: Verify PaddingDataType keeps left=45 and right=136 (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010045 begin');
      let pad: PaddingDataType = new PaddingDataType(45, 136);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(45));
      expect(v0).assertEqual(45);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(136));
      expect(v1).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010045 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4600
     * @tc.name: testMdlPad010046
     * @tc.desc: Verify PaddingDataType keeps left=46 and right=139 (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010046 begin');
      let pad: PaddingDataType = new PaddingDataType(46, 139);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(46));
      expect(v0).assertEqual(46);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(139));
      expect(v1).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010046 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4700
     * @tc.name: testMdlPad010047
     * @tc.desc: Verify PaddingDataType keeps left=47 and right=142 (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010047 begin');
      let pad: PaddingDataType = new PaddingDataType(47, 142);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(47));
      expect(v0).assertEqual(47);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(142));
      expect(v1).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010047 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4800
     * @tc.name: testMdlPad010048
     * @tc.desc: Verify PaddingDataType keeps left=48 and right=145 (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010048 begin');
      let pad: PaddingDataType = new PaddingDataType(48, 145);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(48));
      expect(v0).assertEqual(48);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(145));
      expect(v1).assertEqual(145);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010048 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_4900
     * @tc.name: testMdlPad010049
     * @tc.desc: Verify PaddingDataType keeps left=49 and right=148 (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010049 begin');
      let pad: PaddingDataType = new PaddingDataType(49, 148);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(49));
      expect(v0).assertEqual(49);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(148));
      expect(v1).assertEqual(148);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010049 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5000
     * @tc.name: testMdlPad010050
     * @tc.desc: Verify PaddingDataType keeps left=50 and right=151 (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010050 begin');
      let pad: PaddingDataType = new PaddingDataType(50, 151);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(50));
      expect(v0).assertEqual(50);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(151));
      expect(v1).assertEqual(151);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010050 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5100
     * @tc.name: testMdlPad010051
     * @tc.desc: Verify PaddingDataType keeps left=51 and right=154 (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010051 begin');
      let pad: PaddingDataType = new PaddingDataType(51, 154);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(51));
      expect(v0).assertEqual(51);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(154));
      expect(v1).assertEqual(154);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010051 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5200
     * @tc.name: testMdlPad010052
     * @tc.desc: Verify PaddingDataType keeps left=52 and right=157 (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010052 begin');
      let pad: PaddingDataType = new PaddingDataType(52, 157);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(52));
      expect(v0).assertEqual(52);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(157));
      expect(v1).assertEqual(157);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010052 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5300
     * @tc.name: testMdlPad010053
     * @tc.desc: Verify PaddingDataType keeps left=53 and right=160 (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010053 begin');
      let pad: PaddingDataType = new PaddingDataType(53, 160);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(53));
      expect(v0).assertEqual(53);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(160));
      expect(v1).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010053 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5400
     * @tc.name: testMdlPad010054
     * @tc.desc: Verify PaddingDataType keeps left=54 and right=163 (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010054 begin');
      let pad: PaddingDataType = new PaddingDataType(54, 163);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(54));
      expect(v0).assertEqual(54);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(163));
      expect(v1).assertEqual(163);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010054 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5500
     * @tc.name: testMdlPad010055
     * @tc.desc: Verify PaddingDataType keeps left=55 and right=166 (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010055 begin');
      let pad: PaddingDataType = new PaddingDataType(55, 166);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(55));
      expect(v0).assertEqual(55);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(166));
      expect(v1).assertEqual(166);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010055 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5600
     * @tc.name: testMdlPad010056
     * @tc.desc: Verify PaddingDataType keeps left=56 and right=169 (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010056 begin');
      let pad: PaddingDataType = new PaddingDataType(56, 169);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(56));
      expect(v0).assertEqual(56);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(169));
      expect(v1).assertEqual(169);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010056 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5700
     * @tc.name: testMdlPad010057
     * @tc.desc: Verify PaddingDataType keeps left=57 and right=172 (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010057 begin');
      let pad: PaddingDataType = new PaddingDataType(57, 172);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(57));
      expect(v0).assertEqual(57);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(172));
      expect(v1).assertEqual(172);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010057 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5800
     * @tc.name: testMdlPad010058
     * @tc.desc: Verify PaddingDataType keeps left=58 and right=175 (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010058 begin');
      let pad: PaddingDataType = new PaddingDataType(58, 175);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(58));
      expect(v0).assertEqual(58);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(175));
      expect(v1).assertEqual(175);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010058 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_5900
     * @tc.name: testMdlPad010059
     * @tc.desc: Verify PaddingDataType keeps left=59 and right=178 (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010059 begin');
      let pad: PaddingDataType = new PaddingDataType(59, 178);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(59));
      expect(v0).assertEqual(59);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(178));
      expect(v1).assertEqual(178);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010059 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6000
     * @tc.name: testMdlPad010060
     * @tc.desc: Verify PaddingDataType keeps left=60 and right=181 (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010060 begin');
      let pad: PaddingDataType = new PaddingDataType(60, 181);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(60));
      expect(v0).assertEqual(60);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(181));
      expect(v1).assertEqual(181);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010060 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6100
     * @tc.name: testMdlPad010061
     * @tc.desc: Verify PaddingDataType keeps left=61 and right=184 (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010061 begin');
      let pad: PaddingDataType = new PaddingDataType(61, 184);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(61));
      expect(v0).assertEqual(61);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(184));
      expect(v1).assertEqual(184);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010061 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6200
     * @tc.name: testMdlPad010062
     * @tc.desc: Verify PaddingDataType keeps left=62 and right=187 (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010062 begin');
      let pad: PaddingDataType = new PaddingDataType(62, 187);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(62));
      expect(v0).assertEqual(62);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(187));
      expect(v1).assertEqual(187);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010062 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6300
     * @tc.name: testMdlPad010063
     * @tc.desc: Verify PaddingDataType keeps left=63 and right=190 (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010063 begin');
      let pad: PaddingDataType = new PaddingDataType(63, 190);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(63));
      expect(v0).assertEqual(63);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(190));
      expect(v1).assertEqual(190);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010063 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6400
     * @tc.name: testMdlPad010064
     * @tc.desc: Verify PaddingDataType keeps left=64 and right=193 (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010064 begin');
      let pad: PaddingDataType = new PaddingDataType(64, 193);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(64));
      expect(v0).assertEqual(64);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(193));
      expect(v1).assertEqual(193);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010064 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6500
     * @tc.name: testMdlPad010065
     * @tc.desc: Verify PaddingDataType keeps left=65 and right=196 (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010065 begin');
      let pad: PaddingDataType = new PaddingDataType(65, 196);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(65));
      expect(v0).assertEqual(65);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(196));
      expect(v1).assertEqual(196);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010065 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6600
     * @tc.name: testMdlPad010066
     * @tc.desc: Verify PaddingDataType keeps left=66 and right=199 (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010066 begin');
      let pad: PaddingDataType = new PaddingDataType(66, 199);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(66));
      expect(v0).assertEqual(66);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(199));
      expect(v1).assertEqual(199);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010066 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6700
     * @tc.name: testMdlPad010067
     * @tc.desc: Verify PaddingDataType keeps left=67 and right=202 (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010067 begin');
      let pad: PaddingDataType = new PaddingDataType(67, 202);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(67));
      expect(v0).assertEqual(67);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(202));
      expect(v1).assertEqual(202);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010067 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6800
     * @tc.name: testMdlPad010068
     * @tc.desc: Verify PaddingDataType keeps left=68 and right=205 (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010068 begin');
      let pad: PaddingDataType = new PaddingDataType(68, 205);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(68));
      expect(v0).assertEqual(68);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(205));
      expect(v1).assertEqual(205);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010068 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_6900
     * @tc.name: testMdlPad010069
     * @tc.desc: Verify PaddingDataType keeps left=69 and right=208 (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010069 begin');
      let pad: PaddingDataType = new PaddingDataType(69, 208);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(69));
      expect(v0).assertEqual(69);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(208));
      expect(v1).assertEqual(208);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010069 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_7000
     * @tc.name: testMdlPad010070
     * @tc.desc: Verify PaddingDataType keeps left=70 and right=211 (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010070 begin');
      let pad: PaddingDataType = new PaddingDataType(70, 211);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(70));
      expect(v0).assertEqual(70);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(211));
      expect(v1).assertEqual(211);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010070 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_7100
     * @tc.name: testMdlPad010071
     * @tc.desc: Verify PaddingDataType keeps left=71 and right=214 (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010071 begin');
      let pad: PaddingDataType = new PaddingDataType(71, 214);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(71));
      expect(v0).assertEqual(71);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(214));
      expect(v1).assertEqual(214);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010071 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_7200
     * @tc.name: testMdlPad010072
     * @tc.desc: Verify PaddingDataType keeps left=72 and right=217 (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010072 begin');
      let pad: PaddingDataType = new PaddingDataType(72, 217);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(72));
      expect(v0).assertEqual(72);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(217));
      expect(v1).assertEqual(217);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010072 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_7300
     * @tc.name: testMdlPad010073
     * @tc.desc: Verify PaddingDataType keeps left=73 and right=220 (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlPad010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010073 begin');
      let pad: PaddingDataType = new PaddingDataType(73, 220);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left actual=%{public}s expected=%{public}s', String(v0), String(73));
      expect(v0).assertEqual(73);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right actual=%{public}s expected=%{public}s', String(v1), String(220));
      expect(v1).assertEqual(220);
      hilog.info(DOMAIN, TAG, 'right-larger-than-left actual=%{public}s expected=true', String(pad.right > pad.left));
      expect(pad.right > pad.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010073 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_7400
     * @tc.name: testMdlPad010074
     * @tc.desc: Anchor: large padding values must not overflow the fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlPad010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010074 begin');
      let pad: PaddingDataType = new PaddingDataType(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER - 1);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left-max actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MAX_SAFE_INTEGER);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right-max-minus-one actual=%{public}s expected=%{public}s', String(v1), String(Number.MAX_SAFE_INTEGER - 1));
      expect(v1).assertEqual(Number.MAX_SAFE_INTEGER - 1);
      hilog.info(DOMAIN, TAG, 'left-greater actual=%{public}s expected=true', String(pad.left > pad.right));
      expect(pad.left > pad.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010074 end');
    })

    /**
     * @tc.number: SUB_MM_MDLPAD01_7500
     * @tc.name: testMdlPad010075
     * @tc.desc: Anchor: zero and negative boundaries must be preserved verbatim
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlPad010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010075 begin');
      let off: OffsetDataType = new OffsetDataType(0, -0);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x-zero actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y-negative-zero actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'both-are-zero actual=%{public}s expected=true', String(off.x === off.y));
      expect(off.x === off.y).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlPad010075 end');
    })

  })
}
