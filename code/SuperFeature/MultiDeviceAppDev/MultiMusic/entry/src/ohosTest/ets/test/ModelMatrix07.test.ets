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

// @volume rule=two-model-instances-never-share-field-state basis=state-derivation cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function modelMatrix07Test() {
  describe('ModelMatrix07', () => {

    /**
     * @tc.number: SUB_MM_MDLISO01_0100
     * @tc.name: testMdlIso010001
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010001 begin');
      let first: OffsetDataType = new OffsetDataType(1, -1);
      let second: OffsetDataType = new OffsetDataType(101, -101);
      first.x = 2;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(101));
      expect(v1).assertEqual(101);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010001 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_0200
     * @tc.name: testMdlIso010002
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010002 begin');
      let first: OffsetDataType = new OffsetDataType(2, -2);
      let second: OffsetDataType = new OffsetDataType(102, -102);
      first.x = 4;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(102));
      expect(v1).assertEqual(102);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010002 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_0300
     * @tc.name: testMdlIso010003
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010003 begin');
      let first: OffsetDataType = new OffsetDataType(3, -3);
      let second: OffsetDataType = new OffsetDataType(103, -103);
      first.x = 6;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(103));
      expect(v1).assertEqual(103);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010003 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_0400
     * @tc.name: testMdlIso010004
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010004 begin');
      let first: OffsetDataType = new OffsetDataType(4, -4);
      let second: OffsetDataType = new OffsetDataType(104, -104);
      first.x = 8;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(104));
      expect(v1).assertEqual(104);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010004 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_0500
     * @tc.name: testMdlIso010005
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010005 begin');
      let first: OffsetDataType = new OffsetDataType(5, -5);
      let second: OffsetDataType = new OffsetDataType(105, -105);
      first.x = 10;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(10));
      expect(v0).assertEqual(10);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(105));
      expect(v1).assertEqual(105);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010005 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_0600
     * @tc.name: testMdlIso010006
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010006 begin');
      let first: OffsetDataType = new OffsetDataType(6, -6);
      let second: OffsetDataType = new OffsetDataType(106, -106);
      first.x = 12;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(106));
      expect(v1).assertEqual(106);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010006 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_0700
     * @tc.name: testMdlIso010007
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010007 begin');
      let first: OffsetDataType = new OffsetDataType(7, -7);
      let second: OffsetDataType = new OffsetDataType(107, -107);
      first.x = 14;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(14));
      expect(v0).assertEqual(14);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(107));
      expect(v1).assertEqual(107);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010007 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_0800
     * @tc.name: testMdlIso010008
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010008 begin');
      let first: OffsetDataType = new OffsetDataType(8, -8);
      let second: OffsetDataType = new OffsetDataType(108, -108);
      first.x = 16;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(108));
      expect(v1).assertEqual(108);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010008 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_0900
     * @tc.name: testMdlIso010009
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010009 begin');
      let first: OffsetDataType = new OffsetDataType(9, -9);
      let second: OffsetDataType = new OffsetDataType(109, -109);
      first.x = 18;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(18));
      expect(v0).assertEqual(18);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(109));
      expect(v1).assertEqual(109);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010009 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1000
     * @tc.name: testMdlIso010010
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010010 begin');
      let first: OffsetDataType = new OffsetDataType(10, -10);
      let second: OffsetDataType = new OffsetDataType(110, -110);
      first.x = 20;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(20));
      expect(v0).assertEqual(20);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(110));
      expect(v1).assertEqual(110);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010010 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1100
     * @tc.name: testMdlIso010011
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010011 begin');
      let first: OffsetDataType = new OffsetDataType(11, -11);
      let second: OffsetDataType = new OffsetDataType(111, -111);
      first.x = 22;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(22));
      expect(v0).assertEqual(22);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(111));
      expect(v1).assertEqual(111);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010011 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1200
     * @tc.name: testMdlIso010012
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010012 begin');
      let first: OffsetDataType = new OffsetDataType(12, -12);
      let second: OffsetDataType = new OffsetDataType(112, -112);
      first.x = 24;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(24));
      expect(v0).assertEqual(24);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(112));
      expect(v1).assertEqual(112);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010012 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1300
     * @tc.name: testMdlIso010013
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010013 begin');
      let first: OffsetDataType = new OffsetDataType(13, -13);
      let second: OffsetDataType = new OffsetDataType(113, -113);
      first.x = 26;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(26));
      expect(v0).assertEqual(26);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(113));
      expect(v1).assertEqual(113);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010013 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1400
     * @tc.name: testMdlIso010014
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010014 begin');
      let first: OffsetDataType = new OffsetDataType(14, -14);
      let second: OffsetDataType = new OffsetDataType(114, -114);
      first.x = 28;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(28));
      expect(v0).assertEqual(28);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(114));
      expect(v1).assertEqual(114);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010014 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1500
     * @tc.name: testMdlIso010015
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010015 begin');
      let first: OffsetDataType = new OffsetDataType(15, -15);
      let second: OffsetDataType = new OffsetDataType(115, -115);
      first.x = 30;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(30));
      expect(v0).assertEqual(30);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(115));
      expect(v1).assertEqual(115);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010015 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1600
     * @tc.name: testMdlIso010016
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010016 begin');
      let first: OffsetDataType = new OffsetDataType(16, -16);
      let second: OffsetDataType = new OffsetDataType(116, -116);
      first.x = 32;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(32));
      expect(v0).assertEqual(32);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(116));
      expect(v1).assertEqual(116);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010016 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1700
     * @tc.name: testMdlIso010017
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010017 begin');
      let first: OffsetDataType = new OffsetDataType(17, -17);
      let second: OffsetDataType = new OffsetDataType(117, -117);
      first.x = 34;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(34));
      expect(v0).assertEqual(34);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(117));
      expect(v1).assertEqual(117);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010017 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1800
     * @tc.name: testMdlIso010018
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010018 begin');
      let first: OffsetDataType = new OffsetDataType(18, -18);
      let second: OffsetDataType = new OffsetDataType(118, -118);
      first.x = 36;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(36));
      expect(v0).assertEqual(36);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(118));
      expect(v1).assertEqual(118);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010018 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_1900
     * @tc.name: testMdlIso010019
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010019 begin');
      let first: OffsetDataType = new OffsetDataType(19, -19);
      let second: OffsetDataType = new OffsetDataType(119, -119);
      first.x = 38;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(38));
      expect(v0).assertEqual(38);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(119));
      expect(v1).assertEqual(119);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010019 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2000
     * @tc.name: testMdlIso010020
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010020 begin');
      let first: OffsetDataType = new OffsetDataType(20, -20);
      let second: OffsetDataType = new OffsetDataType(120, -120);
      first.x = 40;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(40));
      expect(v0).assertEqual(40);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(120));
      expect(v1).assertEqual(120);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010020 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2100
     * @tc.name: testMdlIso010021
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010021 begin');
      let first: OffsetDataType = new OffsetDataType(21, -21);
      let second: OffsetDataType = new OffsetDataType(121, -121);
      first.x = 42;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(42));
      expect(v0).assertEqual(42);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(121));
      expect(v1).assertEqual(121);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010021 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2200
     * @tc.name: testMdlIso010022
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010022 begin');
      let first: OffsetDataType = new OffsetDataType(22, -22);
      let second: OffsetDataType = new OffsetDataType(122, -122);
      first.x = 44;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(44));
      expect(v0).assertEqual(44);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(122));
      expect(v1).assertEqual(122);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010022 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2300
     * @tc.name: testMdlIso010023
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010023 begin');
      let first: OffsetDataType = new OffsetDataType(23, -23);
      let second: OffsetDataType = new OffsetDataType(123, -123);
      first.x = 46;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(46));
      expect(v0).assertEqual(46);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(123));
      expect(v1).assertEqual(123);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010023 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2400
     * @tc.name: testMdlIso010024
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010024 begin');
      let first: OffsetDataType = new OffsetDataType(24, -24);
      let second: OffsetDataType = new OffsetDataType(124, -124);
      first.x = 48;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(48));
      expect(v0).assertEqual(48);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(124));
      expect(v1).assertEqual(124);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010024 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2500
     * @tc.name: testMdlIso010025
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010025 begin');
      let first: OffsetDataType = new OffsetDataType(25, -25);
      let second: OffsetDataType = new OffsetDataType(125, -125);
      first.x = 50;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(50));
      expect(v0).assertEqual(50);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(125));
      expect(v1).assertEqual(125);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010025 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2600
     * @tc.name: testMdlIso010026
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010026 begin');
      let first: OffsetDataType = new OffsetDataType(26, -26);
      let second: OffsetDataType = new OffsetDataType(126, -126);
      first.x = 52;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(52));
      expect(v0).assertEqual(52);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(126));
      expect(v1).assertEqual(126);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010026 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2700
     * @tc.name: testMdlIso010027
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010027 begin');
      let first: OffsetDataType = new OffsetDataType(27, -27);
      let second: OffsetDataType = new OffsetDataType(127, -127);
      first.x = 54;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(54));
      expect(v0).assertEqual(54);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(127));
      expect(v1).assertEqual(127);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010027 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2800
     * @tc.name: testMdlIso010028
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010028 begin');
      let first: OffsetDataType = new OffsetDataType(28, -28);
      let second: OffsetDataType = new OffsetDataType(128, -128);
      first.x = 56;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(56));
      expect(v0).assertEqual(56);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(128));
      expect(v1).assertEqual(128);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010028 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_2900
     * @tc.name: testMdlIso010029
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010029 begin');
      let first: OffsetDataType = new OffsetDataType(29, -29);
      let second: OffsetDataType = new OffsetDataType(129, -129);
      first.x = 58;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(58));
      expect(v0).assertEqual(58);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(129));
      expect(v1).assertEqual(129);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010029 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3000
     * @tc.name: testMdlIso010030
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010030 begin');
      let first: OffsetDataType = new OffsetDataType(30, -30);
      let second: OffsetDataType = new OffsetDataType(130, -130);
      first.x = 60;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(60));
      expect(v0).assertEqual(60);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(130));
      expect(v1).assertEqual(130);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010030 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3100
     * @tc.name: testMdlIso010031
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010031 begin');
      let first: OffsetDataType = new OffsetDataType(31, -31);
      let second: OffsetDataType = new OffsetDataType(131, -131);
      first.x = 62;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(62));
      expect(v0).assertEqual(62);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(131));
      expect(v1).assertEqual(131);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010031 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3200
     * @tc.name: testMdlIso010032
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010032 begin');
      let first: OffsetDataType = new OffsetDataType(32, -32);
      let second: OffsetDataType = new OffsetDataType(132, -132);
      first.x = 64;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(64));
      expect(v0).assertEqual(64);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(132));
      expect(v1).assertEqual(132);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010032 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3300
     * @tc.name: testMdlIso010033
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010033 begin');
      let first: OffsetDataType = new OffsetDataType(33, -33);
      let second: OffsetDataType = new OffsetDataType(133, -133);
      first.x = 66;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(66));
      expect(v0).assertEqual(66);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(133));
      expect(v1).assertEqual(133);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010033 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3400
     * @tc.name: testMdlIso010034
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010034 begin');
      let first: OffsetDataType = new OffsetDataType(34, -34);
      let second: OffsetDataType = new OffsetDataType(134, -134);
      first.x = 68;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(68));
      expect(v0).assertEqual(68);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(134));
      expect(v1).assertEqual(134);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010034 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3500
     * @tc.name: testMdlIso010035
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010035 begin');
      let first: OffsetDataType = new OffsetDataType(35, -35);
      let second: OffsetDataType = new OffsetDataType(135, -135);
      first.x = 70;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(70));
      expect(v0).assertEqual(70);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(135));
      expect(v1).assertEqual(135);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010035 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3600
     * @tc.name: testMdlIso010036
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010036 begin');
      let first: OffsetDataType = new OffsetDataType(36, -36);
      let second: OffsetDataType = new OffsetDataType(136, -136);
      first.x = 72;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(72));
      expect(v0).assertEqual(72);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(136));
      expect(v1).assertEqual(136);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010036 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3700
     * @tc.name: testMdlIso010037
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010037 begin');
      let first: OffsetDataType = new OffsetDataType(37, -37);
      let second: OffsetDataType = new OffsetDataType(137, -137);
      first.x = 74;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(74));
      expect(v0).assertEqual(74);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(137));
      expect(v1).assertEqual(137);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010037 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3800
     * @tc.name: testMdlIso010038
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010038 begin');
      let first: OffsetDataType = new OffsetDataType(38, -38);
      let second: OffsetDataType = new OffsetDataType(138, -138);
      first.x = 76;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(76));
      expect(v0).assertEqual(76);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(138));
      expect(v1).assertEqual(138);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010038 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_3900
     * @tc.name: testMdlIso010039
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010039 begin');
      let first: OffsetDataType = new OffsetDataType(39, -39);
      let second: OffsetDataType = new OffsetDataType(139, -139);
      first.x = 78;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(78));
      expect(v0).assertEqual(78);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(139));
      expect(v1).assertEqual(139);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010039 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4000
     * @tc.name: testMdlIso010040
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010040 begin');
      let first: OffsetDataType = new OffsetDataType(40, -40);
      let second: OffsetDataType = new OffsetDataType(140, -140);
      first.x = 80;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(80));
      expect(v0).assertEqual(80);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(140));
      expect(v1).assertEqual(140);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010040 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4100
     * @tc.name: testMdlIso010041
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010041 begin');
      let first: OffsetDataType = new OffsetDataType(41, -41);
      let second: OffsetDataType = new OffsetDataType(141, -141);
      first.x = 82;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(82));
      expect(v0).assertEqual(82);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(141));
      expect(v1).assertEqual(141);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010041 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4200
     * @tc.name: testMdlIso010042
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010042 begin');
      let first: OffsetDataType = new OffsetDataType(42, -42);
      let second: OffsetDataType = new OffsetDataType(142, -142);
      first.x = 84;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(84));
      expect(v0).assertEqual(84);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(142));
      expect(v1).assertEqual(142);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010042 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4300
     * @tc.name: testMdlIso010043
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010043 begin');
      let first: OffsetDataType = new OffsetDataType(43, -43);
      let second: OffsetDataType = new OffsetDataType(143, -143);
      first.x = 86;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(86));
      expect(v0).assertEqual(86);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(143));
      expect(v1).assertEqual(143);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010043 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4400
     * @tc.name: testMdlIso010044
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010044 begin');
      let first: OffsetDataType = new OffsetDataType(44, -44);
      let second: OffsetDataType = new OffsetDataType(144, -144);
      first.x = 88;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(88));
      expect(v0).assertEqual(88);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(144));
      expect(v1).assertEqual(144);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010044 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4500
     * @tc.name: testMdlIso010045
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010045 begin');
      let first: OffsetDataType = new OffsetDataType(45, -45);
      let second: OffsetDataType = new OffsetDataType(145, -145);
      first.x = 90;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(90));
      expect(v0).assertEqual(90);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(145));
      expect(v1).assertEqual(145);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010045 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4600
     * @tc.name: testMdlIso010046
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010046 begin');
      let first: OffsetDataType = new OffsetDataType(46, -46);
      let second: OffsetDataType = new OffsetDataType(146, -146);
      first.x = 92;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(92));
      expect(v0).assertEqual(92);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(146));
      expect(v1).assertEqual(146);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010046 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4700
     * @tc.name: testMdlIso010047
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010047 begin');
      let first: OffsetDataType = new OffsetDataType(47, -47);
      let second: OffsetDataType = new OffsetDataType(147, -147);
      first.x = 94;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(94));
      expect(v0).assertEqual(94);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(147));
      expect(v1).assertEqual(147);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010047 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4800
     * @tc.name: testMdlIso010048
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010048 begin');
      let first: OffsetDataType = new OffsetDataType(48, -48);
      let second: OffsetDataType = new OffsetDataType(148, -148);
      first.x = 96;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(96));
      expect(v0).assertEqual(96);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(148));
      expect(v1).assertEqual(148);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010048 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_4900
     * @tc.name: testMdlIso010049
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010049 begin');
      let first: OffsetDataType = new OffsetDataType(49, -49);
      let second: OffsetDataType = new OffsetDataType(149, -149);
      first.x = 98;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(98));
      expect(v0).assertEqual(98);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(149));
      expect(v1).assertEqual(149);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010049 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5000
     * @tc.name: testMdlIso010050
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010050 begin');
      let first: OffsetDataType = new OffsetDataType(50, -50);
      let second: OffsetDataType = new OffsetDataType(150, -150);
      first.x = 100;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(100));
      expect(v0).assertEqual(100);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(150));
      expect(v1).assertEqual(150);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010050 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5100
     * @tc.name: testMdlIso010051
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010051 begin');
      let first: OffsetDataType = new OffsetDataType(51, -51);
      let second: OffsetDataType = new OffsetDataType(151, -151);
      first.x = 102;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(102));
      expect(v0).assertEqual(102);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(151));
      expect(v1).assertEqual(151);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010051 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5200
     * @tc.name: testMdlIso010052
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010052 begin');
      let first: OffsetDataType = new OffsetDataType(52, -52);
      let second: OffsetDataType = new OffsetDataType(152, -152);
      first.x = 104;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(104));
      expect(v0).assertEqual(104);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(152));
      expect(v1).assertEqual(152);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010052 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5300
     * @tc.name: testMdlIso010053
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010053 begin');
      let first: OffsetDataType = new OffsetDataType(53, -53);
      let second: OffsetDataType = new OffsetDataType(153, -153);
      first.x = 106;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(106));
      expect(v0).assertEqual(106);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(153));
      expect(v1).assertEqual(153);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010053 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5400
     * @tc.name: testMdlIso010054
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010054 begin');
      let first: OffsetDataType = new OffsetDataType(54, -54);
      let second: OffsetDataType = new OffsetDataType(154, -154);
      first.x = 108;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(108));
      expect(v0).assertEqual(108);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(154));
      expect(v1).assertEqual(154);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010054 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5500
     * @tc.name: testMdlIso010055
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010055 begin');
      let first: OffsetDataType = new OffsetDataType(55, -55);
      let second: OffsetDataType = new OffsetDataType(155, -155);
      first.x = 110;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(110));
      expect(v0).assertEqual(110);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(155));
      expect(v1).assertEqual(155);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010055 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5600
     * @tc.name: testMdlIso010056
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010056 begin');
      let first: OffsetDataType = new OffsetDataType(56, -56);
      let second: OffsetDataType = new OffsetDataType(156, -156);
      first.x = 112;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(112));
      expect(v0).assertEqual(112);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(156));
      expect(v1).assertEqual(156);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010056 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5700
     * @tc.name: testMdlIso010057
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010057 begin');
      let first: OffsetDataType = new OffsetDataType(57, -57);
      let second: OffsetDataType = new OffsetDataType(157, -157);
      first.x = 114;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(114));
      expect(v0).assertEqual(114);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(157));
      expect(v1).assertEqual(157);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010057 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5800
     * @tc.name: testMdlIso010058
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010058 begin');
      let first: OffsetDataType = new OffsetDataType(58, -58);
      let second: OffsetDataType = new OffsetDataType(158, -158);
      first.x = 116;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(116));
      expect(v0).assertEqual(116);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(158));
      expect(v1).assertEqual(158);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010058 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_5900
     * @tc.name: testMdlIso010059
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010059 begin');
      let first: OffsetDataType = new OffsetDataType(59, -59);
      let second: OffsetDataType = new OffsetDataType(159, -159);
      first.x = 118;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(118));
      expect(v0).assertEqual(118);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(159));
      expect(v1).assertEqual(159);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010059 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6000
     * @tc.name: testMdlIso010060
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010060 begin');
      let first: OffsetDataType = new OffsetDataType(60, -60);
      let second: OffsetDataType = new OffsetDataType(160, -160);
      first.x = 120;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(120));
      expect(v0).assertEqual(120);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(160));
      expect(v1).assertEqual(160);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010060 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6100
     * @tc.name: testMdlIso010061
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010061 begin');
      let first: OffsetDataType = new OffsetDataType(61, -61);
      let second: OffsetDataType = new OffsetDataType(161, -161);
      first.x = 122;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(122));
      expect(v0).assertEqual(122);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(161));
      expect(v1).assertEqual(161);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010061 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6200
     * @tc.name: testMdlIso010062
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010062 begin');
      let first: OffsetDataType = new OffsetDataType(62, -62);
      let second: OffsetDataType = new OffsetDataType(162, -162);
      first.x = 124;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(124));
      expect(v0).assertEqual(124);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(162));
      expect(v1).assertEqual(162);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010062 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6300
     * @tc.name: testMdlIso010063
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010063 begin');
      let first: OffsetDataType = new OffsetDataType(63, -63);
      let second: OffsetDataType = new OffsetDataType(163, -163);
      first.x = 126;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(126));
      expect(v0).assertEqual(126);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(163));
      expect(v1).assertEqual(163);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010063 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6400
     * @tc.name: testMdlIso010064
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010064 begin');
      let first: OffsetDataType = new OffsetDataType(64, -64);
      let second: OffsetDataType = new OffsetDataType(164, -164);
      first.x = 128;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(128));
      expect(v0).assertEqual(128);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(164));
      expect(v1).assertEqual(164);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010064 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6500
     * @tc.name: testMdlIso010065
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010065 begin');
      let first: OffsetDataType = new OffsetDataType(65, -65);
      let second: OffsetDataType = new OffsetDataType(165, -165);
      first.x = 130;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(130));
      expect(v0).assertEqual(130);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(165));
      expect(v1).assertEqual(165);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010065 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6600
     * @tc.name: testMdlIso010066
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010066 begin');
      let first: OffsetDataType = new OffsetDataType(66, -66);
      let second: OffsetDataType = new OffsetDataType(166, -166);
      first.x = 132;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(132));
      expect(v0).assertEqual(132);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(166));
      expect(v1).assertEqual(166);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010066 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6700
     * @tc.name: testMdlIso010067
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010067 begin');
      let first: OffsetDataType = new OffsetDataType(67, -67);
      let second: OffsetDataType = new OffsetDataType(167, -167);
      first.x = 134;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(134));
      expect(v0).assertEqual(134);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(167));
      expect(v1).assertEqual(167);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010067 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6800
     * @tc.name: testMdlIso010068
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010068 begin');
      let first: OffsetDataType = new OffsetDataType(68, -68);
      let second: OffsetDataType = new OffsetDataType(168, -168);
      first.x = 136;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(136));
      expect(v0).assertEqual(136);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(168));
      expect(v1).assertEqual(168);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010068 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_6900
     * @tc.name: testMdlIso010069
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010069 begin');
      let first: OffsetDataType = new OffsetDataType(69, -69);
      let second: OffsetDataType = new OffsetDataType(169, -169);
      first.x = 138;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(138));
      expect(v0).assertEqual(138);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(169));
      expect(v1).assertEqual(169);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010069 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_7000
     * @tc.name: testMdlIso010070
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010070 begin');
      let first: OffsetDataType = new OffsetDataType(70, -70);
      let second: OffsetDataType = new OffsetDataType(170, -170);
      first.x = 140;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(140));
      expect(v0).assertEqual(140);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(170));
      expect(v1).assertEqual(170);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010070 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_7100
     * @tc.name: testMdlIso010071
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010071 begin');
      let first: OffsetDataType = new OffsetDataType(71, -71);
      let second: OffsetDataType = new OffsetDataType(171, -171);
      first.x = 142;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(142));
      expect(v0).assertEqual(142);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(171));
      expect(v1).assertEqual(171);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010071 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_7200
     * @tc.name: testMdlIso010072
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010072 begin');
      let first: OffsetDataType = new OffsetDataType(72, -72);
      let second: OffsetDataType = new OffsetDataType(172, -172);
      first.x = 144;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(144));
      expect(v0).assertEqual(144);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(172));
      expect(v1).assertEqual(172);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010072 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_7300
     * @tc.name: testMdlIso010073
     * @tc.desc: Verify two OffsetDataType instances do not share field state (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testMdlIso010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010073 begin');
      let first: OffsetDataType = new OffsetDataType(73, -73);
      let second: OffsetDataType = new OffsetDataType(173, -173);
      first.x = 146;
      const v0: number = first.x;
      hilog.info(DOMAIN, TAG, 'first.x-after-set actual=%{public}s expected=%{public}s', String(v0), String(146));
      expect(v0).assertEqual(146);
      const v1: number = second.x;
      hilog.info(DOMAIN, TAG, 'second.x-unchanged actual=%{public}s expected=%{public}s', String(v1), String(173));
      expect(v1).assertEqual(173);
      hilog.info(DOMAIN, TAG, 'instances-stay-distinct actual=%{public}s expected=false', String(first === second));
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010073 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_7400
     * @tc.name: testMdlIso010074
     * @tc.desc: Anchor: three instances must keep three different counts
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlIso010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010074 begin');
      let first: SongType = new SongType($r('app.media.list1'), $r('app.string.emo'), 1);
      let second: SongType = new SongType($r('app.media.list1'), $r('app.string.emo'), 2);
      let third: SongType = new SongType($r('app.media.list1'), $r('app.string.emo'), 3);
      const v0: number = first.count + second.count + third.count;
      hilog.info(DOMAIN, TAG, 'sum-of-counts actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      hilog.info(DOMAIN, TAG, 'counts-differ actual=%{public}s expected=false', String(first.count === second.count));
      expect(first.count === second.count).assertFalse();
      hilog.info(DOMAIN, TAG, 'order-kept actual=%{public}s expected=true', String(third.count > second.count));
      expect(third.count > second.count).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010074 end');
    })

    /**
     * @tc.number: SUB_MM_MDLISO01_7500
     * @tc.name: testMdlIso010075
     * @tc.desc: Anchor: mutating one instance must not move the others
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testMdlIso010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010075 begin');
      let first: PaddingDataType = new PaddingDataType(1, 1);
      let second: PaddingDataType = new PaddingDataType(2, 2);
      first.left = 99;
      const v0: number = second.left;
      hilog.info(DOMAIN, TAG, 'second-left actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = first.left;
      hilog.info(DOMAIN, TAG, 'first-left actual=%{public}s expected=%{public}s', String(v1), String(99));
      expect(v1).assertEqual(99);
      hilog.info(DOMAIN, TAG, 'not-shared actual=%{public}s expected=false', String(first.left === second.left));
      expect(first.left === second.left).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMdlIso010075 end');
    })

  })
}
