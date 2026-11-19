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

// @volume rule=OffsetDataType-maps-constructor-args-to-x-and-y basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function modelMatrix03Test() {
  describe('ModelMatrix03', () => {

    /**
     * @tc.number: SUB_MM_MDLOFF01_0100
     * @tc.name: testMdlOff010001
     * @tc.desc: Verify OffsetDataType keeps x=-36 and y=-2 without swapping (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010001 begin');
      let off: OffsetDataType = new OffsetDataType(-36, -2);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-36));
      expect(v0).assertEqual(-36);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-2));
      expect(v1).assertEqual(-2);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010001 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_0200
     * @tc.name: testMdlOff010002
     * @tc.desc: Verify OffsetDataType keeps x=-35 and y=-4 without swapping (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010002 begin');
      let off: OffsetDataType = new OffsetDataType(-35, -4);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-35));
      expect(v0).assertEqual(-35);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-4));
      expect(v1).assertEqual(-4);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010002 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_0300
     * @tc.name: testMdlOff010003
     * @tc.desc: Verify OffsetDataType keeps x=-34 and y=-6 without swapping (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010003 begin');
      let off: OffsetDataType = new OffsetDataType(-34, -6);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-34));
      expect(v0).assertEqual(-34);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-6));
      expect(v1).assertEqual(-6);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010003 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_0400
     * @tc.name: testMdlOff010004
     * @tc.desc: Verify OffsetDataType keeps x=-33 and y=-8 without swapping (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010004 begin');
      let off: OffsetDataType = new OffsetDataType(-33, -8);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-33));
      expect(v0).assertEqual(-33);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-8));
      expect(v1).assertEqual(-8);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010004 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_0500
     * @tc.name: testMdlOff010005
     * @tc.desc: Verify OffsetDataType keeps x=-32 and y=-10 without swapping (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010005 begin');
      let off: OffsetDataType = new OffsetDataType(-32, -10);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-32));
      expect(v0).assertEqual(-32);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-10));
      expect(v1).assertEqual(-10);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010005 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_0600
     * @tc.name: testMdlOff010006
     * @tc.desc: Verify OffsetDataType keeps x=-31 and y=-12 without swapping (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010006 begin');
      let off: OffsetDataType = new OffsetDataType(-31, -12);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-31));
      expect(v0).assertEqual(-31);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-12));
      expect(v1).assertEqual(-12);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010006 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_0700
     * @tc.name: testMdlOff010007
     * @tc.desc: Verify OffsetDataType keeps x=-30 and y=-14 without swapping (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010007 begin');
      let off: OffsetDataType = new OffsetDataType(-30, -14);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-30));
      expect(v0).assertEqual(-30);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-14));
      expect(v1).assertEqual(-14);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010007 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_0800
     * @tc.name: testMdlOff010008
     * @tc.desc: Verify OffsetDataType keeps x=-29 and y=-16 without swapping (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010008 begin');
      let off: OffsetDataType = new OffsetDataType(-29, -16);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-29));
      expect(v0).assertEqual(-29);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-16));
      expect(v1).assertEqual(-16);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010008 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_0900
     * @tc.name: testMdlOff010009
     * @tc.desc: Verify OffsetDataType keeps x=-28 and y=-18 without swapping (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010009 begin');
      let off: OffsetDataType = new OffsetDataType(-28, -18);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-28));
      expect(v0).assertEqual(-28);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-18));
      expect(v1).assertEqual(-18);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010009 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1000
     * @tc.name: testMdlOff010010
     * @tc.desc: Verify OffsetDataType keeps x=-27 and y=-20 without swapping (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010010 begin');
      let off: OffsetDataType = new OffsetDataType(-27, -20);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-27));
      expect(v0).assertEqual(-27);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-20));
      expect(v1).assertEqual(-20);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010010 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1100
     * @tc.name: testMdlOff010011
     * @tc.desc: Verify OffsetDataType keeps x=-26 and y=-22 without swapping (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010011 begin');
      let off: OffsetDataType = new OffsetDataType(-26, -22);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-26));
      expect(v0).assertEqual(-26);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-22));
      expect(v1).assertEqual(-22);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010011 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1200
     * @tc.name: testMdlOff010012
     * @tc.desc: Verify OffsetDataType keeps x=-25 and y=-24 without swapping (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010012 begin');
      let off: OffsetDataType = new OffsetDataType(-25, -24);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-25));
      expect(v0).assertEqual(-25);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-24));
      expect(v1).assertEqual(-24);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010012 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1300
     * @tc.name: testMdlOff010013
     * @tc.desc: Verify OffsetDataType keeps x=-24 and y=-26 without swapping (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010013 begin');
      let off: OffsetDataType = new OffsetDataType(-24, -26);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-24));
      expect(v0).assertEqual(-24);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-26));
      expect(v1).assertEqual(-26);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010013 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1400
     * @tc.name: testMdlOff010014
     * @tc.desc: Verify OffsetDataType keeps x=-23 and y=-28 without swapping (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010014 begin');
      let off: OffsetDataType = new OffsetDataType(-23, -28);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-23));
      expect(v0).assertEqual(-23);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-28));
      expect(v1).assertEqual(-28);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010014 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1500
     * @tc.name: testMdlOff010015
     * @tc.desc: Verify OffsetDataType keeps x=-22 and y=-30 without swapping (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010015 begin');
      let off: OffsetDataType = new OffsetDataType(-22, -30);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-22));
      expect(v0).assertEqual(-22);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-30));
      expect(v1).assertEqual(-30);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010015 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1600
     * @tc.name: testMdlOff010016
     * @tc.desc: Verify OffsetDataType keeps x=-21 and y=-32 without swapping (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010016 begin');
      let off: OffsetDataType = new OffsetDataType(-21, -32);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-21));
      expect(v0).assertEqual(-21);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-32));
      expect(v1).assertEqual(-32);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010016 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1700
     * @tc.name: testMdlOff010017
     * @tc.desc: Verify OffsetDataType keeps x=-20 and y=-34 without swapping (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010017 begin');
      let off: OffsetDataType = new OffsetDataType(-20, -34);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-20));
      expect(v0).assertEqual(-20);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-34));
      expect(v1).assertEqual(-34);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010017 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1800
     * @tc.name: testMdlOff010018
     * @tc.desc: Verify OffsetDataType keeps x=-19 and y=-36 without swapping (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010018 begin');
      let off: OffsetDataType = new OffsetDataType(-19, -36);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-19));
      expect(v0).assertEqual(-19);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-36));
      expect(v1).assertEqual(-36);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010018 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_1900
     * @tc.name: testMdlOff010019
     * @tc.desc: Verify OffsetDataType keeps x=-18 and y=-38 without swapping (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010019 begin');
      let off: OffsetDataType = new OffsetDataType(-18, -38);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-18));
      expect(v0).assertEqual(-18);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-38));
      expect(v1).assertEqual(-38);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010019 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2000
     * @tc.name: testMdlOff010020
     * @tc.desc: Verify OffsetDataType keeps x=-17 and y=-40 without swapping (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010020 begin');
      let off: OffsetDataType = new OffsetDataType(-17, -40);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-17));
      expect(v0).assertEqual(-17);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-40));
      expect(v1).assertEqual(-40);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010020 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2100
     * @tc.name: testMdlOff010021
     * @tc.desc: Verify OffsetDataType keeps x=-16 and y=-42 without swapping (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010021 begin');
      let off: OffsetDataType = new OffsetDataType(-16, -42);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-16));
      expect(v0).assertEqual(-16);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-42));
      expect(v1).assertEqual(-42);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010021 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2200
     * @tc.name: testMdlOff010022
     * @tc.desc: Verify OffsetDataType keeps x=-15 and y=-44 without swapping (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010022 begin');
      let off: OffsetDataType = new OffsetDataType(-15, -44);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-15));
      expect(v0).assertEqual(-15);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-44));
      expect(v1).assertEqual(-44);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010022 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2300
     * @tc.name: testMdlOff010023
     * @tc.desc: Verify OffsetDataType keeps x=-14 and y=-46 without swapping (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010023 begin');
      let off: OffsetDataType = new OffsetDataType(-14, -46);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-14));
      expect(v0).assertEqual(-14);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-46));
      expect(v1).assertEqual(-46);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010023 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2400
     * @tc.name: testMdlOff010024
     * @tc.desc: Verify OffsetDataType keeps x=-13 and y=-48 without swapping (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010024 begin');
      let off: OffsetDataType = new OffsetDataType(-13, -48);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-13));
      expect(v0).assertEqual(-13);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-48));
      expect(v1).assertEqual(-48);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010024 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2500
     * @tc.name: testMdlOff010025
     * @tc.desc: Verify OffsetDataType keeps x=-12 and y=-50 without swapping (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010025 begin');
      let off: OffsetDataType = new OffsetDataType(-12, -50);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-12));
      expect(v0).assertEqual(-12);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-50));
      expect(v1).assertEqual(-50);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010025 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2600
     * @tc.name: testMdlOff010026
     * @tc.desc: Verify OffsetDataType keeps x=-11 and y=-52 without swapping (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010026 begin');
      let off: OffsetDataType = new OffsetDataType(-11, -52);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-11));
      expect(v0).assertEqual(-11);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-52));
      expect(v1).assertEqual(-52);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010026 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2700
     * @tc.name: testMdlOff010027
     * @tc.desc: Verify OffsetDataType keeps x=-10 and y=-54 without swapping (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010027 begin');
      let off: OffsetDataType = new OffsetDataType(-10, -54);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-10));
      expect(v0).assertEqual(-10);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-54));
      expect(v1).assertEqual(-54);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010027 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2800
     * @tc.name: testMdlOff010028
     * @tc.desc: Verify OffsetDataType keeps x=-9 and y=-56 without swapping (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010028 begin');
      let off: OffsetDataType = new OffsetDataType(-9, -56);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-9));
      expect(v0).assertEqual(-9);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-56));
      expect(v1).assertEqual(-56);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010028 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_2900
     * @tc.name: testMdlOff010029
     * @tc.desc: Verify OffsetDataType keeps x=-8 and y=-58 without swapping (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010029 begin');
      let off: OffsetDataType = new OffsetDataType(-8, -58);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-8));
      expect(v0).assertEqual(-8);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-58));
      expect(v1).assertEqual(-58);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010029 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3000
     * @tc.name: testMdlOff010030
     * @tc.desc: Verify OffsetDataType keeps x=-7 and y=-60 without swapping (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010030 begin');
      let off: OffsetDataType = new OffsetDataType(-7, -60);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-7));
      expect(v0).assertEqual(-7);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-60));
      expect(v1).assertEqual(-60);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010030 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3100
     * @tc.name: testMdlOff010031
     * @tc.desc: Verify OffsetDataType keeps x=-6 and y=-62 without swapping (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010031 begin');
      let off: OffsetDataType = new OffsetDataType(-6, -62);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-6));
      expect(v0).assertEqual(-6);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-62));
      expect(v1).assertEqual(-62);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010031 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3200
     * @tc.name: testMdlOff010032
     * @tc.desc: Verify OffsetDataType keeps x=-5 and y=-64 without swapping (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010032 begin');
      let off: OffsetDataType = new OffsetDataType(-5, -64);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-5));
      expect(v0).assertEqual(-5);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-64));
      expect(v1).assertEqual(-64);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010032 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3300
     * @tc.name: testMdlOff010033
     * @tc.desc: Verify OffsetDataType keeps x=-4 and y=-66 without swapping (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010033 begin');
      let off: OffsetDataType = new OffsetDataType(-4, -66);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-4));
      expect(v0).assertEqual(-4);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-66));
      expect(v1).assertEqual(-66);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010033 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3400
     * @tc.name: testMdlOff010034
     * @tc.desc: Verify OffsetDataType keeps x=-3 and y=-68 without swapping (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010034 begin');
      let off: OffsetDataType = new OffsetDataType(-3, -68);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-3));
      expect(v0).assertEqual(-3);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-68));
      expect(v1).assertEqual(-68);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010034 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3500
     * @tc.name: testMdlOff010035
     * @tc.desc: Verify OffsetDataType keeps x=-2 and y=-70 without swapping (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010035 begin');
      let off: OffsetDataType = new OffsetDataType(-2, -70);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-2));
      expect(v0).assertEqual(-2);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-70));
      expect(v1).assertEqual(-70);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010035 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3600
     * @tc.name: testMdlOff010036
     * @tc.desc: Verify OffsetDataType keeps x=-1 and y=-72 without swapping (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010036 begin');
      let off: OffsetDataType = new OffsetDataType(-1, -72);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(-1));
      expect(v0).assertEqual(-1);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-72));
      expect(v1).assertEqual(-72);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010036 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3700
     * @tc.name: testMdlOff010037
     * @tc.desc: Verify OffsetDataType keeps x=0 and y=-74 without swapping (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010037 begin');
      let off: OffsetDataType = new OffsetDataType(0, -74);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-74));
      expect(v1).assertEqual(-74);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010037 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3800
     * @tc.name: testMdlOff010038
     * @tc.desc: Verify OffsetDataType keeps x=1 and y=-76 without swapping (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010038 begin');
      let off: OffsetDataType = new OffsetDataType(1, -76);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(1));
      expect(v0).assertEqual(1);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-76));
      expect(v1).assertEqual(-76);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010038 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_3900
     * @tc.name: testMdlOff010039
     * @tc.desc: Verify OffsetDataType keeps x=2 and y=-78 without swapping (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010039 begin');
      let off: OffsetDataType = new OffsetDataType(2, -78);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-78));
      expect(v1).assertEqual(-78);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010039 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4000
     * @tc.name: testMdlOff010040
     * @tc.desc: Verify OffsetDataType keeps x=3 and y=-80 without swapping (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010040 begin');
      let off: OffsetDataType = new OffsetDataType(3, -80);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(3));
      expect(v0).assertEqual(3);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-80));
      expect(v1).assertEqual(-80);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010040 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4100
     * @tc.name: testMdlOff010041
     * @tc.desc: Verify OffsetDataType keeps x=4 and y=-82 without swapping (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010041 begin');
      let off: OffsetDataType = new OffsetDataType(4, -82);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-82));
      expect(v1).assertEqual(-82);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010041 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4200
     * @tc.name: testMdlOff010042
     * @tc.desc: Verify OffsetDataType keeps x=5 and y=-84 without swapping (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010042 begin');
      let off: OffsetDataType = new OffsetDataType(5, -84);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(5));
      expect(v0).assertEqual(5);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-84));
      expect(v1).assertEqual(-84);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010042 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4300
     * @tc.name: testMdlOff010043
     * @tc.desc: Verify OffsetDataType keeps x=6 and y=-86 without swapping (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010043 begin');
      let off: OffsetDataType = new OffsetDataType(6, -86);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-86));
      expect(v1).assertEqual(-86);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010043 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4400
     * @tc.name: testMdlOff010044
     * @tc.desc: Verify OffsetDataType keeps x=7 and y=-88 without swapping (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010044 begin');
      let off: OffsetDataType = new OffsetDataType(7, -88);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(7));
      expect(v0).assertEqual(7);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-88));
      expect(v1).assertEqual(-88);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010044 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4500
     * @tc.name: testMdlOff010045
     * @tc.desc: Verify OffsetDataType keeps x=8 and y=-90 without swapping (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010045 begin');
      let off: OffsetDataType = new OffsetDataType(8, -90);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-90));
      expect(v1).assertEqual(-90);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010045 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4600
     * @tc.name: testMdlOff010046
     * @tc.desc: Verify OffsetDataType keeps x=9 and y=-92 without swapping (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010046 begin');
      let off: OffsetDataType = new OffsetDataType(9, -92);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(9));
      expect(v0).assertEqual(9);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-92));
      expect(v1).assertEqual(-92);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010046 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4700
     * @tc.name: testMdlOff010047
     * @tc.desc: Verify OffsetDataType keeps x=10 and y=-94 without swapping (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010047 begin');
      let off: OffsetDataType = new OffsetDataType(10, -94);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(10));
      expect(v0).assertEqual(10);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-94));
      expect(v1).assertEqual(-94);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010047 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4800
     * @tc.name: testMdlOff010048
     * @tc.desc: Verify OffsetDataType keeps x=11 and y=-96 without swapping (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010048 begin');
      let off: OffsetDataType = new OffsetDataType(11, -96);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(11));
      expect(v0).assertEqual(11);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-96));
      expect(v1).assertEqual(-96);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010048 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_4900
     * @tc.name: testMdlOff010049
     * @tc.desc: Verify OffsetDataType keeps x=12 and y=-98 without swapping (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010049 begin');
      let off: OffsetDataType = new OffsetDataType(12, -98);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-98));
      expect(v1).assertEqual(-98);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010049 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5000
     * @tc.name: testMdlOff010050
     * @tc.desc: Verify OffsetDataType keeps x=13 and y=-100 without swapping (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010050 begin');
      let off: OffsetDataType = new OffsetDataType(13, -100);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(13));
      expect(v0).assertEqual(13);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-100));
      expect(v1).assertEqual(-100);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010050 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5100
     * @tc.name: testMdlOff010051
     * @tc.desc: Verify OffsetDataType keeps x=14 and y=-102 without swapping (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010051 begin');
      let off: OffsetDataType = new OffsetDataType(14, -102);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(14));
      expect(v0).assertEqual(14);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-102));
      expect(v1).assertEqual(-102);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010051 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5200
     * @tc.name: testMdlOff010052
     * @tc.desc: Verify OffsetDataType keeps x=15 and y=-104 without swapping (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010052 begin');
      let off: OffsetDataType = new OffsetDataType(15, -104);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(15));
      expect(v0).assertEqual(15);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-104));
      expect(v1).assertEqual(-104);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010052 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5300
     * @tc.name: testMdlOff010053
     * @tc.desc: Verify OffsetDataType keeps x=16 and y=-106 without swapping (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010053 begin');
      let off: OffsetDataType = new OffsetDataType(16, -106);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-106));
      expect(v1).assertEqual(-106);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010053 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5400
     * @tc.name: testMdlOff010054
     * @tc.desc: Verify OffsetDataType keeps x=17 and y=-108 without swapping (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010054 begin');
      let off: OffsetDataType = new OffsetDataType(17, -108);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(17));
      expect(v0).assertEqual(17);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-108));
      expect(v1).assertEqual(-108);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010054 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5500
     * @tc.name: testMdlOff010055
     * @tc.desc: Verify OffsetDataType keeps x=18 and y=-110 without swapping (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010055 begin');
      let off: OffsetDataType = new OffsetDataType(18, -110);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(18));
      expect(v0).assertEqual(18);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-110));
      expect(v1).assertEqual(-110);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010055 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5600
     * @tc.name: testMdlOff010056
     * @tc.desc: Verify OffsetDataType keeps x=19 and y=-112 without swapping (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010056 begin');
      let off: OffsetDataType = new OffsetDataType(19, -112);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(19));
      expect(v0).assertEqual(19);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-112));
      expect(v1).assertEqual(-112);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010056 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5700
     * @tc.name: testMdlOff010057
     * @tc.desc: Verify OffsetDataType keeps x=20 and y=-114 without swapping (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010057 begin');
      let off: OffsetDataType = new OffsetDataType(20, -114);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(20));
      expect(v0).assertEqual(20);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-114));
      expect(v1).assertEqual(-114);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010057 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5800
     * @tc.name: testMdlOff010058
     * @tc.desc: Verify OffsetDataType keeps x=21 and y=-116 without swapping (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010058 begin');
      let off: OffsetDataType = new OffsetDataType(21, -116);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(21));
      expect(v0).assertEqual(21);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-116));
      expect(v1).assertEqual(-116);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010058 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_5900
     * @tc.name: testMdlOff010059
     * @tc.desc: Verify OffsetDataType keeps x=22 and y=-118 without swapping (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010059 begin');
      let off: OffsetDataType = new OffsetDataType(22, -118);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(22));
      expect(v0).assertEqual(22);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-118));
      expect(v1).assertEqual(-118);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010059 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6000
     * @tc.name: testMdlOff010060
     * @tc.desc: Verify OffsetDataType keeps x=23 and y=-120 without swapping (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010060 begin');
      let off: OffsetDataType = new OffsetDataType(23, -120);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(23));
      expect(v0).assertEqual(23);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-120));
      expect(v1).assertEqual(-120);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010060 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6100
     * @tc.name: testMdlOff010061
     * @tc.desc: Verify OffsetDataType keeps x=24 and y=-122 without swapping (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010061 begin');
      let off: OffsetDataType = new OffsetDataType(24, -122);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(24));
      expect(v0).assertEqual(24);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-122));
      expect(v1).assertEqual(-122);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010061 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6200
     * @tc.name: testMdlOff010062
     * @tc.desc: Verify OffsetDataType keeps x=25 and y=-124 without swapping (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010062 begin');
      let off: OffsetDataType = new OffsetDataType(25, -124);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(25));
      expect(v0).assertEqual(25);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-124));
      expect(v1).assertEqual(-124);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010062 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6300
     * @tc.name: testMdlOff010063
     * @tc.desc: Verify OffsetDataType keeps x=26 and y=-126 without swapping (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010063 begin');
      let off: OffsetDataType = new OffsetDataType(26, -126);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(26));
      expect(v0).assertEqual(26);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-126));
      expect(v1).assertEqual(-126);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010063 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6400
     * @tc.name: testMdlOff010064
     * @tc.desc: Verify OffsetDataType keeps x=27 and y=-128 without swapping (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010064 begin');
      let off: OffsetDataType = new OffsetDataType(27, -128);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(27));
      expect(v0).assertEqual(27);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-128));
      expect(v1).assertEqual(-128);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010064 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6500
     * @tc.name: testMdlOff010065
     * @tc.desc: Verify OffsetDataType keeps x=28 and y=-130 without swapping (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010065 begin');
      let off: OffsetDataType = new OffsetDataType(28, -130);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(28));
      expect(v0).assertEqual(28);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-130));
      expect(v1).assertEqual(-130);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010065 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6600
     * @tc.name: testMdlOff010066
     * @tc.desc: Verify OffsetDataType keeps x=29 and y=-132 without swapping (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010066 begin');
      let off: OffsetDataType = new OffsetDataType(29, -132);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(29));
      expect(v0).assertEqual(29);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-132));
      expect(v1).assertEqual(-132);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010066 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6700
     * @tc.name: testMdlOff010067
     * @tc.desc: Verify OffsetDataType keeps x=30 and y=-134 without swapping (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010067 begin');
      let off: OffsetDataType = new OffsetDataType(30, -134);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(30));
      expect(v0).assertEqual(30);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-134));
      expect(v1).assertEqual(-134);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010067 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6800
     * @tc.name: testMdlOff010068
     * @tc.desc: Verify OffsetDataType keeps x=31 and y=-136 without swapping (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010068 begin');
      let off: OffsetDataType = new OffsetDataType(31, -136);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(31));
      expect(v0).assertEqual(31);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-136));
      expect(v1).assertEqual(-136);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010068 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_6900
     * @tc.name: testMdlOff010069
     * @tc.desc: Verify OffsetDataType keeps x=32 and y=-138 without swapping (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010069 begin');
      let off: OffsetDataType = new OffsetDataType(32, -138);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(32));
      expect(v0).assertEqual(32);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-138));
      expect(v1).assertEqual(-138);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010069 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_7000
     * @tc.name: testMdlOff010070
     * @tc.desc: Verify OffsetDataType keeps x=33 and y=-140 without swapping (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010070 begin');
      let off: OffsetDataType = new OffsetDataType(33, -140);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(33));
      expect(v0).assertEqual(33);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-140));
      expect(v1).assertEqual(-140);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010070 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_7100
     * @tc.name: testMdlOff010071
     * @tc.desc: Verify OffsetDataType keeps x=34 and y=-142 without swapping (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010071 begin');
      let off: OffsetDataType = new OffsetDataType(34, -142);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(34));
      expect(v0).assertEqual(34);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-142));
      expect(v1).assertEqual(-142);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010071 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_7200
     * @tc.name: testMdlOff010072
     * @tc.desc: Verify OffsetDataType keeps x=35 and y=-144 without swapping (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010072 begin');
      let off: OffsetDataType = new OffsetDataType(35, -144);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(35));
      expect(v0).assertEqual(35);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-144));
      expect(v1).assertEqual(-144);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010072 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_7300
     * @tc.name: testMdlOff010073
     * @tc.desc: Verify OffsetDataType keeps x=36 and y=-146 without swapping (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlOff010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010073 begin');
      let off: OffsetDataType = new OffsetDataType(36, -146);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x actual=%{public}s expected=%{public}s', String(v0), String(36));
      expect(v0).assertEqual(36);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y actual=%{public}s expected=%{public}s', String(v1), String(-146));
      expect(v1).assertEqual(-146);
      hilog.info(DOMAIN, TAG, 'x-and-y-not-swapped actual=%{public}s expected=false', String(off.x === off.y));
      expect(off.x === off.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010073 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_7400
     * @tc.name: testMdlOff010074
     * @tc.desc: Anchor: zero and negative boundaries must be preserved verbatim
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlOff010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010074 begin');
      let off: OffsetDataType = new OffsetDataType(0, -0);
      const v0: number = off.x;
      hilog.info(DOMAIN, TAG, 'x-zero actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = off.y;
      hilog.info(DOMAIN, TAG, 'y-negative-zero actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'both-are-zero actual=%{public}s expected=true', String(off.x === off.y));
      expect(off.x === off.y).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010074 end');
    })

    /**
     * @tc.number: SUB_MM_MDLOFF01_7500
     * @tc.name: testMdlOff010075
     * @tc.desc: Anchor: large padding values must not overflow the fields
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlOff010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010075 begin');
      let pad: PaddingDataType = new PaddingDataType(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER - 1);
      const v0: number = pad.left;
      hilog.info(DOMAIN, TAG, 'left-max actual=%{public}s expected=%{public}s', String(v0), String(Number.MAX_SAFE_INTEGER));
      expect(v0).assertEqual(Number.MAX_SAFE_INTEGER);
      const v1: number = pad.right;
      hilog.info(DOMAIN, TAG, 'right-max-minus-one actual=%{public}s expected=%{public}s', String(v1), String(Number.MAX_SAFE_INTEGER - 1));
      expect(v1).assertEqual(Number.MAX_SAFE_INTEGER - 1);
      hilog.info(DOMAIN, TAG, 'left-greater actual=%{public}s expected=true', String(pad.left > pad.right));
      expect(pad.left > pad.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlOff010075 end');
    })

  })
}
