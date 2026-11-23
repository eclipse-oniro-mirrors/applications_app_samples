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

// @volume rule=getValue(k)-returns-OffsetDataType-field-k-by-reference basis=main-frozen cases=75
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

export default function breakpointMatrix09Test() {
  describe('BreakpointMatrix09', () => {

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0100
     * @tc.name: testBrkObj020001
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 1).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020001 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(1, -1), new OffsetDataType(2, -2), new OffsetDataType(1, -1));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0200
     * @tc.name: testBrkObj020002
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 2).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020002 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(2, -2), new OffsetDataType(4, -4), new OffsetDataType(2, -2));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0300
     * @tc.name: testBrkObj020003
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 3).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020003 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(3, -3), new OffsetDataType(6, -6), new OffsetDataType(3, -3));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0400
     * @tc.name: testBrkObj020004
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 4).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020004 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(4, -4), new OffsetDataType(8, -8), new OffsetDataType(4, -4));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0500
     * @tc.name: testBrkObj020005
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 5).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020005 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(5, -5), new OffsetDataType(10, -10), new OffsetDataType(5, -5));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0600
     * @tc.name: testBrkObj020006
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 6).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020006 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(6, -6), new OffsetDataType(12, -12), new OffsetDataType(6, -6));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0700
     * @tc.name: testBrkObj020007
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 7).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020007 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(7, -7), new OffsetDataType(14, -14), new OffsetDataType(7, -7));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0800
     * @tc.name: testBrkObj020008
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 8).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020008 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(8, -8), new OffsetDataType(16, -16), new OffsetDataType(8, -8));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_0900
     * @tc.name: testBrkObj020009
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 9).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020009 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(9, -9), new OffsetDataType(18, -18), new OffsetDataType(9, -9));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1000
     * @tc.name: testBrkObj020010
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 10).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020010 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(10, -10), new OffsetDataType(20, -20), new OffsetDataType(10, -10));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020010 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1100
     * @tc.name: testBrkObj020011
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 11).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020011 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(11, -11), new OffsetDataType(22, -22), new OffsetDataType(11, -11));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1200
     * @tc.name: testBrkObj020012
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 12).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020012 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(12, -12), new OffsetDataType(24, -24), new OffsetDataType(12, -12));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1300
     * @tc.name: testBrkObj020013
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 13).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020013 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(13, -13), new OffsetDataType(26, -26), new OffsetDataType(13, -13));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1400
     * @tc.name: testBrkObj020014
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 14).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020014 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(14, -14), new OffsetDataType(28, -28), new OffsetDataType(14, -14));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1500
     * @tc.name: testBrkObj020015
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 15).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020015 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(15, -15), new OffsetDataType(30, -30), new OffsetDataType(15, -15));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1600
     * @tc.name: testBrkObj020016
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 16).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020016 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(16, -16), new OffsetDataType(32, -32), new OffsetDataType(16, -16));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1700
     * @tc.name: testBrkObj020017
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 17).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020017 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(17, -17), new OffsetDataType(34, -34), new OffsetDataType(17, -17));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1800
     * @tc.name: testBrkObj020018
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 18).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020018 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(18, -18), new OffsetDataType(36, -36), new OffsetDataType(18, -18));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020018 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_1900
     * @tc.name: testBrkObj020019
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 19).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020019 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(19, -19), new OffsetDataType(38, -38), new OffsetDataType(19, -19));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2000
     * @tc.name: testBrkObj020020
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 20).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020020 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(20, -20), new OffsetDataType(40, -40), new OffsetDataType(20, -20));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2100
     * @tc.name: testBrkObj020021
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 21).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020021 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(21, -21), new OffsetDataType(42, -42), new OffsetDataType(21, -21));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2200
     * @tc.name: testBrkObj020022
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 22).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020022 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(22, -22), new OffsetDataType(44, -44), new OffsetDataType(22, -22));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2300
     * @tc.name: testBrkObj020023
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 23).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020023 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(23, -23), new OffsetDataType(46, -46), new OffsetDataType(23, -23));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2400
     * @tc.name: testBrkObj020024
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 24).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020024 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(24, -24), new OffsetDataType(48, -48), new OffsetDataType(24, -24));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2500
     * @tc.name: testBrkObj020025
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 25).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020025 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(25, -25), new OffsetDataType(50, -50), new OffsetDataType(25, -25));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2600
     * @tc.name: testBrkObj020026
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 26).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020026 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(26, -26), new OffsetDataType(52, -52), new OffsetDataType(26, -26));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2700
     * @tc.name: testBrkObj020027
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 27).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020027 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(27, -27), new OffsetDataType(54, -54), new OffsetDataType(27, -27));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2800
     * @tc.name: testBrkObj020028
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 28).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020028 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(28, -28), new OffsetDataType(56, -56), new OffsetDataType(28, -28));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_2900
     * @tc.name: testBrkObj020029
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 29).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020029 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(29, -29), new OffsetDataType(58, -58), new OffsetDataType(29, -29));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3000
     * @tc.name: testBrkObj020030
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 30).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020030 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(30, -30), new OffsetDataType(60, -60), new OffsetDataType(30, -30));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020030 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3100
     * @tc.name: testBrkObj020031
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 31).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020031 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(31, -31), new OffsetDataType(62, -62), new OffsetDataType(31, -31));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3200
     * @tc.name: testBrkObj020032
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 32).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020032 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(32, -32), new OffsetDataType(64, -64), new OffsetDataType(32, -32));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3300
     * @tc.name: testBrkObj020033
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 33).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020033 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(33, -33), new OffsetDataType(66, -66), new OffsetDataType(33, -33));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3400
     * @tc.name: testBrkObj020034
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 34).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020034 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(34, -34), new OffsetDataType(68, -68), new OffsetDataType(34, -34));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3500
     * @tc.name: testBrkObj020035
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 35).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020035 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(35, -35), new OffsetDataType(70, -70), new OffsetDataType(35, -35));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3600
     * @tc.name: testBrkObj020036
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 36).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020036 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(36, -36), new OffsetDataType(72, -72), new OffsetDataType(36, -36));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3700
     * @tc.name: testBrkObj020037
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 37).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020037 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(37, -37), new OffsetDataType(74, -74), new OffsetDataType(37, -37));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3800
     * @tc.name: testBrkObj020038
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 38).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020038 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(38, -38), new OffsetDataType(76, -76), new OffsetDataType(38, -38));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_3900
     * @tc.name: testBrkObj020039
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 39).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020039 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(39, -39), new OffsetDataType(78, -78), new OffsetDataType(39, -39));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4000
     * @tc.name: testBrkObj020040
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 40).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020040 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(40, -40), new OffsetDataType(80, -80), new OffsetDataType(40, -40));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020040 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4100
     * @tc.name: testBrkObj020041
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 41).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020041', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020041 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(41, -41), new OffsetDataType(82, -82), new OffsetDataType(41, -41));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020041 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4200
     * @tc.name: testBrkObj020042
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 42).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020042', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020042 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(42, -42), new OffsetDataType(84, -84), new OffsetDataType(42, -42));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020042 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4300
     * @tc.name: testBrkObj020043
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 43).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020043', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020043 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(43, -43), new OffsetDataType(86, -86), new OffsetDataType(43, -43));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020043 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4400
     * @tc.name: testBrkObj020044
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 44).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020044', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020044 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(44, -44), new OffsetDataType(88, -88), new OffsetDataType(44, -44));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020044 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4500
     * @tc.name: testBrkObj020045
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 45).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020045', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020045 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(45, -45), new OffsetDataType(90, -90), new OffsetDataType(45, -45));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020045 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4600
     * @tc.name: testBrkObj020046
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 46).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020046', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020046 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(46, -46), new OffsetDataType(92, -92), new OffsetDataType(46, -46));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020046 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4700
     * @tc.name: testBrkObj020047
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 47).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020047', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020047 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(47, -47), new OffsetDataType(94, -94), new OffsetDataType(47, -47));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020047 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4800
     * @tc.name: testBrkObj020048
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 48).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020048', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020048 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(48, -48), new OffsetDataType(96, -96), new OffsetDataType(48, -48));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020048 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_4900
     * @tc.name: testBrkObj020049
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 49).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020049', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020049 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(49, -49), new OffsetDataType(98, -98), new OffsetDataType(49, -49));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020049 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5000
     * @tc.name: testBrkObj020050
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 50).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020050', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020050 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(50, -50), new OffsetDataType(100, -100), new OffsetDataType(50, -50));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020050 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5100
     * @tc.name: testBrkObj020051
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 51).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020051', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020051 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(51, -51), new OffsetDataType(102, -102), new OffsetDataType(51, -51));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020051 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5200
     * @tc.name: testBrkObj020052
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 52).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020052', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020052 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(52, -52), new OffsetDataType(104, -104), new OffsetDataType(52, -52));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("mds");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "mds", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020052 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5300
     * @tc.name: testBrkObj020053
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 53).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020053', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020053 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(53, -53), new OffsetDataType(106, -106), new OffsetDataType(53, -53));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("s");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "s", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020053 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5400
     * @tc.name: testBrkObj020054
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 54).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020054', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020054 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(54, -54), new OffsetDataType(108, -108), new OffsetDataType(54, -54));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("undefined");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "undefined", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020054 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5500
     * @tc.name: testBrkObj020055
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 55).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020055', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020055 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(55, -55), new OffsetDataType(110, -110), new OffsetDataType(55, -55));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("null");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "null", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020055 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5600
     * @tc.name: testBrkObj020056
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 56).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020056', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020056 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(56, -56), new OffsetDataType(112, -112), new OffsetDataType(56, -56));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("0");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "0", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020056 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5700
     * @tc.name: testBrkObj020057
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 57).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020057', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020057 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(57, -57), new OffsetDataType(114, -114), new OffsetDataType(57, -57));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("12");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "12", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020057 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5800
     * @tc.name: testBrkObj020058
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 58).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020058', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020058 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(58, -58), new OffsetDataType(116, -116), new OffsetDataType(58, -58));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("xl");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020058 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_5900
     * @tc.name: testBrkObj020059
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 59).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020059', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020059 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(59, -59), new OffsetDataType(118, -118), new OffsetDataType(59, -59));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("SML");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SML", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020059 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6000
     * @tc.name: testBrkObj020060
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 60).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020060', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020060 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(60, -60), new OffsetDataType(120, -120), new OffsetDataType(60, -60));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("md\t");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "md\t", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020060 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6100
     * @tc.name: testBrkObj020061
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 61).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020061', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020061 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(61, -61), new OffsetDataType(122, -122), new OffsetDataType(61, -61));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("lg2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020061 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6200
     * @tc.name: testBrkObj020062
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 62).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020062', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020062 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(62, -62), new OffsetDataType(124, -124), new OffsetDataType(62, -62));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("m");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "m", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020062 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6300
     * @tc.name: testBrkObj020063
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 63).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020063', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020063 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(63, -63), new OffsetDataType(126, -126), new OffsetDataType(63, -63));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("med");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "med", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020063 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6400
     * @tc.name: testBrkObj020064
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 64).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020064', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020064 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(64, -64), new OffsetDataType(128, -128), new OffsetDataType(64, -64));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("SMALL");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "SMALL", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020064 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6500
     * @tc.name: testBrkObj020065
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 65).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020065', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020065 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(65, -65), new OffsetDataType(130, -130), new OffsetDataType(65, -65));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("largeScreen");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "largeScreen", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020065 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6600
     * @tc.name: testBrkObj020066
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 66).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020066', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020066 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(66, -66), new OffsetDataType(132, -132), new OffsetDataType(66, -66));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020066 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6700
     * @tc.name: testBrkObj020067
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 67).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020067', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020067 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(67, -67), new OffsetDataType(134, -134), new OffsetDataType(67, -67));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("LG");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "LG", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020067 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6800
     * @tc.name: testBrkObj020068
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 68).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020068', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020068 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(68, -68), new OffsetDataType(136, -136), new OffsetDataType(68, -68));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("Lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020068 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_6900
     * @tc.name: testBrkObj020069
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 69).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020069', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020069 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(69, -69), new OffsetDataType(138, -138), new OffsetDataType(69, -69));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("lg ");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "lg ", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020069 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_7000
     * @tc.name: testBrkObj020070
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 70).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020070', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020070 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(70, -70), new OffsetDataType(140, -140), new OffsetDataType(70, -70));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue(" lg");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', " lg", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020070 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_7100
     * @tc.name: testBrkObj020071
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 71).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020071', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020071 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(71, -71), new OffsetDataType(142, -142), new OffsetDataType(71, -71));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("large");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "large", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020071 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_7200
     * @tc.name: testBrkObj020072
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 72).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020072', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020072 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(72, -72), new OffsetDataType(144, -144), new OffsetDataType(72, -72));
      hilog.info(DOMAIN, TAG, 'sm-reference-kept actual=%{public}s expected=true', String(sut.getValue('sm') === sut.sm));
      expect(sut.getValue('sm') === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      const v2: OffsetDataType | undefined = sut.getValue("sm2");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "sm2", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020072 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_7300
     * @tc.name: testBrkObj020073
     * @tc.desc: Verify OffsetDataType instance is stored per breakpoint field and invalid key returns undefined (row 73).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkObj020073', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020073 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(73, -73), new OffsetDataType(146, -146), new OffsetDataType(73, -73));
      hilog.info(DOMAIN, TAG, 'md-reference-kept actual=%{public}s expected=true', String(sut.getValue('md') === sut.md));
      expect(sut.getValue('md') === sut.md).assertTrue();
      hilog.info(DOMAIN, TAG, 'sm-and-md-stay-distinct actual=%{public}s expected=false', String(sut.sm === sut.md));
      expect(sut.sm === sut.md).assertFalse();
      const v2: OffsetDataType | undefined = sut.getValue("Md");
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "Md", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020073 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_7400
     * @tc.name: testBrkObj020074
     * @tc.desc: Anchor: zero offset must keep both fields at zero
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkObj020074', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020074 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(0, 0), new OffsetDataType(0, 0), new OffsetDataType(0, 0));
      const v0: number = sut.lg.x;
      hilog.info(DOMAIN, TAG, 'lg-x actual=%{public}s expected=%{public}s', String(v0), String(0));
      expect(v0).assertEqual(0);
      const v1: number = sut.lg.y;
      hilog.info(DOMAIN, TAG, 'lg-y actual=%{public}s expected=%{public}s', String(v1), String(0));
      expect(v1).assertEqual(0);
      const v2: OffsetDataType | undefined = sut.getValue('xxl');
      hilog.info(DOMAIN, TAG, 'invalid-key=%{public}s actual=%{public}s', "xxl", String(v2));
      expect(v2).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020074 end');
    })

    /**
     * @tc.number: SUB_MM_BRKOBJ02_7500
     * @tc.name: testBrkObj020075
     * @tc.desc: Anchor: negative offset must not be folded into positive values
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkObj020075', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020075 begin');
      let sut: BreakpointType<OffsetDataType> = new BreakpointType<OffsetDataType>(new OffsetDataType(11, -11), new OffsetDataType(-11, 11), new OffsetDataType(0, 0));
      const v0: number = sut.sm.y;
      hilog.info(DOMAIN, TAG, 'sm-negative-y actual=%{public}s expected=%{public}s', String(v0), String(-11));
      expect(v0).assertEqual(-11);
      const v1: number = sut.md.x;
      hilog.info(DOMAIN, TAG, 'md-negative-x actual=%{public}s expected=%{public}s', String(v1), String(-11));
      expect(v1).assertEqual(-11);
      hilog.info(DOMAIN, TAG, 'signs-not-equal actual=%{public}s expected=false', String(sut.sm.y === sut.md.y));
      expect(sut.sm.y === sut.md.y).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkObj020075 end');
    })

  })
}
