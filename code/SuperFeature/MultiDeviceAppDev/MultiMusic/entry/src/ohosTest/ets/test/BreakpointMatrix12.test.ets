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

// @volume rule=getValue(k)-returns-field-k-for-PaddingDataType-and-SongType basis=main-frozen cases=75
// Matrix bucket of the matching Real suite: one case per rule combination.
// Resource.moduleName inside the ohosTest HAP is TEST_MODULE_NAME for test-created and main-side Resources.
// Hand-written Anchor cases are part of this bucket; handwritten companions live in *Real*.test.ets.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { TEST_MODULE_NAME } from '../util/TestConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

export default function breakpointMatrix12Test() {
  describe('BreakpointMatrix12', () => {

    /**
     * @tc.number: SUB_MM_BRKMIX01_0100
     * @tc.name: testBrkMix010001
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010001 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list2'), $r('app.string.emo'), 1), new SongType($r('app.media.list2'), $r('app.string.rock'), 2), new SongType($r('app.media.list2'), $r('app.string.jazz'), 3));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(2));
      expect(v0).assertEqual(2);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(1));
      expect(v1).assertEqual(1);
      const v2: SongType | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_0200
     * @tc.name: testBrkMix010002
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010002 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(2, 3), new PaddingDataType(4, 5), new PaddingDataType(6, 7));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      const v2: PaddingDataType | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_0300
     * @tc.name: testBrkMix010003
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010003 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list4'), $r('app.string.emo'), 3), new SongType($r('app.media.list4'), $r('app.string.rock'), 4), new SongType($r('app.media.list4'), $r('app.string.jazz'), 5));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(4));
      expect(v0).assertEqual(4);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(3));
      expect(v1).assertEqual(3);
      const v2: SongType | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_0400
     * @tc.name: testBrkMix010004
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010004 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(4, 5), new PaddingDataType(6, 7), new PaddingDataType(8, 9));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(9));
      expect(v1).assertEqual(9);
      const v2: PaddingDataType | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_0500
     * @tc.name: testBrkMix010005
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010005 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list6'), $r('app.string.emo'), 5), new SongType($r('app.media.list6'), $r('app.string.rock'), 6), new SongType($r('app.media.list6'), $r('app.string.jazz'), 7));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(6));
      expect(v0).assertEqual(6);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(5));
      expect(v1).assertEqual(5);
      const v2: SongType | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_0600
     * @tc.name: testBrkMix010006
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010006 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(6, 7), new PaddingDataType(8, 9), new PaddingDataType(10, 11));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(10));
      expect(v0).assertEqual(10);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(11));
      expect(v1).assertEqual(11);
      const v2: PaddingDataType | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_0700
     * @tc.name: testBrkMix010007
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010007 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list8'), $r('app.string.emo'), 7), new SongType($r('app.media.list8'), $r('app.string.rock'), 8), new SongType($r('app.media.list8'), $r('app.string.jazz'), 9));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(8));
      expect(v0).assertEqual(8);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(7));
      expect(v1).assertEqual(7);
      const v2: SongType | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_0800
     * @tc.name: testBrkMix010008
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010008 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(8, 9), new PaddingDataType(10, 11), new PaddingDataType(12, 13));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(13));
      expect(v1).assertEqual(13);
      const v2: PaddingDataType | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_0900
     * @tc.name: testBrkMix010009
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010009 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list10'), $r('app.string.emo'), 9), new SongType($r('app.media.list10'), $r('app.string.rock'), 10), new SongType($r('app.media.list10'), $r('app.string.jazz'), 11));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(10));
      expect(v0).assertEqual(10);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(9));
      expect(v1).assertEqual(9);
      const v2: SongType | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1000
     * @tc.name: testBrkMix010010
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010010 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(10, 11), new PaddingDataType(12, 13), new PaddingDataType(14, 15));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(14));
      expect(v0).assertEqual(14);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(15));
      expect(v1).assertEqual(15);
      const v2: PaddingDataType | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1100
     * @tc.name: testBrkMix010011
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010011 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list12'), $r('app.string.emo'), 11), new SongType($r('app.media.list12'), $r('app.string.rock'), 12), new SongType($r('app.media.list12'), $r('app.string.jazz'), 13));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(12));
      expect(v0).assertEqual(12);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(11));
      expect(v1).assertEqual(11);
      const v2: SongType | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1200
     * @tc.name: testBrkMix010012
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010012 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(12, 13), new PaddingDataType(14, 15), new PaddingDataType(16, 17));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(17));
      expect(v1).assertEqual(17);
      const v2: PaddingDataType | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1300
     * @tc.name: testBrkMix010013
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010013 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.banner1'), $r('app.string.emo'), 13), new SongType($r('app.media.banner1'), $r('app.string.rock'), 14), new SongType($r('app.media.banner1'), $r('app.string.jazz'), 15));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(14));
      expect(v0).assertEqual(14);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(13));
      expect(v1).assertEqual(13);
      const v2: SongType | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1400
     * @tc.name: testBrkMix010014
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010014 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(14, 15), new PaddingDataType(16, 17), new PaddingDataType(18, 19));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(18));
      expect(v0).assertEqual(18);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(19));
      expect(v1).assertEqual(19);
      const v2: PaddingDataType | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1500
     * @tc.name: testBrkMix010015
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010015 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.banner3'), $r('app.string.emo'), 15), new SongType($r('app.media.banner3'), $r('app.string.rock'), 16), new SongType($r('app.media.banner3'), $r('app.string.jazz'), 17));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(15));
      expect(v1).assertEqual(15);
      const v2: SongType | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1600
     * @tc.name: testBrkMix010016
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010016 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(16, 17), new PaddingDataType(18, 19), new PaddingDataType(20, 21));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(20));
      expect(v0).assertEqual(20);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(21));
      expect(v1).assertEqual(21);
      const v2: PaddingDataType | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1700
     * @tc.name: testBrkMix010017
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010017 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_find_h'), $r('app.string.emo'), 17), new SongType($r('app.media.ic_find_h'), $r('app.string.rock'), 18), new SongType($r('app.media.ic_find_h'), $r('app.string.jazz'), 19));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(18));
      expect(v0).assertEqual(18);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(17));
      expect(v1).assertEqual(17);
      const v2: SongType | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1800
     * @tc.name: testBrkMix010018
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010018 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(18, 19), new PaddingDataType(20, 21), new PaddingDataType(22, 23));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(22));
      expect(v0).assertEqual(22);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(23));
      expect(v1).assertEqual(23);
      const v2: PaddingDataType | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_1900
     * @tc.name: testBrkMix010019
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010019 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_listener'), $r('app.string.emo'), 19), new SongType($r('app.media.ic_listener'), $r('app.string.rock'), 20), new SongType($r('app.media.ic_listener'), $r('app.string.jazz'), 21));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(20));
      expect(v0).assertEqual(20);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(19));
      expect(v1).assertEqual(19);
      const v2: SongType | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2000
     * @tc.name: testBrkMix010020
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010020 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(20, 21), new PaddingDataType(22, 23), new PaddingDataType(24, 25));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(24));
      expect(v0).assertEqual(24);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(25));
      expect(v1).assertEqual(25);
      const v2: PaddingDataType | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2100
     * @tc.name: testBrkMix010021
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010021 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_mine_h'), $r('app.string.emo'), 21), new SongType($r('app.media.ic_mine_h'), $r('app.string.rock'), 22), new SongType($r('app.media.ic_mine_h'), $r('app.string.jazz'), 23));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(22));
      expect(v0).assertEqual(22);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(21));
      expect(v1).assertEqual(21);
      const v2: SongType | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2200
     * @tc.name: testBrkMix010022
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010022 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(22, 23), new PaddingDataType(24, 25), new PaddingDataType(26, 27));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(26));
      expect(v0).assertEqual(26);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(27));
      expect(v1).assertEqual(27);
      const v2: PaddingDataType | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2300
     * @tc.name: testBrkMix010023
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010023 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_Album'), $r('app.string.emo'), 23), new SongType($r('app.media.ic_music_Album'), $r('app.string.rock'), 24), new SongType($r('app.media.ic_music_Album'), $r('app.string.jazz'), 25));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(24));
      expect(v0).assertEqual(24);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(23));
      expect(v1).assertEqual(23);
      const v2: SongType | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2400
     * @tc.name: testBrkMix010024
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010024 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(24, 25), new PaddingDataType(26, 27), new PaddingDataType(28, 29));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(28));
      expect(v0).assertEqual(28);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(29));
      expect(v1).assertEqual(29);
      const v2: PaddingDataType | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2500
     * @tc.name: testBrkMix010025
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010025 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_hires'), $r('app.string.emo'), 25), new SongType($r('app.media.ic_music_hires'), $r('app.string.rock'), 26), new SongType($r('app.media.ic_music_hires'), $r('app.string.jazz'), 27));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(26));
      expect(v0).assertEqual(26);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(25));
      expect(v1).assertEqual(25);
      const v2: SongType | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2600
     * @tc.name: testBrkMix010026
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010026 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(26, 27), new PaddingDataType(28, 29), new PaddingDataType(30, 31));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(30));
      expect(v0).assertEqual(30);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(31));
      expect(v1).assertEqual(31);
      const v2: PaddingDataType | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2700
     * @tc.name: testBrkMix010027
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010027 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_musicfm'), $r('app.string.emo'), 27), new SongType($r('app.media.ic_music_musicfm'), $r('app.string.rock'), 28), new SongType($r('app.media.ic_music_musicfm'), $r('app.string.jazz'), 29));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(28));
      expect(v0).assertEqual(28);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(27));
      expect(v1).assertEqual(27);
      const v2: SongType | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2800
     * @tc.name: testBrkMix010028
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010028 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(28, 29), new PaddingDataType(30, 31), new PaddingDataType(32, 33));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(32));
      expect(v0).assertEqual(32);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(33));
      expect(v1).assertEqual(33);
      const v2: PaddingDataType | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_2900
     * @tc.name: testBrkMix010029
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010029 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_ranking'), $r('app.string.emo'), 29), new SongType($r('app.media.ic_music_ranking'), $r('app.string.rock'), 30), new SongType($r('app.media.ic_music_ranking'), $r('app.string.jazz'), 31));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(30));
      expect(v0).assertEqual(30);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(29));
      expect(v1).assertEqual(29);
      const v2: SongType | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3000
     * @tc.name: testBrkMix010030
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010030 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(30, 31), new PaddingDataType(32, 33), new PaddingDataType(34, 35));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(34));
      expect(v0).assertEqual(34);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(35));
      expect(v1).assertEqual(35);
      const v2: PaddingDataType | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3100
     * @tc.name: testBrkMix010031
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010031 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_songsheet'), $r('app.string.emo'), 31), new SongType($r('app.media.ic_music_songsheet'), $r('app.string.rock'), 32), new SongType($r('app.media.ic_music_songsheet'), $r('app.string.jazz'), 33));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(32));
      expect(v0).assertEqual(32);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(31));
      expect(v1).assertEqual(31);
      const v2: SongType | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3200
     * @tc.name: testBrkMix010032
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010032 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(32, 33), new PaddingDataType(34, 35), new PaddingDataType(36, 37));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(36));
      expect(v0).assertEqual(36);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(37));
      expect(v1).assertEqual(37);
      const v2: PaddingDataType | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3300
     * @tc.name: testBrkMix010033
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010033 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_playList'), $r('app.string.emo'), 33), new SongType($r('app.media.ic_playList'), $r('app.string.rock'), 34), new SongType($r('app.media.ic_playList'), $r('app.string.jazz'), 35));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(34));
      expect(v0).assertEqual(34);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(33));
      expect(v1).assertEqual(33);
      const v2: SongType | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3400
     * @tc.name: testBrkMix010034
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010034 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(34, 35), new PaddingDataType(36, 37), new PaddingDataType(38, 39));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(38));
      expect(v0).assertEqual(38);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(39));
      expect(v1).assertEqual(39);
      const v2: PaddingDataType | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3500
     * @tc.name: testBrkMix010035
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010035 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_public_home'), $r('app.string.emo'), 35), new SongType($r('app.media.ic_public_home'), $r('app.string.rock'), 36), new SongType($r('app.media.ic_public_home'), $r('app.string.jazz'), 37));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(36));
      expect(v0).assertEqual(36);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(35));
      expect(v1).assertEqual(35);
      const v2: SongType | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3600
     * @tc.name: testBrkMix010036
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010036 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(36, 37), new PaddingDataType(38, 39), new PaddingDataType(40, 41));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(40));
      expect(v0).assertEqual(40);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(41));
      expect(v1).assertEqual(41);
      const v2: PaddingDataType | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3700
     * @tc.name: testBrkMix010037
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010037 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_radio'), $r('app.string.emo'), 37), new SongType($r('app.media.ic_radio'), $r('app.string.rock'), 38), new SongType($r('app.media.ic_radio'), $r('app.string.jazz'), 39));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(38));
      expect(v0).assertEqual(38);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(37));
      expect(v1).assertEqual(37);
      const v2: SongType | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3800
     * @tc.name: testBrkMix010038
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010038 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(38, 39), new PaddingDataType(40, 41), new PaddingDataType(42, 43));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(42));
      expect(v0).assertEqual(42);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(43));
      expect(v1).assertEqual(43);
      const v2: PaddingDataType | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_3900
     * @tc.name: testBrkMix010039
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010039 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_search'), $r('app.string.emo'), 39), new SongType($r('app.media.ic_search'), $r('app.string.rock'), 40), new SongType($r('app.media.ic_search'), $r('app.string.jazz'), 41));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(40));
      expect(v0).assertEqual(40);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(39));
      expect(v1).assertEqual(39);
      const v2: SongType | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4000
     * @tc.name: testBrkMix010040
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010040 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(40, 41), new PaddingDataType(42, 43), new PaddingDataType(44, 45));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(44));
      expect(v0).assertEqual(44);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(45));
      expect(v1).assertEqual(45);
      const v2: PaddingDataType | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4100
     * @tc.name: testBrkMix010041
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010041 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.icon_play'), $r('app.string.emo'), 41), new SongType($r('app.media.icon_play'), $r('app.string.rock'), 42), new SongType($r('app.media.icon_play'), $r('app.string.jazz'), 43));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(42));
      expect(v0).assertEqual(42);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(41));
      expect(v1).assertEqual(41);
      const v2: SongType | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4200
     * @tc.name: testBrkMix010042
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010042 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(42, 43), new PaddingDataType(44, 45), new PaddingDataType(46, 47));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(46));
      expect(v0).assertEqual(46);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(47));
      expect(v1).assertEqual(47);
      const v2: PaddingDataType | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4300
     * @tc.name: testBrkMix010043
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010043 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list1'), $r('app.string.emo'), 43), new SongType($r('app.media.list1'), $r('app.string.rock'), 44), new SongType($r('app.media.list1'), $r('app.string.jazz'), 45));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(44));
      expect(v0).assertEqual(44);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(43));
      expect(v1).assertEqual(43);
      const v2: SongType | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4400
     * @tc.name: testBrkMix010044
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010044 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(44, 45), new PaddingDataType(46, 47), new PaddingDataType(48, 49));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(48));
      expect(v0).assertEqual(48);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(49));
      expect(v1).assertEqual(49);
      const v2: PaddingDataType | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4500
     * @tc.name: testBrkMix010045
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010045 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list3'), $r('app.string.emo'), 45), new SongType($r('app.media.list3'), $r('app.string.rock'), 46), new SongType($r('app.media.list3'), $r('app.string.jazz'), 47));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(46));
      expect(v0).assertEqual(46);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(45));
      expect(v1).assertEqual(45);
      const v2: SongType | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4600
     * @tc.name: testBrkMix010046
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010046 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(46, 47), new PaddingDataType(48, 49), new PaddingDataType(50, 51));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(50));
      expect(v0).assertEqual(50);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(51));
      expect(v1).assertEqual(51);
      const v2: PaddingDataType | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4700
     * @tc.name: testBrkMix010047
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010047 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list5'), $r('app.string.emo'), 47), new SongType($r('app.media.list5'), $r('app.string.rock'), 48), new SongType($r('app.media.list5'), $r('app.string.jazz'), 49));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(48));
      expect(v0).assertEqual(48);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(47));
      expect(v1).assertEqual(47);
      const v2: SongType | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4800
     * @tc.name: testBrkMix010048
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010048 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(48, 49), new PaddingDataType(50, 51), new PaddingDataType(52, 53));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(52));
      expect(v0).assertEqual(52);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(53));
      expect(v1).assertEqual(53);
      const v2: PaddingDataType | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_4900
     * @tc.name: testBrkMix010049
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010049 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list7'), $r('app.string.emo'), 49), new SongType($r('app.media.list7'), $r('app.string.rock'), 50), new SongType($r('app.media.list7'), $r('app.string.jazz'), 51));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(50));
      expect(v0).assertEqual(50);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(49));
      expect(v1).assertEqual(49);
      const v2: SongType | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5000
     * @tc.name: testBrkMix010050
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010050 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(50, 51), new PaddingDataType(52, 53), new PaddingDataType(54, 55));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(54));
      expect(v0).assertEqual(54);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(55));
      expect(v1).assertEqual(55);
      const v2: PaddingDataType | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5100
     * @tc.name: testBrkMix010051
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010051 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list9'), $r('app.string.emo'), 51), new SongType($r('app.media.list9'), $r('app.string.rock'), 52), new SongType($r('app.media.list9'), $r('app.string.jazz'), 53));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(52));
      expect(v0).assertEqual(52);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(51));
      expect(v1).assertEqual(51);
      const v2: SongType | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5200
     * @tc.name: testBrkMix010052
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010052 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(52, 53), new PaddingDataType(54, 55), new PaddingDataType(56, 57));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(56));
      expect(v0).assertEqual(56);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(57));
      expect(v1).assertEqual(57);
      const v2: PaddingDataType | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5300
     * @tc.name: testBrkMix010053
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010053 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list11'), $r('app.string.emo'), 53), new SongType($r('app.media.list11'), $r('app.string.rock'), 54), new SongType($r('app.media.list11'), $r('app.string.jazz'), 55));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(54));
      expect(v0).assertEqual(54);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(53));
      expect(v1).assertEqual(53);
      const v2: SongType | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5400
     * @tc.name: testBrkMix010054
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010054 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(54, 55), new PaddingDataType(56, 57), new PaddingDataType(58, 59));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(58));
      expect(v0).assertEqual(58);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(59));
      expect(v1).assertEqual(59);
      const v2: PaddingDataType | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5500
     * @tc.name: testBrkMix010055
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010055 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list13'), $r('app.string.emo'), 55), new SongType($r('app.media.list13'), $r('app.string.rock'), 56), new SongType($r('app.media.list13'), $r('app.string.jazz'), 57));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(56));
      expect(v0).assertEqual(56);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(55));
      expect(v1).assertEqual(55);
      const v2: SongType | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5600
     * @tc.name: testBrkMix010056
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010056 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(56, 57), new PaddingDataType(58, 59), new PaddingDataType(60, 61));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(60));
      expect(v0).assertEqual(60);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(61));
      expect(v1).assertEqual(61);
      const v2: PaddingDataType | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5700
     * @tc.name: testBrkMix010057
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010057 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.banner2'), $r('app.string.emo'), 57), new SongType($r('app.media.banner2'), $r('app.string.rock'), 58), new SongType($r('app.media.banner2'), $r('app.string.jazz'), 59));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(58));
      expect(v0).assertEqual(58);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(57));
      expect(v1).assertEqual(57);
      const v2: SongType | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5800
     * @tc.name: testBrkMix010058
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010058 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(58, 59), new PaddingDataType(60, 61), new PaddingDataType(62, 63));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(62));
      expect(v0).assertEqual(62);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(63));
      expect(v1).assertEqual(63);
      const v2: PaddingDataType | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_5900
     * @tc.name: testBrkMix010059
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010059 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_find'), $r('app.string.emo'), 59), new SongType($r('app.media.ic_find'), $r('app.string.rock'), 60), new SongType($r('app.media.ic_find'), $r('app.string.jazz'), 61));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(60));
      expect(v0).assertEqual(60);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(59));
      expect(v1).assertEqual(59);
      const v2: SongType | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6000
     * @tc.name: testBrkMix010060
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010060 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(60, 61), new PaddingDataType(62, 63), new PaddingDataType(64, 65));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(64));
      expect(v0).assertEqual(64);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(65));
      expect(v1).assertEqual(65);
      const v2: PaddingDataType | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6100
     * @tc.name: testBrkMix010061
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010061 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_home'), $r('app.string.emo'), 61), new SongType($r('app.media.ic_home'), $r('app.string.rock'), 62), new SongType($r('app.media.ic_home'), $r('app.string.jazz'), 63));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(62));
      expect(v0).assertEqual(62);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(61));
      expect(v1).assertEqual(61);
      const v2: SongType | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6200
     * @tc.name: testBrkMix010062
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010062 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(62, 63), new PaddingDataType(64, 65), new PaddingDataType(66, 67));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(66));
      expect(v0).assertEqual(66);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(67));
      expect(v1).assertEqual(67);
      const v2: PaddingDataType | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6300
     * @tc.name: testBrkMix010063
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010063 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_mine'), $r('app.string.emo'), 63), new SongType($r('app.media.ic_mine'), $r('app.string.rock'), 64), new SongType($r('app.media.ic_mine'), $r('app.string.jazz'), 65));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(64));
      expect(v0).assertEqual(64);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(63));
      expect(v1).assertEqual(63);
      const v2: SongType | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6400
     * @tc.name: testBrkMix010064
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010064 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(64, 65), new PaddingDataType(66, 67), new PaddingDataType(68, 69));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(68));
      expect(v0).assertEqual(68);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(69));
      expect(v1).assertEqual(69);
      const v2: PaddingDataType | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6500
     * @tc.name: testBrkMix010065
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010065 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_more'), $r('app.string.emo'), 65), new SongType($r('app.media.ic_more'), $r('app.string.rock'), 66), new SongType($r('app.media.ic_more'), $r('app.string.jazz'), 67));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(66));
      expect(v0).assertEqual(66);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(65));
      expect(v1).assertEqual(65);
      const v2: SongType | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6600
     * @tc.name: testBrkMix010066
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010066 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(66, 67), new PaddingDataType(68, 69), new PaddingDataType(70, 71));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(70));
      expect(v0).assertEqual(70);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(71));
      expect(v1).assertEqual(71);
      const v2: PaddingDataType | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6700
     * @tc.name: testBrkMix010067
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010067 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_children'), $r('app.string.emo'), 67), new SongType($r('app.media.ic_music_children'), $r('app.string.rock'), 68), new SongType($r('app.media.ic_music_children'), $r('app.string.jazz'), 69));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(68));
      expect(v0).assertEqual(68);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(67));
      expect(v1).assertEqual(67);
      const v2: SongType | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6800
     * @tc.name: testBrkMix010068
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010068 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(68, 69), new PaddingDataType(70, 71), new PaddingDataType(72, 73));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(72));
      expect(v0).assertEqual(72);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(73));
      expect(v1).assertEqual(73);
      const v2: PaddingDataType | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_6900
     * @tc.name: testBrkMix010069
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010069 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_localmusic'), $r('app.string.emo'), 69), new SongType($r('app.media.ic_music_localmusic'), $r('app.string.rock'), 70), new SongType($r('app.media.ic_music_localmusic'), $r('app.string.jazz'), 71));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(70));
      expect(v0).assertEqual(70);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(69));
      expect(v1).assertEqual(69);
      const v2: SongType | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_7000
     * @tc.name: testBrkMix010070
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010070 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(70, 71), new PaddingDataType(72, 73), new PaddingDataType(74, 75));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(74));
      expect(v0).assertEqual(74);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(75));
      expect(v1).assertEqual(75);
      const v2: PaddingDataType | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_7100
     * @tc.name: testBrkMix010071
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010071 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_privatefm'), $r('app.string.emo'), 71), new SongType($r('app.media.ic_music_privatefm'), $r('app.string.rock'), 72), new SongType($r('app.media.ic_music_privatefm'), $r('app.string.jazz'), 73));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(72));
      expect(v0).assertEqual(72);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(71));
      expect(v1).assertEqual(71);
      const v2: SongType | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_7200
     * @tc.name: testBrkMix010072
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010072 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(72, 73), new PaddingDataType(74, 75), new PaddingDataType(76, 77));
      hilog.info(DOMAIN, TAG, 'lg-reference-kept actual=%{public}s expected=true', String(sut.getValue('lg') === sut.lg));
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg.left actual=%{public}s expected=%{public}s', String(v0), String(76));
      expect(v0).assertEqual(76);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg.right actual=%{public}s expected=%{public}s', String(v1), String(77));
      expect(v1).assertEqual(77);
      const v2: PaddingDataType | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_7300
     * @tc.name: testBrkMix010073
     * @tc.desc: Verify class typed breakpoint value is returned per key without cross field leaking (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkMix010073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010073 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.ic_music_singer'), $r('app.string.emo'), 73), new SongType($r('app.media.ic_music_singer'), $r('app.string.rock'), 74), new SongType($r('app.media.ic_music_singer'), $r('app.string.jazz'), 75));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v0: number = sut.md.count;
      hilog.info(DOMAIN, TAG, 'md.count actual=%{public}s expected=%{public}s', String(v0), String(74));
      expect(v0).assertEqual(74);
      const v1: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm.count actual=%{public}s expected=%{public}s', String(v1), String(73));
      expect(v1).assertEqual(73);
      const v2: SongType | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_7400
     * @tc.name: testBrkMix010074
     * @tc.desc: Anchor: SongType slots must keep their own count
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkMix010074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010074 begin');
      let sut: BreakpointType<SongType> = new BreakpointType<SongType>(new SongType($r('app.media.list4'), $r('app.string.emo'), 16), new SongType($r('app.media.list7'), $r('app.string.noon'), 30), new SongType($r('app.media.list2'), $r('app.string.oldYear'), 48));
      const v0: number = sut.sm.count;
      hilog.info(DOMAIN, TAG, 'sm-count actual=%{public}s expected=%{public}s', String(v0), String(16));
      expect(v0).assertEqual(16);
      const v1: number = sut.lg.count;
      hilog.info(DOMAIN, TAG, 'lg-count actual=%{public}s expected=%{public}s', String(v1), String(48));
      expect(v1).assertEqual(48);
      const v2: SongType | undefined = sut.getValue('sm' + ' ');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm-space", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKMIX01_7500
     * @tc.name: testBrkMix010075
     * @tc.desc: Anchor: PaddingDataType slots must keep left and right separately
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkMix010075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010075 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(new PaddingDataType(16, 16), new PaddingDataType(0, 0), new PaddingDataType(24, 24));
      const v0: number = sut.lg.left;
      hilog.info(DOMAIN, TAG, 'lg-left actual=%{public}s expected=%{public}s', String(v0), String(24));
      expect(v0).assertEqual(24);
      const v1: number = sut.lg.right;
      hilog.info(DOMAIN, TAG, 'lg-right actual=%{public}s expected=%{public}s', String(v1), String(24));
      expect(v1).assertEqual(24);
      const v2: number = sut.md.left;
      hilog.info(DOMAIN, TAG, 'md-left actual=%{public}s expected=%{public}s', String(v2), String(0));
      expect(v2).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkMix010075 end');
    })

  })
}
